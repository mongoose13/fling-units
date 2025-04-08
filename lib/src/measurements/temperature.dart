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
  const Temperature.absoluteZero([TemperatureChangeUnit defaultUnit = kelvin])
      : _kelvin = 0.0,
        _precision = Precision.max,
        _defaultUnit = defaultUnit;

  /// Infinite temperature.
  const Temperature.infinite([TemperatureChangeUnit defaultUnit = kelvin])
      : _kelvin = double.infinity,
        _precision = Precision.max,
        _defaultUnit = defaultUnit;

  /// NaN (Not a Number) temperature.
  const Temperature.nan([TemperatureChangeUnit unit = kelvin])
      : _kelvin = double.nan,
        _precision = Precision.max,
        _defaultUnit = unit;

  /// Constructs a [Temperature] from a Kelvin amount.
  Temperature.ofKelvin(
    num amount, {
    int precision = Precision.maximumPrecision,
  }) : this._(
          amount,
          precision,
          kelvin,
        );

  /// Constructs a [Temperature] from a degree Celcius amount.
  @Deprecated('Use [ofCelsius]')
  Temperature.ofCelcius(
    num amount, {
    int precision = Precision.maximumPrecision,
  }) : this.ofCelsius(amount, precision: precision);

  /// Constructs a [Temperature] from a degree Celsius amount.
  Temperature.ofCelsius(
    num amount, {
    int precision = Precision.maximumPrecision,
  }) : this._(celsius.toSI(amount) - _celsiusOffset, precision, celsius);

  /// Constructs a [Temperature] from a degree Fahrenheit amount.
  Temperature.ofFahrenheit(
    num amount, {
    int precision = Precision.maximumPrecision,
  }) : this._(
          fahrenheit.toSI(amount - _fahrenheitOffset) - _celsiusOffset,
          precision,
          fahrenheit,
        );

  /// Constructs a [Temperature] with all custom parameters.
  Temperature._(
    num kelvin,
    int precision,
    TemperatureChangeUnit defaultUnit,
  )   : _kelvin = kelvin,
        _precision = Precision(precision),
        _defaultUnit = defaultUnit {
    if (_kelvin.isNegative) {
      throw ArgumentError('Temperatures cannot go below 0 Kelvin: $_kelvin');
    }
  }

  /// Interprets this as Kelvin.
  double get asKelvin => _precision.apply(_kelvin);

  /// Interprets this as degrees Celcius.
  @Deprecated('Use [asCelsius]')
  double get asCelcius => asCelsius;

  /// Interprets this as degrees Celsius.
  double get asCelsius =>
      _precision.apply(celsius.fromSI(_kelvin) + _celsiusOffset);

  /// Interprets this as degrees Fahrenheit.
  double get asFahrenheit => _precision
      .apply(fahrenheit.fromSI(_kelvin + _celsiusOffset) + _fahrenheitOffset);

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
  Temperature operator +(
          Measurement<TemperatureChange, InvertedTemperatureChange> change) =>
      Temperature.ofKelvin(_kelvin + change.si,
          precision: Precision.addition(
              kelvin(_kelvin, precision: _precision.precision), change));

  /// Creates a [Temperature] representing the application of a [Temperature]
  /// and the opposite of a [TemperatureChange].
  ///
  /// ```dart
  /// Temperature.kelvin(3) - TemperatureChange.zero() == Temperature.kelvin(3)
  /// Temperature.kelvin(5) - TemperatureChange.kelvin(3) == Temperature.kelvin(2)
  /// Temperature.kelvin(3) - TemperatureChange.kelvin(-5) == Temperature.kelvin(8)
  /// ```
  Temperature operator -(TemperatureChangeMeasurement change) =>
      Temperature.ofKelvin(_kelvin - change.si,
          precision: Precision.addition(
              kelvin(_kelvin, precision: _precision.precision), -change));

  /// Returns the difference between this and another [Temperature].
  ///
  /// The resulting [TemperatureChange] will be negative if this is smaller than
  /// the other [Temperature].
  TemperatureChangeMeasurement difference(Temperature other) =>
      kelvin(_kelvin - other._kelvin,
          precision: Precision.addition(
              kelvin(_kelvin, precision: _precision.precision),
              kelvin(other._kelvin, precision: other._precision.precision)));

  /// Constructs a new measurement equivalent to this one but with a different
  /// [Precision].
  Temperature withPrecision(int precision) =>
      Temperature._(_kelvin, precision, _defaultUnit);

  /// Constructs a new measurement equivalent to this one but with a different
  /// default measurement unit.
  Temperature withDefaultUnit(TemperatureChangeUnit interpreter) =>
      Temperature._(_kelvin, _precision.precision, interpreter);

  @override
  String toString() => '${_as(_defaultUnit)} $_defaultUnit';

  /// Evaluates the measurement using a different unit.
  double _as(TemperatureChangeUnit interpreter) {
    if (interpreter == celsius) {
      return asCelsius;
    } else if (interpreter == fahrenheit) {
      return asFahrenheit;
    } else {
      return asKelvin;
    }
  }

  /// The offset required for conversions from Kelvin to Celsius.
  static final double _celsiusOffset = -273.15;

  /// The offset required for conversions from Fahrenheit to Celsius.
  static final double _fahrenheitOffset = 32.0;

  /// The measurement, in Kelvin.
  final num _kelvin;

  /// The precision used in all conversions.
  final Precision _precision;

  /// The default interpreter.
  final TemperatureChangeUnit _defaultUnit;
}

mixin TemperatureVisitorMixin {
  void visitTemperature(Temperature temperature) {}
}

extension NumExtensionTemperature on num {
  Temperature get ofKelvin => Temperature.ofKelvin(this);
  Temperature get ofFahrenheit => Temperature.ofFahrenheit(this);
  @Deprecated('Use [ofCelsius]')
  Temperature get ofCelcius => ofCelsius;
  Temperature get ofCelsius => Temperature.ofCelsius(this);
}
