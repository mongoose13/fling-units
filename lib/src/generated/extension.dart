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

  /// Creates a(n) hertz measurement.
  Frequency get hertz => FrequencyInterpreter.hertz.withPrefix(_prefix)(_value);

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
