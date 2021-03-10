import 'converter.dart';

class VolumeConverter extends Converter {
  static const VolumeConverter zero = VolumeConverter._zero();
  static const VolumeConverter infinity = VolumeConverter._infinity();
  static const VolumeConverter negativeInfinity =
      VolumeConverter._negativeInfinity();

  VolumeConverter.metric({
    final num kiloliters = 0,
    final num hectoliters = 0,
    final num dekaliters = 0,
    final num liters = 0,
    final num deciliters = 0,
    final num centiliters = 0,
    final num milliliters = 0,
  }) : super.metric(
          kilo: kiloliters,
          hecto: hectoliters,
          deka: dekaliters,
          base: liters,
          deci: deciliters,
          centi: centiliters,
          milli: milliliters,
        );

  VolumeConverter.metricCubic({
    final num cubicKilometers = 0,
    final num cubicHectometers = 0,
    final num cubicDekameters = 0,
    final num cubicMeters = 0,
    final num cubicDecimeters = 0,
    final num cubicCentimeters = 0,
    final num cubicMillimeters = 0,
  }) : super.fromSI(
          fromCubicKilometers(cubicKilometers.toDouble()) +
              fromCubicHectometers(cubicHectometers.toDouble()) +
              fromCubicDekameters(cubicDekameters.toDouble()) +
              fromCubicMeters(cubicMeters.toDouble()) +
              fromCubicDecimeters(cubicDecimeters.toDouble()) +
              fromCubicCentimeters(cubicCentimeters.toDouble()) +
              fromCubicMillimeters(cubicMillimeters.toDouble()),
        );

  VolumeConverter.imperial({
    final num gallons = 0,
    final num quarts = 0,
    final num pints = 0,
    final num cups = 0,
    final num fluidOunces = 0,
    final num tablespoons = 0,
    final num teaspoons = 0,
  }) : super.fromSI(fromGallons(gallons.toDouble()) +
            fromQuarts(quarts.toDouble()) +
            fromPints(pints.toDouble()) +
            fromCups(cups.toDouble()) +
            fromFluidOunces(fluidOunces.toDouble()) +
            fromTablespoons(tablespoons.toDouble()) +
            fromTeaspoons(teaspoons.toDouble()));

  VolumeConverter.imperialCubic({
    final num cubicFeet = 0,
    final num cubicInches = 0,
  }) : super.fromSI(
          fromCubicFeet(cubicFeet.toDouble()) +
              fromCubicInches(cubicInches.toDouble()),
        );

  VolumeConverter.us({
    final num usGallons = 0,
    final num usQuarts = 0,
    final num usPints = 0,
    final num usCups = 0,
    final num usFluidOunces = 0,
    final num usTablespoons = 0,
    final num usTeaspoons = 0,
  }) : super.fromSI(fromUsGallons(usGallons.toDouble()) +
            fromUsQuarts(usQuarts.toDouble()) +
            fromUsPints(usPints.toDouble()) +
            fromUsCups(usCups.toDouble()) +
            fromUsFluidOunces(usFluidOunces.toDouble()) +
            fromUsTablespoons(usTablespoons.toDouble()) +
            fromUsTeaspoons(usTeaspoons.toDouble()));

  VolumeConverter.usLegalCups(final num usLegalCups)
      : super.fromSI(fromUsLegalCups(usLegalCups.toDouble()));

  double toMilliliters() => asMilliliters(base);

  double toCentiliters() => asCentiliters(base);

  double toDeciliters() => asDeciliters(base);

  double toLiters() => base;

  double toDekaliters() => asDekaliters(base);

  double toHectoliters() => asHectoliters(base);

  double toKiloliters() => asKiloliters(base);

  double toCubicMillimeters() => asCubicMillimeters(base);

  double toCubicCentimeters() => asCubicCentimeters(base);

  double toCubicDecimeters() => asCubicDecimeters(base);

  double toCubicMeters() => asCubicMeters(base);

  double toCubicDekameters() => asCubicDekameters(base);

  double toCubicHectometers() => asCubicHectometers(base);

  double toCubicKilometers() => asCubicKilometers(base);

  double toTeaspoons() => asTeaspoons(base);

  double toTablespoons() => asTablespoons(base);

  double toFluidOunces() => asFluidOunces(base);

  double toCups() => asCups(base);

  double toPints() => asPints(base);

  double toQuarts() => asQuarts(base);

  double toGallons() => asGallons(base);

  double toUsTeaspoons() => asUsTeaspoons(base);

  double toUsTablespoons() => asUsTablespoons(base);

  double toUsFluidOunces() => asUsFluidOunces(base);

  double toUsCups() => asUsCups(base);

  double toUsPints() => asUsPints(base);

  double toUsQuarts() => asUsQuarts(base);

  double toUsGallons() => asUsGallons(base);

  double toUsLegalCups() => asUsLegalCups(base);

  double toCubicInches() => asCubicInches(base);

  double toCubicFeet() => asCubicFeet(base);

  static double asMilliliters(final double liters) => Converter.asMilli(liters);

  static double asCentiliters(final double liters) => Converter.asCenti(liters);

  static double asDeciliters(final double liters) => Converter.asDeci(liters);

  static double asLiters(final double liters) => liters;

  static double asDekaliters(final double liters) => Converter.asDeka(liters);

  static double asHectoliters(final double liters) => Converter.asHecto(liters);

  static double asKiloliters(final double liters) => Converter.asKilo(liters);

  static double asTeaspoons(final double liters) =>
      liters * _teaspoonConversion;

  static double asTablespoons(final double liters) =>
      liters * _tablespoonConversion;

  static double asFluidOunces(final double liters) =>
      liters * _fluidOunceConversion;

  static double asCups(final double liters) => liters * _cupConversion;

  static double asPints(final double liters) => liters * _pintConversion;

  static double asQuarts(final double liters) => liters * _quartConversion;

  static double asGallons(final double liters) => liters * _gallonConversion;

  static double asUsTeaspoons(final double liters) =>
      liters * _usTeaspoonConversion;

  static double asUsTablespoons(final double liters) =>
      liters * _usTablespoonConversion;

  static double asUsFluidOunces(final double liters) =>
      liters * _usFluidOunceConversion;

  static double asUsCups(final double liters) => liters * _usCupConversion;

  static double asUsPints(final double liters) => liters * _usPintConversion;

  static double asUsQuarts(final double liters) => liters * _usQuartConversion;

  static double asUsGallons(final double liters) =>
      liters * _usGallonConversion;

  static double asUsLegalCups(final double liters) =>
      liters * _usLegalCupConversion;

  static double asCubicMillimeters(final double cubicMillimeters) =>
      cubicMillimeters * _cubicMillimeterConversion;

  static double asCubicCentimeters(final double cubicCentimeters) =>
      cubicCentimeters * _cubicCentimeterConversion;

  static double asCubicDecimeters(final double cubicDecimeters) =>
      cubicDecimeters * _cubicDecimeterConversion;

  static double asCubicMeters(final double cubicMeters) =>
      cubicMeters * _cubicMeterConversion;

  static double asCubicDekameters(final double cubicDekameters) =>
      cubicDekameters * _cubicDekameterConversion;

  static double asCubicHectometers(final double cubicHectometers) =>
      cubicHectometers * _cubicHectometerConversion;

  static double asCubicKilometers(final double cubicKilometers) =>
      cubicKilometers * _cubicKilometerConversion;

  static double asCubicInches(final double cubicInches) =>
      cubicInches * _cubicInchConversion;

  static double asCubicFeet(final double cubicFeet) =>
      cubicFeet * _cubicFootConversion;

  static double fromCubicMillimeters(final double cubicMillimeters) =>
      cubicMillimeters / _cubicMillimeterConversion;

  static double fromCubicCentimeters(final double cubicCentimeters) =>
      cubicCentimeters / _cubicCentimeterConversion;

  static double fromCubicDecimeters(final double cubicDecimeters) =>
      cubicDecimeters / _cubicDecimeterConversion;

  static double fromCubicMeters(final double cubicMeters) =>
      cubicMeters / _cubicMeterConversion;

  static double fromCubicDekameters(final double cubicDekameters) =>
      cubicDekameters / _cubicDekameterConversion;

  static double fromCubicHectometers(final double cubicHectometers) =>
      cubicHectometers / _cubicHectometerConversion;

  static double fromCubicKilometers(final double cubicKilometers) =>
      cubicKilometers / _cubicKilometerConversion;

  static double fromCubicInches(final double cubicInches) =>
      cubicInches / _cubicInchConversion;

  static double fromCubicFeet(final double cubicFeet) =>
      cubicFeet / _cubicFootConversion;

  static double fromMilliliters(final double milliliters) =>
      Converter.fromMilli(milliliters);

  static double fromCentiliters(final double centiliters) =>
      Converter.fromCenti(centiliters);

  static double fromDeciliters(final double deciliters) =>
      Converter.fromDeci(deciliters);

  static double fromLiters(final double liters) => liters;

  static double fromDekaliters(final double dekaliters) =>
      Converter.fromDeka(dekaliters);

  static double fromHectoliters(final double hectoliters) =>
      Converter.fromHecto(hectoliters);

  static double fromKiloliters(final double kiloliters) =>
      Converter.fromKilo(kiloliters);

  static double fromTeaspoons(final double teaspoons) =>
      teaspoons / _teaspoonConversion;

  static double fromTablespoons(final double tablespoons) =>
      tablespoons / _tablespoonConversion;

  static double fromFluidOunces(final double fluidOunces) =>
      fluidOunces / _fluidOunceConversion;

  static double fromCups(final double cups) => cups / _cupConversion;

  static double fromPints(final double pints) => pints / _pintConversion;

  static double fromQuarts(final double quarts) => quarts / _quartConversion;

  static double fromGallons(final double gallons) =>
      gallons / _gallonConversion;

  static double fromUsTeaspoons(final double usTeaspoons) =>
      usTeaspoons / _usTeaspoonConversion;

  static double fromUsTablespoons(final double usTablespoons) =>
      usTablespoons / _usTablespoonConversion;

  static double fromUsFluidOunces(final double usFluidOunces) =>
      usFluidOunces / _usFluidOunceConversion;

  static double fromUsCups(final double usCups) => usCups / _usCupConversion;

  static double fromUsPints(final double usPints) =>
      usPints / _usPintConversion;

  static double fromUsQuarts(final double usQuarts) =>
      usQuarts / _usQuartConversion;

  static double fromUsGallons(final double usGallons) =>
      usGallons / _usGallonConversion;

  static double fromUsLegalCups(final double usLegalCups) =>
      usLegalCups / _usLegalCupConversion;

  static final double _teaspoonConversion = 168.936;
  static final double _tablespoonConversion = 56.3121;
  static final double _fluidOunceConversion = 35.1951;
  static final double _cupConversion = 3.51951;
  static final double _pintConversion = 1.75975;
  static final double _quartConversion = 0.879877;
  static final double _gallonConversion = 0.219969;

  static final double _usTeaspoonConversion = 202.884;
  static final double _usTablespoonConversion = 67.628;
  static final double _usFluidOunceConversion = 33.814;
  static final double _usCupConversion = 4.22676;
  static final double _usPintConversion = 2.11338;
  static final double _usQuartConversion = 1.05669;
  static final double _usGallonConversion = 0.264172;
  static final double _usLegalCupConversion = 4.16667;

  static final double _cubicInchConversion = 61.0237;
  static final double _cubicFootConversion = 0.0353147;

  static final double _cubicMillimeterConversion = 1e6;
  static final double _cubicCentimeterConversion = 1e3;
  static final double _cubicDecimeterConversion = 1e0;
  static final double _cubicMeterConversion = 1e-3;
  static final double _cubicDekameterConversion = 1e-6;
  static final double _cubicHectometerConversion = 1e-9;
  static final double _cubicKilometerConversion = 1e-12;

  const VolumeConverter._zero() : super.zero();

  const VolumeConverter._infinity() : super.infinity();

  const VolumeConverter._negativeInfinity() : super.negativeInfinity();
}
