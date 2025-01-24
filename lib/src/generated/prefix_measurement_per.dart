// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:fling_units/src/core/library.dart';

class PrefixedMeasurementPer<N extends f.Measurement<D>,
    D extends f.Dimension> {
  PrefixedMeasurementPer(
    this.numerator, {
    this.prefix = const MeasurementPrefix.unit(),
  });

  final N numerator;

  final MeasurementPrefix prefix;

  /// Creates a derived measurement with [turns] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>>>
      get turn => ratio(numerator.defaultUnit, f.turns)(numerator.defaultValue);

  /// Creates a derived measurement with [radians] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>>>
      get radian =>
          ratio(numerator.defaultUnit, f.radians)(numerator.defaultValue);

  /// Creates a derived measurement with [gradians] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>>>
      get gradian =>
          ratio(numerator.defaultUnit, f.gradians)(numerator.defaultValue);

  /// Creates a derived measurement with [degrees] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>>>
      get degree =>
          ratio(numerator.defaultUnit, f.degrees)(numerator.defaultValue);

  /// Creates a derived measurement with [arcMinutes] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>>>
      get arcMinute =>
          ratio(numerator.defaultUnit, f.arcMinutes)(numerator.defaultValue);

  /// Creates a derived measurement with [arcSeconds] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>>>
      get arcSecond =>
          ratio(numerator.defaultUnit, f.arcSeconds)(numerator.defaultValue);

  /// Creates a derived measurement with [seconds] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Time>>>
      get second =>
          ratio(numerator.defaultUnit, f.seconds)(numerator.defaultValue);

  /// Creates a derived measurement with [minutes] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Time>>>
      get minute =>
          ratio(numerator.defaultUnit, f.minutes)(numerator.defaultValue);

  /// Creates a derived measurement with [hours] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Time>>>
      get hour => ratio(numerator.defaultUnit, f.hours)(numerator.defaultValue);

  /// Creates a derived measurement with [days] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Time>>>
      get day => ratio(numerator.defaultUnit, f.days)(numerator.defaultValue);

  /// Creates a derived measurement with [units] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Quantity>>>
      get unit => ratio(numerator.defaultUnit, f.units)(numerator.defaultValue);

  /// Creates a derived measurement with [moles] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Quantity>>>
      get mole => ratio(numerator.defaultUnit, f.moles)(numerator.defaultValue);

  /// Creates a derived measurement with [grams] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>>>
      get gram => ratio(numerator.defaultUnit, f.grams)(numerator.defaultValue);

  /// Creates a derived measurement with [tonnes] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>>>
      get tonne =>
          ratio(numerator.defaultUnit, f.tonnes)(numerator.defaultValue);

  /// Creates a derived measurement with [atomicMassUnits] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>>>
      get atomicMassUnit => ratio(numerator.defaultUnit, f.atomicMassUnits)(
          numerator.defaultValue);

  /// Creates a derived measurement with [daltons] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>>>
      get dalton =>
          ratio(numerator.defaultUnit, f.daltons)(numerator.defaultValue);

  /// Creates a derived measurement with [electronRestMass] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>>>
      get electronRestMass => ratio(numerator.defaultUnit, f.electronRestMass)(
          numerator.defaultValue);

  /// Creates a derived measurement with [longTons] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>>>
      get longTon =>
          ratio(numerator.defaultUnit, f.longTons)(numerator.defaultValue);

  /// Creates a derived measurement with [shortTons] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>>>
      get shortTon =>
          ratio(numerator.defaultUnit, f.shortTons)(numerator.defaultValue);

  /// Creates a derived measurement with [pounds] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>>>
      get pound =>
          ratio(numerator.defaultUnit, f.pounds)(numerator.defaultValue);

  /// Creates a derived measurement with [ounces] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>>>
      get ounce =>
          ratio(numerator.defaultUnit, f.ounces)(numerator.defaultValue);

  /// Creates a derived measurement with [meters] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Distance>>>
      get meter =>
          ratio(numerator.defaultUnit, f.meters)(numerator.defaultValue);

  /// Creates a derived measurement with [miles] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Distance>>>
      get mile => ratio(numerator.defaultUnit, f.miles)(numerator.defaultValue);

  /// Creates a derived measurement with [yards] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Distance>>>
      get yard => ratio(numerator.defaultUnit, f.yards)(numerator.defaultValue);

  /// Creates a derived measurement with [feet] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Distance>>>
      get foot => ratio(numerator.defaultUnit, f.feet)(numerator.defaultValue);

  /// Creates a derived measurement with [inches] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Distance>>>
      get inch =>
          ratio(numerator.defaultUnit, f.inches)(numerator.defaultValue);

  /// Creates a derived measurement with [nauticalMiles] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Distance>>>
      get nauticalMile =>
          ratio(numerator.defaultUnit, f.nauticalMiles)(numerator.defaultValue);

  /// Creates a derived measurement with [amperes] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Charge>>>
      get ampere =>
          ratio(numerator.defaultUnit, f.amperes)(numerator.defaultValue);

  /// Creates a derived measurement with [kelvin] as the denominator.
  f.Measurement<
      f.Dimension2<f.UnitNumerator<D>,
          f.UnitDenominator<f.TemperatureChange>>> get kelvin =>
      ratio(numerator.defaultUnit, f.kelvin)(numerator.defaultValue);

  /// Creates a derived measurement with [celcius] as the denominator.
  f.Measurement<
      f.Dimension2<f.UnitNumerator<D>,
          f.UnitDenominator<f.TemperatureChange>>> get celcius =>
      ratio(numerator.defaultUnit, f.celcius)(numerator.defaultValue);

  /// Creates a derived measurement with [fahrenheit] as the denominator.
  f.Measurement<
      f.Dimension2<f.UnitNumerator<D>,
          f.UnitDenominator<f.TemperatureChange>>> get fahrenheit =>
      ratio(numerator.defaultUnit, f.fahrenheit)(numerator.defaultValue);

  /// Creates a derived measurement with [pascals] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Pressure>>>
      get pascal =>
          ratio(numerator.defaultUnit, f.pascals)(numerator.defaultValue);

  /// Creates a derived measurement with [bars] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Pressure>>>
      get bar => ratio(numerator.defaultUnit, f.bars)(numerator.defaultValue);

  /// Creates a derived measurement with [baryes] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Pressure>>>
      get barye =>
          ratio(numerator.defaultUnit, f.baryes)(numerator.defaultValue);

  /// Creates a derived measurement with [standardAtmospheres] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Pressure>>>
      get standardAtmosphere => ratio(
          numerator.defaultUnit, f.standardAtmospheres)(numerator.defaultValue);

  /// Creates a derived measurement with [technicalAtmospheres] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Pressure>>>
      get technicalAtmosphere =>
          ratio(numerator.defaultUnit, f.technicalAtmospheres)(
              numerator.defaultValue);

  /// Creates a derived measurement with [mmHg] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Pressure>>>
      get mmHg => ratio(numerator.defaultUnit, f.mmHg)(numerator.defaultValue);

  /// Creates a derived measurement with [inHg] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Pressure>>>
      get inHg => ratio(numerator.defaultUnit, f.inHg)(numerator.defaultValue);

  /// Creates a derived measurement with [torr] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Pressure>>>
      get torr => ratio(numerator.defaultUnit, f.torr)(numerator.defaultValue);

  /// Creates a derived measurement with [psi] as the denominator.
  f.Measurement<f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Pressure>>>
      get psi => ratio(numerator.defaultUnit, f.psi)(numerator.defaultValue);

  /// Creates a derived measurement with [candela] as the denominator.
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Luminosity>>>
      get candela =>
          ratio(numerator.defaultUnit, f.candela)(numerator.defaultValue);

  /// Creates a derived measurement with [candlepower] as the denominator.
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Luminosity>>>
      get candlepower =>
          ratio(numerator.defaultUnit, f.candlepower)(numerator.defaultValue);

  /// Creates a derived measurement with [hefnerkerze] as the denominator.
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<f.Luminosity>>>
      get hefnerkerze =>
          ratio(numerator.defaultUnit, f.hefnerkerze)(numerator.defaultValue);
}
