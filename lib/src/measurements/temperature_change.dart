import 'package:fling_units/src/generator/annotations.dart';

import 'package:fling_units/fling_units.dart' as f;

part "../generated/temperature_change.dart";

/// Represents a change in temperature.
///
/// Because temperature scales are not zero-based (except for Kelvin), working
/// with temperature numbers can be counter-intuitive. For example, what does
/// it mean to "subtract 10 degrees Celsius from 10 degrees Celsius"? One might
/// say the answer is 0 degrees Celsius, but one might also say the answer is
/// "absolute zero" (-273.15 degrees Celsius). Depending on what you mean when
/// you say "subtract 10 degrees Celsius", one of those two will be correct.
///
/// To resolve this ambiguity, the [TemperatureChange] class allows one to model
/// differences in temperature (as opposed to "thermometer" temperatures). If
/// you intend to say "it is 10 degrees Celsius colder than yesterday" then you
/// want to use a [Temperature] alongside a [TemperatureChange] of 10 degrees
/// Celsius as opposed to two [Temperature]s of 10 degrees Celsius.
///
/// Instances of this class may also represent the difference between two
/// "thermometer" temperatures. For example, if I calculate the difference in
/// temperature between today's weather and yesterday's weather, I would get a
/// [TemperatureChange] whose value indicates the amount of difference between
/// the two [Temperature]s. It would not make sense to say that the difference
/// in temperature is the "thermometer" temperature of 10 degrees.
@DimensionConfig(name: "TemperatureChange")
enum TemperatureChangeConfig {
  @UnitConfig(
    shortName: "K",
    singularName: "kelvin",
    multiplier: 1e0,
    isSI: true,
  )
  kelvin,

  @UnitConfig(
    shortName: "°C",
    singularName: "celsius",
    multiplier: 1e0,
  )
  celsius,

  @UnitConfig(
    shortName: "°F",
    singularName: "fahrenheit",
    multiplier: 5.0 / 9.0,
  )
  fahrenheit;
}
