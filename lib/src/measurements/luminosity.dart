import 'package:fling_units/src/core/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/luminosity.dart";

@DimensionConfig(shortName: "Luminosity")
enum LuminosityConfig {
  @UnitConfig(
    shortName: "cd",
    singularName: "candela",
    multiplier: 1e0,
    isSI: true,
  )
  candela,

  @UnitConfig(
    shortName: "cp",
    singularName: "candlepower",
    multiplier: 1.0194,
  )
  candlepower,

  @UnitConfig(
    shortName: "HK",
    singularName: "hefnerkerze",
    multiplier: 1.0870,
  )
  hefnerkerze;
}
