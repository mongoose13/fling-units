part of fling_units;

/// Interprets [Volume]s as specific units.
class VolumeInterpreter extends MeasurementInterpreter<Volume> {
  @override
  Volume call(final num value, {final Precision precision = Precision.max}) =>
      Volume._(_from(value), precision);

  /// Constructs a [VolumeInterpreter] from any three [DistanceInterpreter]s.
  VolumeInterpreter(final DistanceInterpreter a, final DistanceInterpreter b,
      final DistanceInterpreter c)
      : this._(a._unitMultiplier * b._unitMultiplier * c._unitMultiplier);

  /// Constructs a [VolumeInterpreter] that will cube a basic
  /// [DistanceInterpreter].
  VolumeInterpreter.cubed(final DistanceInterpreter a)
      : this._(math.pow(a._unitMultiplier, 3).toDouble());

  /// Constructs a [VolumeInterpreter].
  const VolumeInterpreter._(final double cubicMeters) : super._(cubicMeters);

  /// Produces a [VolumeInterpreter] that is a multiple of this.
  VolumeInterpreter _withPrefix(final double multiplier) =>
      VolumeInterpreter._(_unitMultiplier / multiplier);

  /// The interpreter for liters.
  static const _liters = VolumeInterpreter._(1e3);

  /// The interpreter for teaspoons.
  static const _teaspoons = VolumeInterpreter._(168936);

  /// The interpreter for tablespoons.
  static const _tablespoons = VolumeInterpreter._(56312);

  /// The interpreter for fluid ounces.
  static const _fluidOunces = VolumeInterpreter._(35195.1);

  /// The interpreter for cups.
  static const _cups = VolumeInterpreter._(3519.51);

  /// The interpreter for pints.
  static const _pints = VolumeInterpreter._(1759.75);

  /// The interpreter for quarts.
  static const _quarts = VolumeInterpreter._(879.877);

  /// The interpreter for gallons.
  static const _gallons = VolumeInterpreter._(219.969);

  /// The interpreter for US teaspoons.
  static const _usTeaspoons = VolumeInterpreter._(202884);

  /// The interpreter for US tablespoons.
  static const _usTablespoons = VolumeInterpreter._(67628);

  /// The interpreter for US fluid ounces.
  static const _usFluidOunces = VolumeInterpreter._(33814);

  /// The interpreter for US cups.
  static const _usCups = VolumeInterpreter._(4226.76);

  /// The interpreter for US pints.
  static const _usPints = VolumeInterpreter._(2113.38);

  /// The interpreter for US quarts.
  static const _usQuarts = VolumeInterpreter._(1056.69);

  /// The interpreter for US gallons.
  static const _usGallons = VolumeInterpreter._(264.172);

  /// The interpreter for US legal cups.
  static const _usLegalCups = VolumeInterpreter._(4166.67);
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
abstract class VolumePrefix {
  /// Applies this to a liter amount.
  VolumeInterpreter get liters =>
      VolumeInterpreter._liters._withPrefix(_multiplier);

  /// Applies this to a teaspoon amount.
  VolumeInterpreter get teaspoons =>
      VolumeInterpreter._teaspoons._withPrefix(_multiplier);

  /// Applies this to a tablespoon amount.
  VolumeInterpreter get tablespoons =>
      VolumeInterpreter._tablespoons._withPrefix(_multiplier);

  /// Applies this to a fluid ounce amount.
  VolumeInterpreter get fluidOunces =>
      VolumeInterpreter._fluidOunces._withPrefix(_multiplier);

  /// Applies this to a cup amount.
  VolumeInterpreter get cups =>
      VolumeInterpreter._cups._withPrefix(_multiplier);

  /// Applies this to a pint amount.
  VolumeInterpreter get pints =>
      VolumeInterpreter._pints._withPrefix(_multiplier);

  /// Applies this to a quart amount.
  VolumeInterpreter get quarts =>
      VolumeInterpreter._quarts._withPrefix(_multiplier);

  /// Applies this to a gallon amount.
  VolumeInterpreter get gallons =>
      VolumeInterpreter._gallons._withPrefix(_multiplier);

  /// Applies this to a US teaspoon amount.
  VolumeInterpreter get usTeaspoons =>
      VolumeInterpreter._usTeaspoons._withPrefix(_multiplier);

  /// Applies this to a US tablespoon amount.
  VolumeInterpreter get usTablespoons =>
      VolumeInterpreter._usTablespoons._withPrefix(_multiplier);

  /// Applies this to a US fluid ounce amount.
  VolumeInterpreter get usFluidOunces =>
      VolumeInterpreter._usFluidOunces._withPrefix(_multiplier);

  /// Applies this to a US cup amount.
  VolumeInterpreter get usCups =>
      VolumeInterpreter._usCups._withPrefix(_multiplier);

  /// Applies this to a US pint amount.
  VolumeInterpreter get usPints =>
      VolumeInterpreter._usPints._withPrefix(_multiplier);

  /// Applies this to a US quart amount.
  VolumeInterpreter get usQuarts =>
      VolumeInterpreter._usQuarts._withPrefix(_multiplier);

  /// Applies this to a US gallon amount.
  VolumeInterpreter get usGallons =>
      VolumeInterpreter._usGallons._withPrefix(_multiplier);

  /// Applies this to a US legal cup amount.
  VolumeInterpreter get usLegalCups =>
      VolumeInterpreter._usLegalCups._withPrefix(_multiplier);

  /// The prefix multiplier applied to this measurement.
  double get _multiplier;
}

/// Represents a three-dimensional space.
class Volume extends Measurement<Volume> {
  /// Produces an interpreter for the cube of a provided unit.
  static VolumeInterpreter cubic(
          final DistanceInterpreter distanceInterpreter) =>
      VolumeInterpreter.cubed(distanceInterpreter);

  @Deprecated("Use 'Volume.cubic(centi.meters)' instead")
  static final VolumeInterpreter cubicCentimeters = cubic(centi.meters);

  @Deprecated("Use 'Volume.cubic(meters)' instead")
  static final VolumeInterpreter cubicMeters = cubic(meters);

  @Deprecated("Use 'Volume.cubic(feet)' instead")
  static final VolumeInterpreter cubicFeet = cubic(feet);

  @Deprecated("Use 'Volume.cubic(inches)' instead")
  static final VolumeInterpreter cubicInches = cubic(inches);

  @Deprecated("Use 'milli.liters' instead")
  static final VolumeInterpreter milliliters = milli.liters;

  @Deprecated("Use 'centi.liters' instead")
  static final VolumeInterpreter centiliters = centi.liters;

  @Deprecated("Use 'deci.liters' instead")
  static final VolumeInterpreter deciliters = deci.liters;

  @Deprecated("Use 'liters' instead")
  static final VolumeInterpreter liters = VolumeInterpreter._liters;

  @Deprecated("Use 'deka.liters' instead")
  static final VolumeInterpreter dekaliters = deka.liters;

  @Deprecated("Use 'hecto.liters' instead")
  static final VolumeInterpreter hectoliters = hecto.liters;

  @Deprecated("Use 'kilo.liters' instead")
  static final VolumeInterpreter kiloliters = kilo.liters;

  @Deprecated("Use 'teaspoons' instead")
  static final VolumeInterpreter teaspoons = VolumeInterpreter._teaspoons;

  @Deprecated("Use 'tablespoons' instead")
  static final VolumeInterpreter tablespoons = VolumeInterpreter._tablespoons;

  @Deprecated("Use 'fluidOunces' instead")
  static final VolumeInterpreter fluidOunces = VolumeInterpreter._fluidOunces;

  @Deprecated("Use 'cups' instead")
  static final VolumeInterpreter cups = VolumeInterpreter._cups;

  @Deprecated("Use 'pints' instead")
  static final VolumeInterpreter pints = VolumeInterpreter._pints;

  @Deprecated("Use 'quarts' instead")
  static final VolumeInterpreter quarts = VolumeInterpreter._quarts;

  @Deprecated("Use 'gallons' instead")
  static final VolumeInterpreter gallons = VolumeInterpreter._gallons;

  @Deprecated("Use 'usTeaspoons' instead")
  static final VolumeInterpreter usTeaspoons = VolumeInterpreter._usTeaspoons;

  @Deprecated("Use 'usTablespoons' instead")
  static final VolumeInterpreter usTablespoons =
      VolumeInterpreter._usTablespoons;

  @Deprecated("Use 'usFluidOunces' instead")
  static final VolumeInterpreter usFluidOunces =
      VolumeInterpreter._usFluidOunces;

  @Deprecated("Use 'usCups' instead")
  static final VolumeInterpreter usCups = VolumeInterpreter._usCups;

  @Deprecated("Use 'usPints' instead")
  static final VolumeInterpreter usPints = VolumeInterpreter._usPints;

  @Deprecated("Use 'usQuarts' instead")
  static final VolumeInterpreter usQuarts = VolumeInterpreter._usQuarts;

  @Deprecated("Use 'usGallons' instead")
  static final VolumeInterpreter usGallons = VolumeInterpreter._usGallons;

  @Deprecated("Use 'usLegalCups' instead")
  static final VolumeInterpreter usLegalCups = VolumeInterpreter._usLegalCups;

  /// The volume of size zero.
  const Volume.zero() : super.zero();

  /// Infinite volume.
  const Volume.infinite() : super.infinite();

  /// Infinite negative volume.
  const Volume.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Volume] representing the sum of any number of other
  /// [Volume]s.
  Volume.sum(final Iterable<Volume> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  @Deprecated("Use 'Volume.sum()' instead")
  Volume.ofMetric({
    final num milliliters = 0,
    final num centiliters = 0,
    final num deciliters = 0,
    final num liters = 0,
    final num dekaliters = 0,
    final num hectoliters = 0,
    final num kiloliters = 0,
    final Precision precision = Precision.max,
  }) : super.sum([
          milli.liters(milliliters),
          centi.liters(centiliters),
          deci.liters(deciliters),
          VolumeInterpreter._liters(liters),
          deka.liters(dekaliters),
          hecto.liters(hectoliters),
          kilo.liters(kiloliters),
        ], precision);

  @Deprecated("Use 'Volume.sum()' instead")
  Volume.ofImperial({
    final num teaspoons = 0,
    final num tablespoons = 0,
    final num fluidOunces = 0,
    final num cups = 0,
    final num pints = 0,
    final num quarts = 0,
    final num gallons = 0,
    final Precision precision = Precision.max,
  }) : super.sum([
          VolumeInterpreter._teaspoons(teaspoons),
          VolumeInterpreter._tablespoons(tablespoons),
          VolumeInterpreter._fluidOunces(fluidOunces),
          VolumeInterpreter._cups(cups),
          VolumeInterpreter._pints(pints),
          VolumeInterpreter._quarts(quarts),
          VolumeInterpreter._gallons(gallons),
        ], precision);

  @Deprecated("Use 'Volume.sum()' instead")
  Volume.ofUs({
    final num usTeaspoons = 0,
    final num usTablespoons = 0,
    final num usFluidOunces = 0,
    final num usCups = 0,
    final num usPints = 0,
    final num usQuarts = 0,
    final num usGallons = 0,
    final Precision precision = Precision.max,
  }) : super.sum([
          VolumeInterpreter._usTeaspoons(usTeaspoons),
          VolumeInterpreter._usTablespoons(usTablespoons),
          VolumeInterpreter._usFluidOunces(usFluidOunces),
          VolumeInterpreter._usCups(usCups),
          VolumeInterpreter._usPints(usPints),
          VolumeInterpreter._usQuarts(usQuarts),
          VolumeInterpreter._usGallons(usGallons),
        ], precision);

  @Deprecated("Use 'milli.liters()' instead")
  Volume.ofMilliliters(final num milliliters,
      {final Precision precision = Precision.max})
      : this._(milli.liters._from(milliliters), precision);

  @Deprecated("Use 'centi.liters()' instead")
  Volume.ofCentiliters(final num centiliters,
      {final Precision precision = Precision.max})
      : this._(centi.liters._from(centiliters), precision);

  @Deprecated("Use 'deci.liters()' instead")
  Volume.ofDeciliters(final num deciliters,
      {final Precision precision = Precision.max})
      : this._(deci.liters._from(deciliters), precision);

  @Deprecated("Use 'liters()' instead")
  Volume.ofLiters(final num liters, {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._liters._from(liters), precision);

  @Deprecated("Use 'deka.liters()' instead")
  Volume.ofDekaliters(final num dekaliters,
      {final Precision precision = Precision.max})
      : this._(deka.liters._from(dekaliters), precision);

  @Deprecated("Use 'hecto.liters()' instead")
  Volume.ofHectoliters(final num hectoliters,
      {final Precision precision = Precision.max})
      : this._(hecto.liters._from(hectoliters), precision);

  @Deprecated("Use 'kilo.liters()' instead")
  Volume.ofKiloliters(final num kiloliters,
      {final Precision precision = Precision.max})
      : this._(kilo.liters._from(kiloliters), precision);

  @Deprecated("Use 'Volume.cubic(meters)()' instead")
  Volume.ofCubicMeters(final num cubicMeters,
      {final Precision precision = Precision.max})
      : this._(cubic(meters)._from(cubicMeters), precision);

  @Deprecated("Use 'teaspoons()' instead")
  Volume.ofTeaspoons(final num teaspoons,
      {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._teaspoons._from(teaspoons), precision);

  @Deprecated("Use 'tablespoons()' instead")
  Volume.ofTablespoons(final num tablespoons,
      {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._tablespoons._from(tablespoons), precision);

  @Deprecated("Use 'fluidOunces()' instead")
  Volume.ofFluidOunces(final num fluidOunces,
      {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._fluidOunces._from(fluidOunces), precision);

  @Deprecated("Use 'cups()' instead")
  Volume.ofCups(final num cups, {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._cups._from(cups), precision);

  @Deprecated("Use 'pints()' instead")
  Volume.ofPints(final num pints, {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._pints._from(pints), precision);

  @Deprecated("Use 'quarts()' instead")
  Volume.ofQuarts(final num quarts, {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._quarts._from(quarts), precision);

  @Deprecated("Use 'gallons()' instead")
  Volume.ofGallons(final num gallons,
      {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._gallons._from(gallons), precision);

  @Deprecated("Use 'Volume.cubic(feet)()' instead")
  Volume.ofCubicFeet(final num cubicFeet,
      {final Precision precision = Precision.max})
      : this._(cubic(feet)._from(cubicFeet), precision);

  @Deprecated("Use 'Volume.cubic(inches)()' instead")
  Volume.ofCubicInches(final num cubicInches,
      {final Precision precision = Precision.max})
      : this._(cubic(inches)._from(cubicInches), precision);

  @Deprecated("Use 'usTeaspoons()' instead")
  Volume.ofUsTeaspoons(final num usTeaspoons,
      {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._usTeaspoons._from(usTeaspoons), precision);

  @Deprecated("Use 'usTablespoons()' instead")
  Volume.ofUsTablespoons(final num usTablespoons,
      {final Precision precision = Precision.max})
      : this._(
            VolumeInterpreter._usTablespoons._from(usTablespoons), precision);

  @Deprecated("Use 'usFluidOunces()' instead")
  Volume.ofUsFluidOunces(final num usFluidOunces,
      {final Precision precision = Precision.max})
      : this._(
            VolumeInterpreter._usFluidOunces._from(usFluidOunces), precision);

  @Deprecated("Use 'usCups()' instead")
  Volume.ofUsCups(final num usCups, {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._usCups._from(usCups), precision);

  @Deprecated("Use 'usPints()' instead")
  Volume.ofUsPints(final num usPints,
      {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._usPints._from(usPints), precision);

  @Deprecated("Use 'usQuarts()' instead")
  Volume.ofUsQuarts(final num usQuarts,
      {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._usQuarts._from(usQuarts), precision);

  @Deprecated("Use 'usGallons()' instead")
  Volume.ofUsGallons(final num usGallons,
      {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._usGallons._from(usGallons), precision);

  @Deprecated("Use 'usLegalCups()' instead")
  Volume.ofUsLegalCups(final num usLegalCups,
      {final Precision precision = Precision.max})
      : this._(VolumeInterpreter._usLegalCups._from(usLegalCups), precision);

  /// Constructs a [Volume] from three [Distance] measurements.
  Volume.of(final Distance a, final Distance b, final Distance c)
      : this._(
            a.as(meters) * b.as(meters) * c.as(meters),
            Precision.combine(
                Precision.combine(a._precision, b._precision), c._precision));

  /// Interprets this in the specified units.
  double as(final DistanceInterpreter a, final DistanceInterpreter b,
          final DistanceInterpreter c) =>
      _precise(a._of(b._of(c._of(si))));

  /// Interprets this in the specified volume unit.
  double asVolume(final VolumeInterpreter interpreter) =>
      _preciseOf(interpreter);

  @Deprecated("Use 'asVolume(milli.liters)' instead")
  double get asMilliliters => asVolume(milli.liters);

  @Deprecated("Use 'asVolume(centi.liters)' instead")
  double get asCentiliters => asVolume(centi.liters);

  @Deprecated("Use 'asVolume(deci.liters)' instead")
  double get asDeciliters => asVolume(deci.liters);

  @Deprecated("Use 'asVolume(liters)' instead")
  double get asLiters => asVolume(VolumeInterpreter._liters);

  @Deprecated("Use 'asVolume(deka.liters)' instead")
  double get asDekaliters => asVolume(deka.liters);

  @Deprecated("Use 'asVolume(hecto.liters)' instead")
  double get asHectoliters => asVolume(hecto.liters);

  @Deprecated("Use 'asVolume(kilo.liters)' instead")
  double get asKiloliters => asVolume(kilo.liters);

  @Deprecated("Use 'asVolume(Volume.cubic(meters))' instead")
  double get asCubicMeters => asVolume(cubic(meters));

  @Deprecated("Use 'asVolume(teaspoons)' instead")
  double get asTeaspoons => asVolume(VolumeInterpreter._teaspoons);

  @Deprecated("Use 'asVolume(tablespoons)' instead")
  double get asTablespoons => asVolume(VolumeInterpreter._tablespoons);

  @Deprecated("Use 'asVolume(fluidOunces)' instead")
  double get asFluidOunces => asVolume(VolumeInterpreter._fluidOunces);

  @Deprecated("Use 'asVolume(cups)' instead")
  double get asCups => asVolume(VolumeInterpreter._cups);

  @Deprecated("Use 'asVolume(pints)' instead")
  double get asPints => asVolume(VolumeInterpreter._pints);

  @Deprecated("Use 'asVolume(quarts)' instead")
  double get asQuarts => asVolume(VolumeInterpreter._quarts);

  @Deprecated("Use 'asVolume(gallons)' instead")
  double get asGallons => asVolume(VolumeInterpreter._gallons);

  @Deprecated("Use 'asVolume(Volume.cubic(feet))' instead")
  double get asCubicFeet => asVolume(cubic(feet));

  @Deprecated("Use 'asVolume(Volume.cubic(inches))' instead")
  double get asCubicInches => asVolume(cubic(inches));

  @Deprecated("Use 'asVolume(usTeaspoons)' instead")
  double get asUsTeaspoons => asVolume(VolumeInterpreter._usTeaspoons);

  @Deprecated("Use 'asVolume(usTablespoon)' instead")
  double get asUsTablespoons => asVolume(VolumeInterpreter._usTablespoons);

  @Deprecated("Use 'asVolume(usFluidOunces)' instead")
  double get asUsFluidOunces => asVolume(VolumeInterpreter._usFluidOunces);

  @Deprecated("Use 'asVolume(usCups)' instead")
  double get asUsCups => asVolume(VolumeInterpreter._usCups);

  @Deprecated("Use 'asVolume(usPints)' instead")
  double get asUsPints => asVolume(VolumeInterpreter._usPints);

  @Deprecated("Use 'asVolume(usQuarts)' instead")
  double get asUsQuarts => asVolume(VolumeInterpreter._usQuarts);

  @Deprecated("Use 'asVolume(usGallons)' instead")
  double get asUsGallons => asVolume(VolumeInterpreter._usGallons);

  @Deprecated("Use 'asVolume(usLegalCups)' instead")
  double get asUsLegalCups => asVolume(VolumeInterpreter._usLegalCups);

  @override
  String toString() => '${asVolume(VolumeInterpreter._liters).toString()} L';

  /// Constructs a [Volume].
  const Volume._(final double cubicMeters, final Precision precision)
      : super(cubicMeters, precision);

  @override
  Volume _construct(final double cubicMeters, final Precision precision) =>
      Volume._(cubicMeters, precision);
}
