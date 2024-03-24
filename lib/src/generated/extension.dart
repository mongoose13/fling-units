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
  Angle get turns => AngleInterpreter.turns.withPrefix(_prefix)(_value);

  /// Creates a(n) radians measurement.
  Angle get radians => AngleInterpreter.radians.withPrefix(_prefix)(_value);

  /// Creates a(n) gradians measurement.
  Angle get gradians => AngleInterpreter.gradians.withPrefix(_prefix)(_value);

  /// Creates a(n) degrees measurement.
  Angle get degrees => AngleInterpreter.degrees.withPrefix(_prefix)(_value);

  /// Creates a(n) arcMinutes measurement.
  Angle get arcMinutes =>
      AngleInterpreter.arcMinutes.withPrefix(_prefix)(_value);

  /// Creates a(n) arcSeconds measurement.
  Angle get arcSeconds =>
      AngleInterpreter.arcSeconds.withPrefix(_prefix)(_value);

  /// Creates a(n) seconds measurement.
  Time get seconds => TimeInterpreter.seconds.withPrefix(_prefix)(_value);

  /// Creates a(n) minutes measurement.
  Time get minutes => TimeInterpreter.minutes.withPrefix(_prefix)(_value);

  /// Creates a(n) hours measurement.
  Time get hours => TimeInterpreter.hours.withPrefix(_prefix)(_value);

  /// Creates a(n) days measurement.
  Time get days => TimeInterpreter.days.withPrefix(_prefix)(_value);

  /// Creates a(n) grams measurement.
  Mass get grams => MassInterpreter.grams.withPrefix(_prefix)(_value);

  /// Creates a(n) tonnes measurement.
  Mass get tonnes => MassInterpreter.tonnes.withPrefix(_prefix)(_value);

  /// Creates a(n) atomicMassUnits measurement.
  Mass get atomicMassUnits =>
      MassInterpreter.atomicMassUnits.withPrefix(_prefix)(_value);

  /// Creates a(n) daltons measurement.
  Mass get daltons => MassInterpreter.daltons.withPrefix(_prefix)(_value);

  /// Creates a(n) electronRestMass measurement.
  Mass get electronRestMass =>
      MassInterpreter.electronRestMass.withPrefix(_prefix)(_value);

  /// Creates a(n) longTons measurement.
  Mass get longTons => MassInterpreter.longTons.withPrefix(_prefix)(_value);

  /// Creates a(n) shortTons measurement.
  Mass get shortTons => MassInterpreter.shortTons.withPrefix(_prefix)(_value);

  /// Creates a(n) pounds measurement.
  Mass get pounds => MassInterpreter.pounds.withPrefix(_prefix)(_value);

  /// Creates a(n) ounces measurement.
  Mass get ounces => MassInterpreter.ounces.withPrefix(_prefix)(_value);

  /// Creates a(n) meters measurement.
  Distance get meters => DistanceInterpreter.meters.withPrefix(_prefix)(_value);

  /// Creates a(n) miles measurement.
  Distance get miles => DistanceInterpreter.miles.withPrefix(_prefix)(_value);

  /// Creates a(n) yards measurement.
  Distance get yards => DistanceInterpreter.yards.withPrefix(_prefix)(_value);

  /// Creates a(n) feet measurement.
  Distance get feet => DistanceInterpreter.feet.withPrefix(_prefix)(_value);

  /// Creates a(n) inches measurement.
  Distance get inches => DistanceInterpreter.inches.withPrefix(_prefix)(_value);

  /// Creates a(n) nauticalMiles measurement.
  Distance get nauticalMiles =>
      DistanceInterpreter.nauticalMiles.withPrefix(_prefix)(_value);

  /// Creates a(n) amperes measurement.
  Charge get amperes => ChargeInterpreter.amperes.withPrefix(_prefix)(_value);

  /// Creates a(n) kelvin measurement.
  TemperatureChange get kelvin =>
      TemperatureChangeInterpreter.kelvin.withPrefix(_prefix)(_value);

  /// Creates a(n) celcius measurement.
  TemperatureChange get celcius =>
      TemperatureChangeInterpreter.celcius.withPrefix(_prefix)(_value);

  /// Creates a(n) fahrenheit measurement.
  TemperatureChange get fahrenheit =>
      TemperatureChangeInterpreter.fahrenheit.withPrefix(_prefix)(_value);

  /// Creates a(n) pascals measurement.
  Pressure get pascals =>
      PressureInterpreter.pascals.withPrefix(_prefix)(_value);

  /// Creates a(n) bars measurement.
  Pressure get bars => PressureInterpreter.bars.withPrefix(_prefix)(_value);

  /// Creates a(n) baryes measurement.
  Pressure get baryes => PressureInterpreter.baryes.withPrefix(_prefix)(_value);

  /// Creates a(n) standardAtmospheres measurement.
  Pressure get standardAtmospheres =>
      PressureInterpreter.standardAtmospheres.withPrefix(_prefix)(_value);

  /// Creates a(n) technicalAtmospheres measurement.
  Pressure get technicalAtmospheres =>
      PressureInterpreter.technicalAtmospheres.withPrefix(_prefix)(_value);

  /// Creates a(n) mmHg measurement.
  Pressure get mmHg => PressureInterpreter.mmHg.withPrefix(_prefix)(_value);

  /// Creates a(n) inHg measurement.
  Pressure get inHg => PressureInterpreter.inHg.withPrefix(_prefix)(_value);

  /// Creates a(n) torr measurement.
  Pressure get torr => PressureInterpreter.torr.withPrefix(_prefix)(_value);

  /// Creates a(n) psi measurement.
  Pressure get psi => PressureInterpreter.psi.withPrefix(_prefix)(_value);

  /// Creates a(n) hertz measurement.
  Frequency get hertz => FrequencyInterpreter.hertz.withPrefix(_prefix)(_value);

  /// Creates a(n) liters measurement.
  Volume get liters => VolumeInterpreter.liters.withPrefix(_prefix)(_value);

  /// Creates a(n) teaspoons measurement.
  Volume get teaspoons =>
      VolumeInterpreter.teaspoons.withPrefix(_prefix)(_value);

  /// Creates a(n) tablespoons measurement.
  Volume get tablespoons =>
      VolumeInterpreter.tablespoons.withPrefix(_prefix)(_value);

  /// Creates a(n) fluidOunces measurement.
  Volume get fluidOunces =>
      VolumeInterpreter.fluidOunces.withPrefix(_prefix)(_value);

  /// Creates a(n) cups measurement.
  Volume get cups => VolumeInterpreter.cups.withPrefix(_prefix)(_value);

  /// Creates a(n) pints measurement.
  Volume get pints => VolumeInterpreter.pints.withPrefix(_prefix)(_value);

  /// Creates a(n) quarts measurement.
  Volume get quarts => VolumeInterpreter.quarts.withPrefix(_prefix)(_value);

  /// Creates a(n) gallons measurement.
  Volume get gallons => VolumeInterpreter.gallons.withPrefix(_prefix)(_value);

  /// Creates a(n) usTeaspoons measurement.
  Volume get usTeaspoons =>
      VolumeInterpreter.usTeaspoons.withPrefix(_prefix)(_value);

  /// Creates a(n) usTablespoons measurement.
  Volume get usTablespoons =>
      VolumeInterpreter.usTablespoons.withPrefix(_prefix)(_value);

  /// Creates a(n) usFluidOunces measurement.
  Volume get usFluidOunces =>
      VolumeInterpreter.usFluidOunces.withPrefix(_prefix)(_value);

  /// Creates a(n) usCups measurement.
  Volume get usCups => VolumeInterpreter.usCups.withPrefix(_prefix)(_value);

  /// Creates a(n) usPints measurement.
  Volume get usPints => VolumeInterpreter.usPints.withPrefix(_prefix)(_value);

  /// Creates a(n) usQuarts measurement.
  Volume get usQuarts => VolumeInterpreter.usQuarts.withPrefix(_prefix)(_value);

  /// Creates a(n) usGallons measurement.
  Volume get usGallons =>
      VolumeInterpreter.usGallons.withPrefix(_prefix)(_value);

  /// Creates a(n) usLegalCups measurement.
  Volume get usLegalCups =>
      VolumeInterpreter.usLegalCups.withPrefix(_prefix)(_value);

  /// Creates a(n) candela measurement.
  Luminosity get candela =>
      LuminosityInterpreter.candela.withPrefix(_prefix)(_value);

  /// Creates a(n) candlepower measurement.
  Luminosity get candlepower =>
      LuminosityInterpreter.candlepower.withPrefix(_prefix)(_value);

  /// Creates a(n) hefnerkerze measurement.
  Luminosity get hefnerkerze =>
      LuminosityInterpreter.hefnerkerze.withPrefix(_prefix)(_value);
}
