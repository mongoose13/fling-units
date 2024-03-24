import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/mass.dart";

@MeasurementConfig(shortName: "Mass")
enum MassConfig {
  @UnitConfig(
    shortName: "g",
    multiplier: 1e0,
    isSI: true,
  )
  grams,

  @UnitConfig(
    shortName: "t",
    multiplier: 1e-6,
  )
  tonnes,

  @UnitConfig(
    shortName: "u",
    multiplier: 6.022136651e23,
  )
  atomicMassUnits,

  @UnitConfig(
    shortName: "Da",
    multiplier: 6.02214076208e23,
  )
  daltons,

  @UnitConfig(
    shortName: "me",
    multiplier: 1.09776910594e27,
  )
  electronRestMass,

  @UnitConfig(
    shortName: "t",
    multiplier: 9.842065276e-7,
  )
  longTons,

  @UnitConfig(
    shortName: "tn",
    multiplier: 1.1023e-6,
  )
  shortTons,

  @UnitConfig(
    shortName: "lb",
    multiplier: 0.0022046226,
  )
  pounds,

  @UnitConfig(
    shortName: "oz",
    multiplier: 0.0352739619,
  )
  ounces;
}
