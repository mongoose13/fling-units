part of fling_units;

/// Interprets a measurement as a specific unit.
///
/// [MeasurementInterpreter]s allow [Measurement]s to be interpreted as whatever
/// unit the [MeasurementInterpreter] was configured for. Users of the library
/// will generally only require the built-in converters for the [Measurement]
/// types being used (e.g. [Distance.miles]), but if needed, some
/// [MeasurementInterpreter] subtypes can be configured further (e.g.
/// [AreaConverter]).
///
/// Users should not need to access the internal workings of
/// [MeasurementConverters], but instead pass them to the appropriate
/// [Measurement] instances for interpretation (typically via an `as()` method,
/// such as [Area.as]).
abstract class MeasurementInterpreter<T> {
  /// Interprets the base value according to the configured unit.
  double _of(final num value) => value.toDouble() * _multiplier;

  /// Interprets the provided value as if it were of the configured unit,
  /// returning the base value.
  double _from(final num value) => value.toDouble() / _multiplier;

  /// Constructs a [MeasurementInterpreter].
  MeasurementInterpreter._(final this._multiplier);

  /// The multiplier for the configured unit.
  final double _multiplier;
}