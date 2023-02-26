part of fling_units;

/// Interprets [Volume]s as specific units.
class VolumeInterpreter extends MeasurementInterpreter<Volume> {
  @override
  Volume call(final num value, {final Precision precision = Precision.max}) =>
      Volume._(_from(value), precision, this);

  /// Constructs a [VolumeInterpreter] from any three [DistanceInterpreter]s.
  VolumeInterpreter(
    final MeasurementInterpreter<Distance> a,
    final MeasurementInterpreter<Distance> b,
    final MeasurementInterpreter<Distance> c, {
    final String? name,
  }) : this._(
            name ?? '${a._name}⋅${b._name}⋅${c._name}',
            a._unitMultiplier *
                b._unitMultiplier *
                c._unitMultiplier /
                a._prefix._multiplier /
                b._prefix._multiplier /
                c._prefix._multiplier);

  /// Constructs a [VolumeInterpreter] that will cube a basic
  /// [DistanceInterpreter].
  VolumeInterpreter.cubed(
    final DistanceInterpreter a, {
    final String? name,
  }) : this(a, a, a, name: name ?? '${a._name}³');

  /// Constructs a [VolumeInterpreter].
  const VolumeInterpreter._(
    final String name,
    final double cubicMeters, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, cubicMeters, prefix);

  /// Produces a [VolumeInterpreter] that is a multiple of this.
  VolumeInterpreter _withPrefix(final MeasurementPrefix prefix) =>
      VolumeInterpreter._(_name, _unitMultiplier, prefix);

  /// The interpreter for liters.
  static const _liters = VolumeInterpreter._('L', 1e3);

  /// The interpreter for teaspoons.
  static const _teaspoons = VolumeInterpreter._('tsp', 168936);

  /// The interpreter for tablespoons.
  static const _tablespoons = VolumeInterpreter._('tbsp', 56312);

  /// The interpreter for fluid ounces.
  static const _fluidOunces = VolumeInterpreter._('fl oz', 35195.1);

  /// The interpreter for cups.
  static const _cups = VolumeInterpreter._('cup', 3519.51);

  /// The interpreter for pints.
  static const _pints = VolumeInterpreter._('pt', 1759.75);

  /// The interpreter for quarts.
  static const _quarts = VolumeInterpreter._('qt', 879.877);

  /// The interpreter for gallons.
  static const _gallons = VolumeInterpreter._('gal', 219.969);

  /// The interpreter for US teaspoons.
  static const _usTeaspoons = VolumeInterpreter._('us tsp', 202884);

  /// The interpreter for US tablespoons.
  static const _usTablespoons = VolumeInterpreter._('us tbsp', 67628);

  /// The interpreter for US fluid ounces.
  static const _usFluidOunces = VolumeInterpreter._('us fl oz', 33814);

  /// The interpreter for US cups.
  static const _usCups = VolumeInterpreter._('us cup', 4226.76);

  /// The interpreter for US pints.
  static const _usPints = VolumeInterpreter._('us pt', 2113.38);

  /// The interpreter for US quarts.
  static const _usQuarts = VolumeInterpreter._('us qt', 1056.69);

  /// The interpreter for US gallons.
  static const _usGallons = VolumeInterpreter._('us gal', 264.172);

  /// The interpreter for US legal cups.
  static const _usLegalCups = VolumeInterpreter._('legal cup', 4166.67);
}

/// The interpreter for liters.
const liters = VolumeInterpreter._liters;

/// The interpreter for teaspoons.
const teaspoons = VolumeInterpreter._teaspoons;

/// The interpreter for tablespoons.
const tablespoons = VolumeInterpreter._tablespoons;

/// The interpreter for fluid ounces.
const fluidOunces = VolumeInterpreter._fluidOunces;

/// The interpreter for cups.
const cups = VolumeInterpreter._cups;

/// The interpreter for pints.
const pints = VolumeInterpreter._pints;

/// The interpreter for quarts.
const quarts = VolumeInterpreter._quarts;

/// The interpreter for gallons.
const gallons = VolumeInterpreter._gallons;

/// The interpreter for US teaspoons.
const usTeaspoons = VolumeInterpreter._usTeaspoons;

/// The interpreter for US tablespoons.
const usTablespoons = VolumeInterpreter._usTablespoons;

/// The interpreter for US fluid ounces.
const usFluidOunces = VolumeInterpreter._usFluidOunces;

/// The interpreter for US cups.
const usCups = VolumeInterpreter._usCups;

/// The interpreter for US pints.
const usPints = VolumeInterpreter._usPints;

/// The interpreter for US quarts.
const usQuarts = VolumeInterpreter._usQuarts;

/// The interpreter for US gallons.
const usGallons = VolumeInterpreter._usGallons;

/// The interpreter for US legal cups.
const usLegalCups = VolumeInterpreter._usLegalCups;

/// Applies a prefix to various volume units.
mixin VolumePrefix {
  /// Applies this to a liter amount.
  VolumeInterpreter get liters =>
      VolumeInterpreter._liters._withPrefix(_prefix);

  /// Applies this to a teaspoon amount.
  VolumeInterpreter get teaspoons =>
      VolumeInterpreter._teaspoons._withPrefix(_prefix);

  /// Applies this to a tablespoon amount.
  VolumeInterpreter get tablespoons =>
      VolumeInterpreter._tablespoons._withPrefix(_prefix);

  /// Applies this to a fluid ounce amount.
  VolumeInterpreter get fluidOunces =>
      VolumeInterpreter._fluidOunces._withPrefix(_prefix);

  /// Applies this to a cup amount.
  VolumeInterpreter get cups => VolumeInterpreter._cups._withPrefix(_prefix);

  /// Applies this to a pint amount.
  VolumeInterpreter get pints => VolumeInterpreter._pints._withPrefix(_prefix);

  /// Applies this to a quart amount.
  VolumeInterpreter get quarts =>
      VolumeInterpreter._quarts._withPrefix(_prefix);

  /// Applies this to a gallon amount.
  VolumeInterpreter get gallons =>
      VolumeInterpreter._gallons._withPrefix(_prefix);

  /// Applies this to a US teaspoon amount.
  VolumeInterpreter get usTeaspoons =>
      VolumeInterpreter._usTeaspoons._withPrefix(_prefix);

  /// Applies this to a US tablespoon amount.
  VolumeInterpreter get usTablespoons =>
      VolumeInterpreter._usTablespoons._withPrefix(_prefix);

  /// Applies this to a US fluid ounce amount.
  VolumeInterpreter get usFluidOunces =>
      VolumeInterpreter._usFluidOunces._withPrefix(_prefix);

  /// Applies this to a US cup amount.
  VolumeInterpreter get usCups =>
      VolumeInterpreter._usCups._withPrefix(_prefix);

  /// Applies this to a US pint amount.
  VolumeInterpreter get usPints =>
      VolumeInterpreter._usPints._withPrefix(_prefix);

  /// Applies this to a US quart amount.
  VolumeInterpreter get usQuarts =>
      VolumeInterpreter._usQuarts._withPrefix(_prefix);

  /// Applies this to a US gallon amount.
  VolumeInterpreter get usGallons =>
      VolumeInterpreter._usGallons._withPrefix(_prefix);

  /// Applies this to a US legal cup amount.
  VolumeInterpreter get usLegalCups =>
      VolumeInterpreter._usLegalCups._withPrefix(_prefix);

  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;
}

/// Represents a three-dimensional space.
class Volume extends Measurement<Volume> {
  /// Produces an interpreter for the cube of a provided unit.
  static VolumeInterpreter cubic(
          final DistanceInterpreter distanceInterpreter) =>
      VolumeInterpreter.cubed(distanceInterpreter);

  /// The volume of size zero.
  const Volume.zero([final MeasurementInterpreter<Volume> interpreter = liters])
      : super.zero(interpreter);

  /// Infinite volume.
  const Volume.infinite(
      [final MeasurementInterpreter<Volume> interpreter = liters])
      : super.infinite(interpreter);

  /// Infinite negative volume.
  const Volume.negativeInfinite(
      [final MeasurementInterpreter<Volume> interpreter = liters])
      : super.negativeInfinite(interpreter);

  /// Constructs a [Volume] representing the sum of any number of other
  /// [Volume]s.
  Volume.sum(final Iterable<Volume> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Constructs a [Volume] from three [Distance] measurements.
  Volume.of(final Distance a, final Distance b, final Distance c)
      : this._(
          a.as(meters) * b.as(meters) * c.as(meters),
          Precision.combine(
              Precision.combine(a._precision, b._precision), c._precision),
          VolumeInterpreter(a._interpreter, b._interpreter, c._interpreter),
        );

  /// Interprets this in the specified units.
  double as(final DistanceInterpreter a, final DistanceInterpreter b,
          final DistanceInterpreter c) =>
      _precise(a._of(b._of(c._of(si))));

  /// Interprets this in the specified volume unit.
  double asVolume(final MeasurementInterpreter<Volume> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitVolume(this);

  /// Constructs a [Volume].
  const Volume._(
    final double cubicMeters,
    final Precision precision,
    final MeasurementInterpreter<Volume> interpreter,
  ) : super(cubicMeters, precision, interpreter);

  @override
  Volume _construct(
    final double si,
    final Precision precision,
    final MeasurementInterpreter<Volume> interpreter,
  ) =>
      Volume._(si, precision, interpreter);
}
