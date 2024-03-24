import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/luminosity.dart";

@MeasurementConfig(shortName: "Luminosity")
enum LuminosityConfig {
  @UnitConfig(
    shortName: "cd",
    multiplier: 1e0,
    isSI: true,
  )
  candela,

  @UnitConfig(
    shortName: "cp",
    multiplier: 1.0194,
  )
  candlepower,

  @UnitConfig(
    shortName: "HK",
    multiplier: 1.0870,
  )
  hefnerkerze;
}
