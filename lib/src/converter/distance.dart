import 'converter.dart';

class DistanceConverter extends Converter {
  static const DistanceConverter zero = DistanceConverter._zero();
  static const DistanceConverter infinity = DistanceConverter._infinity();
  static const DistanceConverter negativeInfinity =
      DistanceConverter._negativeInfinity();

  DistanceConverter.meters(final num meters) : super.fromSI(meters);

  DistanceConverter.metric({
    final num kilometers = 0,
    final num hectometers = 0,
    final num dekameters = 0,
    final num meters = 0,
    final num decimeters = 0,
    final num centimeters = 0,
    final num millimeters = 0,
  }) : super.metric(
          kilo: kilometers,
          hecto: hectometers,
          deka: dekameters,
          base: meters,
          deci: decimeters,
          centi: centimeters,
          milli: millimeters,
        );

  DistanceConverter.imperial({
    final num miles = 0,
    final num yards = 0,
    final num feet = 0,
    final num inches = 0,
  }) : super.fromSI(fromMiles(miles.toDouble()) +
            fromYards(yards.toDouble()) +
            fromFeet(feet.toDouble()) +
            fromInches(inches.toDouble()));

  DistanceConverter.nauticalMiles(final num nauticalMiles)
      : super.fromSI(nauticalMiles / _nauticalMilesConversion);

  double toMiles() => asMiles(base);

  double toYards() => asYards(base);

  double toFeet() => asFeet(base);

  double toInches() => asInches(base);

  double toNauticalMiles() => asNauticalMiles(base);

  static double asMillimeters(final double meters) => Converter.asMilli(meters);

  static double asCentimeters(final double meters) => Converter.asCenti(meters);

  static double asDecimeters(final double meters) => Converter.asDeci(meters);

  static double asMeters(final double meters) => meters;

  static double asDekameters(final double meters) => Converter.asDeka(meters);

  static double asHectometers(final double meters) => Converter.asHecto(meters);

  static double asKilometers(final double meters) => Converter.asKilo(meters);

  static double asInches(final double inches) => inches * _inchesConversion;

  static double asFeet(final double feet) => feet * _feetConversion;

  static double asYards(final double yards) => yards * _yardsConversion;

  static double asMiles(final double miles) => miles * _milesConversion;

  static double asNauticalMiles(final double nauticalMiles) =>
      nauticalMiles * _nauticalMilesConversion;

  static double fromMillimeters(final double millimeters) =>
      Converter.fromMilli(millimeters);

  static double fromCentimeters(final double centimeters) =>
      Converter.fromCenti(centimeters);

  static double fromDecimeters(final double decimeters) =>
      Converter.fromDeci(decimeters);

  static double fromMeters(final double meters) => meters;

  static double fromDekameters(final double dekameters) =>
      Converter.fromDeka(dekameters);

  static double fromHectometers(final double hectometers) =>
      Converter.fromHecto(hectometers);

  static double fromKilometers(final double kilometers) =>
      Converter.fromKilo(kilometers);

  static double fromInches(final double inches) => inches / _inchesConversion;

  static double fromFeet(final double feet) => feet / _feetConversion;

  static double fromYards(final double yards) => yards / _yardsConversion;

  static double fromMiles(final double miles) => miles / _milesConversion;

  static double fromNauticalMiles(final double nauticalMiles) =>
      nauticalMiles / _nauticalMilesConversion;

  static final double _milesConversion = 0.0006213712;
  static final double _yardsConversion = 1.093613;
  static final double _feetConversion = 3.280840;
  static final double _inchesConversion = 39.37008;
  static final double _nauticalMilesConversion = 0.000539956803456;

  const DistanceConverter._zero() : super.zero();

  const DistanceConverter._infinity() : super.infinity();

  const DistanceConverter._negativeInfinity() : super.negativeInfinity();
}
