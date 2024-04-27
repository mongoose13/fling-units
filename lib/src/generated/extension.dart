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
  Measurement<f.Angle> get turns =>
      f.AngleUnit.turns.withPrefix(_prefix)(_value);

  /// Creates a(n) radians measurement.
  Measurement<f.Angle> get radians =>
      f.AngleUnit.radians.withPrefix(_prefix)(_value);

  /// Creates a(n) gradians measurement.
  Measurement<f.Angle> get gradians =>
      f.AngleUnit.gradians.withPrefix(_prefix)(_value);

  /// Creates a(n) degrees measurement.
  Measurement<f.Angle> get degrees =>
      f.AngleUnit.degrees.withPrefix(_prefix)(_value);

  /// Creates a(n) arcMinutes measurement.
  Measurement<f.Angle> get arcMinutes =>
      f.AngleUnit.arcMinutes.withPrefix(_prefix)(_value);

  /// Creates a(n) arcSeconds measurement.
  Measurement<f.Angle> get arcSeconds =>
      f.AngleUnit.arcSeconds.withPrefix(_prefix)(_value);

  /// Creates a(n) amperes measurement.
  Measurement<f.Charge> get amperes =>
      f.ChargeUnit.amperes.withPrefix(_prefix)(_value);

  /// Creates a(n) meters measurement.
  Measurement<f.Distance> get meters =>
      f.DistanceUnit.meters.withPrefix(_prefix)(_value);

  /// Creates a(n) miles measurement.
  Measurement<f.Distance> get miles =>
      f.DistanceUnit.miles.withPrefix(_prefix)(_value);

  /// Creates a(n) yards measurement.
  Measurement<f.Distance> get yards =>
      f.DistanceUnit.yards.withPrefix(_prefix)(_value);

  /// Creates a(n) feet measurement.
  Measurement<f.Distance> get feet =>
      f.DistanceUnit.feet.withPrefix(_prefix)(_value);

  /// Creates a(n) inches measurement.
  Measurement<f.Distance> get inches =>
      f.DistanceUnit.inches.withPrefix(_prefix)(_value);

  /// Creates a(n) nauticalMiles measurement.
  Measurement<f.Distance> get nauticalMiles =>
      f.DistanceUnit.nauticalMiles.withPrefix(_prefix)(_value);

  /// Creates a(n) hertz measurement.
  Measurement<f.Frequency> get hertz =>
      f.FrequencyUnit.hertz.withPrefix(_prefix)(_value);

  /// Creates a(n) candela measurement.
  Measurement<f.Luminosity> get candela =>
      f.LuminosityUnit.candela.withPrefix(_prefix)(_value);

  /// Creates a(n) candlepower measurement.
  Measurement<f.Luminosity> get candlepower =>
      f.LuminosityUnit.candlepower.withPrefix(_prefix)(_value);

  /// Creates a(n) hefnerkerze measurement.
  Measurement<f.Luminosity> get hefnerkerze =>
      f.LuminosityUnit.hefnerkerze.withPrefix(_prefix)(_value);

  /// Creates a(n) grams measurement.
  Measurement<f.Mass> get grams => f.MassUnit.grams.withPrefix(_prefix)(_value);

  /// Creates a(n) tonnes measurement.
  Measurement<f.Mass> get tonnes =>
      f.MassUnit.tonnes.withPrefix(_prefix)(_value);

  /// Creates a(n) atomicMassUnits measurement.
  Measurement<f.Mass> get atomicMassUnits =>
      f.MassUnit.atomicMassUnits.withPrefix(_prefix)(_value);

  /// Creates a(n) daltons measurement.
  Measurement<f.Mass> get daltons =>
      f.MassUnit.daltons.withPrefix(_prefix)(_value);

  /// Creates a(n) electronRestMass measurement.
  Measurement<f.Mass> get electronRestMass =>
      f.MassUnit.electronRestMass.withPrefix(_prefix)(_value);

  /// Creates a(n) longTons measurement.
  Measurement<f.Mass> get longTons =>
      f.MassUnit.longTons.withPrefix(_prefix)(_value);

  /// Creates a(n) shortTons measurement.
  Measurement<f.Mass> get shortTons =>
      f.MassUnit.shortTons.withPrefix(_prefix)(_value);

  /// Creates a(n) pounds measurement.
  Measurement<f.Mass> get pounds =>
      f.MassUnit.pounds.withPrefix(_prefix)(_value);

  /// Creates a(n) ounces measurement.
  Measurement<f.Mass> get ounces =>
      f.MassUnit.ounces.withPrefix(_prefix)(_value);

  /// Creates a(n) pascals measurement.
  Measurement<f.Pressure> get pascals =>
      f.PressureUnit.pascals.withPrefix(_prefix)(_value);

  /// Creates a(n) bars measurement.
  Measurement<f.Pressure> get bars =>
      f.PressureUnit.bars.withPrefix(_prefix)(_value);

  /// Creates a(n) baryes measurement.
  Measurement<f.Pressure> get baryes =>
      f.PressureUnit.baryes.withPrefix(_prefix)(_value);

  /// Creates a(n) standardAtmospheres measurement.
  Measurement<f.Pressure> get standardAtmospheres =>
      f.PressureUnit.standardAtmospheres.withPrefix(_prefix)(_value);

  /// Creates a(n) technicalAtmospheres measurement.
  Measurement<f.Pressure> get technicalAtmospheres =>
      f.PressureUnit.technicalAtmospheres.withPrefix(_prefix)(_value);

  /// Creates a(n) mmHg measurement.
  Measurement<f.Pressure> get mmHg =>
      f.PressureUnit.mmHg.withPrefix(_prefix)(_value);

  /// Creates a(n) inHg measurement.
  Measurement<f.Pressure> get inHg =>
      f.PressureUnit.inHg.withPrefix(_prefix)(_value);

  /// Creates a(n) torr measurement.
  Measurement<f.Pressure> get torr =>
      f.PressureUnit.torr.withPrefix(_prefix)(_value);

  /// Creates a(n) psi measurement.
  Measurement<f.Pressure> get psi =>
      f.PressureUnit.psi.withPrefix(_prefix)(_value);

  /// Creates a(n) units measurement.
  Measurement<f.Quantity> get units =>
      f.QuantityUnit.units.withPrefix(_prefix)(_value);

  /// Creates a(n) moles measurement.
  Measurement<f.Quantity> get moles =>
      f.QuantityUnit.moles.withPrefix(_prefix)(_value);

  /// Creates a(n) kelvin measurement.
  Measurement<f.TemperatureChange> get kelvin =>
      f.TemperatureChangeUnit.kelvin.withPrefix(_prefix)(_value);

  /// Creates a(n) celcius measurement.
  Measurement<f.TemperatureChange> get celcius =>
      f.TemperatureChangeUnit.celcius.withPrefix(_prefix)(_value);

  /// Creates a(n) fahrenheit measurement.
  Measurement<f.TemperatureChange> get fahrenheit =>
      f.TemperatureChangeUnit.fahrenheit.withPrefix(_prefix)(_value);

  /// Creates a(n) seconds measurement.
  Measurement<f.Time> get seconds =>
      f.TimeUnit.seconds.withPrefix(_prefix)(_value);

  /// Creates a(n) minutes measurement.
  Measurement<f.Time> get minutes =>
      f.TimeUnit.minutes.withPrefix(_prefix)(_value);

  /// Creates a(n) hours measurement.
  Measurement<f.Time> get hours => f.TimeUnit.hours.withPrefix(_prefix)(_value);

  /// Creates a(n) days measurement.
  Measurement<f.Time> get days => f.TimeUnit.days.withPrefix(_prefix)(_value);
}
