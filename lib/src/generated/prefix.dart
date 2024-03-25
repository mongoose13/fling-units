part of 'package:fling_units/src/core/library.dart';

class MeasurementPrefix
    with
        AnglePrefix,
        TimePrefix,
        QuantityPrefix,
        MassPrefix,
        DistancePrefix,
        ChargePrefix,
        TemperatureChangePrefix,
        PressurePrefix,
        FrequencyPrefix,
        VolumePrefix,
        LuminosityPrefix {
  const MeasurementPrefix(
    this.unitMultiplier, {
    this.name = "",
  });

  const MeasurementPrefix.unit()
      : unitMultiplier = 1.0,
        name = "";

  final double unitMultiplier;

  final String name;

  @override
  MeasurementPrefix get prefix => this;

  @override
  toString() => name;
}
