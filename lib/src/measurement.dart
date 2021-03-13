part of fling_units;

/// Base class for any type of measurement.
abstract class Measurement<T extends Measurement<T>> implements Comparable<T> {
  /// The SI value this measurement is based on.
  final double si;

  /// Constructs a basic measurement.
  Measurement(this.si, final Precision precision) : _precision = precision;

  /// A measurement of zero.
  const Measurement.zero()
      : si = 0.0,
        _precision = Precision.max;

  /// An infinite measurement.
  const Measurement.infinite()
      : si = double.infinity,
        _precision = Precision.max;

  /// A negative infinite measurement.
  const Measurement.negativeInfinite()
      : si = double.negativeInfinity,
        _precision = Precision.max;

  /// Returns `true` if this measurement is negative.
  bool get isNegative => si.isNegative;

  /// Returns `true` if this measurement is infinite (either positive or
  /// negative).
  bool get isInfinite => si.isInfinite;

  /// Returns `true` if this measurement is finite.
  bool get isFinite => si.isFinite;

  /// Returns `true` if this measurement cannot be expressed as a number.
  bool get isNaN => si.isNaN;

  @override
  bool operator ==(final dynamic other) =>
      other is Measurement<T> &&
      si == other.si &&
      _precision == other._precision;

  /// Returns `true` if this is greater than the other measurement.
  ///
  /// Precision may play a role here, e.g. the following evaluates to `true`:
  /// ```dart
  /// Distance(3.14159, precision: Precision(5)) > Distance(3.142, precision: Precision(3));
  /// ```
  bool operator >(final T other) => _precise(si) > _precise(other.si);

  /// Returns `true` if this is greater than or equal to the other measurement.
  ///
  /// Precision may play a role here, e.g. the following evaluates to `true`:
  /// ```dart
  /// Distance(3.14159, precision: Precision(5)) >= Distance(3.142, precision: Precision(3));
  /// ```
  bool operator >=(final T other) => _precise(si) >= _precise(other.si);

  /// Returns `true` if this is less than the other measurement.
  ///
  /// Precision may play a role here, e.g. the following evaluates to `false`:
  /// ```dart
  /// Distance(3.14159, precision: Precision(5)) < Distance(3.142, precision: Precision(3));
  /// ```
  bool operator <(final T other) => _precise(si) < _precise(other.si);

  /// Returns `true` if this is less than or equal to the other measurement.
  ///
  /// Precision may play a role here, e.g. the following evaluates to `false`:
  /// ```dart
  /// Distance(3.14159, precision: Precision(5)) <= Distance(3.142, precision: Precision(3));
  /// ```
  bool operator <=(final T other) => _precise(si) <= _precise(other.si);

  @override
  int compareTo(final T other) => si.compareTo(other.si);

  /// Returns a measurement representing the opposite of this.
  T operator -() => _construct(-si, _precision);

  /// Returns a measurement equivalent to the sum of two others.
  T operator +(final T other) =>
      _construct(si + other.si, Precision.add(_precision, other._precision));

  /// Returns a measurement equivalent to the difference between two others.
  T operator -(final T other) =>
      _construct(si - other.si, Precision.add(_precision, other._precision));

  /// Returns a measurement equivalent to a multiple of this.
  T operator *(final double multiplier) =>
      _construct(si * multiplier, _precision);

  /// Returns a measurement equivalent to a fraction of this.
  T operator /(final double divisor) => _construct(si / divisor, _precision);

  @override
  int get hashCode => si.hashCode * _precision.hashCode;

  /// Returns the number of digits of precision this measurement has.
  int get precision => _precision.precision;

  /// Apply the measurement appropriate precision to a value.
  double _precise(final double value) => _precision.withPrecision(value);

  /// Apply the measurement appropriate precision to a converted value.
  double _preciseOf(final MeasurementInterpreter<T> converter) =>
      _precision.withPrecision(converter._of(si));

  /// Constructs a new measurement.
  T _construct(final double si, final Precision precision);

  /// The precision of this measurement.
  final Precision _precision;
}