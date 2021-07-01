part of fling_units;

/// Interprets [Distance]s as a specific unit.
class DistanceInterpreter extends MeasurementInterpreter<Distance> {
  @override
  Distance call(final num value, {final Precision precision = Precision.max}) =>
      Distance._(_from(value), precision);

  /// Constructs a [DistanceInterpreter].
  const DistanceInterpreter._(final double multiplier) : super._(multiplier);

  /// Produces a [DistanceInterpreter] that is a fraction of this.
  DistanceInterpreter _withPrefix(final double multiplier) =>
      DistanceInterpreter._(_unitMultiplier / multiplier);

  /// The interpreter for meters.
  static const _meters = DistanceInterpreter._(1e0);

  /// The interpreter for miles.
  static const _miles = DistanceInterpreter._(0.0006213712);

  /// The interpreter for yards.
  static const _yards = DistanceInterpreter._(1.093613);

  /// The interpreter for feet.
  static const _feet = DistanceInterpreter._(3.28084);

  /// The interpreter for inches.
  static const _inches = DistanceInterpreter._(39.37008);

  /// The interpreter for nautical miles.
  static const _nauticalMiles = DistanceInterpreter._(0.000539956803456);
}

/// The interpreter for meters.
const meters = DistanceInterpreter._meters;

/// The interpreter for miles.
const miles = DistanceInterpreter._miles;

/// The interpreter for yards.
const yards = DistanceInterpreter._yards;

/// The interpreter for feet.
const feet = DistanceInterpreter._feet;

/// The interpreter for inches.
const inches = DistanceInterpreter._inches;

/// The interpreter for nautical miles.
const nauticalMiles = DistanceInterpreter._nauticalMiles;

/// Applies a prefix to various distance units.
abstract class DistancePrefix {
  /// Applies this to a meter amount.
  DistanceInterpreter get meters =>
      DistanceInterpreter._meters._withPrefix(_multiplier);

  /// Applies this to a mile amount.
  DistanceInterpreter get miles =>
      DistanceInterpreter._miles._withPrefix(_multiplier);

  /// Applies this to a yard amount.
  DistanceInterpreter get yards =>
      DistanceInterpreter._yards._withPrefix(_multiplier);

  /// Applies this to a foot amount.
  DistanceInterpreter get feet =>
      DistanceInterpreter._feet._withPrefix(_multiplier);

  /// Applies this to an inch amount.
  DistanceInterpreter get inches =>
      DistanceInterpreter._inches._withPrefix(_multiplier);

  /// Applies this to a nautical mile amount.
  DistanceInterpreter get nauticalMiles =>
      DistanceInterpreter._nauticalMiles._withPrefix(_multiplier);

  /// The prefix multiplier applied to this measurement.
  double get _multiplier;
}

/// Represents a single dimension of distance.
class Distance extends Measurement<Distance> {
  /// The distance of size zero.
  const Distance.zero() : super.zero();

  /// Infinite distance.
  const Distance.infinite() : super.infinite();

  /// Infinite negative distance.
  const Distance.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Distance] representing the sum of any number of other
  /// [Distance]s.
  Distance.sum(final Iterable<Distance> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Interprets this using the specified units.
  double as(final DistanceInterpreter interpreter) => _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitDistance(this);

  @override
  String toString() => '${as(DistanceInterpreter._meters)} m';

  @override
  Distance _construct(final double si, final Precision precision) =>
      Distance._(si, precision);

  /// Constructs a [Distance].
  const Distance._(final double meters, final Precision precision)
      : super(meters, precision);
}
