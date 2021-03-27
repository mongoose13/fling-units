part of fling_units;

/// Interprets a measurement as a specific unit.
///
/// [MeasurementInterpreter]s allow [Measurement]s to be interpreted as whatever
/// unit the [MeasurementInterpreter] was configured for. Users of the library
/// will generally only require the built-in converters for the [Measurement]
/// types being used (e.g. [miles]), but if needed, some
/// [MeasurementInterpreter] subtypes can be configured further (e.g.
/// [AreaInterpreter]).
///
/// Users should not need to access the internal workings of
/// [MeasurementInterpreter]s, but instead pass them to the appropriate
/// [Measurement] instances for interpretation (typically via an `as()` method,
/// such as [Area.as]).
abstract class MeasurementInterpreter<T> {
  /// Interprets the base value according to the configured unit.
  double _of(final num value) => value.toDouble() * _unitMultiplier;

  /// Interprets the provided value as if it were of the configured unit,
  /// returning the base value.
  double _from(final num value) => value.toDouble() / _unitMultiplier;

  /// Creates a measurement based on the value and the configured multiplier.
  T call(final double value, {final Precision precision = Precision.max});

  /// Constructs a [MeasurementInterpreter].
  const MeasurementInterpreter._(final this._unitMultiplier);

  /// The multiplier for the configured unit.
  final double _unitMultiplier;
}

/// A [MeasurementInterpreter] that truncates its results to `int`s.
///
/// This is useful for measurements that should not be represented fractionally,
/// e.g. the number of items in a collection.
abstract class TruncatingMeasurementInterpreter<T>
    extends MeasurementInterpreter<T> {
  @override
  double _of(final num value) =>
      (value.toDouble() * _unitMultiplier).truncateToDouble();

  @override
  double _from(final num value) => value.toDouble() / _unitMultiplier;

  /// Constructs a [TruncatingMeasurementInterpreter].
  const TruncatingMeasurementInterpreter._(final double unitMultiplier)
      : super._(unitMultiplier);
}
