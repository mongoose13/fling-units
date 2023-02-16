part of fling_units;

/// Interprets [Charge]s as a specific unit.
class ChargeInterpreter extends MeasurementInterpreter<Charge> {
  /// Constructs a [StandardQuantityInterpreter].
  const ChargeInterpreter._(
    final String name,
    final double multiplier, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, multiplier, prefix);

  /// Produces a [StandardQuantityInterpreter] that is a fraction of this.
  ChargeInterpreter _withPrefix(final MeasurementPrefix prefix) =>
      ChargeInterpreter._(_name, _unitMultiplier, prefix);

  @override
  Charge call(final num value, {final Precision precision = Precision.max}) =>
      Charge._(_from(value), precision, this);

  /// The interpreter for amperes.
  static const _amperes = ChargeInterpreter._('A', 1e0);
}

/// The interpreter for amperes.
const amperes = ChargeInterpreter._amperes;

/// Applies a prefix to various quantity units.
abstract class ChargePrefix {
  /// Applies this to an ampere amount.
  ChargeInterpreter get amperes =>
      ChargeInterpreter._amperes._withPrefix(_prefix);

  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;
}

/// Measures electric charge.
///
/// The standard (and only) unit for measuring electric charge is the
/// [Ampere](https://en.wikipedia.org/wiki/Ampere). This class supports all the
/// basic measurement features for electric charge.
class Charge extends Measurement<Charge> {
  /// The electric charge of size zero.
  const Charge.zero([final ChargeInterpreter interpreter = amperes])
      : super.zero(interpreter);

  /// Infinite electric charge.
  const Charge.infinite([final ChargeInterpreter interpreter = amperes])
      : super.infinite(interpreter);

  /// Infinite negative electric charge.
  const Charge.negativeInfinite([final ChargeInterpreter interpreter = amperes])
      : super.negativeInfinite(interpreter);

  /// Constructs a [Charge] representing the sum of any number of other
  /// [Charge]s.
  Charge.sum(final Iterable<Charge> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Interprets this using the specified units.
  double as(final ChargeInterpreter interpreter) => _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitCharge(this);

  @override
  Charge _construct(
    final double si,
    final Precision precision,
    final MeasurementInterpreter<Charge> interpreter,
  ) =>
      Charge._(si, precision, interpreter);

  /// Constructs a [Distance].
  const Charge._(
    final double units,
    final Precision precision,
    final MeasurementInterpreter<Charge> interpreter,
  ) : super(units, precision, interpreter);
}
