part of "library.dart";

/// Base class for any type of measurement.
abstract class Measurement<D extends Dimension, I extends Dimension>
    implements Comparable<Measurement<D, I>> {
  /// Creates a base measurement.
  const Measurement({
    required this.magnitude,
    Precision precision = Precision.max,
  }) : precisionData = precision;

  /// Creates a measurement of magnitude zero.
  const Measurement.zero() : this(magnitude: 0.0);

  /// Creates a measurement of infinite magnitude.
  const Measurement.infinite()
      : this(
          magnitude: double.infinity,
        );

  /// Creates a measurement of negative infinite magnitude.
  const Measurement.negativeInfinite()
      : this(
          magnitude: -double.infinity,
        );

  /// Creates a measurement that is not a number.
  const Measurement.nan()
      : this(
          magnitude: double.nan,
        );

  /// Creates a measurement that is the sum of several measurements.
  Measurement.sum(
    Iterable<Measurement<D, I>> parts, {
    int precision = Precision.maximumPrecision,
  }) : this(
          magnitude: parts.fold(
              0.0, (previousValue, element) => previousValue + element.si),
          precision: Precision(precision),
        );

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  Unit<D, I> get defaultUnit;

  /// Returns the default measurement value (i.e. the measurement as interpreted
  /// by the default [Unit].
  ///
  /// This is equivalent to `as(defaultUnit)`.
  double get defaultValue => _precise(magnitude);

  /// The measurement's value in the SI unit.
  double get si => defaultUnit.toSI(magnitude);

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
  bool equals(Measurement<D, I> other) {
    return identical(this, other) ||
        isNaN && other.isNaN ||
        other._precise(preciseDefaultValue) ==
            _precise(other.preciseDefaultValue);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Measurement<D, I> &&
          si == other.si &&
          precisionData == other.precisionData;

  @override
  int get hashCode => si.hashCode * precisionData.hashCode;

  /// Returns `true` if this is greater than the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator >(Measurement<D, I> other) => _precise(si) > _precise(other.si);

  /// Returns `true` if this is greater than or equal to the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator >=(Measurement<D, I> other) =>
      _precise(si) >= _precise(other.si);

  /// Returns `true` if this is less than the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator <(Measurement<D, I> other) => _precise(si) < _precise(other.si);

  /// Returns `true` if this is less than or equal to the other measurement.
  ///
  /// This uses the first measurement's precision for all calculations.
  bool operator <=(Measurement<D, I> other) =>
      _precise(si) <= _precise(other.si);

  @override
  int compareTo(Measurement<D, I> other) => si.compareTo(other.si);

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
  int operator ~/(Measurement<D, I> other) =>
      preciseDefaultValue ~/ other.preciseDefaultValue;

  /// Returns the difference in magnitude between this and another measurement.
  ///
  /// For example:
  /// ```dart
  /// meters(3).compareMagnitude(deka.meters(3));  // 0.1
  /// ```
  double compareMagnitude(Measurement<D, I> other) =>
      preciseDefaultValue / other.preciseDefaultValue;

  @override
  String toString() => '$defaultValue $defaultUnit';

  /// Apply the measurement appropriate precision to a value.
  double _precise(num value) => precisionData.apply(value);

  /// Apply the measurement appropriate precision to the base value.
  double get preciseDefaultValue => _precise(si);

  /// The value of this measurement in the default unit.
  final num magnitude;

  /// The precision of this measurement.
  final Precision precisionData;
}
