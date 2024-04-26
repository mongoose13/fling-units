import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/frequency.dart";

@MeasurementConfig(shortName: "Frequency")
enum FrequencyConfig {
  @UnitConfig(
    shortName: "Hz",
    singularName: "hertz",
    multiplier: 1e0,
    isSI: true,
  )
  hertz;
}
