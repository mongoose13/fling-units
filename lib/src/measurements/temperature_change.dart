part of fling_units;

/// The [MeasurementInterpreter] for [TemperatureChange]s.
class TemperatureChangeInterpreter
    extends MeasurementInterpreter<TemperatureChange> {
  @override
  TemperatureChange call(final num value,
          {final Precision precision = Precision.max}) =>
      TemperatureChange._(_from(value), precision, this);

  /// Constructs a [TemperatureChangeInterpreter].
  const TemperatureChangeInterpreter._(
    final String name,
    final double kelvin, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, kelvin, prefix);

  /// Produces a [TemperatureChangeInterpreter] that is a multiple of this.
  TemperatureChangeInterpreter _withPrefix(final MeasurementPrefix prefix) =>
      TemperatureChangeInterpreter._(_name, _unitMultiplier, prefix);

  /// The interpreter for Kelvin.
  static const _kelvin = TemperatureChangeInterpreter._('K', 1e0);

  /// The interpreter for degrees Celcius.
  static const _celcius = TemperatureChangeInterpreter._('°C', 1e0);

  /// The interpreter for degrees Fahrenheit.
  static const _fahrenheit = TemperatureChangeInterpreter._('°F', 9.0 / 5.0);
}

/// The interpreter for Kelvin.
const kelvin = TemperatureChangeInterpreter._kelvin;

/// The interpreter for degrees Celcius.
const celcius = TemperatureChangeInterpreter._celcius;

/// The interpreter for degrees Fahrenheit.
const fahrenheit = TemperatureChangeInterpreter._fahrenheit;

/// Applies a prefix to various time units.
mixin TemperaturePrefix {
  /// The interpreter for Kelvin.
  TemperatureChangeInterpreter get kelvin =>
      TemperatureChangeInterpreter._kelvin._withPrefix(_prefix);

  /// The interpreter for degrees Celcius.
  TemperatureChangeInterpreter get celcius =>
      TemperatureChangeInterpreter._celcius._withPrefix(_prefix);

  /// The interpreter for degrees Fahrenheit.
  TemperatureChangeInterpreter get fahrenheit =>
      TemperatureChangeInterpreter._fahrenheit._withPrefix(_prefix);

  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;
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
  /// No change in temperature.
  const TemperatureChange.zero(
      [final MeasurementInterpreter<TemperatureChange> interpreter = kelvin])
      : super.zero(interpreter);

  /// Infinite temperature change.
  const TemperatureChange.infinite(
      [final MeasurementInterpreter<TemperatureChange> interpreter = kelvin])
      : super.infinite(interpreter);

  /// Negative infinite temperature change.
  const TemperatureChange.negativeInfinite(
      [final MeasurementInterpreter<TemperatureChange> interpreter = kelvin])
      : super.negativeInfinite(interpreter);

  /// Constructs a [TemperatureChange] representing the sum of any number of
  /// other [TemperatureChange]s.
  TemperatureChange.sum(final Iterable<TemperatureChange> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Returns a [TemperatureChange] that represents the positive magnitude of
  /// this.
  TemperatureChange magnitude() =>
      TemperatureChange._(si.abs(), _precision, defaultInterpreter);

  /// Interprets this using the specified units.
  double as(final MeasurementInterpreter<TemperatureChange> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitTemperatureChange(this);

  /// Constructs a [TemperatureChange].
  const TemperatureChange._(
    final double kelvin,
    final Precision precision,
    final MeasurementInterpreter<TemperatureChange> interpreter,
  ) : super(kelvin, precision, interpreter);

  @override
  TemperatureChange _construct(
    final double si,
    final Precision precision,
    final MeasurementInterpreter<TemperatureChange> interpreter,
  ) =>
      TemperatureChange._(si, precision, interpreter);
}
