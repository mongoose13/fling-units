// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:fling_units/src/core/library.dart';

class PrefixedMeasurementPer<N extends f.Measurement<D, I>,
    D extends f.Dimension, I extends f.Dimension> {
  PrefixedMeasurementPer(
    this.numerator, {
    this.prefix = const MeasurementPrefix.unit(),
  });

  final N numerator;

  final MeasurementPrefix prefix;

  /// Creates a derived measurement with [turns] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedAngle, I, f.Angle> get turn =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.turns.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [quadrants] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedAngle, I, f.Angle> get quadrant =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.quadrants.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [sextants] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedAngle, I, f.Angle> get sextant =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.sextants.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [radians] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedAngle, I, f.Angle> get radian =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.radians.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [gradians] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedAngle, I, f.Angle> get gradian =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.gradians.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [degrees] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedAngle, I, f.Angle> get degree =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.degrees.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [arcMinutes] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedAngle, I, f.Angle> get arcMinute =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.arcMinutes.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [arcSeconds] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedAngle, I, f.Angle> get arcSecond =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.arcSeconds.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [candela] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedLuminosity, I, f.Luminosity> get candela =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.candela.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [candlepower] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedLuminosity, I, f.Luminosity>
      get candlepower => DerivedUnit2.build(numerator.defaultUnit,
          f.candlepower.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [hefnerkerze] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedLuminosity, I, f.Luminosity>
      get hefnerkerze => DerivedUnit2.build(numerator.defaultUnit,
          f.hefnerkerze.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [grams] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedMass, I, f.Mass> get gram =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.grams.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [tonnes] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedMass, I, f.Mass> get tonne =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.tonnes.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [atomicMassUnits] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedMass, I, f.Mass> get atomicMassUnit =>
      DerivedUnit2.build(
          numerator.defaultUnit,
          f.atomicMassUnits
              .withPrefix(prefix)
              .inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [daltons] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedMass, I, f.Mass> get dalton =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.daltons.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [electronRestMass] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedMass, I, f.Mass> get electronRestMass =>
      DerivedUnit2.build(
          numerator.defaultUnit,
          f.electronRestMass
              .withPrefix(prefix)
              .inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [longTons] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedMass, I, f.Mass> get longTon =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.longTons.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [shortTons] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedMass, I, f.Mass> get shortTon =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.shortTons.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [pounds] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedMass, I, f.Mass> get pound =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.pounds.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [ounces] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedMass, I, f.Mass> get ounce =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.ounces.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [hertz] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedFrequency, I, f.Frequency> get hertz =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.hertz.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [rpm] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedFrequency, I, f.Frequency> get rpm =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.rpm.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [seconds] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedTime, I, f.Time> get second =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.seconds.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [minutes] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedTime, I, f.Time> get minute =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.minutes.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [hours] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedTime, I, f.Time> get hour =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.hours.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [days] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedTime, I, f.Time> get day =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.days.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [meters] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedDistance, I, f.Distance> get meter =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.meters.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [miles] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedDistance, I, f.Distance> get mile =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.miles.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [yards] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedDistance, I, f.Distance> get yard =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.yards.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [feet] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedDistance, I, f.Distance> get foot =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.feet.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [inches] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedDistance, I, f.Distance> get inch =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.inches.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [nauticalMiles] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedDistance, I, f.Distance>
      get nauticalMile => DerivedUnit2.build(numerator.defaultUnit,
          f.nauticalMiles.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [microns] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedDistance, I, f.Distance> get micron =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.microns.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [lightYears] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedDistance, I, f.Distance> get lightYear =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.lightYears.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [units] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedQuantity, I, f.Quantity> get unit =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.units.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [moles] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedQuantity, I, f.Quantity> get mole =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.moles.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [pascals] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedPressure, I, f.Pressure> get pascal =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.pascals.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [bars] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedPressure, I, f.Pressure> get bar =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.bars.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [baryes] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedPressure, I, f.Pressure> get barye =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.baryes.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [standardAtmospheres] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedPressure, I, f.Pressure>
      get standardAtmosphere => DerivedUnit2.build(
          numerator.defaultUnit,
          f.standardAtmospheres
              .withPrefix(prefix)
              .inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [technicalAtmospheres] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedPressure, I, f.Pressure>
      get technicalAtmosphere => DerivedUnit2.build(
          numerator.defaultUnit,
          f.technicalAtmospheres
              .withPrefix(prefix)
              .inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [mmHg] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedPressure, I, f.Pressure> get mmHg =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.mmHg.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [torr] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedPressure, I, f.Pressure> get torr =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.torr.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [psi] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedPressure, I, f.Pressure> get psi =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.psi.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [kelvin] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedTemperatureChange, I, f.TemperatureChange>
      get kelvin => DerivedUnit2.build(numerator.defaultUnit,
          f.kelvin.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [celcius] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedTemperatureChange, I, f.TemperatureChange>
      get celcius => DerivedUnit2.build(numerator.defaultUnit,
          f.celcius.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [celsius] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedTemperatureChange, I, f.TemperatureChange>
      get celsius => DerivedUnit2.build(numerator.defaultUnit,
          f.celsius.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [fahrenheit] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedTemperatureChange, I, f.TemperatureChange>
      get fahrenheit => DerivedUnit2.build(numerator.defaultUnit,
          f.fahrenheit.withPrefix(prefix).inverted)(numerator.defaultValue);

  /// Creates a derived measurement with [amperes] as the denominator.
  f.DerivedMeasurement2<D, f.InvertedCharge, I, f.Charge> get ampere =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.amperes.withPrefix(prefix).inverted)(numerator.defaultValue);
}

class PrefixedMeasurementDot<N extends f.Measurement<D, I>,
    D extends f.Dimension, I extends f.Dimension> {
  PrefixedMeasurementDot(
    this.first, {
    this.prefix = const MeasurementPrefix.unit(),
  });

  final N first;

  final MeasurementPrefix prefix;

  /// Creates a derived measurement with [turns] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Angle, I, f.InvertedAngle> get turns =>
      DerivedUnit2.build(first.defaultUnit, f.turns)(first.defaultValue);

  /// Creates a derived measurement with [quadrants] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Angle, I, f.InvertedAngle> get quadrants =>
      DerivedUnit2.build(first.defaultUnit, f.quadrants)(first.defaultValue);

  /// Creates a derived measurement with [sextants] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Angle, I, f.InvertedAngle> get sextants =>
      DerivedUnit2.build(first.defaultUnit, f.sextants)(first.defaultValue);

  /// Creates a derived measurement with [radians] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Angle, I, f.InvertedAngle> get radians =>
      DerivedUnit2.build(first.defaultUnit, f.radians)(first.defaultValue);

  /// Creates a derived measurement with [gradians] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Angle, I, f.InvertedAngle> get gradians =>
      DerivedUnit2.build(first.defaultUnit, f.gradians)(first.defaultValue);

  /// Creates a derived measurement with [degrees] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Angle, I, f.InvertedAngle> get degrees =>
      DerivedUnit2.build(first.defaultUnit, f.degrees)(first.defaultValue);

  /// Creates a derived measurement with [arcMinutes] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Angle, I, f.InvertedAngle> get arcMinutes =>
      DerivedUnit2.build(first.defaultUnit, f.arcMinutes)(first.defaultValue);

  /// Creates a derived measurement with [arcSeconds] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Angle, I, f.InvertedAngle> get arcSeconds =>
      DerivedUnit2.build(first.defaultUnit, f.arcSeconds)(first.defaultValue);

  /// Creates a derived measurement with [candela] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Luminosity, I, f.InvertedLuminosity> get candela =>
      DerivedUnit2.build(first.defaultUnit, f.candela)(first.defaultValue);

  /// Creates a derived measurement with [candlepower] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Luminosity, I, f.InvertedLuminosity>
      get candlepower => DerivedUnit2.build(first.defaultUnit, f.candlepower)(
          first.defaultValue);

  /// Creates a derived measurement with [hefnerkerze] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Luminosity, I, f.InvertedLuminosity>
      get hefnerkerze => DerivedUnit2.build(first.defaultUnit, f.hefnerkerze)(
          first.defaultValue);

  /// Creates a derived measurement with [grams] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Mass, I, f.InvertedMass> get grams =>
      DerivedUnit2.build(first.defaultUnit, f.grams)(first.defaultValue);

  /// Creates a derived measurement with [tonnes] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Mass, I, f.InvertedMass> get tonnes =>
      DerivedUnit2.build(first.defaultUnit, f.tonnes)(first.defaultValue);

  /// Creates a derived measurement with [atomicMassUnits] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Mass, I, f.InvertedMass> get atomicMassUnits =>
      DerivedUnit2.build(first.defaultUnit, f.atomicMassUnits)(
          first.defaultValue);

  /// Creates a derived measurement with [daltons] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Mass, I, f.InvertedMass> get daltons =>
      DerivedUnit2.build(first.defaultUnit, f.daltons)(first.defaultValue);

  /// Creates a derived measurement with [electronRestMass] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Mass, I, f.InvertedMass> get electronRestMass =>
      DerivedUnit2.build(first.defaultUnit, f.electronRestMass)(
          first.defaultValue);

  /// Creates a derived measurement with [longTons] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Mass, I, f.InvertedMass> get longTons =>
      DerivedUnit2.build(first.defaultUnit, f.longTons)(first.defaultValue);

  /// Creates a derived measurement with [shortTons] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Mass, I, f.InvertedMass> get shortTons =>
      DerivedUnit2.build(first.defaultUnit, f.shortTons)(first.defaultValue);

  /// Creates a derived measurement with [pounds] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Mass, I, f.InvertedMass> get pounds =>
      DerivedUnit2.build(first.defaultUnit, f.pounds)(first.defaultValue);

  /// Creates a derived measurement with [ounces] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Mass, I, f.InvertedMass> get ounces =>
      DerivedUnit2.build(first.defaultUnit, f.ounces)(first.defaultValue);

  /// Creates a derived measurement with [hertz] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Frequency, I, f.InvertedFrequency> get hertz =>
      DerivedUnit2.build(first.defaultUnit, f.hertz)(first.defaultValue);

  /// Creates a derived measurement with [rpm] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Frequency, I, f.InvertedFrequency> get rpm =>
      DerivedUnit2.build(first.defaultUnit, f.rpm)(first.defaultValue);

  /// Creates a derived measurement with [seconds] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Time, I, f.InvertedTime> get seconds =>
      DerivedUnit2.build(first.defaultUnit, f.seconds)(first.defaultValue);

  /// Creates a derived measurement with [minutes] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Time, I, f.InvertedTime> get minutes =>
      DerivedUnit2.build(first.defaultUnit, f.minutes)(first.defaultValue);

  /// Creates a derived measurement with [hours] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Time, I, f.InvertedTime> get hours =>
      DerivedUnit2.build(first.defaultUnit, f.hours)(first.defaultValue);

  /// Creates a derived measurement with [days] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Time, I, f.InvertedTime> get days =>
      DerivedUnit2.build(first.defaultUnit, f.days)(first.defaultValue);

  /// Creates a derived measurement with [meters] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Distance, I, f.InvertedDistance> get meters =>
      DerivedUnit2.build(first.defaultUnit, f.meters)(first.defaultValue);

  /// Creates a derived measurement with [miles] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Distance, I, f.InvertedDistance> get miles =>
      DerivedUnit2.build(first.defaultUnit, f.miles)(first.defaultValue);

  /// Creates a derived measurement with [yards] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Distance, I, f.InvertedDistance> get yards =>
      DerivedUnit2.build(first.defaultUnit, f.yards)(first.defaultValue);

  /// Creates a derived measurement with [feet] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Distance, I, f.InvertedDistance> get feet =>
      DerivedUnit2.build(first.defaultUnit, f.feet)(first.defaultValue);

  /// Creates a derived measurement with [inches] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Distance, I, f.InvertedDistance> get inches =>
      DerivedUnit2.build(first.defaultUnit, f.inches)(first.defaultValue);

  /// Creates a derived measurement with [nauticalMiles] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Distance, I, f.InvertedDistance>
      get nauticalMiles => DerivedUnit2.build(
          first.defaultUnit, f.nauticalMiles)(first.defaultValue);

  /// Creates a derived measurement with [microns] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Distance, I, f.InvertedDistance> get microns =>
      DerivedUnit2.build(first.defaultUnit, f.microns)(first.defaultValue);

  /// Creates a derived measurement with [lightYears] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Distance, I, f.InvertedDistance> get lightYears =>
      DerivedUnit2.build(first.defaultUnit, f.lightYears)(first.defaultValue);

  /// Creates a derived measurement with [units] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Quantity, I, f.InvertedQuantity> get units =>
      DerivedUnit2.build(first.defaultUnit, f.units)(first.defaultValue);

  /// Creates a derived measurement with [moles] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Quantity, I, f.InvertedQuantity> get moles =>
      DerivedUnit2.build(first.defaultUnit, f.moles)(first.defaultValue);

  /// Creates a derived measurement with [pascals] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Pressure, I, f.InvertedPressure> get pascals =>
      DerivedUnit2.build(first.defaultUnit, f.pascals)(first.defaultValue);

  /// Creates a derived measurement with [bars] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Pressure, I, f.InvertedPressure> get bars =>
      DerivedUnit2.build(first.defaultUnit, f.bars)(first.defaultValue);

  /// Creates a derived measurement with [baryes] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Pressure, I, f.InvertedPressure> get baryes =>
      DerivedUnit2.build(first.defaultUnit, f.baryes)(first.defaultValue);

  /// Creates a derived measurement with [standardAtmospheres] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Pressure, I, f.InvertedPressure>
      get standardAtmospheres => DerivedUnit2.build(
          first.defaultUnit, f.standardAtmospheres)(first.defaultValue);

  /// Creates a derived measurement with [technicalAtmospheres] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Pressure, I, f.InvertedPressure>
      get technicalAtmospheres => DerivedUnit2.build(
          first.defaultUnit, f.technicalAtmospheres)(first.defaultValue);

  /// Creates a derived measurement with [mmHg] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Pressure, I, f.InvertedPressure> get mmHg =>
      DerivedUnit2.build(first.defaultUnit, f.mmHg)(first.defaultValue);

  /// Creates a derived measurement with [torr] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Pressure, I, f.InvertedPressure> get torr =>
      DerivedUnit2.build(first.defaultUnit, f.torr)(first.defaultValue);

  /// Creates a derived measurement with [psi] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Pressure, I, f.InvertedPressure> get psi =>
      DerivedUnit2.build(first.defaultUnit, f.psi)(first.defaultValue);

  /// Creates a derived measurement with [kelvin] as the second unit in a product.
  f.DerivedMeasurement2<D, f.TemperatureChange, I, f.InvertedTemperatureChange>
      get kelvin =>
          DerivedUnit2.build(first.defaultUnit, f.kelvin)(first.defaultValue);

  /// Creates a derived measurement with [celcius] as the second unit in a product.
  f.DerivedMeasurement2<D, f.TemperatureChange, I, f.InvertedTemperatureChange>
      get celcius =>
          DerivedUnit2.build(first.defaultUnit, f.celcius)(first.defaultValue);

  /// Creates a derived measurement with [celsius] as the second unit in a product.
  f.DerivedMeasurement2<D, f.TemperatureChange, I, f.InvertedTemperatureChange>
      get celsius =>
          DerivedUnit2.build(first.defaultUnit, f.celsius)(first.defaultValue);

  /// Creates a derived measurement with [fahrenheit] as the second unit in a product.
  f.DerivedMeasurement2<D, f.TemperatureChange, I, f.InvertedTemperatureChange>
      get fahrenheit => DerivedUnit2.build(first.defaultUnit, f.fahrenheit)(
          first.defaultValue);

  /// Creates a derived measurement with [amperes] as the second unit in a product.
  f.DerivedMeasurement2<D, f.Charge, I, f.InvertedCharge> get amperes =>
      DerivedUnit2.build(first.defaultUnit, f.amperes)(first.defaultValue);
}
