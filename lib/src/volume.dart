import 'converter/volume.dart';
import 'precision.dart';

/// Unit conversion system for volume.
///
/// Volumes measure an amount of space. The value can be negative, but this is
/// mostly useful for arithmetic (e.g. subtracting out a volume in a formula).
///
/// The actual unit used is abstracted, so an instance of Volume does not
/// inherently represent any particular unit (e.g. "milliliters" or "cups") but
/// can be interpreted as a value with any distance unit you like. For instance,
/// given a Volume instance, I could choose to read it in centiliters or in
/// cubic feet, depending on my needs.
///
/// Because unit conversions ("interpretations") require computation, it is
/// recommended to save off conversion results rather than performing the
/// computation multiple times (e.g. calling 'volume.milliliters' twice).
class Volume implements Comparable<Volume> {
  /// A null volume, representing no space.
  const Volume.zero()
      : _converter = VolumeConverter.zero,
        precision = Precision.max;

  /// Infinite volume.
  const Volume.infinity()
      : _converter = VolumeConverter.infinity,
        precision = Precision.max;

  /// Infinite volume in the negative.
  const Volume.negativeInfinity()
      : _converter = VolumeConverter.negativeInfinity,
        precision = Precision.max;

  /// Construct a Volume from any number of partial metric amounts.
  ///
  /// The resulting Volume will represent the sum of the parts.
  Volume.metric({
    final num milliliters = 0,
    final num centiliters = 0,
    final num deciliters = 0,
    final num liters = 0,
    final num dekaliters = 0,
    final num hectoliters = 0,
    final num kiloliters = 0,
    final this.precision = Precision.max,
  }) : _converter = VolumeConverter.metric(
            milliliters: milliliters,
            centiliters: centiliters,
            deciliters: deciliters,
            liters: liters,
            dekaliters: dekaliters,
            hectoliters: hectoliters,
            kiloliters: kiloliters);

  /// Construct a Volume from any number of partial Imperial amounts.
  ///
  /// The resulting Volume will represent the sum of the parts.
  Volume.imperial({
    final num teaspoons = 0,
    final num tablespoons = 0,
    final num fluidOunces = 0,
    final num cups = 0,
    final num pints = 0,
    final num quarts = 0,
    final num gallons = 0,
    final this.precision = Precision.max,
  }) : _converter = VolumeConverter.imperial(
            teaspoons: teaspoons,
            tablespoons: tablespoons,
            fluidOunces: fluidOunces,
            cups: cups,
            pints: pints,
            quarts: quarts,
            gallons: gallons);

  /// Construct a Volume from any number of partial US amounts.
  ///
  /// The resulting Volume will represent the sum of the parts.
  Volume.us({
    final num usTeaspoons = 0,
    final num usTablespoons = 0,
    final num usFluidOunces = 0,
    final num usCups = 0,
    final num usPints = 0,
    final num usQuarts = 0,
    final num usGallons = 0,
    final this.precision = Precision.max,
  }) : _converter = VolumeConverter.us(
            usTeaspoons: usTeaspoons,
            usTablespoons: usTablespoons,
            usFluidOunces: usFluidOunces,
            usCups: usCups,
            usPints: usPints,
            usQuarts: usQuarts,
            usGallons: usGallons);

  /// Construct a Volume from a milliliter amount.
  Volume.milliliters(final num milliliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(milliliters: milliliters);

  /// Construct a Volume from a centiliter amount.
  Volume.centiliters(final num centiliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(centiliters: centiliters);

  /// Construct a Volume from a deciliter amount.
  Volume.deciliters(final num deciliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(deciliters: deciliters);

  /// Construct a Volume from a liter amount.
  Volume.liters(final num liters, {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(liters: liters);

  /// Construct a Volume from a dekaliter amount.
  Volume.dekaliters(final num dekaliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(dekaliters: dekaliters);

  /// Construct a Volume from a hectoliter amount.
  Volume.hectoliters(final num hectoliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(hectoliters: hectoliters);

  /// Construct a Volume from a kiloliter amount.
  Volume.kiloliters(final num kiloliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(kiloliters: kiloliters);

  /// Construct a Volume from a cubic meter amount.
  Volume.cubicMeters(final num cubicMeters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metricCubic(cubicMeters: cubicMeters);

  /// Construct a Volume from an Imperial teaspoon amount.
  Volume.teaspoons(final num teaspoons, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(teaspoons: teaspoons);

  /// Construct a Volume from an Imperial tablespoon amount.
  Volume.tablespoons(final num tablespoons,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(tablespoons: tablespoons);

  /// Construct a Volume from an Imperial fluid ounce amount.
  Volume.fluidOunces(final num fluidOunces,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(fluidOunces: fluidOunces);

  /// Construct a Volume from an Imperial cup amount.
  Volume.cups(final num cups, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(cups: cups);

  /// Construct a Volume from an Imperial pint amount.
  Volume.pints(final num pints, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(pints: pints);

  /// Construct a Volume from an Imperial quart amount.
  Volume.quarts(final num quarts, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(quarts: quarts);

  /// Construct a Volume from an Imperial gallon amount.
  Volume.gallons(final num gallons, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(gallons: gallons);

  /// Construct a Volume from a cubic feet amount.
  Volume.cubicFeet(final num cubicFeet, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperialCubic(cubicFeet: cubicFeet);

  /// Construct a Volume from a cubic inch amount.
  Volume.cubicInches(final num cubicInches,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperialCubic(cubicInches: cubicInches);

  /// Construct a Volume from a US teaspoon amount.
  Volume.usTeaspoons(final num usTeaspoons,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usTeaspoons: usTeaspoons);

  /// Construct a Volume from a US tablespoon amount.
  Volume.usTablespoons(final num usTablespoons,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usTablespoons: usTablespoons);

  /// Construct a Volume from a US fluid ounce amount.
  Volume.usFluidOunces(final num usFluidOunces,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usFluidOunces: usFluidOunces);

  /// Construct a Volume from a US cup amount.
  Volume.usCups(final num usCups, {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usCups: usCups);

  /// Construct a Volume from a US pint amount.
  Volume.usPints(final num usPints, {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usPints: usPints);

  /// Construct a Volume from a US quart amount.
  Volume.usQuarts(final num usQuarts, {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usQuarts: usQuarts);

  /// Construct a Volume from a US gallon amount.
  Volume.usGallons(final num usGallons, {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usGallons: usGallons);

  /// Construct a Volume from a US gallon amount.
  Volume.usLegalCups(final num usLegalCups,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.usLegalCups(usLegalCups);

  /// Interpret this volume as a number of milliliters.
  double get milliliters => precision.withPrecision(_converter.toMilliliters());

  /// Interpret this volume as a number of centiliters.
  double get centiliters => precision.withPrecision(_converter.toCentiliters());

  /// Interpret this volume as a number of deciliters.
  double get deciliters => precision.withPrecision(_converter.toDeciliters());

  /// Interpret this volume as a number of liters.
  double get liters => precision.withPrecision(_converter.toLiters());

  /// Interpret this volume as a number of dekaliters.
  double get dekaliters => precision.withPrecision(_converter.toDekaliters());

  /// Interpret this volume as a number of hectoliters.
  double get hectoliters => precision.withPrecision(_converter.toHectoliters());

  /// Interpret this volume as a number of kiloliters.
  double get kiloliters => precision.withPrecision(_converter.toKiloliters());

  /// Interpret this volume as a number of cubic meters.
  double get cubicMeters => precision.withPrecision(_converter.toCubicMeters());

  /// Interpret this volume as a number of Imperial teaspoons.
  double get teaspoons => precision.withPrecision(_converter.toTeaspoons());

  /// Interpret this volume as a number of Imperial tablespoons.
  double get tablespoons => precision.withPrecision(_converter.toTablespoons());

  /// Interpret this volume as a number of Imperial fluid ounces.
  double get fluidOunces => precision.withPrecision(_converter.toFluidOunces());

  /// Interpret this volume as a number of Imperial cups.
  double get cups => precision.withPrecision(_converter.toCups());

  /// Interpret this volume as a number of Imperial pints.
  double get pints => precision.withPrecision(_converter.toPints());

  /// Interpret this volume as a number of Imperial quarts.
  double get quarts => precision.withPrecision(_converter.toQuarts());

  /// Interpret this volume as a number of Imperial gallons.
  double get gallons => precision.withPrecision(_converter.toGallons());

  /// Interpret this volume as a number of cubic feet.
  double get cubicFeet => precision.withPrecision(_converter.toCubicFeet());

  /// Interpret this volume as a number of cubic inches.
  double get cubicInches => precision.withPrecision(_converter.toCubicInches());

  /// Interpret this volume as a number of US teaspoons.
  double get usTeaspoons => precision.withPrecision(_converter.toUsTeaspoons());

  /// Interpret this volume as a number of US tablespoons.
  double get usTablespoons =>
      precision.withPrecision(_converter.toUsTablespoons());

  /// Interpret this volume as a number of US fluid ounces.
  double get usFluidOunces =>
      precision.withPrecision(_converter.toUsFluidOunces());

  /// Interpret this volume as a number of US cups.
  double get usCups => precision.withPrecision(_converter.toUsCups());

  /// Interpret this volume as a number of US pints.
  double get usPints => precision.withPrecision(_converter.toUsPints());

  /// Interpret this volume as a number of US quarts.
  double get usQuarts => precision.withPrecision(_converter.toUsQuarts());

  /// Interpret this volume as a number of US gallons.
  double get usGallons => precision.withPrecision(_converter.toUsGallons());

  /// Interpret this volume as a number of US legal cups.
  double get usLegalCups => precision.withPrecision(_converter.toUsLegalCups());

  /// Interprets the specified Volume in kiloliters.
  static double asKiloliters(final Volume volume) => volume.kiloliters;

  /// Interprets the specified Volume in hectoliters.
  static double asHectoliters(final Volume volume) => volume.hectoliters;

  /// Interprets the specified Volume in dekaliters.
  static double asDekaliters(final Volume volume) => volume.dekaliters;

  /// Interprets the specified Volume in liters.
  static double asLiters(final Volume volume) => volume.liters;

  /// Interprets the specified Volume in deciliters.
  static double asDeciliters(final Volume volume) => volume.deciliters;

  /// Interprets the specified Volume in centiliters.
  static double asCentiliters(final Volume volume) => volume.centiliters;

  /// Interprets the specified Volume in milliliters.
  static double asMilliliters(final Volume volume) => volume.milliliters;

  /// Interprets the specified Volume in gallons.
  static double asGallons(final Volume volume) => volume.gallons;

  /// Interprets the specified Volume in quarts.
  static double asQuarts(final Volume volume) => volume.quarts;

  /// Interprets the specified Volume in pints.
  static double asPints(final Volume volume) => volume.pints;

  /// Interprets the specified Volume in cups.
  static double asCups(final Volume volume) => volume.cups;

  /// Interprets the specified Volume in fluidOunces.
  static double asFluidOunces(final Volume volume) => volume.fluidOunces;

  /// Interprets the specified Volume in tablespoon.
  static double asTablespoons(final Volume volume) => volume.tablespoons;

  /// Interprets the specified Volume in teaspoon.
  static double asTeaspoons(final Volume volume) => volume.teaspoons;

  /// Interprets the specified Volume in US gallons.
  static double asUsGallons(final Volume volume) => volume.usGallons;

  /// Interprets the specified Volume in US quarts.
  static double asUsQuarts(final Volume volume) => volume.usQuarts;

  /// Interprets the specified Volume in US pints.
  static double asUsPints(final Volume volume) => volume.usPints;

  /// Interprets the specified Volume in US cups.
  static double asUsCups(final Volume volume) => volume.usCups;

  /// Interprets the specified Volume in US fluid ounces.
  static double asUsFluidOunces(final Volume volume) => volume.usFluidOunces;

  /// Interprets the specified Volume in US tablespoons.
  static double asUsTablespoons(final Volume volume) => volume.usTablespoons;

  /// Interprets the specified Volume in US teaspoons.
  static double asUsTeaspoons(final Volume volume) => volume.usTeaspoons;

  /// Interprets the specified Volume in US legal cups.
  static double asUsLegalCups(final Volume volume) => volume.usLegalCups;

  /// Returns whether this Volume represents a negative amount.
  bool get isNegative => _converter.isNegative;

  /// Returns whether this Volume represents a finite amount.
  bool get isFinite => _converter.isFinite;

  /// Returns whether this Volume represents an infinite amount (positive or
  /// negative).
  bool get isInfinite => _converter.isInfinite;

  /// Whether this volume is not a number.
  bool get isNaN => _converter.isNaN;

  /// Compares this Volume to another Volume, returning true if this Volume is
  /// larger than the other Volume, or false otherwise.
  bool operator >(final Volume other) => liters > other.liters;

  /// Compares this Volume to another Volume, returning true if this Volume is
  /// larger than or equal to the other Volume, or false otherwise.
  bool operator >=(final Volume other) => liters >= other.liters;

  /// Compares this Volume to another Volume, returning true if this Volume is
  /// smaller than the other Volume, or false otherwise.
  bool operator <(final Volume other) => liters < other.liters;

  /// Compares this Volume to another Volume, returning true if this Volume is
  /// smaller than or equal to the other Volume, or false otherwise.
  bool operator <=(final Volume other) => liters <= other.liters;

  @override
  bool operator ==(final dynamic other) =>
      other is Volume && other.liters == liters && other.precision == precision;

  @override
  int get hashCode => liters.hashCode * precision.hashCode;

  /// Creates a Volume that is the opposite of this Volume.
  ///
  /// In brief, it will have the opposite sign as this Volume.
  Volume operator -() => Volume.liters(-liters, precision: precision);

  /// Add two Volumes together to produce a third Volume. The resulting
  /// Volume is equivalent to the sum of the two input Volumes. Negative
  /// Volumes may cancel out.
  ///
  /// Volume.liters(2) + Volume.zero() == Volume.liters(2)
  /// Volume.liters(2) + Volume.liters(3) == Volume.liters(5)
  /// Volume.liters(2) + Volume.liters(-3) == Volume.liters(-1)
  Volume operator +(final Volume other) => Volume.liters(
        liters + other.liters,
        precision: Precision.add(precision, other.precision),
      );

  /// Subtract two Volumes to produce a third Volume. The resulting
  /// Volume is equivalent to the difference between the two input Volumes.
  /// The resulting Volume's sign will be inverted if a larger Volume is
  /// subtracted from a smaller Volume.
  ///
  /// Volume.liters(3) - Volume.zero() == Volume.liters(3)
  /// Volume.liters(5) - Volume.liters(3) == Volume.liters(2)
  /// Volume.liters(3) - Volume.liters(5) == Volume.liters(-2)
  /// Volume.liters(3) - Volume.liters(-5) == Volume.liters(8)
  Volume operator -(final Volume other) => Volume.liters(
        liters - other.liters,
        precision: Precision.add(precision, other.precision),
      );

  /// Multiply a Volume by a scalar to produce a new Volume that is a
  /// multiple of the original Volume. As you might expect, multiplying by a
  /// negative value inverts the resulting Volume.
  ///
  /// Volume.liters(3) * 1 == Volume.liters(3)
  /// Volume.liters(3) * 0 == Volume.zero()
  /// Volume.liters(3) * 2 == Volume.liters(6)
  /// Volume.liters(3) * -2 == Volume.liters(-6)
  Volume operator *(final num multiplier) => Volume.liters(
        liters * multiplier,
        precision: precision,
      );

  /// Divide a Volume by a scalar to produce a new Volume that is a fraction
  /// of the original Volume. As you might expect, dividing by a negative
  /// value inverts the resulting Volume.
  ///
  /// Volume.liters(6) / 1 == Volume.liters(6)
  /// Volume.liters(6) / 2 == Volume.liters(3)
  /// Volume.liters(6) / -2 == Volume.liters(-3)
  /// Volume.liters(6) / 0 == Volume.infinity()
  Volume operator /(final num divisor) => Volume.liters(
        liters / divisor,
        precision: precision,
      );

  @override
  int compareTo(final Volume other) => liters.compareTo(other.liters);

  @override
  String toString() => '${liters.toString()} L';

  final VolumeConverter _converter;

  /// The precision used in all conversions.
  final Precision precision;
}
