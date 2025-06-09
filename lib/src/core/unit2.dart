part of "library.dart";

/// A derived [Unit] that has two components.
class DerivedUnit2<D1 extends f.Dimension, D2 extends f.Dimension,
        I1 extends f.Dimension, I2 extends f.Dimension>
    extends Unit<f.Dimension2<D1, D2>, f.Dimension2<I1, I2>>
    implements Prefixable<DerivedMeasurement2<D1, D2, I1, I2>> {
  /// Constructor.
  const DerivedUnit2({
    required super.name,
    required super.unitMultiplier,
    required super.prefix,
  });

  /// Constructor using a pair of [Unit]s.
  DerivedUnit2.build(
    Unit<D1, I1> first,
    Unit<D2, I2> second, {
    String? name,
    UnitPrefix? prefix,
  }) : this(
          name: name ??
              (first == second
                  ? "${first.toString()}²"
                  : "${first.toString()}⋅${second.toString()}"),
          unitMultiplier: first.multiplier * second.multiplier,
          prefix: prefix ?? const UnitPrefix.unit(),
        );

  /// Instantiates a [Measurement] using this [Unit] and the provided magnitude(s).
  ///
  /// ```dart
  /// // The following are equivalent.
  /// // Creates a "square foot" measurement representing 6 square feet.
  /// square(feet)(6);
  /// // Creates a "square foot" measurement representing 2 feet by 3 feet.
  /// square(feet)(2, 3);
  /// ```
  @override
  DerivedMeasurement2<D1, D2, I1, I2> call(
    num magnitude, [
    f.Precision? precision,
  ]) =>
      DerivedMeasurement2(
        magnitude: magnitude,
        defaultUnit: this,
        precision: precision ?? f.Precision.max,
      );

  /// Creates a [Measurement] from this [Unit] using existing [Measurement]s of
  /// the same dimension.
  ///
  /// If a new precision is not provided, the precision from the two component parts
  /// are combined.
  ///
  /// ```dart
  /// // Creates a "square meter" measurement that is 3 feet wide by 2 feet long
  /// square(meters).using(3.feet, 2.feet);
  /// ```
  DerivedMeasurement2<D1, D2, I1, I2>
      using<M1 extends Measurement<D1, I1>, M2 extends Measurement<D2, I2>>(
    M1 first,
    M2 second, {
    f.Precision? precision,
  }) {
    final magnitude = first.si * second.si / multiplier;
    return DerivedMeasurement2(
        magnitude: magnitude,
        precision: precision ??
            f.Precision.combine(
              [
                first.precision,
                second.precision,
              ],
              magnitude,
            ),
        defaultUnit: this);
  }

  /// Creates a new [Unit] that is identical to this [Unit] but with a different [UnitPrefix].
  ///
  /// If this [Unit] already has a prefix, it is ignored in favor of the provided prefix.
  ///
  /// ```dart
  /// final milliMeters = meters.withPrefix(milli);
  /// final centiMeters = milliMeters.withPrefix(centi);
  /// ```
  @override
  DerivedUnit2<D1, D2, I1, I2> withPrefix(UnitPrefix prefix) => DerivedUnit2(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  /// Creates a new [Unit] that is identical to this [Unit] but with a different name.
  ///
  /// If this [Unit] already has a name, it is ignored in favor of the provided name.
  ///
  /// ```dart
  /// final milliMeters = milli.meters.withName("millimeters");
  /// ```
  DerivedUnit2<D1, D2, I1, I2> withName(String name) => DerivedUnit2(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  DerivedUnit2<I1, I2, D1, D2> get inverted => InvertedDerivedUnit2(
        name: "($name)⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  f.PrefixedUnitPer<DerivedUnit2<D1, D2, I1, I2>, f.Dimension2<D1, D2>,
      f.Dimension2<I1, I2>> get per => f.PrefixedUnitPer(this);

  f.PrefixedUnitDot<DerivedUnit2<D1, D2, I1, I2>, f.Dimension2<D1, D2>,
      f.Dimension2<I1, I2>> get dot => f.PrefixedUnitDot(this);

  @override
  operator ==(Object other) =>
      other is DerivedUnit2<D1, D2, I1, I2> &&
      other.unitMultiplier == unitMultiplier &&
      other.prefix == prefix &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * prefix.hashCode * name.hashCode;
}

class InvertedDerivedUnit2<
    D1 extends f.Dimension,
    D2 extends f.Dimension,
    I1 extends f.Dimension,
    I2 extends f.Dimension> extends DerivedUnit2<D1, D2, I1, I2> {
  InvertedDerivedUnit2({
    required super.name,
    required super.unitMultiplier,
    required super.prefix,
  });

  /// Constructor using a pair of [Unit]s.
  InvertedDerivedUnit2.build(
    Unit<D1, I1> first,
    Unit<D2, I2> second, {
    String? name,
    UnitPrefix? prefix,
  }) : this(
          name: name ??
              (first == second
                  ? "${first.toString()}²"
                  : "${first.toString()}⋅${second.toString()}"),
          unitMultiplier: first.multiplier * second.multiplier,
          prefix: prefix ?? const UnitPrefix.unit(),
        );

  @override
  DerivedUnit2<I1, I2, D1, D2> get inverted => DerivedUnit2(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  double get multiplier => 1.0 / super.multiplier;

  @override
  operator ==(Object other) =>
      other is InvertedDerivedUnit2<D1, D2, I1, I2> &&
      other.unitMultiplier == unitMultiplier &&
      other.prefix == prefix &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * prefix.hashCode * name.hashCode;
}

/// Creates a derived [Unit] that is the square of the provided [Unit].
///
/// This is equivalent to using [DerivedUnit2.build] with the same [Unit] twice.
///
/// ```dart
/// final squareFeet = square(feet);
/// ```
DerivedUnit2<D, D, I, I> square<D extends f.Dimension, I extends f.Dimension>(
  Unit<D, I> unit, {
  String? name,
  UnitPrefix? prefix,
}) =>
    DerivedUnit2.build(unit, unit, name: name, prefix: prefix);
