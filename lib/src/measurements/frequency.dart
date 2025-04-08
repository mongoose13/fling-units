import 'package:fling_units/src/core/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/frequency.dart";

@DimensionConfig(shortName: "Frequency")
enum FrequencyConfig {
  @UnitConfig(
    shortName: "Hz",
    singularName: "hertz",
    multiplier: 1e0,
    isSI: true,
  )
  hertz,

  @UnitConfig(
    shortName: "rpm",
    singularName: "rpm",
    multiplier: 1.0 / 60.0,
  )
  rpm;
}
