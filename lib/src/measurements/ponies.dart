import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/ponies.dart";

@MeasurementTemplate(name: "Pony")
enum PonyConfig {
  /// A fat pony.
  @MeasurementUnit(
    shortName: "F",
    multiplier: 2e0,
  )
  fat,

  /// An ugly pony.
  @MeasurementUnit(
    isSI: true,
    shortName: "U",
    multiplier: 1e0,
  )
  ugly,

  /// A lazy pony.
  @MeasurementUnit(
    shortName: "L",
    multiplier: 5e-2,
  )
  lazy;
}
