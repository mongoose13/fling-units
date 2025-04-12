import 'package:fling_units/fling_units.dart' as f;

import 'package:fling_units/src/core/annotations.dart';

part '../generated/speed.dart';

@DimensionConfig(
  name: "Speed",
  types: ["Distance", "InvertedTime"],
)
enum SpeedConfig {
  @UnitConfig(
    shortName: "m/s",
    singularName: "meterPerSecond",
    multiplier: 1.0,
    isSI: true,
  )
  mps,

  @UnitSpecialization(
    shortName: "kn",
    singularName: "knot",
    equivalent: "nauticalMiles.per.hour",
  )
  knots,

  @MeasurementConstant(
    unit: "mps",
    magnitude: 2.99792458e8,
    precision: f.Precision.maximumPrecision,
  )
  speedOfLight;
}
