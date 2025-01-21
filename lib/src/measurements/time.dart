import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

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
extension TimeExtension on TimeMeasurement {
  /// Constructs a [Time] from a [Duration].
  TimeMeasurement ofDuration(
    Duration duration, {
    f.Precision precision = f.Precision.max,
    f.Unit<Time> interpreter = seconds,
  }) =>
      TimeMeasurement(duration.inMicroseconds, interpreter, precision);

  /// Constructs a [Duration] based on this.
  ///
  /// Note that any granularity below microseconds will be lost.
  Duration get asDuration =>
      Duration(microseconds: as(f.micro.seconds).toInt());
}
