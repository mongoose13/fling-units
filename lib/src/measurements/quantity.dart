import 'package:fling_units/src/core/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/quantity.dart";

@MeasurementConfig(shortName: "Quantity")
enum QuantityConfig {
  @UnitConfig(
    shortName: "units",
    singularName: "unit",
    multiplier: 1e0,
    isSI: true,
  )
  units,

  @UnitConfig(
    shortName: "mol",
    singularName: "mole",
    multiplier: 1.660539067e-24,
  )
  moles;
}
