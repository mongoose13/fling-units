// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:fling_units/src/core/library.dart';

class PrefixedUnitPer<N extends f.Unit<D, I>, D extends f.Dimension,
    I extends f.Dimension> {
  PrefixedUnitPer(
    this.numerator, {
    this.prefix = const MeasurementPrefix.unit(),
  });

  final N numerator;

  final MeasurementPrefix prefix;

  /// Creates a derived unit with [turns] as the denominator.
  f.DerivedUnit2<D, f.InvertedAngle, I, f.Angle> get turn =>
      f.DerivedUnit2.build(
        numerator,
        prefix.turns.inverted,
      );

  /// Creates a derived unit with [quadrants] as the denominator.
  f.DerivedUnit2<D, f.InvertedAngle, I, f.Angle> get quadrant =>
      f.DerivedUnit2.build(
        numerator,
        prefix.quadrants.inverted,
      );

  /// Creates a derived unit with [sextants] as the denominator.
  f.DerivedUnit2<D, f.InvertedAngle, I, f.Angle> get sextant =>
      f.DerivedUnit2.build(
        numerator,
        prefix.sextants.inverted,
      );

  /// Creates a derived unit with [radians] as the denominator.
  f.DerivedUnit2<D, f.InvertedAngle, I, f.Angle> get radian =>
      f.DerivedUnit2.build(
        numerator,
        prefix.radians.inverted,
      );

  /// Creates a derived unit with [gradians] as the denominator.
  f.DerivedUnit2<D, f.InvertedAngle, I, f.Angle> get gradian =>
      f.DerivedUnit2.build(
        numerator,
        prefix.gradians.inverted,
      );

  /// Creates a derived unit with [degrees] as the denominator.
  f.DerivedUnit2<D, f.InvertedAngle, I, f.Angle> get degree =>
      f.DerivedUnit2.build(
        numerator,
        prefix.degrees.inverted,
      );

  /// Creates a derived unit with [arcMinutes] as the denominator.
  f.DerivedUnit2<D, f.InvertedAngle, I, f.Angle> get arcMinute =>
      f.DerivedUnit2.build(
        numerator,
        prefix.arcMinutes.inverted,
      );

  /// Creates a derived unit with [arcSeconds] as the denominator.
  f.DerivedUnit2<D, f.InvertedAngle, I, f.Angle> get arcSecond =>
      f.DerivedUnit2.build(
        numerator,
        prefix.arcSeconds.inverted,
      );

  /// Creates a derived unit with [candela] as the denominator.
  f.DerivedUnit2<D, f.InvertedLuminosity, I, f.Luminosity> get candela =>
      f.DerivedUnit2.build(
        numerator,
        prefix.candela.inverted,
      );

  /// Creates a derived unit with [candlepower] as the denominator.
  f.DerivedUnit2<D, f.InvertedLuminosity, I, f.Luminosity> get candlepower =>
      f.DerivedUnit2.build(
        numerator,
        prefix.candlepower.inverted,
      );

  /// Creates a derived unit with [hefnerkerze] as the denominator.
  f.DerivedUnit2<D, f.InvertedLuminosity, I, f.Luminosity> get hefnerkerze =>
      f.DerivedUnit2.build(
        numerator,
        prefix.hefnerkerze.inverted,
      );

  /// Creates a derived unit with [grams] as the denominator.
  f.DerivedUnit2<D, f.InvertedMass, I, f.Mass> get gram => f.DerivedUnit2.build(
        numerator,
        prefix.grams.inverted,
      );

  /// Creates a derived unit with [tonnes] as the denominator.
  f.DerivedUnit2<D, f.InvertedMass, I, f.Mass> get tonne =>
      f.DerivedUnit2.build(
        numerator,
        prefix.tonnes.inverted,
      );

  /// Creates a derived unit with [atomicMassUnits] as the denominator.
  f.DerivedUnit2<D, f.InvertedMass, I, f.Mass> get atomicMassUnit =>
      f.DerivedUnit2.build(
        numerator,
        prefix.atomicMassUnits.inverted,
      );

  /// Creates a derived unit with [daltons] as the denominator.
  f.DerivedUnit2<D, f.InvertedMass, I, f.Mass> get dalton =>
      f.DerivedUnit2.build(
        numerator,
        prefix.daltons.inverted,
      );

  /// Creates a derived unit with [electronRestMass] as the denominator.
  f.DerivedUnit2<D, f.InvertedMass, I, f.Mass> get electronRestMass =>
      f.DerivedUnit2.build(
        numerator,
        prefix.electronRestMass.inverted,
      );

  /// Creates a derived unit with [longTons] as the denominator.
  f.DerivedUnit2<D, f.InvertedMass, I, f.Mass> get longTon =>
      f.DerivedUnit2.build(
        numerator,
        prefix.longTons.inverted,
      );

  /// Creates a derived unit with [shortTons] as the denominator.
  f.DerivedUnit2<D, f.InvertedMass, I, f.Mass> get shortTon =>
      f.DerivedUnit2.build(
        numerator,
        prefix.shortTons.inverted,
      );

  /// Creates a derived unit with [pounds] as the denominator.
  f.DerivedUnit2<D, f.InvertedMass, I, f.Mass> get pound =>
      f.DerivedUnit2.build(
        numerator,
        prefix.pounds.inverted,
      );

  /// Creates a derived unit with [ounces] as the denominator.
  f.DerivedUnit2<D, f.InvertedMass, I, f.Mass> get ounce =>
      f.DerivedUnit2.build(
        numerator,
        prefix.ounces.inverted,
      );

  /// Creates a derived unit with [hertz] as the denominator.
  f.DerivedUnit2<D, f.InvertedFrequency, I, f.Frequency> get hertz =>
      f.DerivedUnit2.build(
        numerator,
        prefix.hertz.inverted,
      );

  /// Creates a derived unit with [rpm] as the denominator.
  f.DerivedUnit2<D, f.InvertedFrequency, I, f.Frequency> get rpm =>
      f.DerivedUnit2.build(
        numerator,
        prefix.rpm.inverted,
      );

  /// Creates a derived unit with [seconds] as the denominator.
  f.DerivedUnit2<D, f.InvertedTime, I, f.Time> get second =>
      f.DerivedUnit2.build(
        numerator,
        prefix.seconds.inverted,
      );

  /// Creates a derived unit with [minutes] as the denominator.
  f.DerivedUnit2<D, f.InvertedTime, I, f.Time> get minute =>
      f.DerivedUnit2.build(
        numerator,
        prefix.minutes.inverted,
      );

  /// Creates a derived unit with [hours] as the denominator.
  f.DerivedUnit2<D, f.InvertedTime, I, f.Time> get hour => f.DerivedUnit2.build(
        numerator,
        prefix.hours.inverted,
      );

  /// Creates a derived unit with [days] as the denominator.
  f.DerivedUnit2<D, f.InvertedTime, I, f.Time> get day => f.DerivedUnit2.build(
        numerator,
        prefix.days.inverted,
      );

  /// Creates a derived unit with [meters] as the denominator.
  f.DerivedUnit2<D, f.InvertedDistance, I, f.Distance> get meter =>
      f.DerivedUnit2.build(
        numerator,
        prefix.meters.inverted,
      );

  /// Creates a derived unit with [miles] as the denominator.
  f.DerivedUnit2<D, f.InvertedDistance, I, f.Distance> get mile =>
      f.DerivedUnit2.build(
        numerator,
        prefix.miles.inverted,
      );

  /// Creates a derived unit with [yards] as the denominator.
  f.DerivedUnit2<D, f.InvertedDistance, I, f.Distance> get yard =>
      f.DerivedUnit2.build(
        numerator,
        prefix.yards.inverted,
      );

  /// Creates a derived unit with [feet] as the denominator.
  f.DerivedUnit2<D, f.InvertedDistance, I, f.Distance> get foot =>
      f.DerivedUnit2.build(
        numerator,
        prefix.feet.inverted,
      );

  /// Creates a derived unit with [inches] as the denominator.
  f.DerivedUnit2<D, f.InvertedDistance, I, f.Distance> get inch =>
      f.DerivedUnit2.build(
        numerator,
        prefix.inches.inverted,
      );

  /// Creates a derived unit with [nauticalMiles] as the denominator.
  f.DerivedUnit2<D, f.InvertedDistance, I, f.Distance> get nauticalMile =>
      f.DerivedUnit2.build(
        numerator,
        prefix.nauticalMiles.inverted,
      );

  /// Creates a derived unit with [microns] as the denominator.
  f.DerivedUnit2<D, f.InvertedDistance, I, f.Distance> get micron =>
      f.DerivedUnit2.build(
        numerator,
        prefix.microns.inverted,
      );

  /// Creates a derived unit with [lightYears] as the denominator.
  f.DerivedUnit2<D, f.InvertedDistance, I, f.Distance> get lightYear =>
      f.DerivedUnit2.build(
        numerator,
        prefix.lightYears.inverted,
      );

  /// Creates a derived unit with [units] as the denominator.
  f.DerivedUnit2<D, f.InvertedQuantity, I, f.Quantity> get unit =>
      f.DerivedUnit2.build(
        numerator,
        prefix.units.inverted,
      );

  /// Creates a derived unit with [moles] as the denominator.
  f.DerivedUnit2<D, f.InvertedQuantity, I, f.Quantity> get mole =>
      f.DerivedUnit2.build(
        numerator,
        prefix.moles.inverted,
      );

  /// Creates a derived unit with [pascals] as the denominator.
  f.DerivedUnit2<D, f.InvertedPressure, I, f.Pressure> get pascal =>
      f.DerivedUnit2.build(
        numerator,
        prefix.pascals.inverted,
      );

  /// Creates a derived unit with [bars] as the denominator.
  f.DerivedUnit2<D, f.InvertedPressure, I, f.Pressure> get bar =>
      f.DerivedUnit2.build(
        numerator,
        prefix.bars.inverted,
      );

  /// Creates a derived unit with [baryes] as the denominator.
  f.DerivedUnit2<D, f.InvertedPressure, I, f.Pressure> get barye =>
      f.DerivedUnit2.build(
        numerator,
        prefix.baryes.inverted,
      );

  /// Creates a derived unit with [standardAtmospheres] as the denominator.
  f.DerivedUnit2<D, f.InvertedPressure, I, f.Pressure> get standardAtmosphere =>
      f.DerivedUnit2.build(
        numerator,
        prefix.standardAtmospheres.inverted,
      );

  /// Creates a derived unit with [technicalAtmospheres] as the denominator.
  f.DerivedUnit2<D, f.InvertedPressure, I, f.Pressure>
      get technicalAtmosphere => f.DerivedUnit2.build(
            numerator,
            prefix.technicalAtmospheres.inverted,
          );

  /// Creates a derived unit with [mmHg] as the denominator.
  f.DerivedUnit2<D, f.InvertedPressure, I, f.Pressure> get mmHg =>
      f.DerivedUnit2.build(
        numerator,
        prefix.mmHg.inverted,
      );

  /// Creates a derived unit with [torr] as the denominator.
  f.DerivedUnit2<D, f.InvertedPressure, I, f.Pressure> get torr =>
      f.DerivedUnit2.build(
        numerator,
        prefix.torr.inverted,
      );

  /// Creates a derived unit with [psi] as the denominator.
  f.DerivedUnit2<D, f.InvertedPressure, I, f.Pressure> get psi =>
      f.DerivedUnit2.build(
        numerator,
        prefix.psi.inverted,
      );

  /// Creates a derived unit with [kelvin] as the denominator.
  f.DerivedUnit2<D, f.InvertedTemperatureChange, I, f.TemperatureChange>
      get kelvin => f.DerivedUnit2.build(
            numerator,
            prefix.kelvin.inverted,
          );

  /// Creates a derived unit with [celcius] as the denominator.
  f.DerivedUnit2<D, f.InvertedTemperatureChange, I, f.TemperatureChange>
      get celcius => f.DerivedUnit2.build(
            numerator,
            prefix.celcius.inverted,
          );

  /// Creates a derived unit with [celsius] as the denominator.
  f.DerivedUnit2<D, f.InvertedTemperatureChange, I, f.TemperatureChange>
      get celsius => f.DerivedUnit2.build(
            numerator,
            prefix.celsius.inverted,
          );

  /// Creates a derived unit with [fahrenheit] as the denominator.
  f.DerivedUnit2<D, f.InvertedTemperatureChange, I, f.TemperatureChange>
      get fahrenheit => f.DerivedUnit2.build(
            numerator,
            prefix.fahrenheit.inverted,
          );

  /// Creates a derived unit with [amperes] as the denominator.
  f.DerivedUnit2<D, f.InvertedCharge, I, f.Charge> get ampere =>
      f.DerivedUnit2.build(
        numerator,
        prefix.amperes.inverted,
      );
}

class PrefixedUnitDot<N extends f.Unit<D, I>, D extends f.Dimension,
    I extends f.Dimension> {
  PrefixedUnitDot(
    this.first, {
    this.prefix = const MeasurementPrefix.unit(),
  });

  final N first;

  final MeasurementPrefix prefix;

  /// Creates a derived unit with [turns] as the second unit in a product.
  f.DerivedUnit2<D, f.Angle, I, f.InvertedAngle> get turns =>
      f.DerivedUnit2.build(
        first,
        prefix.turns,
      );

  /// Creates a derived unit with [quadrants] as the second unit in a product.
  f.DerivedUnit2<D, f.Angle, I, f.InvertedAngle> get quadrants =>
      f.DerivedUnit2.build(
        first,
        prefix.quadrants,
      );

  /// Creates a derived unit with [sextants] as the second unit in a product.
  f.DerivedUnit2<D, f.Angle, I, f.InvertedAngle> get sextants =>
      f.DerivedUnit2.build(
        first,
        prefix.sextants,
      );

  /// Creates a derived unit with [radians] as the second unit in a product.
  f.DerivedUnit2<D, f.Angle, I, f.InvertedAngle> get radians =>
      f.DerivedUnit2.build(
        first,
        prefix.radians,
      );

  /// Creates a derived unit with [gradians] as the second unit in a product.
  f.DerivedUnit2<D, f.Angle, I, f.InvertedAngle> get gradians =>
      f.DerivedUnit2.build(
        first,
        prefix.gradians,
      );

  /// Creates a derived unit with [degrees] as the second unit in a product.
  f.DerivedUnit2<D, f.Angle, I, f.InvertedAngle> get degrees =>
      f.DerivedUnit2.build(
        first,
        prefix.degrees,
      );

  /// Creates a derived unit with [arcMinutes] as the second unit in a product.
  f.DerivedUnit2<D, f.Angle, I, f.InvertedAngle> get arcMinutes =>
      f.DerivedUnit2.build(
        first,
        prefix.arcMinutes,
      );

  /// Creates a derived unit with [arcSeconds] as the second unit in a product.
  f.DerivedUnit2<D, f.Angle, I, f.InvertedAngle> get arcSeconds =>
      f.DerivedUnit2.build(
        first,
        prefix.arcSeconds,
      );

  /// Creates a derived unit with [candela] as the second unit in a product.
  f.DerivedUnit2<D, f.Luminosity, I, f.InvertedLuminosity> get candela =>
      f.DerivedUnit2.build(
        first,
        prefix.candela,
      );

  /// Creates a derived unit with [candlepower] as the second unit in a product.
  f.DerivedUnit2<D, f.Luminosity, I, f.InvertedLuminosity> get candlepower =>
      f.DerivedUnit2.build(
        first,
        prefix.candlepower,
      );

  /// Creates a derived unit with [hefnerkerze] as the second unit in a product.
  f.DerivedUnit2<D, f.Luminosity, I, f.InvertedLuminosity> get hefnerkerze =>
      f.DerivedUnit2.build(
        first,
        prefix.hefnerkerze,
      );

  /// Creates a derived unit with [grams] as the second unit in a product.
  f.DerivedUnit2<D, f.Mass, I, f.InvertedMass> get grams =>
      f.DerivedUnit2.build(
        first,
        prefix.grams,
      );

  /// Creates a derived unit with [tonnes] as the second unit in a product.
  f.DerivedUnit2<D, f.Mass, I, f.InvertedMass> get tonnes =>
      f.DerivedUnit2.build(
        first,
        prefix.tonnes,
      );

  /// Creates a derived unit with [atomicMassUnits] as the second unit in a product.
  f.DerivedUnit2<D, f.Mass, I, f.InvertedMass> get atomicMassUnits =>
      f.DerivedUnit2.build(
        first,
        prefix.atomicMassUnits,
      );

  /// Creates a derived unit with [daltons] as the second unit in a product.
  f.DerivedUnit2<D, f.Mass, I, f.InvertedMass> get daltons =>
      f.DerivedUnit2.build(
        first,
        prefix.daltons,
      );

  /// Creates a derived unit with [electronRestMass] as the second unit in a product.
  f.DerivedUnit2<D, f.Mass, I, f.InvertedMass> get electronRestMass =>
      f.DerivedUnit2.build(
        first,
        prefix.electronRestMass,
      );

  /// Creates a derived unit with [longTons] as the second unit in a product.
  f.DerivedUnit2<D, f.Mass, I, f.InvertedMass> get longTons =>
      f.DerivedUnit2.build(
        first,
        prefix.longTons,
      );

  /// Creates a derived unit with [shortTons] as the second unit in a product.
  f.DerivedUnit2<D, f.Mass, I, f.InvertedMass> get shortTons =>
      f.DerivedUnit2.build(
        first,
        prefix.shortTons,
      );

  /// Creates a derived unit with [pounds] as the second unit in a product.
  f.DerivedUnit2<D, f.Mass, I, f.InvertedMass> get pounds =>
      f.DerivedUnit2.build(
        first,
        prefix.pounds,
      );

  /// Creates a derived unit with [ounces] as the second unit in a product.
  f.DerivedUnit2<D, f.Mass, I, f.InvertedMass> get ounces =>
      f.DerivedUnit2.build(
        first,
        prefix.ounces,
      );

  /// Creates a derived unit with [hertz] as the second unit in a product.
  f.DerivedUnit2<D, f.Frequency, I, f.InvertedFrequency> get hertz =>
      f.DerivedUnit2.build(
        first,
        prefix.hertz,
      );

  /// Creates a derived unit with [rpm] as the second unit in a product.
  f.DerivedUnit2<D, f.Frequency, I, f.InvertedFrequency> get rpm =>
      f.DerivedUnit2.build(
        first,
        prefix.rpm,
      );

  /// Creates a derived unit with [seconds] as the second unit in a product.
  f.DerivedUnit2<D, f.Time, I, f.InvertedTime> get seconds =>
      f.DerivedUnit2.build(
        first,
        prefix.seconds,
      );

  /// Creates a derived unit with [minutes] as the second unit in a product.
  f.DerivedUnit2<D, f.Time, I, f.InvertedTime> get minutes =>
      f.DerivedUnit2.build(
        first,
        prefix.minutes,
      );

  /// Creates a derived unit with [hours] as the second unit in a product.
  f.DerivedUnit2<D, f.Time, I, f.InvertedTime> get hours =>
      f.DerivedUnit2.build(
        first,
        prefix.hours,
      );

  /// Creates a derived unit with [days] as the second unit in a product.
  f.DerivedUnit2<D, f.Time, I, f.InvertedTime> get days => f.DerivedUnit2.build(
        first,
        prefix.days,
      );

  /// Creates a derived unit with [meters] as the second unit in a product.
  f.DerivedUnit2<D, f.Distance, I, f.InvertedDistance> get meters =>
      f.DerivedUnit2.build(
        first,
        prefix.meters,
      );

  /// Creates a derived unit with [miles] as the second unit in a product.
  f.DerivedUnit2<D, f.Distance, I, f.InvertedDistance> get miles =>
      f.DerivedUnit2.build(
        first,
        prefix.miles,
      );

  /// Creates a derived unit with [yards] as the second unit in a product.
  f.DerivedUnit2<D, f.Distance, I, f.InvertedDistance> get yards =>
      f.DerivedUnit2.build(
        first,
        prefix.yards,
      );

  /// Creates a derived unit with [feet] as the second unit in a product.
  f.DerivedUnit2<D, f.Distance, I, f.InvertedDistance> get feet =>
      f.DerivedUnit2.build(
        first,
        prefix.feet,
      );

  /// Creates a derived unit with [inches] as the second unit in a product.
  f.DerivedUnit2<D, f.Distance, I, f.InvertedDistance> get inches =>
      f.DerivedUnit2.build(
        first,
        prefix.inches,
      );

  /// Creates a derived unit with [nauticalMiles] as the second unit in a product.
  f.DerivedUnit2<D, f.Distance, I, f.InvertedDistance> get nauticalMiles =>
      f.DerivedUnit2.build(
        first,
        prefix.nauticalMiles,
      );

  /// Creates a derived unit with [microns] as the second unit in a product.
  f.DerivedUnit2<D, f.Distance, I, f.InvertedDistance> get microns =>
      f.DerivedUnit2.build(
        first,
        prefix.microns,
      );

  /// Creates a derived unit with [lightYears] as the second unit in a product.
  f.DerivedUnit2<D, f.Distance, I, f.InvertedDistance> get lightYears =>
      f.DerivedUnit2.build(
        first,
        prefix.lightYears,
      );

  /// Creates a derived unit with [units] as the second unit in a product.
  f.DerivedUnit2<D, f.Quantity, I, f.InvertedQuantity> get units =>
      f.DerivedUnit2.build(
        first,
        prefix.units,
      );

  /// Creates a derived unit with [moles] as the second unit in a product.
  f.DerivedUnit2<D, f.Quantity, I, f.InvertedQuantity> get moles =>
      f.DerivedUnit2.build(
        first,
        prefix.moles,
      );

  /// Creates a derived unit with [pascals] as the second unit in a product.
  f.DerivedUnit2<D, f.Pressure, I, f.InvertedPressure> get pascals =>
      f.DerivedUnit2.build(
        first,
        prefix.pascals,
      );

  /// Creates a derived unit with [bars] as the second unit in a product.
  f.DerivedUnit2<D, f.Pressure, I, f.InvertedPressure> get bars =>
      f.DerivedUnit2.build(
        first,
        prefix.bars,
      );

  /// Creates a derived unit with [baryes] as the second unit in a product.
  f.DerivedUnit2<D, f.Pressure, I, f.InvertedPressure> get baryes =>
      f.DerivedUnit2.build(
        first,
        prefix.baryes,
      );

  /// Creates a derived unit with [standardAtmospheres] as the second unit in a product.
  f.DerivedUnit2<D, f.Pressure, I, f.InvertedPressure>
      get standardAtmospheres => f.DerivedUnit2.build(
            first,
            prefix.standardAtmospheres,
          );

  /// Creates a derived unit with [technicalAtmospheres] as the second unit in a product.
  f.DerivedUnit2<D, f.Pressure, I, f.InvertedPressure>
      get technicalAtmospheres => f.DerivedUnit2.build(
            first,
            prefix.technicalAtmospheres,
          );

  /// Creates a derived unit with [mmHg] as the second unit in a product.
  f.DerivedUnit2<D, f.Pressure, I, f.InvertedPressure> get mmHg =>
      f.DerivedUnit2.build(
        first,
        prefix.mmHg,
      );

  /// Creates a derived unit with [torr] as the second unit in a product.
  f.DerivedUnit2<D, f.Pressure, I, f.InvertedPressure> get torr =>
      f.DerivedUnit2.build(
        first,
        prefix.torr,
      );

  /// Creates a derived unit with [psi] as the second unit in a product.
  f.DerivedUnit2<D, f.Pressure, I, f.InvertedPressure> get psi =>
      f.DerivedUnit2.build(
        first,
        prefix.psi,
      );

  /// Creates a derived unit with [kelvin] as the second unit in a product.
  f.DerivedUnit2<D, f.TemperatureChange, I, f.InvertedTemperatureChange>
      get kelvin => f.DerivedUnit2.build(
            first,
            prefix.kelvin,
          );

  /// Creates a derived unit with [celcius] as the second unit in a product.
  f.DerivedUnit2<D, f.TemperatureChange, I, f.InvertedTemperatureChange>
      get celcius => f.DerivedUnit2.build(
            first,
            prefix.celcius,
          );

  /// Creates a derived unit with [celsius] as the second unit in a product.
  f.DerivedUnit2<D, f.TemperatureChange, I, f.InvertedTemperatureChange>
      get celsius => f.DerivedUnit2.build(
            first,
            prefix.celsius,
          );

  /// Creates a derived unit with [fahrenheit] as the second unit in a product.
  f.DerivedUnit2<D, f.TemperatureChange, I, f.InvertedTemperatureChange>
      get fahrenheit => f.DerivedUnit2.build(
            first,
            prefix.fahrenheit,
          );

  /// Creates a derived unit with [amperes] as the second unit in a product.
  f.DerivedUnit2<D, f.Charge, I, f.InvertedCharge> get amperes =>
      f.DerivedUnit2.build(
        first,
        prefix.amperes,
      );
}
