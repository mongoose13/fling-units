part of 'package:fling_units/src/core/library.dart';

class MeasurementPrefix with ChargePrefix, FrequencyPrefix, LuminosityPrefix {
  const MeasurementPrefix(
    this._multiplier, {
    this.name = "",
  });

  const MeasurementPrefix.unit()
      : _multiplier = 1.0,
        name = "";

  final double _multiplier;

  final String name;

  @override
  MeasurementPrefix get prefix => this;

  @override
  toString() => name;
}
