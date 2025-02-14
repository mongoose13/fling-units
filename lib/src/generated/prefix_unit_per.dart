// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:fling_units/src/core/library.dart';

class PrefixedUnitPer<N extends f.Unit<D>, D extends f.Dimension> {
  PrefixedUnitPer(
    this.numerator, {
    this.prefix = const MeasurementPrefix.unit(),
  });

  final N numerator;

  final MeasurementPrefix prefix;

  /// Creates a derived unit with [turns] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>, D, f.Angle>
      get turn => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.turns),
          );

  /// Creates a derived unit with [radians] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>, D, f.Angle>
      get radian => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.radians),
          );

  /// Creates a derived unit with [gradians] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>, D, f.Angle>
      get gradian => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.gradians),
          );

  /// Creates a derived unit with [degrees] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>, D, f.Angle>
      get degree => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.degrees),
          );

  /// Creates a derived unit with [arcMinutes] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>, D, f.Angle>
      get arcMinute => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.arcMinutes),
          );

  /// Creates a derived unit with [arcSeconds] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Angle>, D, f.Angle>
      get arcSecond => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.arcSeconds),
          );

  /// Creates a derived unit with [candela] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Luminosity>, D, f.Luminosity>
      get candela => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.candela),
          );

  /// Creates a derived unit with [candlepower] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Luminosity>, D, f.Luminosity>
      get candlepower => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.candlepower),
          );

  /// Creates a derived unit with [hefnerkerze] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Luminosity>, D, f.Luminosity>
      get hefnerkerze => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.hefnerkerze),
          );

  /// Creates a derived unit with [grams] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>, D, f.Mass>
      get gram => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.grams),
          );

  /// Creates a derived unit with [tonnes] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>, D, f.Mass>
      get tonne => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.tonnes),
          );

  /// Creates a derived unit with [atomicMassUnits] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>, D, f.Mass>
      get atomicMassUnit => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.atomicMassUnits),
          );

  /// Creates a derived unit with [daltons] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>, D, f.Mass>
      get dalton => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.daltons),
          );

  /// Creates a derived unit with [electronRestMass] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>, D, f.Mass>
      get electronRestMass => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.electronRestMass),
          );

  /// Creates a derived unit with [longTons] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>, D, f.Mass>
      get longTon => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.longTons),
          );

  /// Creates a derived unit with [shortTons] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>, D, f.Mass>
      get shortTon => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.shortTons),
          );

  /// Creates a derived unit with [pounds] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>, D, f.Mass>
      get pound => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.pounds),
          );

  /// Creates a derived unit with [ounces] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Mass>, D, f.Mass>
      get ounce => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.ounces),
          );

  /// Creates a derived unit with [seconds] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Time>, D, f.Time>
      get second => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.seconds),
          );

  /// Creates a derived unit with [minutes] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Time>, D, f.Time>
      get minute => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.minutes),
          );

  /// Creates a derived unit with [hours] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Time>, D, f.Time>
      get hour => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.hours),
          );

  /// Creates a derived unit with [days] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Time>, D, f.Time>
      get day => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.days),
          );

  /// Creates a derived unit with [meters] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Distance>, D, f.Distance>
      get meter => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.meters),
          );

  /// Creates a derived unit with [miles] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Distance>, D, f.Distance>
      get mile => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.miles),
          );

  /// Creates a derived unit with [yards] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Distance>, D, f.Distance>
      get yard => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.yards),
          );

  /// Creates a derived unit with [feet] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Distance>, D, f.Distance>
      get foot => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.feet),
          );

  /// Creates a derived unit with [inches] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Distance>, D, f.Distance>
      get inch => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.inches),
          );

  /// Creates a derived unit with [nauticalMiles] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Distance>, D, f.Distance>
      get nauticalMile => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.nauticalMiles),
          );

  /// Creates a derived unit with [units] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Quantity>, D, f.Quantity>
      get unit => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.units),
          );

  /// Creates a derived unit with [moles] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Quantity>, D, f.Quantity>
      get mole => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.moles),
          );

  /// Creates a derived unit with [pascals] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Pressure>, D, f.Pressure>
      get pascal => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.pascals),
          );

  /// Creates a derived unit with [bars] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Pressure>, D, f.Pressure>
      get bar => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.bars),
          );

  /// Creates a derived unit with [baryes] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Pressure>, D, f.Pressure>
      get barye => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.baryes),
          );

  /// Creates a derived unit with [standardAtmospheres] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Pressure>, D, f.Pressure>
      get standardAtmosphere => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.standardAtmospheres),
          );

  /// Creates a derived unit with [technicalAtmospheres] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Pressure>, D, f.Pressure>
      get technicalAtmosphere => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.technicalAtmospheres),
          );

  /// Creates a derived unit with [mmHg] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Pressure>, D, f.Pressure>
      get mmHg => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.mmHg),
          );

  /// Creates a derived unit with [inHg] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Pressure>, D, f.Pressure>
      get inHg => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.inHg),
          );

  /// Creates a derived unit with [torr] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Pressure>, D, f.Pressure>
      get torr => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.torr),
          );

  /// Creates a derived unit with [psi] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.Pressure>, D, f.Pressure>
      get psi => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.psi),
          );

  /// Creates a derived unit with [kelvin] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.TemperatureChange>, D, f.TemperatureChange>
      get kelvin => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.kelvin),
          );

  /// Creates a derived unit with [celcius] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.TemperatureChange>, D, f.TemperatureChange>
      get celcius => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.celcius),
          );

  /// Creates a derived unit with [fahrenheit] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitDenominator<f.TemperatureChange>, D, f.TemperatureChange>
      get fahrenheit => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.fahrenheit),
          );

  /// Creates a derived unit with [amperes] as the denominator.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.Charge>, D, f.Charge>
      get ampere => f.DerivedUnit2.build(
            f.UnitNumerator(numerator),
            f.UnitDenominator(prefix.amperes),
          );
}

class PrefixedUnitDot<N extends f.Unit<D>, D extends f.Dimension> {
  PrefixedUnitDot(
    this.first, {
    this.prefix = const MeasurementPrefix.unit(),
  });

  final N first;

  final MeasurementPrefix prefix;

  /// Creates a derived unit with [turns] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Angle>, D, f.Angle>
      get turns => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.turns),
          );

  /// Creates a derived unit with [radians] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Angle>, D, f.Angle>
      get radians => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.radians),
          );

  /// Creates a derived unit with [gradians] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Angle>, D, f.Angle>
      get gradians => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.gradians),
          );

  /// Creates a derived unit with [degrees] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Angle>, D, f.Angle>
      get degrees => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.degrees),
          );

  /// Creates a derived unit with [arcMinutes] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Angle>, D, f.Angle>
      get arcMinutes => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.arcMinutes),
          );

  /// Creates a derived unit with [arcSeconds] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Angle>, D, f.Angle>
      get arcSeconds => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.arcSeconds),
          );

  /// Creates a derived unit with [candela] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitNumerator<f.Luminosity>, D, f.Luminosity>
      get candela => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.candela),
          );

  /// Creates a derived unit with [candlepower] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitNumerator<f.Luminosity>, D, f.Luminosity>
      get candlepower => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.candlepower),
          );

  /// Creates a derived unit with [hefnerkerze] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitNumerator<f.Luminosity>, D, f.Luminosity>
      get hefnerkerze => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.hefnerkerze),
          );

  /// Creates a derived unit with [grams] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Mass>, D, f.Mass>
      get grams => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.grams),
          );

  /// Creates a derived unit with [tonnes] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Mass>, D, f.Mass>
      get tonnes => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.tonnes),
          );

  /// Creates a derived unit with [atomicMassUnits] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Mass>, D, f.Mass>
      get atomicMassUnits => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.atomicMassUnits),
          );

  /// Creates a derived unit with [daltons] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Mass>, D, f.Mass>
      get daltons => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.daltons),
          );

  /// Creates a derived unit with [electronRestMass] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Mass>, D, f.Mass>
      get electronRestMass => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.electronRestMass),
          );

  /// Creates a derived unit with [longTons] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Mass>, D, f.Mass>
      get longTons => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.longTons),
          );

  /// Creates a derived unit with [shortTons] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Mass>, D, f.Mass>
      get shortTons => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.shortTons),
          );

  /// Creates a derived unit with [pounds] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Mass>, D, f.Mass>
      get pounds => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.pounds),
          );

  /// Creates a derived unit with [ounces] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Mass>, D, f.Mass>
      get ounces => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.ounces),
          );

  /// Creates a derived unit with [seconds] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Time>, D, f.Time>
      get seconds => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.seconds),
          );

  /// Creates a derived unit with [minutes] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Time>, D, f.Time>
      get minutes => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.minutes),
          );

  /// Creates a derived unit with [hours] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Time>, D, f.Time>
      get hours => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.hours),
          );

  /// Creates a derived unit with [days] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Time>, D, f.Time>
      get days => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.days),
          );

  /// Creates a derived unit with [meters] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Distance>, D, f.Distance>
      get meters => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.meters),
          );

  /// Creates a derived unit with [miles] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Distance>, D, f.Distance>
      get miles => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.miles),
          );

  /// Creates a derived unit with [yards] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Distance>, D, f.Distance>
      get yards => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.yards),
          );

  /// Creates a derived unit with [feet] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Distance>, D, f.Distance>
      get feet => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.feet),
          );

  /// Creates a derived unit with [inches] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Distance>, D, f.Distance>
      get inches => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.inches),
          );

  /// Creates a derived unit with [nauticalMiles] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Distance>, D, f.Distance>
      get nauticalMiles => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.nauticalMiles),
          );

  /// Creates a derived unit with [units] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Quantity>, D, f.Quantity>
      get units => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.units),
          );

  /// Creates a derived unit with [moles] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Quantity>, D, f.Quantity>
      get moles => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.moles),
          );

  /// Creates a derived unit with [pascals] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Pressure>, D, f.Pressure>
      get pascals => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.pascals),
          );

  /// Creates a derived unit with [bars] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Pressure>, D, f.Pressure>
      get bars => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.bars),
          );

  /// Creates a derived unit with [baryes] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Pressure>, D, f.Pressure>
      get baryes => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.baryes),
          );

  /// Creates a derived unit with [standardAtmospheres] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Pressure>, D, f.Pressure>
      get standardAtmospheres => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.standardAtmospheres),
          );

  /// Creates a derived unit with [technicalAtmospheres] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Pressure>, D, f.Pressure>
      get technicalAtmospheres => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.technicalAtmospheres),
          );

  /// Creates a derived unit with [mmHg] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Pressure>, D, f.Pressure>
      get mmHg => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.mmHg),
          );

  /// Creates a derived unit with [inHg] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Pressure>, D, f.Pressure>
      get inHg => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.inHg),
          );

  /// Creates a derived unit with [torr] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Pressure>, D, f.Pressure>
      get torr => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.torr),
          );

  /// Creates a derived unit with [psi] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Pressure>, D, f.Pressure>
      get psi => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.psi),
          );

  /// Creates a derived unit with [kelvin] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitNumerator<f.TemperatureChange>, D, f.TemperatureChange>
      get kelvin => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.kelvin),
          );

  /// Creates a derived unit with [celcius] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitNumerator<f.TemperatureChange>, D, f.TemperatureChange>
      get celcius => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.celcius),
          );

  /// Creates a derived unit with [fahrenheit] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>,
          f.UnitNumerator<f.TemperatureChange>, D, f.TemperatureChange>
      get fahrenheit => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.fahrenheit),
          );

  /// Creates a derived unit with [amperes] as the second unit in a product.
  f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.Charge>, D, f.Charge>
      get amperes => f.DerivedUnit2.build(
            f.UnitNumerator(first),
            f.UnitNumerator(prefix.amperes),
          );
}
