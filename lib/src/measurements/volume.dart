part of "../core/library.dart";

typedef Volume = f.Dimension3<f.Distance, f.Distance, f.Distance>;

typedef InvertedVolume
    = f.Dimension3<f.InvertedDistance, f.InvertedDistance, f.InvertedDistance>;

typedef VolumeUnit = DerivedUnit3<f.Distance, f.Distance, f.Distance,
    f.InvertedDistance, f.InvertedDistance, f.InvertedDistance>;

typedef InvertedVolumeUnit = DerivedUnit3<f.InvertedDistance,
    f.InvertedDistance, f.InvertedDistance, f.Distance, f.Distance, f.Distance>;

extension VolumeUnitExtension on VolumeUnit {
  InvertedVolumeUnit get inverted => InvertedVolumeUnit(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

typedef VolumeMeasurement = DerivedMeasurement3<f.Distance, f.Distance,
    f.Distance, f.InvertedDistance, f.InvertedDistance, f.InvertedDistance>;

final cbm = f.cubic(f.meters);

final liters = VolumeUnit(name: "L", unitMultiplier: 1e-3);

final teaspoons = VolumeUnit(name: "tsp", unitMultiplier: 5.9194e-6);

final tablespoons = VolumeUnit(name: "tbsp", unitMultiplier: 1.77582e-5);

final fluidOunces = VolumeUnit(name: "fl oz", unitMultiplier: 2.84131e-5);

final cups = VolumeUnit(name: "cup", unitMultiplier: 2.841306e-4);

final pints = VolumeUnit(name: "pt", unitMultiplier: 5.682613e-4);

final quarts = VolumeUnit(name: "qt", unitMultiplier: 1.1365225e-3);

final gallons = VolumeUnit(name: "gal", unitMultiplier: 4.54609e-3);

final usTeaspoons = VolumeUnit(name: "tsp", unitMultiplier: 4.9289e-6);

final usTablespoons = VolumeUnit(name: "tbsp", unitMultiplier: 1.47868e-5);

final usFluidOunces = VolumeUnit(name: "fl oz", unitMultiplier: 2.95735e-5);

final usCups = VolumeUnit(name: "cup", unitMultiplier: 2.365882e-4);

final usPints = VolumeUnit(name: "pt", unitMultiplier: 4.731765e-4);

final usQuarts = VolumeUnit(name: "qt", unitMultiplier: 9.463529e-4);

final usGallons = VolumeUnit(name: "gal", unitMultiplier: 3.7854118e-3);

extension VolumeExtensionNum on num {
  VolumeMeasurement get cbm => f.cbm(this);
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
}

extension VolumeNumExtension on f.NumExtension {
  VolumeMeasurement get cbm => f.cbm.withPrefix(prefix)(value);
  VolumeMeasurement get liters => f.liters.withPrefix(prefix)(value);
  VolumeMeasurement get teaspoons => f.teaspoons.withPrefix(prefix)(value);
  VolumeMeasurement get tablespoons => f.tablespoons.withPrefix(prefix)(value);
  VolumeMeasurement get fluidOunces => f.fluidOunces.withPrefix(prefix)(value);
  VolumeMeasurement get cups => f.cups.withPrefix(prefix)(value);
  VolumeMeasurement get pints => f.pints.withPrefix(prefix)(value);
  VolumeMeasurement get quarts => f.quarts.withPrefix(prefix)(value);
  VolumeMeasurement get gallons => f.gallons.withPrefix(prefix)(value);
  VolumeMeasurement get usTeaspoons => f.usTeaspoons.withPrefix(prefix)(value);
  VolumeMeasurement get usTablespoons =>
      f.usTablespoons.withPrefix(prefix)(value);
  VolumeMeasurement get usFluidOunces =>
      f.usFluidOunces.withPrefix(prefix)(value);
  VolumeMeasurement get usCups => f.usCups.withPrefix(prefix)(value);
  VolumeMeasurement get usPints => f.usPints.withPrefix(prefix)(value);
  VolumeMeasurement get usQuarts => f.usQuarts.withPrefix(prefix)(value);
  VolumeMeasurement get usGallons => f.usGallons.withPrefix(prefix)(value);
}

extension VolumeUnitPrefix on UnitPrefix {
  VolumeUnit get cbm => f.cbm.withPrefix(prefix);
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
}

extension PrefixedUnitPerVolume<N extends Unit<D, I>, D extends f.Dimension,
    I extends f.Dimension> on f.PrefixedUnitPer<N, D, I> {
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get cbm =>
      build(prefix.cbm.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get liter =>
      build(prefix.liters.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get teaspoon =>
      build(prefix.teaspoons.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get tablespoon =>
      build(prefix.tablespoons.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get fluidOunce =>
      build(prefix.fluidOunces.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get cup =>
      build(prefix.cups.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get pint =>
      build(prefix.pints.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get quart =>
      build(prefix.quarts.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get gallon =>
      build(prefix.gallons.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get usTeaspoon =>
      build(prefix.usTeaspoons.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get usTablespoon =>
      build(prefix.usTablespoons.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get usFluidOunce =>
      build(prefix.usFluidOunces.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get usCup =>
      build(prefix.usCups.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get usPint =>
      build(prefix.usPints.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get usQuart =>
      build(prefix.usQuarts.inverted);
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get usGallon =>
      build(prefix.usGallons.inverted);
}

extension VolumeMeasurementPer<
    N extends Measurement<D, I>,
    D extends f.Dimension,
    I extends f.Dimension> on PrefixedMeasurementPer<N, D, I> {
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get cbm =>
      DerivedUnit2.build(numerator.defaultUnit,
          f.cbm.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get liter =>
      DerivedUnit2.build(numerator.defaultUnit,
          liters.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get teaspoon =>
      DerivedUnit2.build(numerator.defaultUnit,
          teaspoons.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get tablespoon =>
      DerivedUnit2.build(numerator.defaultUnit,
          tablespoons.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get fluidOunce =>
      DerivedUnit2.build(numerator.defaultUnit,
          fluidOunces.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get cup =>
      DerivedUnit2.build(numerator.defaultUnit,
          cups.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get pint =>
      DerivedUnit2.build(numerator.defaultUnit,
          pints.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get quart =>
      DerivedUnit2.build(numerator.defaultUnit,
          quarts.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get gallon =>
      DerivedUnit2.build(numerator.defaultUnit,
          gallons.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usTeaspoon =>
      DerivedUnit2.build(numerator.defaultUnit,
          usTeaspoons.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usTablespoon =>
      DerivedUnit2.build(numerator.defaultUnit,
          usTablespoons.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usFluidOunce =>
      DerivedUnit2.build(numerator.defaultUnit,
          usFluidOunces.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usCup =>
      DerivedUnit2.build(numerator.defaultUnit,
          usCups.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usPint =>
      DerivedUnit2.build(numerator.defaultUnit,
          usPints.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usQuart =>
      DerivedUnit2.build(numerator.defaultUnit,
          usQuarts.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usGallon =>
      DerivedUnit2.build(numerator.defaultUnit,
          usGallons.withPrefix(prefix).inverted)(numerator.defaultValue);
}

extension PrefixedUnitDotVolume<N extends Unit<D, I>, D extends f.Dimension,
    I extends f.Dimension> on f.PrefixedUnitDot<N, D, I> {
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get cbm =>
      f.DerivedUnit2.build(initial, f.cbm.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get liter =>
      f.DerivedUnit2.build(initial, liters.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get teaspoon =>
      f.DerivedUnit2.build(initial, teaspoons.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get tablespoon =>
      f.DerivedUnit2.build(initial, tablespoons.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get fluidOunce =>
      f.DerivedUnit2.build(initial, fluidOunces.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get cup =>
      f.DerivedUnit2.build(initial, cups.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get pint =>
      f.DerivedUnit2.build(initial, pints.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get quart =>
      f.DerivedUnit2.build(initial, quarts.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get gallon =>
      f.DerivedUnit2.build(initial, gallons.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usTeaspoon =>
      f.DerivedUnit2.build(initial, usTeaspoons.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usTablespoon =>
      f.DerivedUnit2.build(initial, usTablespoons.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usFluidOunce =>
      f.DerivedUnit2.build(initial, usFluidOunces.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usCup =>
      f.DerivedUnit2.build(initial, usCups.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usPint =>
      f.DerivedUnit2.build(initial, usPints.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usQuart =>
      f.DerivedUnit2.build(initial, usQuarts.withPrefix(prefix));
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usGallon =>
      f.DerivedUnit2.build(initial, usGallons.withPrefix(prefix));
}

extension VolumeMeasurementDot<
    N extends Measurement<D, I>,
    D extends f.Dimension,
    I extends f.Dimension> on PrefixedMeasurementDot<N, D, I> {
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get cbm =>
      DerivedUnit2.build(initial.defaultUnit, f.cbm.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get liter =>
      DerivedUnit2.build(initial.defaultUnit, liters.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get teaspoon =>
      DerivedUnit2.build(initial.defaultUnit, teaspoons.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get tablespoon =>
      DerivedUnit2.build(initial.defaultUnit, tablespoons.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get fluidOunce =>
      DerivedUnit2.build(initial.defaultUnit, fluidOunces.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get cup =>
      DerivedUnit2.build(initial.defaultUnit, cups.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get pint =>
      DerivedUnit2.build(initial.defaultUnit, pints.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get quart =>
      DerivedUnit2.build(initial.defaultUnit, quarts.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get gallon =>
      DerivedUnit2.build(initial.defaultUnit, gallons.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usTeaspoon =>
      DerivedUnit2.build(initial.defaultUnit, usTeaspoons)(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usTablespoon =>
      DerivedUnit2.build(initial.defaultUnit, usTablespoons.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usFluidOunce =>
      DerivedUnit2.build(initial.defaultUnit, usFluidOunces.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usCup =>
      DerivedUnit2.build(initial.defaultUnit, usCups.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usPint =>
      DerivedUnit2.build(initial.defaultUnit, usPints.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usQuart =>
      DerivedUnit2.build(initial.defaultUnit, usQuarts.withPrefix(prefix))(
          initial.defaultValue);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usGallon =>
      DerivedUnit2.build(initial.defaultUnit, usGallons.withPrefix(prefix))(
          initial.defaultValue);
}
