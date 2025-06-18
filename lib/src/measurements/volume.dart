// part of "../core/library.dart";

// Make a standard unit, and extend as needed to convert to Derived3?

import 'package:fling_units/src/generator/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;
import 'package:fling_units/src/core/library.dart';

part "../generated/volume.dart";

@DimensionConfig(name: "Volume")
enum VolumeConfig {
  @UnitConfig(
    shortName: "cbm",
    singularName: "cbm",
    multiplier: 1e0,
    isSI: true,
  )
  cbm,

  @UnitConfig(
    shortName: "L",
    singularName: "liter",
    multiplier: 1e-3,
  )
  liters,

  @UnitConfig(
    shortName: "tsp",
    singularName: "teaspoon",
    multiplier: 5.9194e-6,
  )
  teaspoons,

  @UnitConfig(
    shortName: "tbsp",
    singularName: "tablespoon",
    multiplier: 1.77582e-5,
  )
  tablespoons,

  @UnitConfig(
    shortName: "fl oz",
    singularName: "fluidOunce",
    multiplier: 2.84131e-5,
  )
  fluidOunces,

  @UnitConfig(
    shortName: "cup",
    singularName: "cup",
    multiplier: 2.841306e-4,
  )
  cups,

  @UnitConfig(
    shortName: "pt",
    singularName: "pint",
    multiplier: 5.682613e-4,
  )
  pints,

  @UnitConfig(
    shortName: "qt",
    singularName: "quart",
    multiplier: 1.1365225e-3,
  )
  quarts,

  @UnitConfig(
    shortName: "gal",
    singularName: "gallon",
    multiplier: 4.54609e-3,
  )
  gallons,

  @UnitConfig(
    shortName: "tsp",
    singularName: "usTeaspoon",
    multiplier: 4.9289e-6,
  )
  usTeaspoons,

  @UnitConfig(
    shortName: "tbsp",
    singularName: "usTablespoon",
    multiplier: 1.47868e-5,
  )
  usTablespoons,

  @UnitConfig(
    shortName: "fl oz",
    singularName: "usFluidOunce",
    multiplier: 2.95735e-5,
  )
  usFluidOunces,

  @UnitConfig(
    shortName: "cup",
    singularName: "usCup",
    multiplier: 2.365882e-4,
  )
  usCups,

  @UnitConfig(
    shortName: "pt",
    singularName: "usPint",
    multiplier: 4.731765e-4,
  )
  usPints,

  @UnitConfig(
    shortName: "qt",
    singularName: "usQuart",
    multiplier: 9.463529e-4,
  )
  usQuarts,

  @UnitConfig(
    shortName: "gal",
    singularName: "usGallon",
    multiplier: 3.7854118e-3,
  )
  usGallons;
}

typedef VolumeDerivedUnit = DerivedUnit3<f.Distance, f.Distance, f.Distance,
    f.InvertedDistance, f.InvertedDistance, f.InvertedDistance>;

typedef VolumeDerivedMeasurement = DerivedMeasurement3<f.Distance, f.Distance,
    f.Distance, f.InvertedDistance, f.InvertedDistance, f.InvertedDistance>;

extension VM on VolumeMeasurement {
  VolumeDerivedMeasurement butAsDerived(VolumeDerivedUnit unit) =>
      f.DerivedMeasurement3(
        magnitude: unit.fromSI(si),
        precision: precision,
        defaultUnit: unit,
      );

  double asDerived(VolumeDerivedUnit unit) => unit.fromSI(precision.apply(si));
}

extension VME on VolumeDerivedMeasurement {
  VolumeMeasurement butAsConsolidated(VolumeUnit unit) =>
      VolumeMeasurement(unit.fromSI(si), unit, precision: precision);
  double asConsolidated(VolumeUnit unit) => unit.fromSI(precision.apply(si));
}

///////////////////
/*

typedef Volume = f.Dimension3<f.Distance, f.Distance, f.Distance>;

typedef InvertedVolume
    = f.Dimension3<f.InvertedDistance, f.InvertedDistance, f.InvertedDistance>;

typedef VolumeUnit = DerivedUnit3<f.Distance, f.Distance, f.Distance,
    f.InvertedDistance, f.InvertedDistance, f.InvertedDistance>;

typedef InvertedVolumeUnit = DerivedUnit3<f.InvertedDistance,
    f.InvertedDistance, f.InvertedDistance, f.Distance, f.Distance, f.Distance>;

extension VolumeUnitExtension on VolumeUnit {
  InvertedVolumeUnit get inverted => InvertedVolumeUnit(
        unit1.inverted,
        unit2.inverted,
        unit3.inverted,
        name: "$name⁻¹",
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
    I extends f.Dimension> on f.PrefixedUnitPer2<D, I> {
  f.DerivedUnit2<D, InvertedVolume, I, Volume> get cbm => build(f.cbm);

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

extension VolumeMeasurementPer2<D extends f.Dimension, I extends f.Dimension>
    on PrefixedMeasurementPer2<D, I> {
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get cbm => build(f.cbm);

  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get liter =>
      DerivedUnit2(numerator.defaultUnit, liters.withPrefix(prefix).inverted)(
          numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get teaspoon =>
      DerivedUnit2(numerator.defaultUnit,
          teaspoons.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get tablespoon =>
      DerivedUnit2(numerator.defaultUnit,
          tablespoons.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get fluidOunce =>
      DerivedUnit2(numerator.defaultUnit,
          fluidOunces.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get cup =>
      DerivedUnit2(numerator.defaultUnit, cups.withPrefix(prefix).inverted)(
          numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get pint =>
      DerivedUnit2(numerator.defaultUnit, pints.withPrefix(prefix).inverted)(
          numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get quart =>
      DerivedUnit2(numerator.defaultUnit, quarts.withPrefix(prefix).inverted)(
          numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get gallon =>
      DerivedUnit2(numerator.defaultUnit, gallons.withPrefix(prefix).inverted)(
          numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usTeaspoon =>
      DerivedUnit2(numerator.defaultUnit,
          usTeaspoons.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usTablespoon =>
      DerivedUnit2(numerator.defaultUnit,
          usTablespoons.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usFluidOunce =>
      DerivedUnit2(numerator.defaultUnit,
          usFluidOunces.withPrefix(prefix).inverted)(numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usCup =>
      DerivedUnit2(numerator.defaultUnit, usCups.withPrefix(prefix).inverted)(
          numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usPint =>
      DerivedUnit2(numerator.defaultUnit, usPints.withPrefix(prefix).inverted)(
          numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usQuart =>
      DerivedUnit2(numerator.defaultUnit, usQuarts.withPrefix(prefix).inverted)(
          numerator.defaultValue);
  f.DerivedMeasurement2<D, InvertedVolume, I, Volume> get usGallon =>
      DerivedUnit2(numerator.defaultUnit,
          usGallons.withPrefix(prefix).inverted)(numerator.defaultValue);
}

extension PrefixedUnitDotVolume<D extends f.Dimension, I extends f.Dimension>
    on f.PrefixedUnitDot2<D, I> {
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get cbm => build(f.cbm);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get liter => build(f.liters);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get teaspoon =>
      build(f.teaspoons);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get tablespoon =>
      build(f.tablespoons);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get fluidOunce =>
      build(f.fluidOunces);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get cup => build(f.cups);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get pint => build(f.pints);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get quart => build(f.quarts);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get gallon => build(f.gallons);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usTeaspoon =>
      build(f.usTeaspoons);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usTablespoon =>
      build(f.usTablespoons);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usFluidOunce =>
      build(f.usFluidOunces);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usCup => build(f.usCups);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usPint => build(f.usPints);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usQuart => build(f.usQuarts);
  f.DerivedUnit2<D, Volume, I, InvertedVolume> get usGallon =>
      build(f.usGallons);
}

extension VolumeMeasurementDot<
    N extends Measurement<D, I>,
    D extends f.Dimension,
    I extends f.Dimension> on PrefixedMeasurementDot2<D, I> {
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get cbm => build(f.cbm);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get liter =>
      build(f.liters);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get teaspoon =>
      build(f.teaspoons);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get tablespoon =>
      build(f.tablespoons);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get fluidOunce =>
      build(f.fluidOunces);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get cup => build(f.cups);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get pint =>
      build(f.pints);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get quart =>
      build(f.quarts);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get gallon =>
      build(f.gallons);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usTeaspoon =>
      build(f.usTeaspoons);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usTablespoon =>
      build(f.usTablespoons);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usFluidOunce =>
      build(f.usFluidOunces);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usCup =>
      build(f.usCups);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usPint =>
      build(f.usPints);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usQuart =>
      build(f.usQuarts);
  f.DerivedMeasurement2<D, Volume, I, InvertedVolume> get usGallon =>
      build(f.usGallons);
}
*/
