part of 'package:fling_units/src/core/prefix_base.dart';

class MeasurementPrefix with PonyPrefix {
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
}
