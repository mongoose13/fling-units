part of '../../fling_units.dart';

/// Interprets [Distance]s as a specific unit.
class DistanceInterpreter extends MeasurementInterpreter<Distance> {
  @override
  Distance call(num value, {Precision precision = Precision.max}) =>
      Distance(value, this, precision);

  /// Constructs a [DistanceInterpreter].
  const DistanceInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super._();

  /// Produces an equivalent [DistanceInterpreter] but with an added multiplier prefix.
  DistanceInterpreter _withPrefix(MeasurementPrefix prefix) =>
      DistanceInterpreter._(name, unitMultiplier, prefix);

  /// The interpreter for meters.
  static const _meters = DistanceInterpreter._('m', 1e0);

  /// The interpreter for miles.
  static const _miles = DistanceInterpreter._('mi', 0.0006213712);

  /// The interpreter for yards.
  static const _yards = DistanceInterpreter._('yd', 1.093613);

  /// The interpreter for feet.
  static const _feet = DistanceInterpreter._('ft', 3.28084);

  /// The interpreter for inches.
  static const _inches = DistanceInterpreter._('in', 39.37008);

  /// The interpreter for nautical miles.
  static const _nauticalMiles = DistanceInterpreter._('NM', 0.000539956803456);
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
mixin DistancePrefix {
  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;

  /// Applies this to a meter amount.
  DistanceInterpreter get meters =>
      DistanceInterpreter._meters._withPrefix(_prefix);

  /// Applies this to a mile amount.
  DistanceInterpreter get miles =>
      DistanceInterpreter._miles._withPrefix(_prefix);

  /// Applies this to a yard amount.
  DistanceInterpreter get yards =>
      DistanceInterpreter._yards._withPrefix(_prefix);

  /// Applies this to a foot amount.
  DistanceInterpreter get feet =>
      DistanceInterpreter._feet._withPrefix(_prefix);

  /// Applies this to an inch amount.
  DistanceInterpreter get inches =>
      DistanceInterpreter._inches._withPrefix(_prefix);

  /// Applies this to a nautical mile amount.
  DistanceInterpreter get nauticalMiles =>
      DistanceInterpreter._nauticalMiles._withPrefix(_prefix);
}

/// Represents a single dimension of distance.
class Distance extends Measurement<Distance> {
  /// The SI unit associated with this measurement.
  static const siUnit = meters;

  /// The distance of size zero.
  const Distance.zero([super.interpreter = siUnit]) : super.zero();

  /// Infinite distance.
  const Distance.infinite([super.interpreter = siUnit]) : super.infinite();

  /// Infinite negative distance.
  const Distance.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  /// NaN (Not a Number) distance.
  const Distance.nan([super.interpreter = siUnit]) : super.nan();

  /// Constructs a [Distance] representing the sum of any number of other
  /// [Distance]s.
  Distance.sum(super.parts, {super.precision}) : super.sum();

  /// Interprets this using the specified units.
  double as(MeasurementInterpreter<Distance> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitDistance(this);

  @override
  Distance construct(
    double amount,
    MeasurementInterpreter<Distance>? interpreter,
    Precision precision,
  ) =>
      Distance(amount, interpreter ?? siUnit, precision);

  /// Constructs a [Distance].
  const Distance(
    num meters,
    MeasurementInterpreter<Distance> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: meters, precision: precision, interpreter: interpreter);
}
