part of '../../fling_units.dart';

/// Base class for [Quantity] interpreters.
abstract class QuantityInterpreter extends MeasurementInterpreter<Quantity> {
  QuantityInterpreter._(
    String name, [
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, 0.0, prefix);
}

/// Interprets [Quantity]s as a specific unit.
class StandardQuantityInterpreter extends MeasurementInterpreter<Quantity>
    implements QuantityInterpreter {
  /// Constructs a [StandardQuantityInterpreter].
  const StandardQuantityInterpreter._(
    String name,
    double multiplier, [
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, multiplier, prefix);

  /// Produces a [StandardQuantityInterpreter] that is a fraction of this.
  StandardQuantityInterpreter _withPrefix(MeasurementPrefix prefix) =>
      StandardQuantityInterpreter._(_name, _unitMultiplier, prefix);

  @override
  Quantity call(num value, {Precision precision = Precision.max}) =>
      Quantity(value, this, precision);

  /// The interpreter for moles.
  static const _moles = StandardQuantityInterpreter._('mol', 1e0);
}

/// Interprets [Quantity]s as a specific unit, truncating results.
class RoundingQuantityInterpreter
    extends RoundingMeasurementInterpreter<Quantity>
    implements QuantityInterpreter {
  /// Constructs a [RoundingQuantityInterpreter].
  const RoundingQuantityInterpreter._(
    String name,
    double unitMultiplier, [
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, unitMultiplier, prefix);

  /// Produces a [RoundingQuantityInterpreter] that is a fraction of this.
  RoundingQuantityInterpreter _withPrefix(MeasurementPrefix prefix) =>
      RoundingQuantityInterpreter._(_name, _unitMultiplier, prefix);

  @override
  Quantity call(num value, {Precision precision = Precision.max}) =>
      Quantity(value, this, precision);

  /// The interpreter for units (discrete items).
  static const _units = RoundingQuantityInterpreter._('x', 6.02214076e23);
}

/// The interpreter for units.
const units = RoundingQuantityInterpreter._units;

/// The interpreter for moles.
const moles = StandardQuantityInterpreter._moles;

/// Applies a prefix to various quantity units.
mixin QuantityPrefix {
  /// Applies this to a unit amount.
  QuantityInterpreter get units =>
      RoundingQuantityInterpreter._units._withPrefix(_prefix);

  /// Applies this to a mole amount.
  QuantityInterpreter get moles =>
      StandardQuantityInterpreter._moles._withPrefix(_prefix);

  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;
}

/// Measures a number of discrete items.
///
/// Technically not a measurement, and somewhat controversial for its inclusion
/// in the SI base units, this is nonetheless a useful measurement for counting
/// items. This class allows conversions between units and moles with full SI
/// prefix support (e.g. kilomoles).
///
/// Note that because it is impossible to have fractional "units" in the real
/// world, this class truncates "units" measurements. For example:
///
/// ```dart
/// var result = units(5.6).as(units); // 5.0
/// ```
class Quantity extends Measurement<Quantity> {
  /// The quantity of size zero.
  const Quantity.zero([MeasurementInterpreter<Quantity> interpreter = units])
      : super.zero(interpreter);

  /// Infinite quantity.
  const Quantity.infinite(
      [MeasurementInterpreter<Quantity> interpreter = units])
      : super.infinite(interpreter);

  /// Infinite negative quantity.
  const Quantity.negativeInfinite(
      [MeasurementInterpreter<Quantity> interpreter = units])
      : super.negativeInfinite(interpreter);

  /// NaN (Not a Number) quantity.
  const Quantity.nan([MeasurementInterpreter<Quantity> interpreter = units])
      : super.nan(interpreter);

  /// Constructs a [Quantity] representing the sum of any number of other
  /// [Quantity]s.
  Quantity.sum(Iterable<Quantity> parts, {Precision precision = Precision.max})
      : super.sum(parts, precision: precision);

  /// Interprets this using the specified units.
  double as(MeasurementInterpreter<Quantity> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitQuantity(this);

  @override
  Quantity _construct(
    double amount,
    MeasurementInterpreter<Quantity>? interpreter,
    Precision precision,
  ) =>
      Quantity(
        amount,
        interpreter ?? units,
        precision,
      );

  /// Constructs a [Distance].
  const Quantity(
    num units,
    MeasurementInterpreter<Quantity> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);
}
