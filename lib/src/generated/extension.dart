// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:fling_units/src/core/library.dart';

/// Wrapper class for extensions on [num] types.
///
/// The main purpose is to limit the legal syntax to things that make sense, in
/// particular for extensions that make use of an SI prefix. For example, if we
/// were to have the prefixes return another [num] instead, the following would
/// be possible, but not necessarily desirable:
/// ```dart
/// a = 3.kilo.meters;       // Sensible.
/// b = 3.kilo.kilo.meters;  // Confusing! Prefixes should not be chained.
/// c = 3.kilo.floor();      // Confusing! Other methods on num should not be used.
/// d = 3.kilo;              // Confusing! Can be used anywhere a num is required.
/// ```
///
/// Having the prefix extensions return instances of this class instead of [num]
/// prevents all but the first usage (the one we want) demonstrated above.
class NumExtension {
  const NumExtension(
    this._prefix,
    this._value,
  );

  /// The prefix being applied to the number.
  final MeasurementPrefix _prefix;

  /// The number being extended.
  final num _value;

  /// Creates a(n) turns measurement.
  Angle get turns => AngleUnit.turns.withPrefix(_prefix)(_value);

  /// Creates a(n) radians measurement.
  Angle get radians => AngleUnit.radians.withPrefix(_prefix)(_value);

  /// Creates a(n) gradians measurement.
  Angle get gradians => AngleUnit.gradians.withPrefix(_prefix)(_value);

  /// Creates a(n) degrees measurement.
  Angle get degrees => AngleUnit.degrees.withPrefix(_prefix)(_value);

  /// Creates a(n) arcMinutes measurement.
  Angle get arcMinutes => AngleUnit.arcMinutes.withPrefix(_prefix)(_value);

  /// Creates a(n) arcSeconds measurement.
  Angle get arcSeconds => AngleUnit.arcSeconds.withPrefix(_prefix)(_value);

  /// Creates a(n) seconds measurement.
  Time get seconds => TimeUnit.seconds.withPrefix(_prefix)(_value);

  /// Creates a(n) minutes measurement.
  Time get minutes => TimeUnit.minutes.withPrefix(_prefix)(_value);

  /// Creates a(n) hours measurement.
  Time get hours => TimeUnit.hours.withPrefix(_prefix)(_value);

  /// Creates a(n) days measurement.
  Time get days => TimeUnit.days.withPrefix(_prefix)(_value);

  /// Creates a(n) units measurement.
  Quantity get units => QuantityUnit.units.withPrefix(_prefix)(_value);

  /// Creates a(n) moles measurement.
  Quantity get moles => QuantityUnit.moles.withPrefix(_prefix)(_value);

  /// Creates a(n) grams measurement.
  Mass get grams => MassUnit.grams.withPrefix(_prefix)(_value);

  /// Creates a(n) tonnes measurement.
  Mass get tonnes => MassUnit.tonnes.withPrefix(_prefix)(_value);

  /// Creates a(n) atomicMassUnits measurement.
  Mass get atomicMassUnits =>
      MassUnit.atomicMassUnits.withPrefix(_prefix)(_value);

  /// Creates a(n) daltons measurement.
  Mass get daltons => MassUnit.daltons.withPrefix(_prefix)(_value);

  /// Creates a(n) electronRestMass measurement.
  Mass get electronRestMass =>
      MassUnit.electronRestMass.withPrefix(_prefix)(_value);

  /// Creates a(n) longTons measurement.
  Mass get longTons => MassUnit.longTons.withPrefix(_prefix)(_value);

  /// Creates a(n) shortTons measurement.
  Mass get shortTons => MassUnit.shortTons.withPrefix(_prefix)(_value);

  /// Creates a(n) pounds measurement.
  Mass get pounds => MassUnit.pounds.withPrefix(_prefix)(_value);

  /// Creates a(n) ounces measurement.
  Mass get ounces => MassUnit.ounces.withPrefix(_prefix)(_value);

  /// Creates a(n) meters measurement.
  Distance get meters => DistanceUnit.meters.withPrefix(_prefix)(_value);

  /// Creates a(n) miles measurement.
  Distance get miles => DistanceUnit.miles.withPrefix(_prefix)(_value);

  /// Creates a(n) yards measurement.
  Distance get yards => DistanceUnit.yards.withPrefix(_prefix)(_value);

  /// Creates a(n) feet measurement.
  Distance get feet => DistanceUnit.feet.withPrefix(_prefix)(_value);

  /// Creates a(n) inches measurement.
  Distance get inches => DistanceUnit.inches.withPrefix(_prefix)(_value);

  /// Creates a(n) nauticalMiles measurement.
  Distance get nauticalMiles =>
      DistanceUnit.nauticalMiles.withPrefix(_prefix)(_value);

  /// Creates a(n) amperes measurement.
  Charge get amperes => ChargeUnit.amperes.withPrefix(_prefix)(_value);

  /// Creates a(n) kelvin measurement.
  TemperatureChange get kelvin =>
      TemperatureChangeUnit.kelvin.withPrefix(_prefix)(_value);

  /// Creates a(n) celcius measurement.
  TemperatureChange get celcius =>
      TemperatureChangeUnit.celcius.withPrefix(_prefix)(_value);

  /// Creates a(n) fahrenheit measurement.
  TemperatureChange get fahrenheit =>
      TemperatureChangeUnit.fahrenheit.withPrefix(_prefix)(_value);

  /// Creates a(n) pascals measurement.
  Pressure get pascals => PressureUnit.pascals.withPrefix(_prefix)(_value);

  /// Creates a(n) bars measurement.
  Pressure get bars => PressureUnit.bars.withPrefix(_prefix)(_value);

  /// Creates a(n) baryes measurement.
  Pressure get baryes => PressureUnit.baryes.withPrefix(_prefix)(_value);

  /// Creates a(n) standardAtmospheres measurement.
  Pressure get standardAtmospheres =>
      PressureUnit.standardAtmospheres.withPrefix(_prefix)(_value);

  /// Creates a(n) technicalAtmospheres measurement.
  Pressure get technicalAtmospheres =>
      PressureUnit.technicalAtmospheres.withPrefix(_prefix)(_value);

  /// Creates a(n) mmHg measurement.
  Pressure get mmHg => PressureUnit.mmHg.withPrefix(_prefix)(_value);

  /// Creates a(n) inHg measurement.
  Pressure get inHg => PressureUnit.inHg.withPrefix(_prefix)(_value);

  /// Creates a(n) torr measurement.
  Pressure get torr => PressureUnit.torr.withPrefix(_prefix)(_value);

  /// Creates a(n) psi measurement.
  Pressure get psi => PressureUnit.psi.withPrefix(_prefix)(_value);

  /// Creates a(n) hertz measurement.
  Frequency get hertz => FrequencyUnit.hertz.withPrefix(_prefix)(_value);

  /// Creates a(n) liters measurement.
  Volume get liters => VolumeUnit.liters.withPrefix(_prefix)(_value);

  /// Creates a(n) teaspoons measurement.
  Volume get teaspoons => VolumeUnit.teaspoons.withPrefix(_prefix)(_value);

  /// Creates a(n) tablespoons measurement.
  Volume get tablespoons => VolumeUnit.tablespoons.withPrefix(_prefix)(_value);

  /// Creates a(n) fluidOunces measurement.
  Volume get fluidOunces => VolumeUnit.fluidOunces.withPrefix(_prefix)(_value);

  /// Creates a(n) cups measurement.
  Volume get cups => VolumeUnit.cups.withPrefix(_prefix)(_value);

  /// Creates a(n) pints measurement.
  Volume get pints => VolumeUnit.pints.withPrefix(_prefix)(_value);

  /// Creates a(n) quarts measurement.
  Volume get quarts => VolumeUnit.quarts.withPrefix(_prefix)(_value);

  /// Creates a(n) gallons measurement.
  Volume get gallons => VolumeUnit.gallons.withPrefix(_prefix)(_value);

  /// Creates a(n) usTeaspoons measurement.
  Volume get usTeaspoons => VolumeUnit.usTeaspoons.withPrefix(_prefix)(_value);

  /// Creates a(n) usTablespoons measurement.
  Volume get usTablespoons =>
      VolumeUnit.usTablespoons.withPrefix(_prefix)(_value);

  /// Creates a(n) usFluidOunces measurement.
  Volume get usFluidOunces =>
      VolumeUnit.usFluidOunces.withPrefix(_prefix)(_value);

  /// Creates a(n) usCups measurement.
  Volume get usCups => VolumeUnit.usCups.withPrefix(_prefix)(_value);

  /// Creates a(n) usPints measurement.
  Volume get usPints => VolumeUnit.usPints.withPrefix(_prefix)(_value);

  /// Creates a(n) usQuarts measurement.
  Volume get usQuarts => VolumeUnit.usQuarts.withPrefix(_prefix)(_value);

  /// Creates a(n) usGallons measurement.
  Volume get usGallons => VolumeUnit.usGallons.withPrefix(_prefix)(_value);

  /// Creates a(n) usLegalCups measurement.
  Volume get usLegalCups => VolumeUnit.usLegalCups.withPrefix(_prefix)(_value);

  /// Creates a(n) candela measurement.
  Luminosity get candela => LuminosityUnit.candela.withPrefix(_prefix)(_value);

  /// Creates a(n) candlepower measurement.
  Luminosity get candlepower =>
      LuminosityUnit.candlepower.withPrefix(_prefix)(_value);

  /// Creates a(n) hefnerkerze measurement.
  Luminosity get hefnerkerze =>
      LuminosityUnit.hefnerkerze.withPrefix(_prefix)(_value);
}
