import 'package:fling_units/src/core/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/mass.dart";

@DimensionConfig(name: "Mass")
enum MassConfig {
  @UnitConfig(
    shortName: "g",
    singularName: "gram",
    multiplier: 1e0,
    isSI: true,
  )
  grams,

  @UnitConfig(
    shortName: "t",
    singularName: "tonne",
    multiplier: 1e6,
  )
  tonnes,

  @UnitConfig(
    shortName: "u",
    singularName: "atomicMassUnit",
    multiplier: 1.660540199e-24,
  )
  atomicMassUnits,

  @UnitConfig(
    shortName: "Da",
    singularName: "dalton",
    multiplier: 1.66053e-24,
  )
  daltons,

  @UnitConfig(
    shortName: "me",
    singularName: "electronRestMass",
    multiplier: 9.109389699e-28,
  )
  electronRestMass,

  @UnitConfig(
    shortName: "t",
    singularName: "longTon",
    multiplier: 1.0160469088e6,
  )
  longTons,

  @UnitConfig(
    shortName: "tn",
    singularName: "shortTon",
    multiplier: 9.0718474e5,
  )
  shortTons,

  @UnitConfig(
    shortName: "lb",
    singularName: "pound",
    multiplier: 453.59237,
  )
  pounds,

  @UnitConfig(
    shortName: "oz",
    singularName: "ounce",
    multiplier: 28.349523125,
  )
  ounces;
}
