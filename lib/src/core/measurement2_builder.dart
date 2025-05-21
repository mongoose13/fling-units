part of 'package:fling_units/src/core/library.dart';

/// A builder for Per-type derived units that has already been configured with a prefix for
/// the possible denominator units.
///
/// The preconfigured prefix here will eventually apply to the denominator unit chosen. For
/// example:
/// ```dart
/// // Here, the prefix is UnitPrefix.unit() (the default):
/// 3.meters.per;
///
/// // Here, the prefix is milli:
/// 3.meters.per.milli;
///
/// // That prefix is applied to the denominator, so this is "3 meters per millisecond":
/// 3.meters.per.milli.second;
/// ```
class PrefixedMeasurementPer<N extends f.Measurement<D, I>,
    D extends f.Dimension, I extends f.Dimension> {
  /// Creates a measurement builder preconfigured with a numerator measurement and a prefix for the denominator.
  PrefixedMeasurementPer(
    this.numerator, {
    this.prefix = const UnitPrefix.unit(),
  });

  /// The numerator measurement, which also defines the magnitude of the finished measurement.
  final N numerator;

  /// The prefix for the denominator unit.
  final UnitPrefix prefix;
}

/// A builder for Per-type derived units.
///
/// These objects create [f.DerivedMeasurement2]s with a preconfigured numerator measurement
/// and any denominator unit. The resulting measurement acts as if the denominator's default
/// value is 1. For example:
/// ```dart
/// // 3 meters per 1 second
/// 3.meters.per.second;
/// ```
class MeasurementPer<N extends f.Measurement<D, I>, D extends f.Dimension,
    I extends f.Dimension> extends PrefixedMeasurementPer<N, D, I> {
  /// Creates a measurement builder preconfigured with a numerator.
  MeasurementPer(super.numerator);
}

/// A builder for Dot-type derived units that has already been configured with a prefix for
/// the possible second units.
///
/// The preconfigured prefix here will eventually apply to the second unit chosen. For
/// example:
/// ```dart
/// // Here, the prefix is UnitPrefix.unit() (the default):
/// 3.meters.dot;
///
/// // Here, the prefix is milli:
/// 3.meters.dot.milli;
///
/// // That prefix is applied to the second unit, so this is "3 meters dot milliseconds":
/// 3.meters.dot.milli.seconds;
/// ```
class PrefixedMeasurementDot<N extends f.Measurement<D, I>,
    D extends f.Dimension, I extends f.Dimension> {
  /// Creates a measurement builder preconfigured with a first measurement and
  /// a prefix for the second unit.
  PrefixedMeasurementDot(
    this.initial, {
    this.prefix = const UnitPrefix.unit(),
  });

  /// The initial measurement, which also defines the magnitude of the finished
  /// measurement.
  final N initial;

  /// The prefix for the second unit.
  final UnitPrefix prefix;
}

/// A builder for Dot-type derived measurements.
///
/// These objects create [f.DerivedMeasurement2]s with a preconfigured first
/// measurement and any second unit. The resulting measurement acts as if the
/// second measurement's default value is 1. For example:
/// ```dart
/// // 3 meters per 1 second
/// 3.meters.per.second;
/// ```
class MeasurementDot<N extends f.Measurement<D, I>, D extends f.Dimension,
    I extends f.Dimension> extends PrefixedMeasurementDot<N, D, I> {
  /// Creates a measurement builder preconfigured with a first measurement.
  MeasurementDot(super.initial);
}
