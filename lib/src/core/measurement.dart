part of "library.dart";

/// Base class for any type of measurement.
abstract class Measurement<T extends Measurement<T>> implements Comparable<T> {
  /// Creates a base measurement.
  const Measurement({
    required num amount,
    required Unit<T> interpreter,
    Precision precision = Precision.max,
  })  : _amount = amount,
        defaultUnit = interpreter,
        precisionData = precision;

  /// Creates a measurement of magnitude zero.
  const Measurement.zero(Unit<T> interpreter)
      : this(
          amount: 0.0,
          interpreter: interpreter,
        );

  /// Creates a measurement of infinite magnitude.
  const Measurement.infinite(Unit<T> interpreter)
      : this(
          amount: double.infinity,
          interpreter: interpreter,
        );

  /// Creates a measurement of negative infinite magnitude.
  const Measurement.negativeInfinite(Unit<T> interpreter)
      : this(
          amount: -double.infinity,
          interpreter: interpreter,
        );

  /// Creates a measurement that is not a number.
  const Measurement.nan(Unit<T> interpreter)
      : this(
          amount: double.nan,
          interpreter: interpreter,
        );

  /// Creates a measurement that is the sum of several measurements.
  Measurement.sum(
    Iterable<T> parts, {
    Precision precision = Precision.max,
  }) : this(
          amount: parts.first.defaultUnit.of(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: precision,
          interpreter: parts.first.defaultUnit,
        );

  /// Constructs a new measurement.
  T construct(
    double amount,
    Unit<T>? interpreter,
    Precision precision,
  );

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [withDefaultUnit].
  final Unit<T> defaultUnit;

  /// Returns the default measurement value (i.e. the measurement as interpreted
  /// by the default [Unit].
  ///
  /// This is equivalent to `as(defaultUnit)`.
  double get defaultValue => _precise(_amount);

  /// The measurement's value in the SI unit.
  double get si => defaultUnit.from(_amount);

  /// Returns `true` if this measurement is negative.
  bool get isNegative => _amount.isNegative;

  /// Returns `true` if this measurement is infinite (either positive or
  /// negative).
  bool get isInfinite => _amount.isInfinite;

  /// Returns `true` if this measurement is finite.
  bool get isFinite => _amount.isFinite;

  /// Returns `true` if this measurement cannot be expressed as a number.
  bool get isNaN => _amount.isNaN;

  /// Returns the number of digits of precision this measurement has.
  int get precision => precisionData.precision;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  T withPrecisionOf(int precision) =>
      construct(_amount.toDouble(), defaultUnit, Precision(precision));

  /// Creates a new measurement equivalent to this one but with a different
  /// default unit.
  T withDefaultUnit(Unit<T> interpreter) =>
      construct(interpreter.of(si), interpreter, precisionData);

  /// Accept a visitor object for double-dispatch.
  void acceptVisitor(MeasurementVisitor visitor);

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
  bool equals(Measurement<T> other) {
    return identical(this, other) ||
        isNaN && other.isNaN ||
        other._precise(_preciseSI()) == _precise(other._preciseSI());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Measurement<T> &&
          si == other.si &&
          precisionData == other.precisionData;

  @override
  int get hashCode => si.hashCode * precisionData.hashCode;

  /// Returns `true` if this is greater than the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator >(T other) => _precise(si) > _precise(other.si);

  /// Returns `true` if this is greater than or equal to the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator >=(T other) => _precise(si) >= _precise(other.si);

  /// Returns `true` if this is less than the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator <(T other) => _precise(si) < _precise(other.si);

  /// Returns `true` if this is less than or equal to the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator <=(T other) => _precise(si) <= _precise(other.si);

  @override
  int compareTo(T other) => si.compareTo(other.si);

  /// Returns a measurement representing the opposite of this.
  T operator -() => construct(-si, defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of two others.
  T operator +(T other) => construct(
        si + other.si,
        defaultUnit,
        Precision.addition(this, other),
      );

  /// Returns a measurement equivalent to the difference between two others.
  T operator -(T other) => construct(
        si - other.si,
        defaultUnit,
        Precision.addition(this, -other),
      );

  /// Returns a measurement equivalent to a multiple of this.
  T operator *(num multiplier) =>
      construct(si * multiplier, defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  T operator /(num divisor) =>
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
  T operator %(T other) => construct(
        defaultUnit.of(_preciseSI() % other._preciseSI()),
        defaultUnit,
        Precision.combine([precisionData, other.precisionData]),
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
  int operator ~/(T other) => _preciseSI() ~/ other._preciseSI();

  DerivedMeasurementBuilder<T> get per;

  /// Creates a derived unit that is the multiplication of this measurement with another.
  ///
  /// For example:
  /// ```dart
  /// var squareMeters = meters(2).by(meters(3));
  /// var coulombs = seconds(4).by(amperes(10));
  /// ```
  DerivedMeasurement<Measurement<T>, Measurement<V>>
      by<V extends Measurement<V>>(Measurement<V> other) =>
          DerivedMeasurement.multiply(this, other);

  /// Returns the difference in magnitude between this and another measurement.
  ///
  /// For example:
  /// ```dart
  /// meters(3).compareMagnitude(deka.meters(3));  // 0.1
  /// ```
  double compareMagnitude(T other) => _preciseSI() / other._preciseSI();

  @override
  String toString() => '$defaultValue $defaultUnit';

  /// Apply the measurement appropriate precision to a value.
  double _precise(num value) => precisionData.apply(value);

  /// Apply the measurement appropriate precision to a converted value.
  double _preciseOf([Unit<T>? converter]) =>
      precisionData.apply(converter?.of(si) ?? si);

  /// Apply the measurement appropriate precision to the base value.
  double _preciseSI() => _precise(si);

  /// Interprets this using the specified units.
  double as(Unit<T> interpreter) => _preciseOf(interpreter);

  /// The value of this measurement, in the interpreter's units.
  final num _amount;

  /// The precision of this measurement.
  final Precision precisionData;
}
