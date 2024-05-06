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
abstract class Unit<D extends Dimension> {
  /// Constructs a [Unit].
  const Unit({
    required this.name,
    required this.unitMultiplier,
    required this.prefix,
  });

  @override
  String toString() => '$prefix$name';

  /// Interprets the base value according to the configured unit.
  ///
  /// This effectively converts a number from SI units to this unit.
  /// For example:
  /// ```
  /// feet.of(3);               // 9.84...
  /// kilo.meters.of(1000);     // 1.0
  /// ```
  double of(num siValue) => siValue / multiplier;

  /// Interprets the provided value as if it were of the configured unit,
  /// returning the base value.
  ///
  /// This effectively converts a value of this unit into the corresponding
  /// value in SI units.
  /// For example:
  /// ```
  /// feet.from(1);             // 3.28...
  /// kilo.meters.from(1);      // 1000.0
  /// ```
  double from(num value) => value * multiplier;

  /// The standardized short form name of the unit (e.g. "m" for meters).
  final String name;

  /// The multiplier for the configured unit.
  final double unitMultiplier;

  /// The prefix to apply to the measurement.
  final MeasurementPrefix prefix;

  /// The total mutiplier for this unit.
  double get multiplier => prefix.multiplier * unitMultiplier;
}

/// Represents the position of a unit in a derived unit equation.
abstract class UnitPosition<D extends Dimension> {
  /// The positioned unit.
  final Unit<D> unit;

  /// Constructor.
  UnitPosition(this.unit);

  @override
  String toString() => unit.toString();

  /// The multiplier for this component of the overall derived measurement.
  ///
  /// This includes both the unit multiplier and any modifications to it
  /// required by its position in the derived unit equation.
  double get multiplier;

  /// Returns whether the generic argument provided is a numerator.
  static bool isNumerator<P extends UnitPosition>() =>
      <P>[] is List<UnitNumerator>;

  /// Returns the multiplier for the provided number using the generic argument
  /// to determine where the number should be positioned.
  static num typeMultiplier<P extends UnitPosition>(num? value) => value == null
      ? 1.0
      : isNumerator<P>()
          ? value
          : 1.0 / value;
}

/// Represents a unit in the numerator of a derived unit equation.
class UnitNumerator<D extends Dimension> extends UnitPosition<D> {
  UnitNumerator(super.unit);

  @override
  double get multiplier => unit.multiplier;

  @override
  bool operator ==(Object other) =>
      other is UnitNumerator<D> && other.unit == unit;

  @override
  int get hashCode => 3 * unit.hashCode;
}

/// Represents a unit in the denominator of a derived unit equation.
class UnitDenominator<D extends Dimension> extends UnitPosition<D> {
  UnitDenominator(super.unit);

  @override
  double get multiplier => 1.0 / unit.multiplier;

  @override
  String toString() => "${unit.toString()}⁻¹";

  @override
  bool operator ==(Object other) =>
      other is UnitDenominator<D> && other.unit == unit;

  @override
  int get hashCode => 5 * unit.hashCode;
}

/// A [Unit] that rounds its results to `int`s.
///
/// This is useful for measurements that should not be represented fractionally,
/// e.g. the number of items in a collection.
abstract class RoundingUnit<D extends Dimension> extends Unit<D> {
  /// Constructs a [RoundingUnit].
  const RoundingUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  @override
  double of(num siValue) => (siValue.toDouble() * multiplier).roundToDouble();
}
