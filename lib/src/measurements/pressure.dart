import 'package:fling_units/src/core/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/pressure.dart";

@MeasurementConfig(shortName: "Pressure")
enum PressureConfig {
  @UnitConfig(
    shortName: "Pa",
    singularName: "pascal",
    multiplier: 1e0,
    isSI: true,
  )
  pascals,

  @UnitConfig(
    shortName: "bar",
    singularName: "bar",
    multiplier: 1e-5,
  )
  bars,

  @UnitConfig(
    shortName: "Ba",
    singularName: "barye",
    multiplier: 1e-1,
  )
  baryes,

  @UnitConfig(
    shortName: "atm",
    singularName: "standardAtmosphere",
    multiplier: 1.0 / 101325.0,
  )
  standardAtmospheres,

  @UnitConfig(
    shortName: "at",
    singularName: "technicalAtmosphere",
    multiplier: 98.0665,
  )
  technicalAtmospheres,

  @UnitConfig(
    shortName: "mmHg",
    singularName: "mmHg",
    multiplier: 0.0075006,
  )
  mmHg,

  @UnitConfig(
    shortName: "inHg",
    singularName: "inHg",
    multiplier: 3386.39,
  )
  inHg,

  @UnitConfig(
    shortName: "Torr",
    singularName: "torr",
    multiplier: 101325.0 / 760.0,
  )
  torr,

  @UnitConfig(
    shortName: "psi",
    singularName: "psi",
    multiplier: 6894.76,
  )
  psi;
}
