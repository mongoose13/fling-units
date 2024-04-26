// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:fling_units/src/core/library.dart';

class MeasurementPrefix
    with
        f.AnglePrefix,
        f.TimePrefix,
        f.QuantityPrefix,
        f.MassPrefix,
        f.DistancePrefix,
        f.ChargePrefix,
        f.TemperatureChangePrefix,
        f.PressurePrefix,
        f.FrequencyPrefix,
        f.LuminosityPrefix {
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

  operator *(MeasurementPrefix other) =>
      MeasurementPrefix(unitMultiplier * other.unitMultiplier);

  operator /(MeasurementPrefix other) =>
      MeasurementPrefix(unitMultiplier / other.unitMultiplier);
}
