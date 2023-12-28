part of '../../fling_units.dart';

/// Base class for any type of measurement.
abstract class Measurement<T extends Measurement<T>> implements Comparable<T> {
  /// Creates a base measurement.
  const Measurement({
    required num amount,
    required MeasurementInterpreter<T> interpreter,
    Precision precision = Precision.max,
  })  : _amount = amount,
        defaultInterpreter = interpreter,
        _precision = precision;

  const Measurement.zero(MeasurementInterpreter<T> interpreter)
      : this(
          amount: 0.0,
          interpreter: interpreter,
        );

  const Measurement.infinite(MeasurementInterpreter<T> interpreter)
      : this(
          amount: double.infinity,
          interpreter: interpreter,
        );

  const Measurement.negativeInfinite(MeasurementInterpreter<T> interpreter)
      : this(
          amount: -double.infinity,
          interpreter: interpreter,
        );

  Measurement.sum(
    final Iterable<T> parts, {
    final Precision precision = Precision.max,
  }) : this(
          amount: parts.first.defaultInterpreter._of(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: precision,
          interpreter: parts.first.defaultInterpreter,
        );

  /// Constructs a new measurement.
  T _construct(
    double amount,
    MeasurementInterpreter<T>? interpreter,
    Precision precision,
  );

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [withDefaultUnit].
  final MeasurementInterpreter<T> defaultInterpreter;

  /// Returns the default measurement value (i.e. the measurement as interpreted
  /// by the default [MeasurementInterpreter].
  ///
  /// This is equivalent to `as(defaultInterpreter)`.
  double get defaultValue => _precise(_amount);

  /// The measurement's value in the SI unit.
  double get si => defaultInterpreter._from(_amount);

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
  int get precision => _precision.precision;

  /// Creates an equivalent measurement with the specified precision.
  T withPrecision(final Precision precision) =>
      _construct(_amount.toDouble(), defaultInterpreter, precision);

  /// Creates a new measurement equivalent to this one but with a different
  /// default unit.
  T withDefaultUnit(final MeasurementInterpreter<T> interpreter) =>
      _construct(interpreter._of(si), interpreter, _precision);

  /// Accept a visitor object for double-dispatch.
  void acceptVisitor(final MeasurementVisitor visitor);

  @override
  bool operator ==(final dynamic other) =>
      other is Measurement<T> &&
      si == other.si &&
      _precision == other._precision;

  @override
  int get hashCode => si.hashCode * _precision.hashCode;

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
  T operator -() => _construct(-si, defaultInterpreter, _precision);

  /// Returns a measurement equivalent to the sum of two others.
  T operator +(final T other) => _construct(
        si + other.si,
        defaultInterpreter,
        Precision.addition(this, other),
      );

  /// Returns a measurement equivalent to the difference between two others.
  T operator -(final T other) => _construct(
        si - other.si,
        defaultInterpreter,
        Precision.addition(this, -other),
      );

  /// Returns a measurement equivalent to a multiple of this.
  T operator *(final double multiplier) =>
      _construct(si * multiplier, defaultInterpreter, _precision);

  /// Returns a measurement equivalent to a fraction of this.
  T operator /(final double divisor) =>
      _construct(si / divisor, defaultInterpreter, _precision);

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

  /// Returns the difference in magnitude between this and another measurement.
  ///
  /// For example:
  /// ```dart
  /// meters(3).compareMagnitude(deka.meters(3));  // 0.1
  /// ```
  double compareMagnitude(final T other) => _preciseSI() / other._preciseSI();

  @override
  String toString() => '$defaultValue $defaultInterpreter';

  /// Apply the measurement appropriate precision to a value.
  double _precise(final num value) => _precision.withPrecision(value);

  /// Apply the measurement appropriate precision to a converted value.
  double _preciseOf([final MeasurementInterpreter<T>? converter]) =>
      _precision.withPrecision(converter?._of(si) ?? si);

  /// Apply the measurement appropriate precision to the base value.
  double _preciseSI() => _precise(si);

  /// The value of this measurement, in the interpreter's units.
  final num _amount;

  /// The precision of this measurement.
  final Precision _precision;
}
