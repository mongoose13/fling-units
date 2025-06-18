import 'package:fling_units/src/generator/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/quantity.dart";

@DimensionConfig(name: "Quantity")
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
    multiplier: 6.02214076e23,
  )
  moles;
}
