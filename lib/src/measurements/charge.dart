part of '../../fling_units.dart';

/// Interprets [Charge]s as a specific unit.
class ChargeInterpreter extends MeasurementInterpreter<Charge> {
  /// Constructs a [StandardQuantityInterpreter].
  const ChargeInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super._();

  /// Produces a [StandardQuantityInterpreter] that is a fraction of this.
  ChargeInterpreter _withPrefix(MeasurementPrefix prefix) =>
      ChargeInterpreter._(_name, _unitMultiplier, prefix);

  @override
  Charge call(num value, {Precision precision = Precision.max}) =>
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
  const Charge.zero([super.interpreter = siUnit]) : super.zero();

  /// Infinite electric charge.
  const Charge.infinite([super.interpreter = siUnit]) : super.infinite();

  /// Infinite negative electric charge.
  const Charge.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  /// NaN (Not a Number) charge.
  const Charge.nan([super.interpreter = siUnit]) : super.nan();

  /// Constructs a [Charge] representing the sum of any number of other
  /// [Charge]s.
  Charge.sum(super.parts, {super.precision}) : super.sum();

  /// Interprets this using the specified units.
  double as(MeasurementInterpreter<Charge> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitCharge(this);

  @override
  Charge _construct(
    double amount,
    MeasurementInterpreter<Charge>? interpreter,
    Precision precision,
  ) =>
      Charge(amount, interpreter ?? siUnit, precision);

  /// Constructs a [Distance].
  const Charge(
    num units,
    MeasurementInterpreter<Charge> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);
}
