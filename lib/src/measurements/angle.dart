import "dart:math" as math;

import 'package:fling_units/src/core/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/angle.dart";

@DimensionConfig(shortName: "Angle")
enum AngleConfig {
  @UnitConfig(
    shortName: "turn",
    singularName: "turn",
    multiplier: 1e0,
    isSI: true,
  )
  turns,

  @UnitConfig(
    shortName: "quadrant",
    singularName: "quadrant",
    multiplier: 1.0 / 4.0,
    isSI: true,
  )
  quadrants,

  @UnitConfig(
    shortName: "sextant",
    singularName: "sextant",
    multiplier: 1.0 / 6.0,
    isSI: true,
  )
  sextants,

  @UnitConfig(
    shortName: "rad",
    singularName: "radian",
    multiplier: 1.0 / (2.0 * math.pi),
  )
  radians,

  @UnitConfig(
    shortName: "ᵍ",
    singularName: "gradian",
    multiplier: 1.0 / 4e2,
  )
  gradians,

  @UnitConfig(
    shortName: "°",
    singularName: "degree",
    multiplier: 1.0 / 360.0,
  )
  degrees,

  @UnitConfig(
    shortName: "′",
    singularName: "arcMinute",
    multiplier: 1.0 / (360.0 * 60.0),
  )
  arcMinutes,

  @UnitConfig(
    shortName: "′",
    singularName: "arcSecond",
    multiplier: 1.0 / (360.0 * 3600.0),
  )
  arcSeconds;
}

extension AngleExtension on AngleMeasurement {
  /// A right angle.
  static AngleMeasurement right() => const AngleMeasurement(0.25, turns);

  /// A straight angle.
  static AngleMeasurement straight() => const AngleMeasurement(0.5, turns);
}
