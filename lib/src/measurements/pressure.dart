import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/pressure.dart";

@MeasurementConfig(shortName: "Pressure")
enum PressureConfig {
  @UnitConfig(
    shortName: "Pa",
    multiplier: 1e0,
    isSI: true,
  )
  pascals,

  @UnitConfig(
    shortName: "bar",
    multiplier: 1e-5,
  )
  bars,

  @UnitConfig(
    shortName: "Ba",
    multiplier: 1e-1,
  )
  baryes,

  @UnitConfig(
    shortName: "atm",
    multiplier: 1.0 / 101325.0,
  )
  standardAtmospheres,

  @UnitConfig(
    shortName: "at",
    multiplier: 98.0665,
  )
  technicalAtmospheres,

  @UnitConfig(
    shortName: "mmHg",
    multiplier: 0.0075006,
  )
  mmHg,

  @UnitConfig(
    shortName: "inHg",
    multiplier: 3386.39,
  )
  inHg,

  @UnitConfig(
    shortName: "Torr",
    multiplier: 101325.0 / 760.0,
  )
  torr,

  @UnitConfig(
    shortName: "psi",
    multiplier: 6894.76,
  )
  psi;
}
