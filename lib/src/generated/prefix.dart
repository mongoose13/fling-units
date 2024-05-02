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
        f.LuminosityPrefix {
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

  operator *(MeasurementPrefix other) =>
      MeasurementPrefix(multiplier * other.multiplier);

  operator /(MeasurementPrefix other) =>
      MeasurementPrefix(multiplier / other.multiplier);
}
