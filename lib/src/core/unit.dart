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
abstract class Unit<T extends Dimension> {
  /// Constructs a [Unit].
  const Unit({
    required this.name,
    required this.unitMultiplier,
    required this.prefix,
  });

  /*
  /// Creates a new unit, replacing this unit's prefix with the specified prefix.
  Unit<T> withPrefix(MeasurementPrefix prefix);

  /// Creates a measurement based on the value and the configured multiplier.
  Measurement<T> call(
    List<num> magnitudes, {
    Precision precision = Precision.max,
  });*/

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

abstract class UnitModifier<U extends Unit> {
  final U unit;

  UnitModifier(this.unit);

  @override
  String toString() => unit.toString();

  double get multiplier;

  String get opString;

  static bool isNumerator<T extends UnitModifier>() =>
      <T>[] is List<UnitNumerator>;

  static num typeMultiplier<T extends UnitModifier>(num? value) => value == null
      ? 1.0
      : isNumerator<T>()
          ? value
          : 1.0 / value;

  static num invertedTypeMultiplier<T extends UnitModifier>(num? value) =>
      value == null
          ? 1.0
          : isNumerator<T>()
              ? 1.0 / value
              : value;
}

class UnitNumerator<U extends Unit> extends UnitModifier<U> {
  UnitNumerator(super.unit);

  @override
  double get multiplier => unit.multiplier;

  @override
  String get opString => "*";

  @override
  bool operator ==(Object other) =>
      other is UnitNumerator<U> && other.unit == unit;

  @override
  int get hashCode => 3 * unit.hashCode;
}

class UnitDenominator<U extends Unit> extends UnitModifier<U> {
  UnitDenominator(super.unit);

  @override
  double get multiplier => 1.0 / unit.multiplier;

  @override
  String get opString => "/";

  @override
  String toString() => "${unit.toString()}⁻¹";

  @override
  bool operator ==(Object other) =>
      other is UnitDenominator<U> && other.unit == unit;

  @override
  int get hashCode => 5 * unit.hashCode;
}

/// A [Unit] that rounds its results to `int`s.
///
/// This is useful for measurements that should not be represented fractionally,
/// e.g. the number of items in a collection.
abstract class RoundingUnit<T extends Dimension> extends Unit<T> {
  /// Constructs a [RoundingUnit].
  const RoundingUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  @override
  double of(num siValue) => (siValue.toDouble() * multiplier).roundToDouble();
}

class DerivedUnit1<M extends UnitModifier<Unit<D>>, D extends Dimension>
    extends Unit<Dimension1<M>> {
  final bool _multiplier;

  DerivedUnit1._({
    required super.name,
    required super.unitMultiplier,
    required super.prefix,
  }) : _multiplier = UnitModifier.isNumerator<M>();

  DerivedUnit1.from(
    M measurement, {
    String? name,
    MeasurementPrefix? prefix,
  }) : this._(
          name: name ?? measurement.toString(),
          unitMultiplier:
              UnitModifier.typeMultiplier(measurement.multiplier).toDouble(),
          prefix: prefix ?? const MeasurementPrefix.unit(),
        );

  static DerivedUnit1<UnitDenominator<Unit<D>>, D> inverse<D extends Dimension>(
    Unit<D> unit, {
    String? name,
    double? unitMultiplier,
  }) =>
      DerivedUnit1.from(
        UnitDenominator(unit),
        name: name ?? "${unit.toString()}⁻¹",
      );

  Measurement<Dimension1<M>> call(
    num a, [
    Precision precision = Precision.max,
  ]) =>
      DerivedMeasurement(
        magnitude: UnitModifier.typeMultiplier<M>(a),
        defaultUnit: this,
      );

  Measurement<Dimension1<M>> using<X extends Measurement<D>>(
    X measurement, {
    Precision precision = Precision.max,
  }) {
    return DerivedMeasurement(
      magnitude:
          (_multiplier ? measurement.si : 1.0 / measurement.si) / multiplier,
      defaultUnit: this,
    );
  }

  DerivedUnit1<M, D> withPrefix(MeasurementPrefix prefix) => DerivedUnit1._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class DerivedUnit2<
    M1 extends UnitModifier<Unit<D1>>,
    M2 extends UnitModifier<Unit<D2>>,
    D1 extends Dimension,
    D2 extends Dimension> extends Unit<Dimension2<M1, M2>> {
  final List<bool> _multipliers;

  DerivedUnit2._({
    required super.name,
    required super.unitMultiplier,
    required super.prefix,
  }) : _multipliers = [
          UnitModifier.isNumerator<M1>(),
          UnitModifier.isNumerator<M2>(),
        ];

  DerivedUnit2.from(
    M1 a,
    M2 b, {
    String? name,
    MeasurementPrefix? prefix,
  }) : this._(
          name: name ??
              (a == b ? "${a.toString()}²" : "${a.toString()}⋅${b.toString()}"),
          unitMultiplier: (UnitModifier.invertedTypeMultiplier(a.multiplier) *
                  UnitModifier.invertedTypeMultiplier(b.multiplier))
              .toDouble(),
          prefix: prefix ?? const MeasurementPrefix.unit(),
        );

  Measurement<Dimension2<M1, M2>> call(
    num a, [
    num? b,
    Precision precision = Precision.max,
  ]) =>
      DerivedMeasurement(
        magnitude: UnitModifier.typeMultiplier<M1>(a) *
            UnitModifier.typeMultiplier<M2>(b),
        defaultUnit: this,
      );

  Measurement<Dimension2<M1, M2>>
      using<X1 extends Measurement<D1>, X2 extends Measurement<D2>>(
    X1 a,
    X2 b, {
    Precision precision = Precision.max,
  }) {
    return DerivedMeasurement(
      magnitude: (_multipliers[0] ? a.si : 1.0 / a.si) *
          (_multipliers[1] ? b.si : 1.0 / b.si) /
          multiplier,
      defaultUnit: this,
    );
  }

  DerivedUnit2<M1, M2, D1, D2> withPrefix(MeasurementPrefix prefix) =>
      DerivedUnit2._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

DerivedUnit2<UnitNumerator<Unit<D>>, UnitNumerator<Unit<D>>, D, D>
    square<D extends Dimension>(
  Unit<D> unit, {
  String? name,
  MeasurementPrefix? prefix,
}) =>
        DerivedUnit2.from(
          UnitNumerator(unit),
          UnitNumerator(unit),
          name: name,
          prefix: prefix,
        );

DerivedUnit2<UnitNumerator<Unit<D1>>, UnitDenominator<Unit<D2>>, D1, D2>
    ratio<D1 extends Dimension, D2 extends Dimension>(
  Unit<D1> a,
  Unit<D2> b, {
  String? name,
  MeasurementPrefix? prefix,
}) =>
        DerivedUnit2.from(
          UnitNumerator(a),
          UnitDenominator(b),
          name: name,
          prefix: prefix,
        );

DerivedUnit2<UnitNumerator<Unit<D1>>, UnitNumerator<Unit<D2>>, D1, D2>
    product<D1 extends Dimension, D2 extends Dimension>(
  Unit<D1> a,
  Unit<D2> b, {
  String? name,
  MeasurementPrefix? prefix,
}) =>
        DerivedUnit2.from(
          UnitNumerator(a),
          UnitNumerator(b),
          name: name,
          prefix: prefix,
        );

class DerivedUnit3<
    M1 extends UnitModifier<Unit<D1>>,
    M2 extends UnitModifier<Unit<D2>>,
    M3 extends UnitModifier<Unit<D3>>,
    D1 extends Dimension,
    D2 extends Dimension,
    D3 extends Dimension> extends Unit<Dimension3<M1, M2, M3>> {
  DerivedUnit3({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  DerivedUnit3.from(
    M1 a,
    M2 b,
    M3 c, {
    String? name,
    MeasurementPrefix? prefix,
  }) : super(
          name: name ?? "${a.toString()}⋅${b.toString()}⋅${c.toString()}",
          unitMultiplier: a.multiplier * b.multiplier * c.multiplier,
          prefix: prefix ?? const MeasurementPrefix.unit(),
        );

  DerivedUnit3<M1, M2, M3, D1, D2, D3> withPrefix(MeasurementPrefix prefix) =>
      DerivedUnit3(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  Measurement<Dimension3<M1, M2, M3>> call(
    num a, [
    num? b,
    num? c,
    Precision precision = Precision.max,
  ]) =>
      DerivedMeasurement(
        magnitude: (M1.runtimeType == UnitNumerator ? a : 1.0 / a) *
            (b != null
                ? (M2.runtimeType == UnitNumerator ? b : 1.0 / b)
                : 1.0) *
            (c != null ? (M3.runtimeType == UnitNumerator ? c : 1.0 / c) : 1.0),
        defaultUnit: this,
      );

  Measurement<Dimension3<M1, M2, M3>> using<X1 extends Measurement<D1>,
          X2 extends Measurement<D2>, X3 extends Measurement<D2>>(
    X1 a,
    X2 b,
    X3 c, {
    Precision precision = Precision.max,
  }) =>
      // TODO: magnitude calculation
      DerivedMeasurement(
        magnitude: (a.si * b.si * c.si) / multiplier,
        defaultUnit: this,
      );
}

DerivedUnit3<UnitNumerator<Unit<D>>, UnitNumerator<Unit<D>>,
    UnitNumerator<Unit<D>>, D, D, D> cubic<D extends Dimension>(
  Unit<D> unit, {
  String? name,
  MeasurementPrefix? prefix,
}) =>
    DerivedUnit3.from(
      UnitNumerator(unit),
      UnitNumerator(unit),
      UnitNumerator(unit),
      name: name ?? "${unit.toString()}³",
      prefix: prefix,
    );
