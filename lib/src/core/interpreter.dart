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
  /// The prefix to apply to the measurement.
  final MeasurementPrefix _prefix;

  /// Interprets the base value according to the configured unit.
  double _of(final num value) =>
      value.toDouble() * _unitMultiplier / _prefix._multiplier;

  /// Interprets the provided value as if it were of the configured unit,
  /// returning the base value.
  double _from(final num value) =>
      value.toDouble() / _unitMultiplier * _prefix._multiplier;

  /// The standardized short form name of the unit (e.g. "m" for meters).
  final String _name;

  /// Creates a measurement based on the value and the configured multiplier.
  T call(final double value, {final Precision precision = Precision.max});

  /// Constructs a [MeasurementInterpreter].
  const MeasurementInterpreter._(
    this._name,
    this._unitMultiplier,
    this._prefix,
  );

  /// The multiplier for the configured unit.
  final double _unitMultiplier;

  @override
  String toString() => '$_prefix$_name';
}

/// A [MeasurementInterpreter] that rounds its results to `int`s.
///
/// This is useful for measurements that should not be represented fractionally,
/// e.g. the number of items in a collection.
abstract class RoundingMeasurementInterpreter<T>
    extends MeasurementInterpreter<T> {
  @override
  double _of(final num value) =>
      (value.toDouble() * _unitMultiplier / _prefix._multiplier)
          .roundToDouble();

  @override
  double _from(final num value) =>
      value.toDouble() / _unitMultiplier * _prefix._multiplier;

  /// Constructs a [RoundingMeasurementInterpreter].
  const RoundingMeasurementInterpreter._(
    final String name,
    final double unitMultiplier, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, unitMultiplier, prefix);
}
