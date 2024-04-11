part of "library.dart";

/// Interprets a measurement as a specific unit.
///
/// [Unit]s allow [Measurement]s to be interpreted as whatever
/// unit the [Unit] was configured for. Users of the library
/// will generally only require the built-in units for the [Measurement]
/// types being used (e.g. [miles] or [kilo].[meters]), but if needed, some
/// [Unit] subtypes can be configured further (e.g.
/// [AreaUnit]).
///
/// [Unit]s allow the corresponding unit to be instantiated by "calling"
/// it. For instance, one could create a [Distance] measurement in miles
/// by using the [miles] unit: `miles(5)`. [Unit]s are also offered as
///  extensions on [num], so they could be used this way: `5.miles`.
///
/// Users should not need to access the internal workings of
/// [Unit]s, but instead pass them to the appropriate
/// [Measurement] instances for interpretation (typically via the
/// [Measurement.as] method).
abstract class Unit<T extends Measurement<T>> {
  /// Constructs a [Unit].
  const Unit({
    required this.name,
    required this.unitMultiplier,
    required this.prefix,
  });

  /// Creates a measurement based on the value and the configured multiplier.
  T call(num magnitude, {Precision precision = Precision.max});

  @override
  String toString() => '$prefix$name';

  /// Interprets the base value according to the configured unit.
  ///
  /// This effectively converts a measurement to SI units.
  double of(num value) =>
      value.toDouble() * unitMultiplier / prefix.unitMultiplier;

  /// Interprets the provided value as if it were of the configured unit,
  /// returning the base value.
  double from(num value) =>
      value.toDouble() / unitMultiplier * prefix.unitMultiplier;

  /// Returns a derived unit builder (division) iniialized with this as the first unit.
  DerivedUnitPerBuilder<T> get per => DerivedUnitPerBuilder(this);

  /// Returns a derived unit builder (multiplication) iniialized with this as the first unit.
  DerivedUnitByBuilder<T> get by => DerivedUnitByBuilder(this);

  /// Creates a derived unit that is the multiplication of this and another unit.
  DerivedUnitBy<T, V> multiply<V extends Measurement<V>>(Unit<V> other) =>
      DerivedUnitBy(this, other);

  /// Creates a derived unit that is the division of this and another unit.
  DerivedUnitPer<T, V> divide<V extends Measurement<V>>(Unit<V> other) =>
      DerivedUnitPer(this, other);

  /// The standardized short form name of the unit (e.g. "m" for meters).
  final String name;

  /// The multiplier for the configured unit.
  final double unitMultiplier;

  /// The prefix to apply to the measurement.
  final MeasurementPrefix prefix;
}

/// A [Unit] that rounds its results to `int`s.
///
/// This is useful for measurements that should not be represented fractionally,
/// e.g. the number of items in a collection.
abstract class RoundingUnit<T extends Measurement<T>> extends Unit<T> {
  /// Constructs a [RoundingUnit].
  const RoundingUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  @override
  double of(num value) =>
      (value.toDouble() * unitMultiplier / prefix.unitMultiplier)
          .roundToDouble();

  @override
  double from(num value) =>
      value.toDouble() / unitMultiplier * prefix.unitMultiplier;
}
