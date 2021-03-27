part of fling_units;

/// Interprets [Charge]s as a specific unit.
class ChargeInterpreter extends MeasurementInterpreter<Charge> {
  /// Constructs a [StandardQuantityInterpreter].
  const ChargeInterpreter._(final double multiplier) : super._(multiplier);

  /// Produces a [StandardQuantityInterpreter] that is a fraction of this.
  ChargeInterpreter _withPrefix(final double multiplier) =>
      ChargeInterpreter._(_unitMultiplier / multiplier);

  @override
  Charge call(final num value, {final Precision precision = Precision.max}) =>
      Charge._(_from(value), precision);

  /// The interpreter for amperes.
  static const _amperes = ChargeInterpreter._(1e0);
}

/// The interpreter for amperes.
const amperes = ChargeInterpreter._amperes;

/// Applies a prefix to various quantity units.
abstract class ChargePrefix {
  /// Applies this to an ampere amount.
  ChargeInterpreter get amperes =>
      ChargeInterpreter._amperes._withPrefix(_multiplier);

  /// The prefix multiplier applied to this measurement.
  double get _multiplier;
}

/// Measures electric charge.
///
/// The standard (and only) unit for measuring electric charge is the
/// [Ampere](https://en.wikipedia.org/wiki/Ampere). This class supports all the
/// basic measurement features for electric charge.
class Charge extends Measurement<Charge> {
  /// The electric charge of size zero.
  const Charge.zero() : super.zero();

  /// Infinite electric charge.
  const Charge.infinite() : super.infinite();

  /// Infinite negative electric charge.
  const Charge.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Charge] representing the sum of any number of other
  /// [Charge]s.
  Charge.sum(final Iterable<Charge> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Interprets this using the specified units.
  double as(final ChargeInterpreter interpreter) => _preciseOf(interpreter);

  @override
  String toString() => '${as(amperes)}';

  @override
  Charge _construct(final double si, final Precision precision) =>
      Charge._(si, precision);

  /// Constructs a [Distance].
  const Charge._(final double units, final Precision precision)
      : super(units, precision);
}
