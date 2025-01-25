part of "library.dart";

/// Base class for any type of measurement.
class Measurement<D extends Dimension> implements Comparable<Measurement<D>> {
  /// Creates a base measurement.
  const Measurement({
    required this.magnitude,
    required this.defaultUnit,
    Precision precision = Precision.max,
  }) : precisionData = precision;

  /// Creates a measurement of magnitude zero.
  const Measurement.zero(Unit<D> defaultUnit)
      : this(
          magnitude: 0.0,
          defaultUnit: defaultUnit,
        );

  /// Creates a measurement of infinite magnitude.
  const Measurement.infinite(Unit<D> defaultUnit)
      : this(
          magnitude: double.infinity,
          defaultUnit: defaultUnit,
        );

  /// Creates a measurement of negative infinite magnitude.
  const Measurement.negativeInfinite(Unit<D> defaultUnit)
      : this(
          magnitude: -double.infinity,
          defaultUnit: defaultUnit,
        );

  /// Creates a measurement that is not a number.
  const Measurement.nan(Unit<D> defaultUnit)
      : this(
          magnitude: double.nan,
          defaultUnit: defaultUnit,
        );

  /// Creates a measurement that is the sum of several measurements.
  Measurement.sum(
    Iterable<Measurement<D>> parts, {
    int precision = Precision.maximumPrecision,
  }) : this(
          magnitude: parts.first.defaultUnit.of(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: Precision(precision),
          defaultUnit: parts.first.defaultUnit,
        );

  /// Constructs a new measurement.
  Measurement<D> construct(
    double magnitude,
    Unit<D> defaultUnit,
    Precision precision,
  ) =>
      Measurement(
        magnitude: magnitude,
        defaultUnit: defaultUnit,
        precision: precision,
      );

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  final Unit<D> defaultUnit;

  /// Returns the default measurement value (i.e. the measurement as interpreted
  /// by the default [Unit].
  ///
  /// This is equivalent to `as(defaultUnit)`.
  double get defaultValue => _precise(magnitude);

  /// The measurement's value in the SI unit.
  double get si => defaultUnit.from(magnitude);

  /// Returns `true` if this measurement is negative.
  bool get isNegative => magnitude.isNegative;

  /// Returns `true` if this measurement is infinite (either positive or
  /// negative).
  bool get isInfinite => magnitude.isInfinite;

  /// Returns `true` if this measurement is finite.
  bool get isFinite => magnitude.isFinite;

  /// Returns `true` if this measurement cannot be expressed as a number.
  bool get isNaN => magnitude.isNaN;

  /// Returns the number of digits of precision this measurement has.
  int get precision => precisionData.precision;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  Measurement<D> withPrecision(int precision) =>
      construct(magnitude.toDouble(), defaultUnit, Precision(precision));

  /// Returns whether two measurements are functionally identical.
  ///
  /// This means that, when their precisions are taken into account, they
  /// represent identical values. The measurement with the smaller precision
  /// is used to compare against.
  ///
  /// For example, given the three measurements:
  /// ```
  /// var a = (3.14159).meters.withPrecision(5);
  /// var b = (3.14159).meters.withPrecision(3);
  /// var c = (3.1).meters.withPrecision(3);
  ///
  /// a.equals(b); // true  (because 3.14 == 3.14)
  /// b.equals(a); // true  (because 3.14 == 3.14)
  /// a.equals(c); // false (because 3.1 != 3.14)
  /// b.equals(c); // false (because 3.1 != 3.14)
  /// ```
  bool equals(Measurement<D> other) {
    return identical(this, other) ||
        isNaN && other.isNaN ||
        other._precise(_preciseSI()) == _precise(other._preciseSI());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Measurement<D> &&
          si == other.si &&
          precisionData == other.precisionData;

  @override
  int get hashCode => si.hashCode * precisionData.hashCode;

  /// Returns `true` if this is greater than the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator >(Measurement<D> other) => _precise(si) > _precise(other.si);

  /// Returns `true` if this is greater than or equal to the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator >=(Measurement<D> other) => _precise(si) >= _precise(other.si);

  /// Returns `true` if this is less than the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator <(Measurement<D> other) => _precise(si) < _precise(other.si);

  /// Returns `true` if this is less than or equal to the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator <=(Measurement<D> other) => _precise(si) <= _precise(other.si);

  @override
  int compareTo(Measurement<D> other) => si.compareTo(other.si);

  /// Returns a measurement representing the opposite of this.
  Measurement<D> operator -() => construct(-si, defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of two others.
  Measurement<D> operator +(Measurement<D> other) => construct(
        si + other.si,
        defaultUnit,
        Precision(Precision.addition(this, other)),
      );

  /// Returns a measurement equivalent to the difference between two others.
  Measurement<D> operator -(Measurement<D> other) => construct(
        si - other.si,
        defaultUnit,
        Precision(Precision.addition(this, -other)),
      );

  /// Returns a measurement equivalent to a multiple of this.
  Measurement<D> operator *(num multiplier) =>
      construct(si * multiplier, defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  Measurement<D> operator /(num divisor) =>
      construct(si / divisor, defaultUnit, precisionData);

  /// Returns the Euclidean remainder of the division between two measurements.
  ///
  /// For example:
  /// ```dart
  /// feet(2) % inches(7); // 3 inches
  /// inches(7) % feet(2); // 7 inches
  /// ```
  ///
  /// For the purposes of this function, a negative divisor is treated identically
  /// to its positive counterpart, and thus the operation always produces a positive
  /// result. This is consistent with the way Dart handles the modulo operator.
  /// For example:
  /// ```dart
  /// feet(2) % inches(-7); // 3 inches
  /// feet(-2) % inches(7); // 4 inches
  /// feet(-2) % inches(-7); // 4 inches
  /// ```
  ///
  /// If the divisor is zero or the dividend is infinite, the result is always NaN.
  Measurement<D> operator %(Measurement<D> other) => construct(
        defaultUnit.of(_preciseSI() % other._preciseSI()),
        defaultUnit,
        Precision.combine([precision, other.precision]),
      );

  /// Returns the truncating division result of this and another measurement.
  ///
  /// For example:
  /// ```dart
  /// // the number of times 1/2 cup fits into 1 1/4 cups
  /// int fullHalfCups = cups(1.25) ~/ cups(0.5);  // 2
  /// ```
  ///
  /// Attempting to divide by a measurement of magnitude zero, or attempting to
  /// divide an infinite measurement, will result in UnsupportedError (`int`
  /// cannot hold an infinite or `NaN` value).
  int operator ~/(Measurement<D> other) => _preciseSI() ~/ other._preciseSI();

  /// Returns the difference in magnitude between this and another measurement.
  ///
  /// For example:
  /// ```dart
  /// meters(3).compareMagnitude(deka.meters(3));  // 0.1
  /// ```
  double compareMagnitude(Measurement<D> other) =>
      _preciseSI() / other._preciseSI();

  @override
  String toString() => '$defaultValue $defaultUnit';

  /// Apply the measurement appropriate precision to a value.
  double _precise(num value) => precisionData.apply(value);

  /// Apply the measurement appropriate precision to a converted value.
  double _preciseOf([Unit<D>? converter]) =>
      precisionData.apply(converter?.of(si) ?? si);

  /// Apply the measurement appropriate precision to the base value.
  double _preciseSI() => _precise(si);

  /// Interprets this using the specified units.
  double as(Unit<D> unit) => _preciseOf(unit);

  /// Creates a new measurement equivalent to this one but with a different
  /// default unit.
  Measurement<D> butAs(Unit<D> unit) =>
      construct(unit.of(si), unit, precisionData);

  /// The value of this measurement in the default unit.
  final num magnitude;

  /// The precision of this measurement.
  final Precision precisionData;
}

Measurement<D> sum<D extends Dimension>(
  Iterable<Measurement<D>> parts, {
  int precision = Precision.maximumPrecision,
}) =>
    Measurement.sum(parts, precision: precision);

Measurement<D> zero<D extends Dimension>(Unit<D> defaultUnit) =>
    Measurement.zero(defaultUnit);

Measurement<D> infinite<D extends Dimension>(Unit<D> defaultUnit) =>
    Measurement.infinite(defaultUnit);

Measurement<D> negativeInfinite<D extends Dimension>(Unit<D> defaultUnit) =>
    Measurement.negativeInfinite(defaultUnit);

Measurement<D> nan<D extends Dimension>(Unit<D> defaultUnit) =>
    Measurement.nan(defaultUnit);
