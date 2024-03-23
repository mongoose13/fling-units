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

  const Measurement.nan(MeasurementInterpreter<T> interpreter)
      : this(
          amount: double.nan,
          interpreter: interpreter,
        );

  Measurement.sum(
    Iterable<T> parts, {
    Precision precision = Precision.max,
  }) : this(
          amount: parts.first.defaultInterpreter.of(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: precision,
          interpreter: parts.first.defaultInterpreter,
        );

  /// Constructs a new measurement.
  T construct(
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
  double get si => defaultInterpreter.from(_amount);

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

  /// Creates an equivalent measurement with the specified precision (significant digits).
  T withPrecisionOf(int precision) =>
      construct(_amount.toDouble(), defaultInterpreter, Precision(precision));

  /// Creates a new measurement equivalent to this one but with a different
  /// default unit.
  T withDefaultUnit(MeasurementInterpreter<T> interpreter) =>
      construct(interpreter.of(si), interpreter, _precision);

  /// Accept a visitor object for double-dispatch.
  void acceptVisitor(MeasurementVisitor visitor);

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
          _precision == other._precision;

  @override
  int get hashCode => si.hashCode * _precision.hashCode;

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
  T operator -() => construct(-si, defaultInterpreter, _precision);

  /// Returns a measurement equivalent to the sum of two others.
  T operator +(T other) => construct(
        si + other.si,
        defaultInterpreter,
        Precision.addition(this, other),
      );

  /// Returns a measurement equivalent to the difference between two others.
  T operator -(T other) => construct(
        si - other.si,
        defaultInterpreter,
        Precision.addition(this, -other),
      );

  /// Returns a measurement equivalent to a multiple of this.
  T operator *(num multiplier) =>
      construct(si * multiplier, defaultInterpreter, _precision);

  /// Returns a measurement equivalent to a fraction of this.
  T operator /(num divisor) =>
      construct(si / divisor, defaultInterpreter, _precision);

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
        defaultInterpreter.of(_preciseSI() % other._preciseSI()),
        defaultInterpreter,
        Precision.combine([_precision, other._precision]),
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

  /// Creates a derived measurement that is the division of this measurement with another.
  ///
  /// For example:
  /// ```dart
  /// var milesPerHour = miles(10).per(hours(2));
  /// ```
  DerivedMeasurement<Measurement<T>, Measurement<V>>
      per<V extends Measurement<V>>(Measurement<V> other) =>
          DerivedMeasurement.divide(this, other);

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
  String toString() => '$defaultValue $defaultInterpreter';

  /// Apply the measurement appropriate precision to a value.
  double _precise(num value) => _precision.apply(value);

  /// Apply the measurement appropriate precision to a converted value.
  double _preciseOf([MeasurementInterpreter<T>? converter]) =>
      _precision.apply(converter?.of(si) ?? si);

  /// Apply the measurement appropriate precision to the base value.
  double _preciseSI() => _precise(si);

  /// Interprets this using the specified units.
  double as(MeasurementInterpreter<T> interpreter) => _preciseOf(interpreter);

  /// The value of this measurement, in the interpreter's units.
  final num _amount;

  /// The precision of this measurement.
  final Precision _precision;
}
