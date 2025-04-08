// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:fling_units/src/core/library.dart';

class MeasurementPrefix
    with
        f.AnglePrefix,
        f.LuminosityPrefix,
        f.MassPrefix,
        f.FrequencyPrefix,
        f.TimePrefix,
        f.DistancePrefix,
        f.QuantityPrefix,
        f.PressurePrefix,
        f.TemperatureChangePrefix,
        f.ChargePrefix {
  const MeasurementPrefix(
    this.multiplier, {
    this.name = "",
  });

  const MeasurementPrefix.unit()
      : multiplier = 1.0,
        name = "";

  final double multiplier;

  final String name;

  @override
  MeasurementPrefix get prefix => this;

  @override
  toString() => name;

  MeasurementPrefix operator *(MeasurementPrefix other) =>
      MeasurementPrefix(multiplier * other.multiplier);

  MeasurementPrefix operator /(MeasurementPrefix other) =>
      MeasurementPrefix(multiplier / other.multiplier);
}
