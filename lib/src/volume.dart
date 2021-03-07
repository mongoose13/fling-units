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
  const Volume.zero() : _liters = 0.0;

  /// Infinite volume.
  const Volume.infinity() : _liters = double.infinity;

  /// Infinite volume in the negative.
  const Volume.negativeInfinity() : _liters = double.negativeInfinity;

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
  }) : _liters = milliliters.toDouble() / _milliliterConversion +
            centiliters.toDouble() / _centiliterConversion +
            deciliters.toDouble() / _deciliterConversion +
            liters.toDouble() +
            dekaliters.toDouble() / _dekaliterConversion +
            hectoliters.toDouble() / _hectoliterConversion +
            kiloliters.toDouble() / _kiloliterConversion;

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
  }) : _liters = teaspoons.toDouble() / _teaspoonConversion +
            tablespoons.toDouble() / _tablespoonConversion +
            fluidOunces.toDouble() / _fluidOunceConversion +
            cups.toDouble() / _cupConversion +
            pints.toDouble() / _pintConversion +
            quarts.toDouble() / _quartConversion +
            gallons.toDouble() / _gallonConversion;

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
  }) : _liters = usTeaspoons.toDouble() / _usTeaspoonConversion +
            usTablespoons.toDouble() / _usTablespoonConversion +
            usFluidOunces.toDouble() / _usFluidOunceConversion +
            usCups.toDouble() / _usCupConversion +
            usPints.toDouble() / _usPintConversion +
            usQuarts.toDouble() / _usQuartConversion +
            usGallons.toDouble() / _usGallonConversion;

  /// Construct a Volume from a milliliter amount.
  Volume.milliliters(final num milliliters)
      : _liters = milliliters.toDouble() / _milliliterConversion;

  /// Construct a Volume from a centiliter amount.
  Volume.centiliters(final num centiliters)
      : _liters = centiliters.toDouble() / _centiliterConversion;

  /// Construct a Volume from a deciliter amount.
  Volume.deciliters(final num deciliters)
      : _liters = deciliters.toDouble() / _deciliterConversion;

  /// Construct a Volume from a liter amount.
  Volume.liters(final num liters) : _liters = liters.toDouble();

  /// Construct a Volume from a dekaliter amount.
  Volume.dekaliters(final num dekaliters)
      : _liters = dekaliters.toDouble() / _dekaliterConversion;

  /// Construct a Volume from a hectoliter amount.
  Volume.hectoliters(final num hectoliters)
      : _liters = hectoliters.toDouble() / _hectoliterConversion;

  /// Construct a Volume from a kiloliter amount.
  Volume.kiloliters(final num kiloliters)
      : _liters = kiloliters.toDouble() / _kiloliterConversion;

  /// Construct a Volume from a cubic meter amount.
  Volume.cubicMeters(final num cubicMeters)
      : _liters = cubicMeters.toDouble() / _cubicMeterConversion;

  /// Construct a Volume from an Imperial teaspoon amount.
  Volume.teaspoons(final num teaspoons)
      : _liters = teaspoons.toDouble() / _teaspoonConversion;

  /// Construct a Volume from an Imperial tablespoon amount.
  Volume.tablespoons(final num tablespoons)
      : _liters = tablespoons.toDouble() / _tablespoonConversion;

  /// Construct a Volume from an Imperial fluid ounce amount.
  Volume.fluidOunces(final num fluidOunces)
      : _liters = fluidOunces.toDouble() / _fluidOunceConversion;

  /// Construct a Volume from an Imperial cup amount.
  Volume.cups(final num cups) : _liters = cups.toDouble() / _cupConversion;

  /// Construct a Volume from an Imperial pint amount.
  Volume.pints(final num pints) : _liters = pints.toDouble() / _pintConversion;

  /// Construct a Volume from an Imperial quart amount.
  Volume.quarts(final num quarts)
      : _liters = quarts.toDouble() / _quartConversion;

  /// Construct a Volume from an Imperial gallon amount.
  Volume.gallons(final num gallons)
      : _liters = gallons.toDouble() / _gallonConversion;

  /// Construct a Volume from a cubic feet amount.
  Volume.cubicFeet(final num cubicFeet)
      : _liters = cubicFeet.toDouble() / _cubicFeetConversion;

  /// Construct a Volume from a cubic inch amount.
  Volume.cubicInches(final num cubicInches)
      : _liters = cubicInches.toDouble() / _cubicInchConversion;

  /// Construct a Volume from a US teaspoon amount.
  Volume.usTeaspoons(final num teaspoons)
      : _liters = teaspoons.toDouble() / _usTeaspoonConversion;

  /// Construct a Volume from a US tablespoon amount.
  Volume.usTablespoons(final num tablespoons)
      : _liters = tablespoons.toDouble() / _usTablespoonConversion;

  /// Construct a Volume from a US fluid ounce amount.
  Volume.usFluidOunces(final num fluidOunces)
      : _liters = fluidOunces.toDouble() / _usFluidOunceConversion;

  /// Construct a Volume from a US cup amount.
  Volume.usCups(final num cups) : _liters = cups.toDouble() / _usCupConversion;

  /// Construct a Volume from a US pint amount.
  Volume.usPints(final num pints)
      : _liters = pints.toDouble() / _usPintConversion;

  /// Construct a Volume from a US quart amount.
  Volume.usQuarts(final num quarts)
      : _liters = quarts.toDouble() / _usQuartConversion;

  /// Construct a Volume from a US gallon amount.
  Volume.usGallons(final num gallons)
      : _liters = gallons.toDouble() / _usGallonConversion;

  /// Construct a Volume from a US gallon amount.
  Volume.usLegalCups(final num usLegalCups)
      : _liters = usLegalCups.toDouble() / _usLegalCupConversion;

  /// Interpret this volume as a number of milliliters.
  double get milliliters => _liters * _milliliterConversion;

  /// Interpret this volume as a number of centiliters.
  double get centiliters => _liters * _centiliterConversion;

  /// Interpret this volume as a number of deciliters.
  double get deciliters => _liters * _deciliterConversion;

  /// Interpret this volume as a number of liters.
  double get liters => _liters;

  /// Interpret this volume as a number of dekaliters.
  double get dekaliters => _liters * _dekaliterConversion;

  /// Interpret this volume as a number of hectoliters.
  double get hectoliters => _liters * _hectoliterConversion;

  /// Interpret this volume as a number of kiloliters.
  double get kiloliters => _liters * _kiloliterConversion;

  /// Interpret this volume as a number of cubic meters.
  double get cubicMeters => _liters * _cubicMeterConversion;

  /// Interpret this volume as a number of Imperial teaspoons.
  double get teaspoons => _liters * _teaspoonConversion;

  /// Interpret this volume as a number of Imperial tablespoons.
  double get tablespoons => _liters * _tablespoonConversion;

  /// Interpret this volume as a number of Imperial fluid ounces.
  double get fluidOunces => _liters * _fluidOunceConversion;

  /// Interpret this volume as a number of Imperial cups.
  double get cups => _liters * _cupConversion;

  /// Interpret this volume as a number of Imperial pints.
  double get pints => _liters * _pintConversion;

  /// Interpret this volume as a number of Imperial quarts.
  double get quarts => _liters * _quartConversion;

  /// Interpret this volume as a number of Imperial gallons.
  double get gallons => _liters * _gallonConversion;

  /// Interpret this volume as a number of cubic feet.
  double get cubicFeet => _liters * _cubicFeetConversion;

  /// Interpret this volume as a number of cubic inches.
  double get cubicInches => _liters * _cubicInchConversion;

  /// Interpret this volume as a number of US teaspoons.
  double get usTeaspoons => _liters * _usTeaspoonConversion;

  /// Interpret this volume as a number of US tablespoons.
  double get usTablespoons => _liters * _usTablespoonConversion;

  /// Interpret this volume as a number of US fluid ounces.
  double get usFluidOunces => _liters * _usFluidOunceConversion;

  /// Interpret this volume as a number of US cups.
  double get usCups => _liters * _usCupConversion;

  /// Interpret this volume as a number of US pints.
  double get usPints => _liters * _usPintConversion;

  /// Interpret this volume as a number of US quarts.
  double get usQuarts => _liters * _usQuartConversion;

  /// Interpret this volume as a number of US gallons.
  double get usGallons => _liters * _usGallonConversion;

  /// Interpret this volume as a number of US legal cups.
  double get usLegalCup => _liters * _usLegalCupConversion;

  /// Returns whether this Volume represents a negative amount.
  bool get isNegative => _liters.isNegative;

  /// Returns whether this Volume represents a finite amount.
  bool get isFinite => _liters.isFinite;

  /// Returns whether this Volume represents an infinite amount (positive or
  /// negative).
  bool get isInfinite => _liters.isInfinite;

  /// Whether this volume is not a number.
  bool get isNaN => _liters.isNaN;

  /// Compares this Volume to another Volume, returning true if this Volume is
  /// larger than the other Volume, or false otherwise.
  bool operator >(final Volume other) => _liters > other._liters;

  /// Compares this Volume to another Volume, returning true if this Volume is
  /// larger than or equal to the other Volume, or false otherwise.
  bool operator >=(final Volume other) => _liters >= other._liters;

  /// Compares this Volume to another Volume, returning true if this Volume is
  /// smaller than the other Volume, or false otherwise.
  bool operator <(final Volume other) => _liters < other._liters;

  /// Compares this Volume to another Volume, returning true if this Volume is
  /// smaller than or equal to the other Volume, or false otherwise.
  bool operator <=(final Volume other) => _liters <= other._liters;

  @override
  bool operator ==(final dynamic other) =>
      other is Volume && other._liters == _liters;

  @override
  int get hashCode => _liters.hashCode;

  /// Add two Volumes together to produce a third Volume. The resulting
  /// Volume is equivalent to the sum of the two input Volumes. Negative
  /// Volumes may cancel out.
  ///
  /// Volume.liters(2) + Volume.zero() == Volume.liters(2)
  /// Volume.liters(2) + Volume.liters(3) == Volume.liters(5)
  /// Volume.liters(2) + Volume.liters(-3) == Volume.liters(-1)
  Volume operator +(final Volume other) =>
      Volume.liters(_liters + other._liters);

  /// Subtract two Volumes to produce a third Volume. The resulting
  /// Volume is equivalent to the difference between the two input Volumes.
  /// The resulting Volume's sign will be inverted if a larger Volume is
  /// subtracted from a smaller Volume.
  ///
  /// Volume.liters(3) - Volume.zero() == Volume.liters(3)
  /// Volume.liters(5) - Volume.liters(3) == Volume.liters(2)
  /// Volume.liters(3) - Volume.liters(5) == Volume.liters(-2)
  /// Volume.liters(3) - Volume.liters(-5) == Volume.liters(8)
  Volume operator -(final Volume other) =>
      Volume.liters(_liters - other._liters);

  /// Multiply a Volume by a scalar to produce a new Volume that is a
  /// multiple of the original Volume. As you might expect, multiplying by a
  /// negative value inverts the resulting Volume.
  ///
  /// Volume.liters(3) * 1 == Volume.liters(3)
  /// Volume.liters(3) * 0 == Volume.zero()
  /// Volume.liters(3) * 2 == Volume.liters(6)
  /// Volume.liters(3) * -2 == Volume.liters(-6)
  Volume operator *(final num multiplier) =>
      Volume.liters(_liters * multiplier);

  /// Divide a Volume by a scalar to produce a new Volume that is a fraction
  /// of the original Volume. As you might expect, dividing by a negative
  /// value inverts the resulting Volume.
  ///
  /// Volume.liters(6) / 1 == Volume.liters(6)
  /// Volume.liters(6) / 2 == Volume.liters(3)
  /// Volume.liters(6) / -2 == Volume.liters(-3)
  /// Volume.liters(6) / 0 == Volume.infinity()
  Volume operator /(final num divisor) => Volume.liters(_liters / divisor);

  @override
  int compareTo(final Volume other) => _liters.compareTo(other._liters);

  @override
  String toString() => '${_liters.toString()} L';

  static final double _milliliterConversion = 1e3;
  static final double _centiliterConversion = 1e2;
  static final double _deciliterConversion = 1e1;
  static final double _dekaliterConversion = 1e-1;
  static final double _hectoliterConversion = 1e-2;
  static final double _kiloliterConversion = 1e-3;
  static final double _cubicMeterConversion = 1e-3;

  static final double _teaspoonConversion = 168.936;
  static final double _tablespoonConversion = 56.3121;
  static final double _fluidOunceConversion = 35.1951;
  static final double _cupConversion = 3.51951;
  static final double _pintConversion = 1.75975;
  static final double _quartConversion = 0.879877;
  static final double _gallonConversion = 0.219969;

  static final double _cubicFeetConversion = 0.0353147;
  static final double _cubicInchConversion = 61.0237;

  static final double _usTeaspoonConversion = 202.884;
  static final double _usTablespoonConversion = 67.628;
  static final double _usFluidOunceConversion = 33.814;
  static final double _usCupConversion = 4.22676;
  static final double _usPintConversion = 2.11338;
  static final double _usQuartConversion = 1.05669;
  static final double _usGallonConversion = 0.264172;
  static final double _usLegalCupConversion = 4.16667;

  final double _liters;
}
