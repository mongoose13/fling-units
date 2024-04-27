// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:fling_units/src/core/library.dart';

class MeasurementPrefix
    with
        f.AnglePrefix,
        f.ChargePrefix,
        f.DistancePrefix,
        f.LuminosityPrefix,
        f.MassPrefix,
        f.PressurePrefix,
        f.QuantityPrefix,
        f.TemperatureChangePrefix,
        f.TimePrefix {
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
