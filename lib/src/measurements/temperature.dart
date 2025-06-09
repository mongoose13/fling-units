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
        precision = Precision.max,
        _defaultUnit = defaultUnit;

  /// Infinite temperature.
  const Temperature.infinite([TemperatureChangeUnit defaultUnit = kelvin])
      : _kelvin = double.infinity,
        precision = Precision.max,
        _defaultUnit = defaultUnit;

  /// NaN (Not a Number) temperature.
  const Temperature.nan([TemperatureChangeUnit unit = kelvin])
      : _kelvin = double.nan,
        precision = Precision.max,
        _defaultUnit = unit;

  /// Constructs a [Temperature] from a Kelvin amount.
  Temperature.ofKelvin(
    num amount, {
    Precision precision = Precision.max,
  }) : this._(
          amount,
          precision,
          kelvin,
        );

  /// Constructs a [Temperature] from a degree Celsius amount.
  Temperature.ofCelsius(
    num amount, {
    Precision precision = Precision.max,
  }) : this._(celsius.toSI(amount) - _celsiusOffset, precision, celsius);

  /// Constructs a [Temperature] from a degree Fahrenheit amount.
  Temperature.ofFahrenheit(
    num amount, {
    Precision precision = Precision.max,
  }) : this._(
          fahrenheit.toSI(amount - _fahrenheitOffset) - _celsiusOffset,
          precision,
          fahrenheit,
        );

  /// Constructs a [Temperature] with all custom parameters.
  Temperature._(
    num kelvin,
    this.precision,
    TemperatureChangeUnit defaultUnit,
  )   : _kelvin = kelvin,
        _defaultUnit = defaultUnit {
    if (_kelvin.isNegative) {
      throw ArgumentError('Temperatures cannot go below 0 Kelvin: $_kelvin');
    }
  }

  /// Interprets this as Kelvin.
  double get asKelvin => precision.apply(_kelvin);

  /// Interprets this as degrees Celsius.
  double get asCelsius =>
      precision.apply(celsius.fromSI(_kelvin) + _celsiusOffset);

  /// Interprets this as degrees Fahrenheit.
  double get asFahrenheit => precision
      .apply(fahrenheit.fromSI(_kelvin + _celsiusOffset) + _fahrenheitOffset);

  /// Returns `true` if this is finite.
  bool get isFinite => _kelvin.isFinite;

  /// Returns `true` if this is infinite.
  bool get isInfinite => _kelvin.isInfinite;

  @override
  bool operator ==(Object other) =>
      other is Temperature &&
      other._kelvin == _kelvin &&
      other.precision == precision;

  @override
  int get hashCode => _kelvin.hashCode * precision.hashCode;

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
              kelvin(_kelvin, precision: precision), change));

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
              kelvin(_kelvin, precision: precision), -change));

  /// Returns the difference between this and another [Temperature].
  ///
  /// The resulting [TemperatureChange] will be negative if this is smaller than
  /// the other [Temperature].
  TemperatureChangeMeasurement difference(Temperature other) =>
      kelvin(_kelvin - other._kelvin,
          precision: Precision.addition(kelvin(_kelvin, precision: precision),
              kelvin(other._kelvin, precision: other.precision)));

  /// Constructs a new measurement equivalent to this one but with a different
  /// [Precision].
  Temperature withPrecision(Precision precision) =>
      Temperature._(_kelvin, precision, _defaultUnit);

  /// Constructs a new measurement equivalent to this one but with a different
  /// default measurement unit.
  Temperature withDefaultUnit(TemperatureChangeUnit interpreter) =>
      Temperature._(_kelvin, precision, interpreter);

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
  final Precision precision;

  /// The default interpreter.
  final TemperatureChangeUnit _defaultUnit;
}

mixin TemperatureVisitorMixin {
  void visitTemperature(Temperature temperature) {}
}

extension NumExtensionTemperature on num {
  Temperature get ofKelvin => Temperature.ofKelvin(this);
  Temperature get ofFahrenheit => Temperature.ofFahrenheit(this);
  Temperature get ofCelsius => Temperature.ofCelsius(this);
}
