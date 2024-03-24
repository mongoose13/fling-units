import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/ponies.dart";

@MeasurementConfig(shortName: "Pony")
enum PonyConfig {
  /// A fat pony.
  @UnitConfig(
    shortName: "F",
    multiplier: 2e0,
  )
  fat,

  /// An ugly pony.
  @UnitConfig(
    isSI: true,
    shortName: "U",
    multiplier: 1e0,
  )
  ugly,

  /// A lazy pony.
  @UnitConfig(
    shortName: "L",
    multiplier: 5e-2,
  )
  lazy;
}
