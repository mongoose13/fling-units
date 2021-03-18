part of fling_units;

/// Interprets [Volume]s as specific units.
class VolumeInterpreter extends MeasurementInterpreter<Volume> {
  /// Constructs a [VolumeInterpreter] from any three [DistanceInterpreter]s.
  VolumeInterpreter(final DistanceInterpreter a, final DistanceInterpreter b,
      final DistanceInterpreter c)
      : this._(a._multiplier * b._multiplier * c._multiplier);

  /// Constructs a [VolumeInterpreter] that will cube a basic
  /// [DistanceInterpreter].
  VolumeInterpreter.cubed(final DistanceInterpreter a)
      : this._(math.pow(a._multiplier, 3).toDouble());

  /// Constructs a [VolumeInterpreter].
  const VolumeInterpreter._(final double cubicMeters) : super._(cubicMeters);
}

/// Represents a three-dimensional space.
class Volume extends Measurement<Volume> {
  /// The [VolumeInterpreter] for cubic centimeters.
  static final VolumeInterpreter cubicCentimeters =
      VolumeInterpreter.cubed(Distance.centimeters);

  /// The [VolumeInterpreter] for cubic meters.
  static final VolumeInterpreter cubicMeters =
      VolumeInterpreter.cubed(Distance.meters);

  /// The [VolumeInterpreter] for cubic feet.
  static final VolumeInterpreter cubicFeet =
      VolumeInterpreter.cubed(Distance.feet);

  /// The [VolumeInterpreter] for cubic inches.
  static final VolumeInterpreter cubicInches =
      VolumeInterpreter.cubed(Distance.inches);

  /// The [VolumeInterpreter] for milliliters.
  static final VolumeInterpreter milliliters = VolumeInterpreter._(1e6);

  /// The [VolumeInterpreter] for centiliters.
  static final VolumeInterpreter centiliters = VolumeInterpreter._(1e5);

  /// The [VolumeInterpreter] for deciliters.
  static final VolumeInterpreter deciliters = VolumeInterpreter._(1e4);

  /// The [VolumeInterpreter] for liters.
  static final VolumeInterpreter liters = VolumeInterpreter._(1e3);

  /// The [VolumeInterpreter] for dekaliters.
  static final VolumeInterpreter dekaliters = VolumeInterpreter._(1e2);

  /// The [VolumeInterpreter] for hectoliters.
  static final VolumeInterpreter hectoliters = VolumeInterpreter._(1e1);

  /// The [VolumeInterpreter] for kiloliters.
  static final VolumeInterpreter kiloliters = VolumeInterpreter._(1e0);

  /// The [VolumeInterpreter] for teaspoons.
  static final VolumeInterpreter teaspoons = VolumeInterpreter._(168936);

  /// The [VolumeInterpreter] for tablespoons.
  static final VolumeInterpreter tablespoons = VolumeInterpreter._(56312);

  /// The [VolumeInterpreter] for fluid ounces.
  static final VolumeInterpreter fluidOunces = VolumeInterpreter._(35195.1);

  /// The [VolumeInterpreter] for cups.
  static final VolumeInterpreter cups = VolumeInterpreter._(3519.51);

  /// The [VolumeInterpreter] for pints.
  static final VolumeInterpreter pints = VolumeInterpreter._(1759.75);

  /// The [VolumeInterpreter] for quarts.
  static final VolumeInterpreter quarts = VolumeInterpreter._(879.877);

  /// The [VolumeInterpreter] for gallons.
  static final VolumeInterpreter gallons = VolumeInterpreter._(219.969);

  /// The [VolumeInterpreter] for US teaspoons.
  static final VolumeInterpreter usTeaspoons = VolumeInterpreter._(202884);

  /// The [VolumeInterpreter] for US tablespoons.
  static final VolumeInterpreter usTablespoons = VolumeInterpreter._(67628);

  /// The [VolumeInterpreter] for US fluid ounces.
  static final VolumeInterpreter usFluidOunces = VolumeInterpreter._(33814);

  /// The [VolumeInterpreter] for US cups.
  static final VolumeInterpreter usCups = VolumeInterpreter._(4226.76);

  /// The [VolumeInterpreter] for US pints.
  static final VolumeInterpreter usPints = VolumeInterpreter._(2113.38);

  /// The [VolumeInterpreter] for US quarts.
  static final VolumeInterpreter usQuarts = VolumeInterpreter._(1056.69);

  /// The [VolumeInterpreter] for US gallons.
  static final VolumeInterpreter usGallons = VolumeInterpreter._(264.172);

  /// The [VolumeInterpreter] for US legal cups.
  static final VolumeInterpreter usLegalCups = VolumeInterpreter._(4166.67);

  /// The volume of size zero.
  const Volume.zero() : super.zero();

  /// Infinite volume.
  const Volume.infinite() : super.infinite();

  /// Infinite negative volume.
  const Volume.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Volume] representing the sum of partial metric amounts.
  Volume.ofMetric({
    final num milliliters = 0,
    final num centiliters = 0,
    final num deciliters = 0,
    final num liters = 0,
    final num dekaliters = 0,
    final num hectoliters = 0,
    final num kiloliters = 0,
    final Precision precision = Precision.max,
  }) : this._(
            Volume.milliliters._from(milliliters) +
                Volume.centiliters._from(centiliters) +
                Volume.deciliters._from(deciliters) +
                Volume.liters._from(liters) +
                Volume.dekaliters._from(dekaliters) +
                Volume.hectoliters._from(hectoliters) +
                Volume.kiloliters._from(kiloliters),
            precision);

  /// Constructs a [Volume] representing the sum of partial Imperial amounts.
  Volume.ofImperial({
    final num teaspoons = 0,
    final num tablespoons = 0,
    final num fluidOunces = 0,
    final num cups = 0,
    final num pints = 0,
    final num quarts = 0,
    final num gallons = 0,
    final Precision precision = Precision.max,
  }) : this._(
            Volume.teaspoons._from(teaspoons) +
                Volume.tablespoons._from(tablespoons) +
                Volume.fluidOunces._from(fluidOunces) +
                Volume.cups._from(cups) +
                Volume.pints._from(pints) +
                Volume.quarts._from(quarts) +
                Volume.gallons._from(gallons),
            precision);

  /// Constructs a [Volume] representing the sum of partial US amounts.
  Volume.ofUs({
    final num usTeaspoons = 0,
    final num usTablespoons = 0,
    final num usFluidOunces = 0,
    final num usCups = 0,
    final num usPints = 0,
    final num usQuarts = 0,
    final num usGallons = 0,
    final Precision precision = Precision.max,
  }) : this._(
            Volume.usTeaspoons._from(usTeaspoons) +
                Volume.usTablespoons._from(usTablespoons) +
                Volume.usFluidOunces._from(usFluidOunces) +
                Volume.usCups._from(usCups) +
                Volume.usPints._from(usPints) +
                Volume.usQuarts._from(usQuarts) +
                Volume.usGallons._from(usGallons),
            precision);

  /// Constructs a [Volume] from a milliliter amount.
  Volume.ofMilliliters(final num milliliters,
      {final Precision precision = Precision.max})
      : this._(Volume.milliliters._from(milliliters), precision);

  /// Constructs a [Volume] from a centiliter amount.
  Volume.ofCentiliters(final num centiliters,
      {final Precision precision = Precision.max})
      : this._(Volume.centiliters._from(centiliters), precision);

  /// Constructs a [Volume] from a deciliter amount.
  Volume.ofDeciliters(final num deciliters,
      {final Precision precision = Precision.max})
      : this._(Volume.deciliters._from(deciliters), precision);

  /// Constructs a [Volume] from a liter amount.
  Volume.ofLiters(final num liters, {final Precision precision = Precision.max})
      : this._(Volume.liters._from(liters), precision);

  /// Constructs a [Volume] from a dekaliter amount.
  Volume.ofDekaliters(final num dekaliters,
      {final Precision precision = Precision.max})
      : this._(Volume.dekaliters._from(dekaliters), precision);

  /// Constructs a [Volume] from a hectoliter amount.
  Volume.ofHectoliters(final num hectoliters,
      {final Precision precision = Precision.max})
      : this._(Volume.hectoliters._from(hectoliters), precision);

  /// Constructs a [Volume] from a kiloliter amount.
  Volume.ofKiloliters(final num kiloliters,
      {final Precision precision = Precision.max})
      : this._(Volume.kiloliters._from(kiloliters), precision);

  /// Constructs a [Volume] from a cubic meter amount.
  Volume.ofCubicMeters(final num cubicMeters,
      {final Precision precision = Precision.max})
      : this._(Volume.cubicMeters._from(cubicMeters), precision);

  /// Constructs a [Volume] from an Imperial teaspoon amount.
  Volume.ofTeaspoons(final num teaspoons,
      {final Precision precision = Precision.max})
      : this._(Volume.teaspoons._from(teaspoons), precision);

  /// Constructs a [Volume] from an Imperial tablespoon amount.
  Volume.ofTablespoons(final num tablespoons,
      {final Precision precision = Precision.max})
      : this._(Volume.tablespoons._from(tablespoons), precision);

  /// Constructs a [Volume] from an Imperial fluid ounce amount.
  Volume.ofFluidOunces(final num fluidOunces,
      {final Precision precision = Precision.max})
      : this._(Volume.fluidOunces._from(fluidOunces), precision);

  /// Constructs a [Volume] from an Imperial cup amount.
  Volume.ofCups(final num cups, {final Precision precision = Precision.max})
      : this._(Volume.cups._from(cups), precision);

  /// Constructs a [Volume] from an Imperial pint amount.
  Volume.ofPints(final num pints, {final Precision precision = Precision.max})
      : this._(Volume.pints._from(pints), precision);

  /// Constructs a [Volume] from an Imperial quart amount.
  Volume.ofQuarts(final num quarts, {final Precision precision = Precision.max})
      : this._(Volume.quarts._from(quarts), precision);

  /// Constructs a [Volume] from an Imperial gallon amount.
  Volume.ofGallons(final num gallons,
      {final Precision precision = Precision.max})
      : this._(Volume.gallons._from(gallons), precision);

  /// Constructs a [Volume] from a cubic feet amount.
  Volume.ofCubicFeet(final num cubicFeet,
      {final Precision precision = Precision.max})
      : this._(Volume.cubicFeet._from(cubicFeet), precision);

  /// Constructs a [Volume] from a cubic inch amount.
  Volume.ofCubicInches(final num cubicInches,
      {final Precision precision = Precision.max})
      : this._(Volume.cubicInches._from(cubicInches), precision);

  /// Constructs a [Volume] from a US teaspoon amount.
  Volume.ofUsTeaspoons(final num usTeaspoons,
      {final Precision precision = Precision.max})
      : this._(Volume.usTeaspoons._from(usTeaspoons), precision);

  /// Constructs a [Volume] from a US tablespoon amount.
  Volume.ofUsTablespoons(final num usTablespoons,
      {final Precision precision = Precision.max})
      : this._(Volume.usTablespoons._from(usTablespoons), precision);

  /// Constructs a [Volume] from a US fluid ounce amount.
  Volume.ofUsFluidOunces(final num usFluidOunces,
      {final Precision precision = Precision.max})
      : this._(Volume.usFluidOunces._from(usFluidOunces), precision);

  /// Constructs a [Volume] from a US cup amount.
  Volume.ofUsCups(final num usCups, {final Precision precision = Precision.max})
      : this._(Volume.usCups._from(usCups), precision);

  /// Constructs a [Volume] from a US pint amount.
  Volume.ofUsPints(final num usPints,
      {final Precision precision = Precision.max})
      : this._(Volume.usPints._from(usPints), precision);

  /// Constructs a [Volume] from a US quart amount.
  Volume.ofUsQuarts(final num usQuarts,
      {final Precision precision = Precision.max})
      : this._(Volume.usQuarts._from(usQuarts), precision);

  /// Constructs a [Volume] from a US gallon amount.
  Volume.ofUsGallons(final num usGallons,
      {final Precision precision = Precision.max})
      : this._(Volume.usGallons._from(usGallons), precision);

  /// Constructs a [Volume] from a US gallon amount.
  Volume.ofUsLegalCups(final num usLegalCups,
      {final Precision precision = Precision.max})
      : this._(Volume.usLegalCups._from(usLegalCups), precision);

  /// Constructs a [Volume] from three [Distance] measurements.
  Volume.of(final Distance a, final Distance b, final Distance c)
      : this._(
            a.asMeters * b.asMeters * c.asMeters,
            Precision.combine(
                Precision.combine(a._precision, b._precision), c._precision));

  /// Interprets this as a number of milliliters.
  double get asMilliliters => _precise(milliliters._of(si));

  /// Interprets this as a number of centiliters.
  double get asCentiliters => _precise(centiliters._of(si));

  /// Interprets this as a number of deciliters.
  double get asDeciliters => _precise(deciliters._of(si));

  /// Interprets this as a number of liters.
  double get asLiters => _precise(liters._of(si));

  /// Interprets this as a number of dekaliters.
  double get asDekaliters => _precise(dekaliters._of(si));

  /// Interprets this as a number of hectoliters.
  double get asHectoliters => _precise(hectoliters._of(si));

  /// Interprets this as a number of kiloliters.
  double get asKiloliters => _precise(kiloliters._of(si));

  /// Interprets this as a number of cubic meters.
  double get asCubicMeters => _precise(cubicMeters._of(si));

  /// Interprets this as a number of Imperial teaspoons.
  double get asTeaspoons => _precise(teaspoons._of(si));

  /// Interprets this as a number of Imperial tablespoons.
  double get asTablespoons => _precise(tablespoons._of(si));

  /// Interprets this as a number of Imperial fluid ounces.
  double get asFluidOunces => _precise(fluidOunces._of(si));

  /// Interprets this as a number of Imperial cups.
  double get asCups => _precise(cups._of(si));

  /// Interprets this as a number of Imperial pints.
  double get asPints => _precise(pints._of(si));

  /// Interprets this as a number of Imperial quarts.
  double get asQuarts => _precise(quarts._of(si));

  /// Interprets this as a number of Imperial gallons.
  double get asGallons => _precise(gallons._of(si));

  /// Interprets this as a number of cubic feet.
  double get asCubicFeet => _precise(cubicFeet._of(si));

  /// Interprets this as a number of cubic inches.
  double get asCubicInches => _precise(cubicInches._of(si));

  /// Interprets this as a number of US teaspoons.
  double get asUsTeaspoons => _precise(usTeaspoons._of(si));

  /// Interprets this as a number of US tablespoons.
  double get asUsTablespoons => _precise(usTablespoons._of(si));

  /// Interprets this as a number of US fluid ounces.
  double get asUsFluidOunces => _precise(usFluidOunces._of(si));

  /// Interprets this as a number of US cups.
  double get asUsCups => _precise(usCups._of(si));

  /// Interprets this as a number of US pints.
  double get asUsPints => _precise(usPints._of(si));

  /// Interprets this as a number of US quarts.
  double get asUsQuarts => _precise(usQuarts._of(si));

  /// Interprets this as a number of US gallons.
  double get asUsGallons => _precise(usGallons._of(si));

  /// Interprets this as a number of US legal cups.
  double get asUsLegalCups => _precise(usLegalCups._of(si));

  /// Interprets this in the specified units.
  double as(final DistanceInterpreter a, final DistanceInterpreter b,
          final DistanceInterpreter c) =>
      _precise(a._of(b._of(c._of(si))));

  @override
  String toString() => '${asLiters.toString()} L';

  /// Constructs a [Volume].
  const Volume._(final double cubicMeters, final Precision precision)
      : super(cubicMeters, precision);

  @override
  Volume _construct(final double cubicMeters, final Precision precision) =>
      Volume._(cubicMeters, precision);
}
