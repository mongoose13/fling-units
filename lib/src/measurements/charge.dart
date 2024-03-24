import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/charge.dart";

@MeasurementConfig(shortName: "Charge")
enum ChargeConfig {
  @UnitConfig(
    shortName: "A",
    multiplier: 1e0,
    isSI: true,
  )
  amperes;
}
