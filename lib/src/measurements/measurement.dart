part of fling_units;

/// Base class for any type of measurement.
abstract class Measurement<T extends Measurement<T>> implements Comparable<T> {
  /// The SI value this measurement is based on.
  final double si;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [withDefaultUnit].
  final MeasurementInterpreter<T> _interpreter;

  /// Constructs a basic measurement.
  const Measurement(
    this.si,
    final Precision precision,
    final MeasurementInterpreter<T> interpreter,
  )   : _interpreter = interpreter,
        _precision = precision;

  /// Constructs a measurement representing the sum of other measurements.
  Measurement.sum(final Iterable<T> parts, final Precision precision)
      : this(
          parts.fold(
              0.0, (previousValue, element) => previousValue + element.si),
          precision,
          parts.first._interpreter,
        );

  /// Creates a derived measurement that is the division of this measurement with another.
  ///
  /// For example:
  /// ```dart
  /// var milesPerHour = miles(10).per(hours(2));
  /// ```
  DerivedMeasurement<Measurement<T>, Measurement<V>>
      per<V extends Measurement<V>>(final Measurement<V> other) =>
          DerivedMeasurement.divide(this, other);

  /// Creates a derived unit that is the multiplication of this measurement with another.
  ///
  /// For example:
  /// ```dart
  /// var squareMeters = meters(2).by(meters(3));
  /// var coulombs = seconds(4).by(amperes(10));
  /// ```
  DerivedMeasurement<Measurement<T>, Measurement<V>>
      by<V extends Measurement<V>>(final Measurement<V> other) =>
          DerivedMeasurement.multiply(this, other);

  /// A measurement of zero.
  const Measurement.zero(final MeasurementInterpreter<T> interpreter)
      : si = 0.0,
        _interpreter = interpreter,
        _precision = Precision.max;

  /// An infinite measurement.
  const Measurement.infinite(final MeasurementInterpreter<T> interpreter)
      : si = double.infinity,
        _interpreter = interpreter,
        _precision = Precision.max;

  /// A negative infinite measurement.
  const Measurement.negativeInfinite(
      final MeasurementInterpreter<T> interpreter)
      : si = double.negativeInfinity,
        _interpreter = interpreter,
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
  T operator -() => _construct(-si, _precision, _interpreter);

  /// Returns a measurement equivalent to the sum of two others.
  T operator +(final T other) =>
      _construct(si + other.si, Precision.addition(this, other), _interpreter);

  /// Returns a measurement equivalent to the difference between two others.
  T operator -(final T other) =>
      _construct(si - other.si, Precision.addition(this, -other), _interpreter);

  /// Returns a measurement equivalent to a multiple of this.
  T operator *(final double multiplier) =>
      _construct(si * multiplier, _precision, _interpreter);

  /// Returns a measurement equivalent to a fraction of this.
  T operator /(final double divisor) =>
      _construct(si / divisor, _precision, _interpreter);

  /// Returns the difference in magnitude between this and another measurement.
  ///
  /// For example:
  /// ```dart
  /// meters(3).compareMagnitude(deka.meters(3));  // 0.1
  /// ```
  double compareMagnitude(final T other) => _preciseSI() / other._preciseSI();

  /// Returns the truncating division result of this and another measurement.
  ///
  /// For example:
  /// ```dart
  /// var fullHalfCups = cups(1.25) ~/ cups(0.5);  // 2
  /// ```
  ///
  /// Attempting to divide by a measurement of magnitude zero, or attempting to
  /// divide an infinite measurement, will result in UnsupportedError (`int`
  /// cannot hold an infinite or `NaN` value).
  int operator ~/(final T other) => _preciseSI() ~/ other._preciseSI();

  @override
  int get hashCode => si.hashCode * _precision.hashCode;

  @override
  String toString() => '${_preciseOf(_interpreter)} $_interpreter';

  /// Returns the number of digits of precision this measurement has.
  int get precision => _precision.precision;

  /// Creates an equivalent measurement with the specified precision.
  T withPrecision(final Precision precision) =>
      _construct(si, precision, _interpreter);

  /// Accept a visitor object for double-dispatch.
  void acceptVisitor(final MeasurementVisitor visitor);

  /// Creates a new measurement equivalent to this one but with a different
  /// default unit.
  T withDefaultUnit(final MeasurementInterpreter<T> interpreter) =>
      _construct(si, _precision, interpreter);

  /// Apply the measurement appropriate precision to a value.
  double _precise(final double value) => _precision.withPrecision(value);

  /// Apply the measurement appropriate precision to a converted value.
  double _preciseOf(final MeasurementInterpreter<T> converter) =>
      _precision.withPrecision(converter._of(si));

  /// Apply the measurement appropriate precision to the base value.
  double _preciseSI() => _precise(si);

  /// Constructs a new measurement.
  T _construct(
    final double si,
    final Precision precision,
    final MeasurementInterpreter<T> interpreter,
  );

  /// The precision of this measurement.
  final Precision _precision;
}
