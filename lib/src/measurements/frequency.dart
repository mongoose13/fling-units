import 'package:fling_units/src/generator/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/frequency.dart";

@DimensionConfig(name: "Frequency")
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

abstract final class FrequencyBuilder {
  static FrequencyUnit from(f.InvertedTimeUnit period) => FrequencyUnit._(
        name: period.name,
        unitMultiplier: 1.0 / period.unitMultiplier,
      );
}
