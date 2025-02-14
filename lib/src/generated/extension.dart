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
  f.AngleMeasurement get turns => f.AngleUnit.turns.withPrefix(_prefix)(_value);

  /// Creates a(n) radians measurement.
  f.AngleMeasurement get radians =>
      f.AngleUnit.radians.withPrefix(_prefix)(_value);

  /// Creates a(n) gradians measurement.
  f.AngleMeasurement get gradians =>
      f.AngleUnit.gradians.withPrefix(_prefix)(_value);

  /// Creates a(n) degrees measurement.
  f.AngleMeasurement get degrees =>
      f.AngleUnit.degrees.withPrefix(_prefix)(_value);

  /// Creates a(n) arcMinutes measurement.
  f.AngleMeasurement get arcMinutes =>
      f.AngleUnit.arcMinutes.withPrefix(_prefix)(_value);

  /// Creates a(n) arcSeconds measurement.
  f.AngleMeasurement get arcSeconds =>
      f.AngleUnit.arcSeconds.withPrefix(_prefix)(_value);

  /// Creates a(n) candela measurement.
  f.LuminosityMeasurement get candela =>
      f.LuminosityUnit.candela.withPrefix(_prefix)(_value);

  /// Creates a(n) candlepower measurement.
  f.LuminosityMeasurement get candlepower =>
      f.LuminosityUnit.candlepower.withPrefix(_prefix)(_value);

  /// Creates a(n) hefnerkerze measurement.
  f.LuminosityMeasurement get hefnerkerze =>
      f.LuminosityUnit.hefnerkerze.withPrefix(_prefix)(_value);

  /// Creates a(n) grams measurement.
  f.MassMeasurement get grams => f.MassUnit.grams.withPrefix(_prefix)(_value);

  /// Creates a(n) tonnes measurement.
  f.MassMeasurement get tonnes => f.MassUnit.tonnes.withPrefix(_prefix)(_value);

  /// Creates a(n) atomicMassUnits measurement.
  f.MassMeasurement get atomicMassUnits =>
      f.MassUnit.atomicMassUnits.withPrefix(_prefix)(_value);

  /// Creates a(n) daltons measurement.
  f.MassMeasurement get daltons =>
      f.MassUnit.daltons.withPrefix(_prefix)(_value);

  /// Creates a(n) electronRestMass measurement.
  f.MassMeasurement get electronRestMass =>
      f.MassUnit.electronRestMass.withPrefix(_prefix)(_value);

  /// Creates a(n) longTons measurement.
  f.MassMeasurement get longTons =>
      f.MassUnit.longTons.withPrefix(_prefix)(_value);

  /// Creates a(n) shortTons measurement.
  f.MassMeasurement get shortTons =>
      f.MassUnit.shortTons.withPrefix(_prefix)(_value);

  /// Creates a(n) pounds measurement.
  f.MassMeasurement get pounds => f.MassUnit.pounds.withPrefix(_prefix)(_value);

  /// Creates a(n) ounces measurement.
  f.MassMeasurement get ounces => f.MassUnit.ounces.withPrefix(_prefix)(_value);

  /// Creates a(n) seconds measurement.
  f.TimeMeasurement get seconds =>
      f.TimeUnit.seconds.withPrefix(_prefix)(_value);

  /// Creates a(n) minutes measurement.
  f.TimeMeasurement get minutes =>
      f.TimeUnit.minutes.withPrefix(_prefix)(_value);

  /// Creates a(n) hours measurement.
  f.TimeMeasurement get hours => f.TimeUnit.hours.withPrefix(_prefix)(_value);

  /// Creates a(n) days measurement.
  f.TimeMeasurement get days => f.TimeUnit.days.withPrefix(_prefix)(_value);

  /// Creates a(n) meters measurement.
  f.DistanceMeasurement get meters =>
      f.DistanceUnit.meters.withPrefix(_prefix)(_value);

  /// Creates a(n) miles measurement.
  f.DistanceMeasurement get miles =>
      f.DistanceUnit.miles.withPrefix(_prefix)(_value);

  /// Creates a(n) yards measurement.
  f.DistanceMeasurement get yards =>
      f.DistanceUnit.yards.withPrefix(_prefix)(_value);

  /// Creates a(n) feet measurement.
  f.DistanceMeasurement get feet =>
      f.DistanceUnit.feet.withPrefix(_prefix)(_value);

  /// Creates a(n) inches measurement.
  f.DistanceMeasurement get inches =>
      f.DistanceUnit.inches.withPrefix(_prefix)(_value);

  /// Creates a(n) nauticalMiles measurement.
  f.DistanceMeasurement get nauticalMiles =>
      f.DistanceUnit.nauticalMiles.withPrefix(_prefix)(_value);

  /// Creates a(n) units measurement.
  f.QuantityMeasurement get units =>
      f.QuantityUnit.units.withPrefix(_prefix)(_value);

  /// Creates a(n) moles measurement.
  f.QuantityMeasurement get moles =>
      f.QuantityUnit.moles.withPrefix(_prefix)(_value);

  /// Creates a(n) pascals measurement.
  f.PressureMeasurement get pascals =>
      f.PressureUnit.pascals.withPrefix(_prefix)(_value);

  /// Creates a(n) bars measurement.
  f.PressureMeasurement get bars =>
      f.PressureUnit.bars.withPrefix(_prefix)(_value);

  /// Creates a(n) baryes measurement.
  f.PressureMeasurement get baryes =>
      f.PressureUnit.baryes.withPrefix(_prefix)(_value);

  /// Creates a(n) standardAtmospheres measurement.
  f.PressureMeasurement get standardAtmospheres =>
      f.PressureUnit.standardAtmospheres.withPrefix(_prefix)(_value);

  /// Creates a(n) technicalAtmospheres measurement.
  f.PressureMeasurement get technicalAtmospheres =>
      f.PressureUnit.technicalAtmospheres.withPrefix(_prefix)(_value);

  /// Creates a(n) mmHg measurement.
  f.PressureMeasurement get mmHg =>
      f.PressureUnit.mmHg.withPrefix(_prefix)(_value);

  /// Creates a(n) inHg measurement.
  f.PressureMeasurement get inHg =>
      f.PressureUnit.inHg.withPrefix(_prefix)(_value);

  /// Creates a(n) torr measurement.
  f.PressureMeasurement get torr =>
      f.PressureUnit.torr.withPrefix(_prefix)(_value);

  /// Creates a(n) psi measurement.
  f.PressureMeasurement get psi =>
      f.PressureUnit.psi.withPrefix(_prefix)(_value);

  /// Creates a(n) kelvin measurement.
  f.TemperatureChangeMeasurement get kelvin =>
      f.TemperatureChangeUnit.kelvin.withPrefix(_prefix)(_value);

  /// Creates a(n) celcius measurement.
  f.TemperatureChangeMeasurement get celcius =>
      f.TemperatureChangeUnit.celcius.withPrefix(_prefix)(_value);

  /// Creates a(n) fahrenheit measurement.
  f.TemperatureChangeMeasurement get fahrenheit =>
      f.TemperatureChangeUnit.fahrenheit.withPrefix(_prefix)(_value);

  /// Creates a(n) amperes measurement.
  f.ChargeMeasurement get amperes =>
      f.ChargeUnit.amperes.withPrefix(_prefix)(_value);
}
