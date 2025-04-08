part of "library.dart";

class MeasurementPrefix {
  const MeasurementPrefix(
    this.multiplier, {
    this.name = "",
  });

  const MeasurementPrefix.unit()
      : multiplier = 1.0,
        name = "";

  final double multiplier;

  final String name;

  MeasurementPrefix get prefix => this;

  @override
  toString() => name;

  MeasurementPrefix operator *(MeasurementPrefix other) =>
      MeasurementPrefix(multiplier * other.multiplier);

  MeasurementPrefix operator /(MeasurementPrefix other) =>
      MeasurementPrefix(multiplier / other.multiplier);
}
