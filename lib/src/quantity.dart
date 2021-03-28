part of fling_units;

/// Base class for [Quantity] interpreters.
abstract class QuantityInterpreter extends MeasurementInterpreter<Quantity> {
  QuantityInterpreter._() : super._(0.0);
}

/// Interprets [Quantity]s as a specific unit.
class StandardQuantityInterpreter extends MeasurementInterpreter<Quantity>
    implements QuantityInterpreter {
  /// Constructs a [StandardQuantityInterpreter].
  const StandardQuantityInterpreter._(final double multiplier)
      : super._(multiplier);

  /// Produces a [StandardQuantityInterpreter] that is a fraction of this.
  StandardQuantityInterpreter _withPrefix(final double multiplier) =>
      StandardQuantityInterpreter._(_unitMultiplier / multiplier);

  @override
  Quantity call(final num value, {final Precision precision = Precision.max}) =>
      Quantity._(_from(value), precision);

  /// The interpreter for moles.
  static const _moles = StandardQuantityInterpreter._(1e0);
}

/// Interprets [Quantity]s as a specific unit, truncating results.
class TruncatingQuantityInterpreter
    extends TruncatingMeasurementInterpreter<Quantity>
    implements QuantityInterpreter {
  /// Constructs a [TruncatingQuantityInterpreter].
  const TruncatingQuantityInterpreter._(final double multiplier)
      : super._(multiplier);

  /// Produces a [StandardQuantityInterpreter] that is a fraction of this.
  StandardQuantityInterpreter _withPrefix(final double multiplier) =>
      StandardQuantityInterpreter._(_unitMultiplier / multiplier);

  @override
  Quantity call(final num value, {final Precision precision = Precision.max}) =>
      Quantity._(_from(value), precision);

  /// The interpreter for units (discrete items).
  static const _units = TruncatingQuantityInterpreter._(6.02214076e23);
}

/// The interpreter for units.
const units = TruncatingQuantityInterpreter._units;

/// The interpreter for moles.
const moles = StandardQuantityInterpreter._moles;

/// Applies a prefix to various quantity units.
abstract class QuantityPrefix {
  /// Applies this to a unit amount.
  QuantityInterpreter get units =>
      TruncatingQuantityInterpreter._units._withPrefix(_multiplier);

  /// Applies this to a mole amount.
  QuantityInterpreter get moles =>
      StandardQuantityInterpreter._moles._withPrefix(_multiplier);

  /// The prefix multiplier applied to this measurement.
  double get _multiplier;
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
  const Quantity.zero() : super.zero();

  /// Infinite quantity.
  const Quantity.infinite() : super.infinite();

  /// Infinite negative quantity.
  const Quantity.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Quantity] representing the sum of any number of other
  /// [Quantity]s.
  Quantity.sum(final Iterable<Quantity> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Interprets this using the specified units.
  double as(final QuantityInterpreter interpreter) => _preciseOf(interpreter);

  @override
  String toString() => '${as(units)}';

  @override
  Quantity _construct(final double si, final Precision precision) =>
      Quantity._(si, precision);

  /// Constructs a [Distance].
  const Quantity._(final double units, final Precision precision)
      : super(units, precision);
}
