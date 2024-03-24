import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/distance.dart";

@MeasurementConfig(shortName: "Distance")
enum DistanceConfig {
  @UnitConfig(
    shortName: "m",
    multiplier: 1e0,
    isSI: true,
  )
  meters,

  @UnitConfig(
    shortName: "mi",
    multiplier: 0.0006213712,
  )
  miles,

  @UnitConfig(
    shortName: "yd",
    multiplier: 1.093613,
  )
  yards,

  @UnitConfig(
    shortName: "ft",
    multiplier: 3.28084,
  )
  feet,

  @UnitConfig(
    shortName: "in",
    multiplier: 39.37008,
  )
  inches,

  @UnitConfig(
    shortName: "NM",
    multiplier: 0.000539956803456,
  )
  nauticalMiles;
}

extension DistanceInterpreterExtension on DistanceInterpreter {
  AreaInterpreter get squared => AreaInterpreter.squared(this);
  VolumeInterpreter get cubed => VolumeInterpreterExtension.cubed(this);
}
