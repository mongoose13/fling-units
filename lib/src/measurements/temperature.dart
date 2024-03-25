import "package:fling_units/fling_units.dart";

/// Represents a "thermometer" temperature.
///
/// This is distinguished from a change in temperature because of the fact that
/// temperature scales are not zero-based. To represent a change in temperature
/// instead, and for an in-depth explanation of this requirement, see the
/// [TemperatureChange] class documentation.
///
/// Several operations on the [Temperature] class work with [TemperatureChange]
/// instances instead of [Temperature] instances. This is because the natural
/// way to think about those operations is in terms of temperature changes. For
/// example, the `+` operator applies a change in temperature rather than a
/// "thermometer" temperature. While physicists may intend to actually add two
/// "thermometer" temperatures together in some cases, this is not the common
/// meaning of "adding temperature," so the more esoteric uses are supported
/// with special methods rather than the built-in operators. Pay special
/// attention to the operations in this class to ensure proper use of the
/// library. The type system should catch most errors, e.g. adding together two
/// "thermometer" temperatures with the `+` operator.
class Temperature implements Comparable<Temperature> {
  /// Absolute zero.
  const Temperature.absoluteZero(
      [MeasurementInterpreter<TemperatureChange> defaultInterpreter = kelvin])
      : _kelvin = 0.0,
        _precision = Precision.max,
        _defaultInterpreter = defaultInterpreter;

  /// Infinite temperature.
  const Temperature.infinite(
      [MeasurementInterpreter<TemperatureChange> defaultInterpreter = kelvin])
      : _kelvin = double.infinity,
        _precision = Precision.max,
        _defaultInterpreter = defaultInterpreter;

  /// NaN (Not a Number) temperature.
  const Temperature.nan(
      [MeasurementInterpreter<TemperatureChange> interpreter = kelvin])
      : _kelvin = double.nan,
        _precision = Precision.max,
        _defaultInterpreter = interpreter;

  /// Constructs a [Temperature] from a Kelvin amount.
  Temperature.ofKelvin(
    num amount, {
    Precision precision = Precision.max,
  }) : this._(
          amount,
          precision,
          kelvin,
        );

  /// Constructs a [Temperature] from a degree Celcius amount.
  Temperature.ofCelcius(
    num amount, {
    Precision precision = Precision.max,
  }) : this._(celcius.from(amount) - _celciusOffset, precision, celcius);

  /// Constructs a [Temperature] from a degree Fahrenheit amount.
  Temperature.ofFahrenheit(
    num amount, {
    Precision precision = Precision.max,
  }) : this._(
          fahrenheit.from(amount - _fahrenheitOffset) - _celciusOffset,
          precision,
          fahrenheit,
        );

  /// Constructs a [Temperature] with all custom parameters.
  Temperature._(
    num kelvin,
    Precision precision,
    MeasurementInterpreter<TemperatureChange> defaultInterpreter,
  )   : _kelvin = kelvin,
        _precision = precision,
        _defaultInterpreter = defaultInterpreter {
    if (_kelvin.isNegative) {
      throw ArgumentError('Temperatures cannot go below 0 Kelvin: $_kelvin');
    }
  }

  /// Interprets this as Kelvin.
  double get asKelvin => _precision.apply(_kelvin);

  /// Interprets this as degrees Celcius.
  double get asCelcius =>
      _precision.apply(celcius.of(_kelvin) + _celciusOffset);

  /// Interprets this as degrees Fahrenheit.
  double get asFahrenheit => _precision
      .apply(fahrenheit.of(_kelvin + _celciusOffset) + _fahrenheitOffset);

  /// Returns `true` if this is finite.
  bool get isFinite => _kelvin.isFinite;

  /// Returns `true` if this is infinite.
  bool get isInfinite => _kelvin.isInfinite;

  /// Returns the digits of precision this measurement has.
  int get precision => _precision.precision;

  @override
  bool operator ==(Object other) =>
      other is Temperature &&
      other._kelvin == _kelvin &&
      other._precision == _precision;

  @override
  int get hashCode => _kelvin.hashCode * _precision.hashCode;

  /// Returns `true` if this is larger than the other [Temperature].
  bool operator >(Temperature other) => asKelvin > other.asKelvin;

  /// Returns `true` if this is larger than or equal to the other [Temperature].
  bool operator >=(Temperature other) => asKelvin >= other.asKelvin;

  /// Returns `true` if this is smaller than the other [Temperature].
  bool operator <(Temperature other) => asKelvin < other.asKelvin;

  /// Returns `true` if this is smaller than or equal to the other [Temperature].
  bool operator <=(Temperature other) => asKelvin <= other.asKelvin;

  @override
  int compareTo(Temperature other) => asKelvin.compareTo(other.asKelvin);

  /// Creates a [Temperature] representing the application of a [Temperature]
  /// and a [TemperatureChange].
  ///
  /// ```dart
  /// Temperature.kelvin(2) + TemperatureChange.zero() == Temperature.kelvin(2)
  /// Temperature.kelvin(2) + TemperatureChange.kelvin(3) == Temperature.kelvin(5)
  /// Temperature.kelvin(2) + TemperatureChange.kelvin(-1) == Temperature.kelvin(1)
  /// ```
  Temperature operator +(TemperatureChange change) => Temperature.ofKelvin(
      _kelvin + change.si,
      precision:
          Precision.addition(kelvin(_kelvin, precision: _precision), change));

  /// Creates a [Temperature] representing the application of a [Temperature]
  /// and the opposite of a [TemperatureChange].
  ///
  /// ```dart
  /// Temperature.kelvin(3) - TemperatureChange.zero() == Temperature.kelvin(3)
  /// Temperature.kelvin(5) - TemperatureChange.kelvin(3) == Temperature.kelvin(2)
  /// Temperature.kelvin(3) - TemperatureChange.kelvin(-5) == Temperature.kelvin(8)
  /// ```
  Temperature operator -(TemperatureChange change) => Temperature.ofKelvin(
      _kelvin - change.si,
      precision:
          Precision.addition(kelvin(_kelvin, precision: _precision), -change));

  /// Returns the difference between this and another [Temperature].
  ///
  /// The resulting [TemperatureChange] will be negative if this is smaller than
  /// the other [Temperature].
  TemperatureChange difference(Temperature other) => kelvin(
      _kelvin - other._kelvin,
      precision: Precision.addition(kelvin(_kelvin, precision: _precision),
          kelvin(other._kelvin, precision: other._precision)));

  /// Accept a measurement visitor.
  void acceptVisitor(MeasurementVisitor visitor) =>
      visitor.visitTemperature(this);

  /// Constructs a new measurement equivalent to this one but with a different
  /// [Precision].
  Temperature withPrecision(Precision precision) =>
      Temperature._(_kelvin, precision, _defaultInterpreter);

  /// Constructs a new measurement equivalent to this one but with a different
  /// precision (significant digits).
  Temperature withPrecisionOf(int precision) =>
      withPrecision(Precision(precision));

  /// Constructs a new measurement equivalent to this one but with a different
  /// default measurement unit.
  Temperature withDefaultUnit(
          MeasurementInterpreter<TemperatureChange> interpreter) =>
      Temperature._(_kelvin, _precision, interpreter);

  @override
  String toString() => '${_as(_defaultInterpreter)} $_defaultInterpreter';

  /// Evaluates the measurement using a different unit.
  double _as(MeasurementInterpreter<TemperatureChange> interpreter) {
    if (interpreter == celcius) {
      return asCelcius;
    } else if (interpreter == fahrenheit) {
      return asFahrenheit;
    } else {
      return asKelvin;
    }
  }

  /// The offset required for conversions from Kelvin to Celcius.
  static final double _celciusOffset = -273.15;

  /// The offset required for conversions from Fahrenheit to Celcius.
  static final double _fahrenheitOffset = 32.0;

  /// The measurement, in Kelvin.
  final num _kelvin;

  /// The precision used in all conversions.
  final Precision _precision;

  /// The default interpreter.
  final MeasurementInterpreter<TemperatureChange> _defaultInterpreter;
}

extension TemperatureVisitorExtension on MeasurementVisitor {
  void visitTemperature(Temperature temperature) {}
}

extension NumExtensionTemperature on num {
  Temperature get ofKelvin => Temperature.ofKelvin(this);
  Temperature get ofFahrenheit => Temperature.ofFahrenheit(this);
  Temperature get ofCelcius => Temperature.ofCelcius(this);
}
