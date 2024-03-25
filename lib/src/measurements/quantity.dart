import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/quantity.dart";

@MeasurementConfig(shortName: "Quantity")
enum QuantityConfig {
  @UnitConfig(
    shortName: "units",
    multiplier: 1e0,
    isSI: true,
  )
  units,

  @UnitConfig(
    shortName: "mol",
    multiplier: 1.660539067e-24,
  )
  moles;
}
