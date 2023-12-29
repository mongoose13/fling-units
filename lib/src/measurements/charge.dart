part of '../../fling_units.dart';

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
      Charge(value, this, precision);

  /// The interpreter for amperes.
  static const _amperes = ChargeInterpreter._('A', 1e0);
}

/// The interpreter for amperes.
const amperes = ChargeInterpreter._amperes;

/// Applies a prefix to various quantity units.
mixin ChargePrefix {
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
  /// The SI unit for this measurement type.
  static const siUnit = amperes;

  /// The electric charge of size zero.
  const Charge.zero([final MeasurementInterpreter<Charge> interpreter = siUnit])
      : super.zero(interpreter);

  /// Infinite electric charge.
  const Charge.infinite(
      [final MeasurementInterpreter<Charge> interpreter = siUnit])
      : super.infinite(interpreter);

  /// Infinite negative electric charge.
  const Charge.negativeInfinite(
      [final MeasurementInterpreter<Charge> interpreter = siUnit])
      : super.negativeInfinite(interpreter);

  /// NaN (Not a Number) charge.
  const Charge.nan([final MeasurementInterpreter<Charge> interpreter = siUnit])
      : super.nan(interpreter);

  /// Constructs a [Charge] representing the sum of any number of other
  /// [Charge]s.
  Charge.sum(final Iterable<Charge> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision: precision);

  /// Interprets this using the specified units.
  double as(final MeasurementInterpreter<Charge> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitCharge(this);

  @override
  Charge _construct(
    double amount,
    MeasurementInterpreter<Charge>? interpreter,
    Precision precision,
  ) =>
      Charge(amount, interpreter ?? siUnit, precision);

  /// Constructs a [Distance].
  const Charge(
    final num units,
    final MeasurementInterpreter<Charge> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);
}
