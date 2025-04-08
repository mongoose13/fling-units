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
/// [Measurement] instances for conversion.
abstract class Unit<D extends Dimension, I extends Dimension> {
  /// Constructs a [Unit].
  const Unit({
    required this.name,
    required this.unitMultiplier,
    required this.prefix,
  });

  Unit<I, D> get inverted;

  @override
  String toString() => '$prefix$name';

  /// Converts a value in the SI unit to the corresponding value in this unit.
  ///
  /// For example:
  /// ```
  /// feet.fromSI(3);           // 9.843...
  /// kilo.meters.fromSI(1);    // 1000.0
  /// ```
  double fromSI(num siValue) => siValue / multiplier;

  /// Converts a value of this unit into the corresponding value in SI units.
  ///
  /// For example:
  /// ```
  /// feet.toSI(3);             // 0.914...
  /// kilo.meters.toSI(1.0);    // 0.001
  /// ```
  double toSI(num value) => value * multiplier;

  /// The standardized short form name of the unit (e.g. "m" for meters).
  final String name;

  /// The multiplier for the configured unit only.
  ///
  /// This does not include a prefix modifier, if one exists for this unit.
  /// To get the complete multiplier, including the prefix, use [multiplier].
  final double unitMultiplier;

  /// The prefix to apply to the measurement.
  final MeasurementPrefix prefix;

  /// The total multiplier for this unit.
  ///
  /// This includes the multiplier due to the unit being used as well as
  /// the modifier for any prefixes being used.
  ///
  /// You can read this value as, "the number of times you need to multiply
  /// the SI unit to get one of these units."
  ///
  /// For example:
  /// * seconds.multiplier = 1.0
  /// * minutes.multiplier = 60.0
  /// * kilo.seconds.multiplier = 1000.0
  /// * centi.seconds.multiplier = 0.01
  /// * kilo.minutes.multiplier = 60000.0
  /// * centi.minutes.multiplier = 0.6
  ///
  /// For inverted units, the multiplier is inverted as well. For example:
  /// * seconds.inverted.multiplier = 1.0
  /// * minutes.multiplier.inverted = 0.0167
  double get multiplier => prefix.multiplier * unitMultiplier;
}

abstract class Inverted<D extends Dimension> extends Dimension {
  const Inverted();
}

abstract class InvertedUnit<D extends Dimension, I extends Dimension>
    extends Unit<D, I> {
  const InvertedUnit({
    required super.name,
    required super.unitMultiplier,
    required super.prefix,
  });

  /// The total mutiplier for this unit.
  @override
  double get multiplier => 1.0 / super.multiplier;
}

/// A [Unit] that rounds its results to `int`s.
///
/// This is useful for measurements that should not be represented fractionally,
/// e.g. the number of items in a collection.
abstract class RoundingUnit<D extends Dimension, I extends Dimension>
    extends Unit<D, I> {
  /// Constructs a [RoundingUnit].
  const RoundingUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  @override
  double fromSI(num siValue) =>
      (siValue.toDouble() * multiplier).roundToDouble();
}
