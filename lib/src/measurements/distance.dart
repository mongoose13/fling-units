import 'package:fling_units/src/core/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;
import 'package:fling_units/src/core/library.dart';

part "../generated/distance.dart";

@DimensionConfig(shortName: "Distance")
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
    multiplier: 0.0006213712,
  )
  miles,

  @UnitConfig(
    shortName: "yd",
    singularName: "yard",
    multiplier: 1.093613,
  )
  yards,

  @UnitConfig(
    shortName: "ft",
    singularName: "foot",
    multiplier: 3.28084,
  )
  feet,

  @UnitConfig(
    shortName: "in",
    singularName: "inch",
    multiplier: 39.37008,
  )
  inches,

  @UnitConfig(
    shortName: "NM",
    singularName: "nauticalMile",
    multiplier: 0.000539956803456,
  )
  nauticalMiles;
}
