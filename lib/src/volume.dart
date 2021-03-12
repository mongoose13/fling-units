import 'converter/volume.dart';
import 'precision.dart';

/// Represents a three-dimensional space.
class Volume implements Comparable<Volume> {
  /// The volume of size zero.
  const Volume.zero()
      : _converter = VolumeConverter.zero,
        precision = Precision.max;

  /// Infinite volume.
  const Volume.infinity()
      : _converter = VolumeConverter.infinity,
        precision = Precision.max;

  /// Infinite negative volume.
  const Volume.negativeInfinity()
      : _converter = VolumeConverter.negativeInfinity,
        precision = Precision.max;

  /// Constructs a [Volume] representing the sum of partial metric amounts.
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

  /// Constructs a [Volume] representing the sum of partial Imperial amounts.
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

  /// Constructs a [Volume] representing the sum of partial US amounts.
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

  /// Constructs a [Volume] from a milliliter amount.
  Volume.milliliters(final num milliliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(milliliters: milliliters);

  /// Constructs a [Volume] from a centiliter amount.
  Volume.centiliters(final num centiliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(centiliters: centiliters);

  /// Constructs a [Volume] from a deciliter amount.
  Volume.deciliters(final num deciliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(deciliters: deciliters);

  /// Constructs a [Volume] from a liter amount.
  Volume.liters(final num liters, {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(liters: liters);

  /// Constructs a [Volume] from a dekaliter amount.
  Volume.dekaliters(final num dekaliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(dekaliters: dekaliters);

  /// Constructs a [Volume] from a hectoliter amount.
  Volume.hectoliters(final num hectoliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(hectoliters: hectoliters);

  /// Constructs a [Volume] from a kiloliter amount.
  Volume.kiloliters(final num kiloliters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metric(kiloliters: kiloliters);

  /// Constructs a [Volume] from a cubic meter amount.
  Volume.cubicMeters(final num cubicMeters,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.metricCubic(cubicMeters: cubicMeters);

  /// Constructs a [Volume] from an Imperial teaspoon amount.
  Volume.teaspoons(final num teaspoons, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(teaspoons: teaspoons);

  /// Constructs a [Volume] from an Imperial tablespoon amount.
  Volume.tablespoons(final num tablespoons,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(tablespoons: tablespoons);

  /// Constructs a [Volume] from an Imperial fluid ounce amount.
  Volume.fluidOunces(final num fluidOunces,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(fluidOunces: fluidOunces);

  /// Constructs a [Volume] from an Imperial cup amount.
  Volume.cups(final num cups, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(cups: cups);

  /// Constructs a [Volume] from an Imperial pint amount.
  Volume.pints(final num pints, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(pints: pints);

  /// Constructs a [Volume] from an Imperial quart amount.
  Volume.quarts(final num quarts, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(quarts: quarts);

  /// Constructs a [Volume] from an Imperial gallon amount.
  Volume.gallons(final num gallons, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperial(gallons: gallons);

  /// Constructs a [Volume] from a cubic feet amount.
  Volume.cubicFeet(final num cubicFeet, {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperialCubic(cubicFeet: cubicFeet);

  /// Constructs a [Volume] from a cubic inch amount.
  Volume.cubicInches(final num cubicInches,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.imperialCubic(cubicInches: cubicInches);

  /// Constructs a [Volume] from a US teaspoon amount.
  Volume.usTeaspoons(final num usTeaspoons,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usTeaspoons: usTeaspoons);

  /// Constructs a [Volume] from a US tablespoon amount.
  Volume.usTablespoons(final num usTablespoons,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usTablespoons: usTablespoons);

  /// Constructs a [Volume] from a US fluid ounce amount.
  Volume.usFluidOunces(final num usFluidOunces,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usFluidOunces: usFluidOunces);

  /// Constructs a [Volume] from a US cup amount.
  Volume.usCups(final num usCups, {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usCups: usCups);

  /// Constructs a [Volume] from a US pint amount.
  Volume.usPints(final num usPints, {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usPints: usPints);

  /// Constructs a [Volume] from a US quart amount.
  Volume.usQuarts(final num usQuarts, {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usQuarts: usQuarts);

  /// Constructs a [Volume] from a US gallon amount.
  Volume.usGallons(final num usGallons, {final this.precision = Precision.max})
      : _converter = VolumeConverter.us(usGallons: usGallons);

  /// Constructs a [Volume] from a US gallon amount.
  Volume.usLegalCups(final num usLegalCups,
      {final this.precision = Precision.max})
      : _converter = VolumeConverter.usLegalCups(usLegalCups);

  /// Interprets this as a number of milliliters.
  double get milliliters => precision.withPrecision(_converter.toMilliliters());

  /// Interprets this as a number of centiliters.
  double get centiliters => precision.withPrecision(_converter.toCentiliters());

  /// Interprets this as a number of deciliters.
  double get deciliters => precision.withPrecision(_converter.toDeciliters());

  /// Interprets this as a number of liters.
  double get liters => precision.withPrecision(_converter.toLiters());

  /// Interprets this as a number of dekaliters.
  double get dekaliters => precision.withPrecision(_converter.toDekaliters());

  /// Interprets this as a number of hectoliters.
  double get hectoliters => precision.withPrecision(_converter.toHectoliters());

  /// Interprets this as a number of kiloliters.
  double get kiloliters => precision.withPrecision(_converter.toKiloliters());

  /// Interprets this as a number of cubic meters.
  double get cubicMeters => precision.withPrecision(_converter.toCubicMeters());

  /// Interprets this as a number of Imperial teaspoons.
  double get teaspoons => precision.withPrecision(_converter.toTeaspoons());

  /// Interprets this as a number of Imperial tablespoons.
  double get tablespoons => precision.withPrecision(_converter.toTablespoons());

  /// Interprets this as a number of Imperial fluid ounces.
  double get fluidOunces => precision.withPrecision(_converter.toFluidOunces());

  /// Interprets this as a number of Imperial cups.
  double get cups => precision.withPrecision(_converter.toCups());

  /// Interprets this as a number of Imperial pints.
  double get pints => precision.withPrecision(_converter.toPints());

  /// Interprets this as a number of Imperial quarts.
  double get quarts => precision.withPrecision(_converter.toQuarts());

  /// Interprets this as a number of Imperial gallons.
  double get gallons => precision.withPrecision(_converter.toGallons());

  /// Interprets this as a number of cubic feet.
  double get cubicFeet => precision.withPrecision(_converter.toCubicFeet());

  /// Interprets this as a number of cubic inches.
  double get cubicInches => precision.withPrecision(_converter.toCubicInches());

  /// Interprets this as a number of US teaspoons.
  double get usTeaspoons => precision.withPrecision(_converter.toUsTeaspoons());

  /// Interprets this as a number of US tablespoons.
  double get usTablespoons =>
      precision.withPrecision(_converter.toUsTablespoons());

  /// Interprets this as a number of US fluid ounces.
  double get usFluidOunces =>
      precision.withPrecision(_converter.toUsFluidOunces());

  /// Interprets this as a number of US cups.
  double get usCups => precision.withPrecision(_converter.toUsCups());

  /// Interprets this as a number of US pints.
  double get usPints => precision.withPrecision(_converter.toUsPints());

  /// Interprets this as a number of US quarts.
  double get usQuarts => precision.withPrecision(_converter.toUsQuarts());

  /// Interprets this as a number of US gallons.
  double get usGallons => precision.withPrecision(_converter.toUsGallons());

  /// Interprets this as a number of US legal cups.
  double get usLegalCups => precision.withPrecision(_converter.toUsLegalCups());

  /// Interprets the specified [Volume] in kiloliters.
  static double asKiloliters(final Volume volume) => volume.kiloliters;

  /// Interprets the specified [Volume] in hectoliters.
  static double asHectoliters(final Volume volume) => volume.hectoliters;

  /// Interprets the specified [Volume] in dekaliters.
  static double asDekaliters(final Volume volume) => volume.dekaliters;

  /// Interprets the specified [Volume] in liters.
  static double asLiters(final Volume volume) => volume.liters;

  /// Interprets the specified [Volume] in deciliters.
  static double asDeciliters(final Volume volume) => volume.deciliters;

  /// Interprets the specified [Volume] in centiliters.
  static double asCentiliters(final Volume volume) => volume.centiliters;

  /// Interprets the specified [Volume] in milliliters.
  static double asMilliliters(final Volume volume) => volume.milliliters;

  /// Interprets the specified [Volume] in gallons.
  static double asGallons(final Volume volume) => volume.gallons;

  /// Interprets the specified [Volume] in quarts.
  static double asQuarts(final Volume volume) => volume.quarts;

  /// Interprets the specified [Volume] in pints.
  static double asPints(final Volume volume) => volume.pints;

  /// Interprets the specified [Volume] in cups.
  static double asCups(final Volume volume) => volume.cups;

  /// Interprets the specified [Volume] in fluid ounces.
  static double asFluidOunces(final Volume volume) => volume.fluidOunces;

  /// Interprets the specified [Volume] in tablespoon.
  static double asTablespoons(final Volume volume) => volume.tablespoons;

  /// Interprets the specified [Volume] in teaspoon.
  static double asTeaspoons(final Volume volume) => volume.teaspoons;

  /// Interprets the specified [Volume] in US gallons.
  static double asUsGallons(final Volume volume) => volume.usGallons;

  /// Interprets the specified [Volume] in US quarts.
  static double asUsQuarts(final Volume volume) => volume.usQuarts;

  /// Interprets the specified [Volume] in US pints.
  static double asUsPints(final Volume volume) => volume.usPints;

  /// Interprets the specified [Volume] in US cups.
  static double asUsCups(final Volume volume) => volume.usCups;

  /// Interprets the specified [Volume] in US fluid ounces.
  static double asUsFluidOunces(final Volume volume) => volume.usFluidOunces;

  /// Interprets the specified [Volume] in US tablespoons.
  static double asUsTablespoons(final Volume volume) => volume.usTablespoons;

  /// Interprets the specified [Volume] in US teaspoons.
  static double asUsTeaspoons(final Volume volume) => volume.usTeaspoons;

  /// Interprets the specified [Volume] in US legal cups.
  static double asUsLegalCups(final Volume volume) => volume.usLegalCups;

  /// Returns `true` if this represents a negative volume.
  bool get isNegative => _converter.isNegative;

  /// Returns `true` if this represents a finite volume.
  bool get isFinite => _converter.isFinite;

  /// Returns `true` if this represents an infinite volume.
  bool get isInfinite => _converter.isInfinite;

  /// Returns `true` if this volume cannot be expressed as a number.
  bool get isNaN => _converter.isNaN;

  /// Returns `true` if this is larger than the other [Volume].
  bool operator >(final Volume other) => liters > other.liters;

  /// Returns `true` if this is larger than or equal to the other [Volume].
  bool operator >=(final Volume other) => liters >= other.liters;

  /// Returns `true` if this is smaller than the other [Volume].
  bool operator <(final Volume other) => liters < other.liters;

  /// Returns `true` if this is smaller than or equal to the other [Volume].
  bool operator <=(final Volume other) => liters <= other.liters;

  @override
  bool operator ==(final dynamic other) =>
      other is Volume && other.liters == liters && other.precision == precision;

  @override
  int get hashCode => liters.hashCode * precision.hashCode;

  /// Creates a [Volume] that is the opposite of this Volume.
  Volume operator -() => Volume.liters(-liters, precision: precision);

  /// Creates a [Volume] representing the sum of two others.
  ///
  /// ```dart
  /// Volume.liters(2) + Volume.zero() == Volume.liters(2)
  /// Volume.liters(2) + Volume.liters(3) == Volume.liters(5)
  /// Volume.liters(2) + Volume.liters(-3) == Volume.liters(-1)
  /// ```
  Volume operator +(final Volume other) => Volume.liters(
        liters + other.liters,
        precision: Precision.add(precision, other.precision),
      );

  /// Creates a [Volume] representing the difference between two others.
  ///
  /// ```dart
  /// Volume.liters(3) - Volume.zero() == Volume.liters(3)
  /// Volume.liters(5) - Volume.liters(3) == Volume.liters(2)
  /// Volume.liters(3) - Volume.liters(5) == Volume.liters(-2)
  /// Volume.liters(3) - Volume.liters(-5) == Volume.liters(8)
  /// ```
  Volume operator -(final Volume other) => Volume.liters(
        liters - other.liters,
        precision: Precision.add(precision, other.precision),
      );

  /// Creates a [Volume] that is a multiple of this.
  ///
  /// ```dart
  /// Volume.liters(3) * 1 == Volume.liters(3)
  /// Volume.liters(3) * 0 == Volume.zero()
  /// Volume.liters(3) * 2 == Volume.liters(6)
  /// Volume.liters(3) * -2 == Volume.liters(-6)
  /// ```
  Volume operator *(final num multiplier) => Volume.liters(
        liters * multiplier,
        precision: precision,
      );

  /// Creates a [Volume] that is a fraction of this.
  ///
  /// ```dart
  /// Volume.liters(6) / 1 == Volume.liters(6)
  /// Volume.liters(6) / 2 == Volume.liters(3)
  /// Volume.liters(6) / -2 == Volume.liters(-3)
  /// Volume.liters(6) / 0 == Volume.infinity()
  /// ```
  Volume operator /(final num divisor) => Volume.liters(
        liters / divisor,
        precision: precision,
      );

  @override
  int compareTo(final Volume other) => liters.compareTo(other.liters);

  @override
  String toString() => '${liters.toString()} L';

  /// The unit converter being used.
  final VolumeConverter _converter;

  /// The precision used in all conversions.
  final Precision precision;
}