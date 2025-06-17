import "package:fling_units/fling_units.dart";

export "../generated/perdot_builder.dart";

abstract class MeasurementPerDot {
  const MeasurementPerDot(
    this.magnitude, {
    this.prefix = const UnitPrefix.unit(),
  });

  /// The magnitude of the finished measurement.
  final num magnitude;

  /// The prefix for the denominator unit.
  final UnitPrefix prefix;
}
