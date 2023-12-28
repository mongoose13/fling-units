part of '../../fling_units.dart';

/// Base class for [Quantity] interpreters.
abstract class QuantityInterpreter extends MeasurementInterpreter<Quantity> {
  QuantityInterpreter._(
    final String name, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, 0.0, prefix);
}

/// Interprets [Quantity]s as a specific unit.
class StandardQuantityInterpreter extends MeasurementInterpreter<Quantity>
    implements QuantityInterpreter {
  /// Constructs a [StandardQuantityInterpreter].
  const StandardQuantityInterpreter._(
    final String name,
    final double multiplier, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, multiplier, prefix);

  /// Produces a [StandardQuantityInterpreter] that is a fraction of this.
  StandardQuantityInterpreter _withPrefix(final MeasurementPrefix prefix) =>
      StandardQuantityInterpreter._(_name, _unitMultiplier, prefix);

  @override
  Quantity call(final num value, {final Precision precision = Precision.max}) =>
      Quantity._(_from(value), precision, this);

  /// The interpreter for moles.
  static const _moles = StandardQuantityInterpreter._('mol', 1e0);
}

/// Interprets [Quantity]s as a specific unit, truncating results.
class RoundingQuantityInterpreter
    extends RoundingMeasurementInterpreter<Quantity>
    implements QuantityInterpreter {
  /// Constructs a [RoundingQuantityInterpreter].
  const RoundingQuantityInterpreter._(
    final String name,
    final double unitMultiplier, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, unitMultiplier, prefix);

  /// Produces a [RoundingQuantityInterpreter] that is a fraction of this.
  RoundingQuantityInterpreter _withPrefix(final MeasurementPrefix prefix) =>
      RoundingQuantityInterpreter._(_name, _unitMultiplier, prefix);

  @override
  Quantity call(final num value, {final Precision precision = Precision.max}) =>
      Quantity._(_from(value), precision, this);

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
  const Quantity.zero(
      [final MeasurementInterpreter<Quantity> interpreter = units])
      : super.zero(interpreter);

  /// Infinite quantity.
  const Quantity.infinite(
      [final MeasurementInterpreter<Quantity> interpreter = units])
      : super.infinite(interpreter);

  /// Infinite negative quantity.
  const Quantity.negativeInfinite(
      [final MeasurementInterpreter<Quantity> interpreter = units])
      : super.negativeInfinite(interpreter);

  /// Constructs a [Quantity] representing the sum of any number of other
  /// [Quantity]s.
  Quantity.sum(final Iterable<Quantity> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Interprets this using the specified units.
  double as(final MeasurementInterpreter<Quantity> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitQuantity(this);

  @override
  Quantity _construct(
    final double si,
    final Precision precision, [
    final MeasurementInterpreter<Quantity>? interpreter,
  ]) =>
      Quantity._(si, precision, interpreter);

  /// Constructs a [Distance].
  const Quantity._(
    final double units,
    final Precision precision,
    final MeasurementInterpreter<Quantity>? interpreter,
  ) : super(units, precision, interpreter);
}
