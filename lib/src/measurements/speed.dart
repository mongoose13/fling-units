import 'package:fling_units/fling_units.dart' as f;

import 'package:fling_units/src/generator/annotations.dart';
import 'package:fling_units/src/generated/library.dart';

part '../generated/speed.dart';

@DimensionConfig(
  name: "Speed",
  types: ["Distance", "InvertedTime"],
)
enum SpeedConfig {
  @UnitSpecialization(
    shortName: "kn",
    singularName: "knot",
    equivalent: "nauticalMiles.per.hour",
  )
  knots,
}

final speedOfLight = 2.99792458e8.meters.per.second;
