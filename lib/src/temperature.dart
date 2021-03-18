part of fling_units;

/// The [MeasurementInterpreter] for [TemperatureChange]s.
class TemperatureChangeInterpreter
    extends MeasurementInterpreter<TemperatureChange> {
  /// Constructs a [TemperatureChangeInterpreter].
  const TemperatureChangeInterpreter._(final double kelvin) : super._(kelvin);
}

/// Represents a change in temperature.
///
/// Because temperature scales are not zero-based (except for Kelvin), working
/// with temperature numbers can be counter-intuitive. For example, what does
/// it mean to "subtract 10 degrees Celcius from 10 degrees Celcius"? One might
/// say the answer is 0 degrees Celcius, but one might also say the answer is
/// "absolute zero" (-273.15 degrees Celcius). Depending on what you mean when
/// you say "subtract 10 degrees Celcius", one of those two will be correct.
///
/// To resolve this ambiguity, the [TemperatureChange] class allows one to model
/// differences in temperature (as opposed to "thermometer" temperatures). If
/// you intend to say "it is 10 degrees Celcius colder than yesterday" then you
/// want to use a [Temperature] alongside a [TemperatureChange] of 10 degrees
/// Celcius as opposed to two [Temperature]s of 10 degrees Celcius.
///
/// Instances of this class may also represent the difference between two
/// "thermometer" temperatures. For example, if I calculate the difference in
/// temperature between today's weather and yesterday's weather, I would get a
/// [TemperatureChange] whose value indicates the amount of difference between
/// the two [Temperature]s. It would not make sense to say that the difference
/// in temperature is the "thermometer" temperature of 10 degrees.
class TemperatureChange extends Measurement<TemperatureChange> {
  /// The [TemperatureChangeInterpreter] for Kelvin.
  static final TemperatureChangeInterpreter kelvin =
      TemperatureChangeInterpreter._(1.0);

  /// The [TemperatureChangeInterpreter] for degrees Celcius.
  static final TemperatureChangeInterpreter celcius =
      TemperatureChangeInterpreter._(1.0);

  /// The [TemperatureChangeInterpreter] for degrees Fahrenheit.
  static final TemperatureChangeInterpreter fahrenheit =
      TemperatureChangeInterpreter._(9.0 / 5.0);

  /// No change in temperature.
  const TemperatureChange.zero() : super.zero();

  /// Infinite temperature change.
  const TemperatureChange.infinite() : super.infinite();

  /// Negative infinite temperature change.
  const TemperatureChange.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [TemperatureChange] from a Kelvin amount.
  TemperatureChange.ofKelvin(final num kelvin,
      {final Precision precision = Precision.max})
      : this._(TemperatureChange.kelvin._from(kelvin), precision);

  /// Constructs a [TemperatureChange] from a degree Celcius amount.
  TemperatureChange.ofCelcius(final num celcius,
      {final Precision precision = Precision.max})
      : this._(TemperatureChange.celcius._from(celcius), precision);

  /// Constructs a [TemperatureChange] from a degree Fahrenheit amount.
  TemperatureChange.ofFahrenheit(final num fahrenheit,
      {final Precision precision = Precision.max})
      : this._(TemperatureChange.fahrenheit._from(fahrenheit), precision);

  /// Returns a [TemperatureChange] that represents the positive magnitude of
  /// this.
  TemperatureChange magnitude() => TemperatureChange._(si.abs(), _precision);

  /// Interprets this in Kelvin.
  double get asKelvin => _preciseOf(kelvin);

  /// Interprets this in degrees Celcius.
  double get asCelcius => _preciseOf(celcius);

  /// Interprets this in degrees Fahrenheit.
  double get asFahrenheit => _preciseOf(fahrenheit);

  @override
  String toString() => '$asKelvin K';

  /// Constructs a [TemperatureChange].
  const TemperatureChange._(final double kelvin, final Precision precision)
      : super(kelvin, precision);

  @override
  TemperatureChange _construct(
          final double kelvin, final Precision precision) =>
      TemperatureChange._(kelvin, precision);
}

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
      : this.ofKelvin(TemperatureChange.celcius._from(celcius) - _celciusOffset,
            precision: precision);

  /// Constructs a [Temperature] from a degree Fahrenheit amount.
  Temperature.ofFahrenheit(final num fahrenheit,
      {final Precision precision = Precision.max})
      : this.ofKelvin(
            TemperatureChange.fahrenheit._from(fahrenheit - _fahrenheitOffset) -
                _celciusOffset,
            precision: precision);

  /// Interprets this as Kelvin.
  double get asKelvin => _precision.withPrecision(_kelvin);

  /// Interprets this as degrees Celcius.
  double get asCelcius => _precision
      .withPrecision(TemperatureChange.celcius._of(_kelvin) + _celciusOffset);

  /// Interprets this as degrees Fahrenheit.
  double get asFahrenheit => _precision.withPrecision(
      TemperatureChange.fahrenheit._of(_kelvin + _celciusOffset) +
          _fahrenheitOffset);

  /// Returns `true` if this is finite.
  bool get isFinite => _kelvin.isFinite;

  /// Returns `true` if this is infinite.
  bool get isInfinite => _kelvin.isInfinite;

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
          precision: Precision.add(_precision, change._precision));

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
          precision: Precision.add(_precision, change._precision));

  /// Returns the difference between this and another [Temperature].
  ///
  /// The resulting [TemperatureChange] will be negative if this is smaller than
  /// the other [Temperature].
  TemperatureChange difference(final Temperature other) =>
      TemperatureChange.ofKelvin(_kelvin - other._kelvin,
          precision: Precision.add(_precision, other._precision));

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
