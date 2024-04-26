import "dart:math" as math;

import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/angle.dart";

@MeasurementConfig(shortName: "Angle")
enum AngleConfig {
  @UnitConfig(
    shortName: "turn",
    singularName: "turn",
    multiplier: 1e0,
    isSI: true,
  )
  turns,

  @UnitConfig(
    shortName: "rad",
    singularName: "radian",
    multiplier: 2.0 * math.pi,
  )
  radians,

  @UnitConfig(
    shortName: "ᵍ",
    singularName: "gradian",
    multiplier: 4e2,
  )
  gradians,

  @UnitConfig(
    shortName: "°",
    singularName: "degree",
    multiplier: 360.0,
  )
  degrees,

  @UnitConfig(
    shortName: "′",
    singularName: "arcMinute",
    multiplier: 360.0 * 60.0,
  )
  arcMinutes,

  @UnitConfig(
    shortName: "′",
    singularName: "arcSecond",
    multiplier: 360.0 * 3600.0,
  )
  arcSeconds;
}

extension AngleExtension on AngleMeasurement {
  /// A right angle.
  static AngleMeasurement right() => const AngleMeasurement(0.25, turns);

  /// A straight angle.
  static AngleMeasurement straight() => const AngleMeasurement(0.5, turns);

  /// Whether this is an acute angle.
  bool get isAcute => si.abs() < 0.25;

  /// Whether this is an obtuse angle.
  bool get isObtuse => si.abs() > 0.25 && si.abs() < 0.5;

  /// Whether this is a right angle.
  bool get isRight => si.abs() == 0.25;

  /// Whether this is a straight angle.
  bool get isStraight => si.abs() == 0.5;
}
