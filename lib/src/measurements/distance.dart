import 'package:fling_units/src/generator/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/distance.dart";

@DimensionConfig(name: "Distance")
enum DistanceConfig {
  @UnitConfig(
    shortName: "m",
    singularName: "meter",
    multiplier: 1e0,
    isSI: true,
  )
  meters,

  @UnitConfig(
    shortName: "mi",
    singularName: "mile",
    multiplier: 1609.344,
  )
  miles,

  @UnitConfig(
    shortName: "yd",
    singularName: "yard",
    multiplier: 0.9144,
  )
  yards,

  @UnitConfig(
    shortName: "ft",
    singularName: "foot",
    multiplier: 0.3048,
  )
  feet,

  @UnitConfig(
    shortName: "in",
    singularName: "inch",
    multiplier: 0.0254,
  )
  inches,

  @UnitConfig(
    shortName: "NM",
    singularName: "nauticalMile",
    multiplier: 1852,
  )
  nauticalMiles,

  @UnitConfig(
    shortName: "µ",
    singularName: "micron",
    multiplier: 1.0e-6,
  )
  microns,

  @UnitConfig(
    shortName: "ly",
    singularName: "lightYear",
    multiplier: 9.46073047258e15,
  )
  lightYears;
}
