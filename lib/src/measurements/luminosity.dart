part of '../../fling_units.dart';

/// Interprets [Luminosity]s as a specific unit.
class LuminosityInterpreter extends MeasurementInterpreter<Luminosity> {
  /// Constructs a [StandardQuantityInterpreter].
  const LuminosityInterpreter._(
    final String name,
    final double multiplier, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, multiplier, prefix);

  /// Produces a [StandardQuantityInterpreter] that is a fraction of this.
  LuminosityInterpreter _withPrefix(final MeasurementPrefix prefix) =>
      LuminosityInterpreter._(_name, _unitMultiplier, prefix);

  @override
  Luminosity call(final num value,
          {final Precision precision = Precision.max}) =>
      Luminosity(value, this, precision);

  /// The interpreter for candela.
  static const _candela = LuminosityInterpreter._('cd', 1e0);

  /// The interpreter for candlepower.
  static const _candlepower = LuminosityInterpreter._('cp', 1.0194);

  /// The interpreter for Hefnerkerze.
  static const _hefnerkerze = LuminosityInterpreter._('HK', 1.0870);
}

/// The interpreter for candela.
const candela = LuminosityInterpreter._candela;

/// The interpreter for candlepower.
const candlepower = LuminosityInterpreter._candlepower;

/// The interpreter for Hefnerkerze.
const hefnerkerze = LuminosityInterpreter._hefnerkerze;

/// Applies a prefix to various quantity units.
mixin LuminosityPrefix {
  /// Applies this to a candela amount.
  LuminosityInterpreter get candela =>
      LuminosityInterpreter._candela._withPrefix(_prefix);

  /// Applies this to a candlepower amount.
  LuminosityInterpreter get candlepower =>
      LuminosityInterpreter._candlepower._withPrefix(_prefix);

  /// Applies this to a candlepower amount.
  LuminosityInterpreter get hefnerkerze =>
      LuminosityInterpreter._hefnerkerze._withPrefix(_prefix);

  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;
}

/// Measures [luminous intensity](https://en.wikipedia.org/wiki/Luminous_intensity).
class Luminosity extends Measurement<Luminosity> {
  /// The SI unit associated with this measurement.
  static const siUnit = candela;

  /// The electric charge of size zero.
  const Luminosity.zero(
      [final MeasurementInterpreter<Luminosity> interpreter = siUnit])
      : super.zero(interpreter);

  /// Infinite electric charge.
  const Luminosity.infinite(
      [final MeasurementInterpreter<Luminosity> interpreter = siUnit])
      : super.infinite(interpreter);

  /// Infinite negative electric charge.
  const Luminosity.negativeInfinite(
      [final MeasurementInterpreter<Luminosity> interpreter = siUnit])
      : super.negativeInfinite(interpreter);

  /// Constructs a [Luminosity] representing the sum of any number of other
  /// [Luminosity]s.
  Luminosity.sum(final Iterable<Luminosity> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision: precision);

  /// Interprets this using the specified units.
  double as(final MeasurementInterpreter<Luminosity> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitLuminosity(this);

  @override
  Luminosity _construct(
    double amount,
    MeasurementInterpreter<Luminosity>? interpreter,
    Precision precision,
  ) =>
      Luminosity(
        amount,
        interpreter ?? siUnit,
        precision,
      );

  /// Constructs a [Distance].
  const Luminosity(
    num units,
    MeasurementInterpreter<Luminosity> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);
}
