import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/time.dart";

@MeasurementConfig(shortName: "Time")
enum TimeConfig {
  @UnitConfig(
    shortName: "s",
    singularName: "second",
    multiplier: 1e0,
    isSI: true,
  )
  seconds,

  @UnitConfig(
    shortName: "min",
    singularName: "minute",
    multiplier: 1.0 / 60.0,
  )
  minutes,

  @UnitConfig(
    shortName: "h",
    singularName: "hour",
    multiplier: 1.0 / 60.0 / 60.0,
  )
  hours,

  @UnitConfig(
    shortName: "d",
    singularName: "day",
    multiplier: 1.0 / 60.0 / 60.0 / 24.0,
  )
  days;
}

/*
  This first method seems incorrect
  - we are creating a Time in seconds from input in microseconds?
  */
extension TimeExtension on Time {
  /// Constructs a [Time] from a [Duration].
  Time ofDuration(
    Duration duration, {
    Precision precision = Precision.max,
    Unit<Time> interpreter = seconds,
  }) =>
      Time(duration.inMicroseconds, interpreter, precision);

  /// Constructs a [Duration] based on this.
  ///
  /// Note that any granularity below microseconds will be lost.
  Duration get asDuration => Duration(microseconds: as(micro.seconds).toInt());
}
