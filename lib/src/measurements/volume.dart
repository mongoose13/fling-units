part of "../core/library.dart";

typedef VolumeDimension = f.Dimension3<f.UnitNumerator<f.Distance>,
    f.UnitNumerator<f.Distance>, f.UnitNumerator<f.Distance>>;

typedef VolumeUnit = f.DerivedUnit3<
    UnitNumerator<f.Distance>,
    UnitNumerator<f.Distance>,
    UnitNumerator<f.Distance>,
    f.Distance,
    f.Distance,
    f.Distance>;

typedef VolumeMeasurement = f.Measurement<VolumeDimension>;

final VolumeUnit liters = f.DerivedUnit3(name: "L", unitMultiplier: 1e3);

final VolumeUnit teaspoons =
    f.DerivedUnit3(name: "tsp", unitMultiplier: 168936);

final VolumeUnit tablespoons =
    f.DerivedUnit3(name: "tbsp", unitMultiplier: 56312);

final VolumeUnit fluidOunces =
    f.DerivedUnit3(name: "fl oz", unitMultiplier: 35195.1);

final VolumeUnit cups = f.DerivedUnit3(name: "cup", unitMultiplier: 3519.51);

final VolumeUnit pints = f.DerivedUnit3(name: "pt", unitMultiplier: 1759.75);

final VolumeUnit quarts = f.DerivedUnit3(name: "qt", unitMultiplier: 879.877);

final VolumeUnit gallons = f.DerivedUnit3(name: "gal", unitMultiplier: 219.969);

final VolumeUnit usTeaspoons =
    f.DerivedUnit3(name: "tsp", unitMultiplier: 202884);

final VolumeUnit usTablespoons =
    f.DerivedUnit3(name: "tbsp", unitMultiplier: 67628);

final VolumeUnit usFluidOunces =
    f.DerivedUnit3(name: "fl oz", unitMultiplier: 33814);

final VolumeUnit usCups = f.DerivedUnit3(name: "cup", unitMultiplier: 4226.76);

final VolumeUnit usPints = f.DerivedUnit3(name: "pt", unitMultiplier: 2113.38);

final VolumeUnit usQuarts = f.DerivedUnit3(name: "qt", unitMultiplier: 1056.69);

final VolumeUnit usGallons =
    f.DerivedUnit3(name: "gal", unitMultiplier: 264.172);

final VolumeUnit usLegalCups =
    f.DerivedUnit3(name: "legal cup", unitMultiplier: 4166.67);

extension VolumeExtensionNum on num {
  VolumeMeasurement get liters => f.liters(this);
  VolumeMeasurement get teaspoons => f.teaspoons(this);
  VolumeMeasurement get tablespoons => f.tablespoons(this);
  VolumeMeasurement get fluidOunces => f.fluidOunces(this);
  VolumeMeasurement get cups => f.cups(this);
  VolumeMeasurement get pints => f.pints(this);
  VolumeMeasurement get quarts => f.quarts(this);
  VolumeMeasurement get gallons => f.gallons(this);
  VolumeMeasurement get usTeaspoons => f.usTeaspoons(this);
  VolumeMeasurement get usTablespoons => f.usTablespoons(this);
  VolumeMeasurement get usFluidOunces => f.usFluidOunces(this);
  VolumeMeasurement get usCups => f.usCups(this);
  VolumeMeasurement get usPints => f.usPints(this);
  VolumeMeasurement get usQuarts => f.usQuarts(this);
  VolumeMeasurement get usGallons => f.usGallons(this);
  VolumeMeasurement get usLegalCups => f.usLegalCups(this);
}

extension VolumeNumExtension on f.NumExtension {
  VolumeMeasurement get liters => f.liters.withPrefix(_prefix)(_value);
  VolumeMeasurement get teaspoons => f.teaspoons.withPrefix(_prefix)(_value);
  VolumeMeasurement get tablespoons =>
      f.tablespoons.withPrefix(_prefix)(_value);
  VolumeMeasurement get fluidOunces =>
      f.fluidOunces.withPrefix(_prefix)(_value);
  VolumeMeasurement get cups => f.cups.withPrefix(_prefix)(_value);
  VolumeMeasurement get pints => f.pints.withPrefix(_prefix)(_value);
  VolumeMeasurement get quarts => f.quarts.withPrefix(_prefix)(_value);
  VolumeMeasurement get gallons => f.gallons.withPrefix(_prefix)(_value);
  VolumeMeasurement get usTeaspoons =>
      f.usTeaspoons.withPrefix(_prefix)(_value);
  VolumeMeasurement get usTablespoons =>
      f.usTablespoons.withPrefix(_prefix)(_value);
  VolumeMeasurement get usFluidOunces =>
      f.usFluidOunces.withPrefix(_prefix)(_value);
  VolumeMeasurement get usCups => f.usCups.withPrefix(_prefix)(_value);
  VolumeMeasurement get usPints => f.usPints.withPrefix(_prefix)(_value);
  VolumeMeasurement get usQuarts => f.usQuarts.withPrefix(_prefix)(_value);
  VolumeMeasurement get usGallons => f.usGallons.withPrefix(_prefix)(_value);
  VolumeMeasurement get usLegalCups =>
      f.usLegalCups.withPrefix(_prefix)(_value);
}

extension VolumeMeasurementPrefix on MeasurementPrefix {
  VolumeUnit get liters => f.liters.withPrefix(prefix);
  VolumeUnit get teaspoons => f.teaspoons.withPrefix(prefix);
  VolumeUnit get tablespoons => f.tablespoons.withPrefix(prefix);
  VolumeUnit get fluidOunces => f.fluidOunces.withPrefix(prefix);
  VolumeUnit get cups => f.cups.withPrefix(prefix);
  VolumeUnit get pints => f.pints.withPrefix(prefix);
  VolumeUnit get quarts => f.quarts.withPrefix(prefix);
  VolumeUnit get gallons => f.gallons.withPrefix(prefix);
  VolumeUnit get usTeaspoons => f.usTeaspoons.withPrefix(prefix);
  VolumeUnit get usTablespoons => f.usTablespoons.withPrefix(prefix);
  VolumeUnit get usFluidOunces => f.usFluidOunces.withPrefix(prefix);
  VolumeUnit get usCups => f.usCups.withPrefix(prefix);
  VolumeUnit get usPints => f.usPints.withPrefix(prefix);
  VolumeUnit get usQuarts => f.usQuarts.withPrefix(prefix);
  VolumeUnit get usGallons => f.usGallons.withPrefix(prefix);
  VolumeUnit get usLegalCups => f.usLegalCups.withPrefix(prefix);
}

extension VolumeUnitPer<N extends Unit<D>, D extends Dimension>
    on PrefixedUnitPer<N, D> {
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get liter => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(liters.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get teaspoon => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(teaspoons.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get tablespoon => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(tablespoons.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get fluidOunce => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(fluidOunces.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get cup => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(cups.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get pint => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(pints.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get quart => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(quarts.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get gallon => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(gallons.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get usTeaspoon => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(usTeaspoons.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get usTablespoon => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(usTablespoons.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get usFluidOunce => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(usFluidOunces.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get usCup => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(usCups.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get usPint => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(usPints.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get usQuart => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(usQuarts.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get usGallon => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(usGallons.withPrefix(prefix)));
  f.DerivedUnit2<UnitNumerator<D>, UnitDenominator<VolumeDimension>, D,
          VolumeDimension>
      get usLegalCup => f.DerivedUnit2.build(f.UnitNumerator(numerator),
          f.UnitDenominator(usLegalCups.withPrefix(prefix)));
}

extension VolumeMeasurementPer<N extends Measurement<D>, D extends Dimension>
    on PrefixedMeasurementPer<N, D> {
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get liter => ratio(numerator.defaultUnit, liters)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get teaspoon =>
          ratio(numerator.defaultUnit, teaspoons)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get tablespoon =>
          ratio(numerator.defaultUnit, tablespoons)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get fluidOunce =>
          ratio(numerator.defaultUnit, fluidOunces)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get cup => ratio(numerator.defaultUnit, cups)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get pint => ratio(numerator.defaultUnit, pints)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get quart => ratio(numerator.defaultUnit, quarts)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get gallon =>
          ratio(numerator.defaultUnit, gallons)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get usTeaspoon =>
          ratio(numerator.defaultUnit, usTeaspoons)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get usTablespoon =>
          ratio(numerator.defaultUnit, usTablespoons)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get usFluidOunce =>
          ratio(numerator.defaultUnit, usFluidOunces)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get usCup => ratio(numerator.defaultUnit, usCups)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get usPint =>
          ratio(numerator.defaultUnit, usPints)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get usQuart =>
          ratio(numerator.defaultUnit, usQuarts)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get usGallon =>
          ratio(numerator.defaultUnit, usGallons)(numerator.defaultValue);
  f.Measurement<
          f.Dimension2<f.UnitNumerator<D>, f.UnitDenominator<VolumeDimension>>>
      get usLegalCup =>
          ratio(numerator.defaultUnit, usLegalCups)(numerator.defaultValue);
}
