import 'package:fling_units/src/core/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/mass.dart";

@DimensionConfig(shortName: "Mass")
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
    multiplier: 1e-6,
  )
  tonnes,

  @UnitConfig(
    shortName: "u",
    singularName: "atomicMassUnit",
    multiplier: 6.022136651e23,
  )
  atomicMassUnits,

  @UnitConfig(
    shortName: "Da",
    singularName: "dalton",
    multiplier: 6.02214076208e23,
  )
  daltons,

  @UnitConfig(
    shortName: "me",
    singularName: "electronRestMass",
    multiplier: 1.09776910594e27,
  )
  electronRestMass,

  @UnitConfig(
    shortName: "t",
    singularName: "longTon",
    multiplier: 9.842065276e-7,
  )
  longTons,

  @UnitConfig(
    shortName: "tn",
    singularName: "shortTon",
    multiplier: 1.1023e-6,
  )
  shortTons,

  @UnitConfig(
    shortName: "lb",
    singularName: "pound",
    multiplier: 0.0022046226,
  )
  pounds,

  @UnitConfig(
    shortName: "oz",
    singularName: "ounce",
    multiplier: 0.0352739619,
  )
  ounces;
}
