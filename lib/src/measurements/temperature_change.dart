import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/temperature_change.dart";

/// Represents a change in temperature.
///
/// Because temperature scales are not zero-based (except for Kelvin), working
/// with temperature numbers can be counter-intuitive. For example, what does
/// it mean to "subtract 10 degrees Celcius from 10 degrees Celcius"? One might
/// say the answer is 0 degrees Celcius, but one might also say the answer is
/// "absolute zero" (-273.15 degrees Celcius). Depending on what you mean when
/// you say "subtract 10 degrees Celcius", one of those two will be correct.
///
/// To resolve this ambiguity, the [TemperatureChange] class allows one to model
/// differences in temperature (as opposed to "thermometer" temperatures). If
/// you intend to say "it is 10 degrees Celcius colder than yesterday" then you
/// want to use a [Temperature] alongside a [TemperatureChange] of 10 degrees
/// Celcius as opposed to two [Temperature]s of 10 degrees Celcius.
///
/// Instances of this class may also represent the difference between two
/// "thermometer" temperatures. For example, if I calculate the difference in
/// temperature between today's weather and yesterday's weather, I would get a
/// [TemperatureChange] whose value indicates the amount of difference between
/// the two [Temperature]s. It would not make sense to say that the difference
/// in temperature is the "thermometer" temperature of 10 degrees.
@MeasurementConfig(shortName: "TemperatureChange")
enum TemperatureChangeConfig {
  @UnitConfig(
    shortName: "K",
    multiplier: 1e0,
    isSI: true,
  )
  kelvin,

  @UnitConfig(
    shortName: "°C",
    multiplier: 1e0,
  )
  celcius,

  @UnitConfig(
    shortName: "°F",
    multiplier: 9.0 / 5.0,
  )
  fahrenheit;
}
