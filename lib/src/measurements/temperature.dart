part of fling_units;

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
  const Temperature.absoluteZero()
      : _kelvin = 0.0,
        _precision = Precision.max;

  /// Infinite temperature.
  const Temperature.infinite()
      : _kelvin = double.infinity,
        _precision = Precision.max;

  /// Constructs a [Temperature] from a Kelvin amount.
  Temperature.ofKelvin(final num kelvin,
      {final Precision precision = Precision.max})
      : _kelvin = kelvin.toDouble(),
        _precision = precision {
    if (kelvin.isNegative) {
      throw ArgumentError('Temperatures cannot go below 0 Kelvin: $kelvin');
    }
  }

  /// Constructs a [Temperature] from a degree Celcius amount.
  Temperature.ofCelcius(final num celcius,
      {final Precision precision = Precision.max})
      : this.ofKelvin(
            TemperatureChangeInterpreter._celcius._from(celcius) -
                _celciusOffset,
            precision: precision);

  /// Constructs a [Temperature] from a degree Fahrenheit amount.
  Temperature.ofFahrenheit(final num fahrenheit,
      {final Precision precision = Precision.max})
      : this.ofKelvin(
            TemperatureChangeInterpreter._fahrenheit
                    ._from(fahrenheit - _fahrenheitOffset) -
                _celciusOffset,
            precision: precision);

  /// Interprets this as Kelvin.
  double get asKelvin => _precision.withPrecision(_kelvin);

  /// Interprets this as degrees Celcius.
  double get asCelcius => _precision.withPrecision(
      TemperatureChangeInterpreter._celcius._of(_kelvin) + _celciusOffset);

  /// Interprets this as degrees Fahrenheit.
  double get asFahrenheit => _precision.withPrecision(
      TemperatureChangeInterpreter._fahrenheit._of(_kelvin + _celciusOffset) +
          _fahrenheitOffset);

  /// Returns `true` if this is finite.
  bool get isFinite => _kelvin.isFinite;

  /// Returns `true` if this is infinite.
  bool get isInfinite => _kelvin.isInfinite;

  /// Returns the digits of precision this measurement has.
  int get precision => _precision.precision;

  @override
  bool operator ==(final dynamic other) =>
      other is Temperature &&
      other._kelvin == _kelvin &&
      other._precision == _precision;

  @override
  int get hashCode => _kelvin.hashCode * _precision.hashCode;

  /// Returns `true` if this is larger than the other [Temperature].
  bool operator >(final Temperature other) => asKelvin > other.asKelvin;

  /// Returns `true` if this is larger than or equal to the other [Temperature].
  bool operator >=(final Temperature other) => asKelvin >= other.asKelvin;

  /// Returns `true` if this is smaller than the other [Temperature].
  bool operator <(final Temperature other) => asKelvin < other.asKelvin;

  /// Returns `true` if this is smaller than or equal to the other [Temperature].
  bool operator <=(final Temperature other) => asKelvin <= other.asKelvin;

  @override
  int compareTo(final Temperature other) => asKelvin.compareTo(other.asKelvin);

  /// Creates a [Temperature] representing the application of a [Temperature]
  /// and a [TemperatureChange].
  ///
  /// ```dart
  /// Temperature.kelvin(2) + TemperatureChange.zero() == Temperature.kelvin(2)
  /// Temperature.kelvin(2) + TemperatureChange.kelvin(3) == Temperature.kelvin(5)
  /// Temperature.kelvin(2) + TemperatureChange.kelvin(-1) == Temperature.kelvin(1)
  /// ```
  Temperature operator +(final TemperatureChange change) =>
      Temperature.ofKelvin(_kelvin + change.si,
          precision: Precision.addition(
              kelvin(_kelvin, precision: _precision), change));

  /// Creates a [Temperature] representing the application of a [Temperature]
  /// and the opposite of a [TemperatureChange].
  ///
  /// ```dart
  /// Temperature.kelvin(3) - TemperatureChange.zero() == Temperature.kelvin(3)
  /// Temperature.kelvin(5) - TemperatureChange.kelvin(3) == Temperature.kelvin(2)
  /// Temperature.kelvin(3) - TemperatureChange.kelvin(-5) == Temperature.kelvin(8)
  /// ```
  Temperature operator -(final TemperatureChange change) =>
      Temperature.ofKelvin(_kelvin - change.si,
          precision: Precision.addition(
              kelvin(_kelvin, precision: _precision), -change));

  /// Returns the difference between this and another [Temperature].
  ///
  /// The resulting [TemperatureChange] will be negative if this is smaller than
  /// the other [Temperature].
  TemperatureChange difference(final Temperature other) =>
      kelvin(_kelvin - other._kelvin,
          precision: Precision.addition(kelvin(_kelvin, precision: _precision),
              kelvin(other._kelvin, precision: other._precision)));

  /// Accept a measurement visitor.
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitTemperature(this);

  @override
  String toString() => '$asKelvin K';

  /// The offset required for conversions from Kelvin to Celcius.
  static final double _celciusOffset = -273.15;

  /// The offset required for conversions from Fahrenheit to Celcius.
  static final double _fahrenheitOffset = 32.0;

  /// The measurement, in Kelvin.
  final double _kelvin;

  /// The precision used in all conversions.
  final Precision _precision;
}
