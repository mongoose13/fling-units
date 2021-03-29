part of fling_units;

/// Interprets [Luminosity]s as a specific unit.
class LuminosityInterpreter extends MeasurementInterpreter<Luminosity> {
  /// Constructs a [StandardQuantityInterpreter].
  const LuminosityInterpreter._(final double multiplier) : super._(multiplier);

  /// Produces a [StandardQuantityInterpreter] that is a fraction of this.
  LuminosityInterpreter _withPrefix(final double multiplier) =>
      LuminosityInterpreter._(_unitMultiplier / multiplier);

  @override
  Luminosity call(final num value,
          {final Precision precision = Precision.max}) =>
      Luminosity._(_from(value), precision);

  /// The interpreter for candela.
  static const _candela = LuminosityInterpreter._(1e0);

  /// The interpreter for candlepower.
  static const _candlepower = LuminosityInterpreter._(1.0194);

  /// The interpreter for Hefnerkerze.
  static const _hefnerkerze = LuminosityInterpreter._(1.0870);
}

/// The interpreter for candela.
const candela = LuminosityInterpreter._candela;

/// The interpreter for candlepower.
const candlepower = LuminosityInterpreter._candlepower;

/// The interpreter for Hefnerkerze.
const hefnerkerze = LuminosityInterpreter._hefnerkerze;

/// Applies a prefix to various quantity units.
abstract class LuminosityPrefix {
  /// Applies this to a candela amount.
  LuminosityInterpreter get candela =>
      LuminosityInterpreter._candela._withPrefix(_multiplier);

  /// Applies this to a candlepower amount.
  LuminosityInterpreter get candlepower =>
      LuminosityInterpreter._candlepower._withPrefix(_multiplier);

  /// Applies this to a candlepower amount.
  LuminosityInterpreter get hefnerkerze =>
      LuminosityInterpreter._hefnerkerze._withPrefix(_multiplier);

  /// The prefix multiplier applied to this measurement.
  double get _multiplier;
}

/// Measures [luminous intensity](https://en.wikipedia.org/wiki/Luminous_intensity).
class Luminosity extends Measurement<Luminosity> {
  /// The electric charge of size zero.
  const Luminosity.zero() : super.zero();

  /// Infinite electric charge.
  const Luminosity.infinite() : super.infinite();

  /// Infinite negative electric charge.
  const Luminosity.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Luminosity] representing the sum of any number of other
  /// [Luminosity]s.
  Luminosity.sum(final Iterable<Luminosity> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Interprets this using the specified units.
  double as(final LuminosityInterpreter interpreter) => _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitLuminosity(this);

  @override
  String toString() => '${as(candela)}';

  @override
  Luminosity _construct(final double si, final Precision precision) =>
      Luminosity._(si, precision);

  /// Constructs a [Distance].
  const Luminosity._(final double units, final Precision precision)
      : super(units, precision);
}
