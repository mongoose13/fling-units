part of "library.dart";

/// A derived [Unit] that has three components.
class DerivedUnit3<
    P1 extends UnitPosition<Unit<D1>>,
    P2 extends UnitPosition<Unit<D2>>,
    P3 extends UnitPosition<Unit<D3>>,
    D1 extends Dimension,
    D2 extends Dimension,
    D3 extends Dimension> extends Unit<Dimension3<P1, P2, P3>> {
  /// Constructor.
  DerivedUnit3({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  /// Constructor using three [UnitPosition]s.
  DerivedUnit3.from(
    P1 a,
    P2 b,
    P3 c, {
    String? name,
    super.prefix = const MeasurementPrefix.unit(),
  }) : super(
          name: name ??
              (a == b && a == c
                  ? "${a.toString()}³"
                  : "${a.toString()}⋅${b.toString()}⋅${c.toString()}"),
          unitMultiplier: a.multiplier * b.multiplier * c.multiplier,
        );

  /// Instantiates a [Measurement] using this [Unit] and the provided magnitude(s).
  ///
  /// ```dart
  /// // The following are equivalent.
  /// // Creates a "cubic foot" measurement representing 6 cubic feet.
  /// cubic(feet)(6);
  /// // Creates a "cubic foot" measurement representing 2 feet by 3 feet by 1 foot.
  /// cubic(feet)(2, 3, 1);
  /// // Creates a "cubic foot" measurement representing 2 feet by 3 feet by (implied) 1 foot.
  /// cubic(feet)(2, 3);
  /// ```
  Measurement<Dimension3<P1, P2, P3>> call(
    num a, [
    num? b,
    num? c,
  ]) =>
      Measurement(
        magnitude: b == null
            ? a
            : UnitPosition.typeMultiplier(a) *
                UnitPosition.typeMultiplier(b) *
                UnitPosition.typeMultiplier(c),
        defaultUnit: this,
      );

  /// Creates a [Measurement] from this [Unit] using existing [Measurement]s of
  /// the same dimension.
  ///
  /// ```dart
  /// // creates a "cubic meter" measurement that is 3 feet wide by 2 feet long by 1 foot high
  /// cubic(meters).using(3.feet, 2.feet, 1.feet);
  /// ```
  Measurement<Dimension3<P1, P2, P3>> using<X1 extends Measurement<D1>,
          X2 extends Measurement<D2>, X3 extends Measurement<D2>>(
    X1 a,
    X2 b,
    X3 c, {
    int precision = Precision.maximumPrecision,
  }) =>
      Measurement(
        magnitude: UnitPosition.typeMultiplier<P1>(a.si) *
            UnitPosition.typeMultiplier<P2>(b.si) *
            UnitPosition.typeMultiplier<P3>(c.si) *
            multiplier,
        defaultUnit: this,
        precision: Precision(precision),
      );

  /// Creates a new [Unit] that is identical to this [Unit] but with a different [MeasurementPrefix].
  ///
  /// If this [Unit] already has a prefix, it is ignored in favor of the provided prefix.
  ///
  /// ```dart
  /// final milliMeters = meters.withPrefix(milli);
  /// final centiMeters = milliMeters.withPrefix(centi);
  /// ```
  DerivedUnit3<P1, P2, P3, D1, D2, D3> withPrefix(MeasurementPrefix prefix) =>
      DerivedUnit3(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is DerivedUnit3<P1, P2, P3, D1, D2, D3> &&
      other.unitMultiplier == unitMultiplier &&
      other.prefix == prefix &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * prefix.hashCode * name.hashCode;
}

/// Creates a derived [Unit] that is the cube of the provided [Unit].
///
/// This is equivalent to using [product3] with the same [Unit] three times.
///
/// ```dart
/// final cubicFeet = cubic(feet);
/// ```
DerivedUnit3<UnitNumerator<Unit<D>>, UnitNumerator<Unit<D>>,
    UnitNumerator<Unit<D>>, D, D, D> cubic<D extends Dimension>(
  Unit<D> unit, {
  String? name,
  MeasurementPrefix prefix = const MeasurementPrefix.unit(),
}) =>
    product3(
      unit,
      unit,
      unit,
      name: name,
      prefix: prefix,
    );

/// Creates a derived [Unit] that is the product of the provided [Unit]s.
///
/// ```dart
/// // In case you ever needed this...
/// final footMeterMiles = product3(feet, meters, miles);
/// ```
DerivedUnit3<UnitNumerator<Unit<D1>>, UnitNumerator<Unit<D2>>,
        UnitNumerator<Unit<D3>>, D1, D2, D3>
    product3<D1 extends Dimension, D2 extends Dimension, D3 extends Dimension>(
  Unit<D1> a,
  Unit<D2> b,
  Unit<D3> c, {
  String? name,
  MeasurementPrefix prefix = const MeasurementPrefix.unit(),
}) =>
        DerivedUnit3.from(
          UnitNumerator(a),
          UnitNumerator(b),
          UnitNumerator(c),
          name: name,
          prefix: prefix,
        );

/// Extension on [num] to allow three-component derived measurements to be instantiated.
extension Unit3Extension on num {
  /// Creates a [Measurement] whose [Unit] is the cube of the specified [Unit].
  ///
  /// ```dart
  /// var threeCubicFeet = 3.cubic(feet);
  /// ```
  Measurement<
      Dimension3<UnitNumerator<Unit<D>>, UnitNumerator<Unit<D>>,
          UnitNumerator<Unit<D>>>> cubic<D extends Dimension>(Unit<D> unit) =>
      f.cubic(unit)(this);

  /// Creates a [Measurement] whose [Unit] is the product of the specified [Unit]s.
  ///
  /// ```dart
  /// // In case you ever needed this...
  /// final threeFootMeterMiles = 3.product3(feet, meters, miles);
  /// ```
  Measurement<
          Dimension3<UnitNumerator<Unit<D1>>, UnitNumerator<Unit<D2>>,
              UnitNumerator<Unit<D3>>>>
      product3<D1 extends Dimension, D2 extends Dimension,
              D3 extends Dimension>(
    Unit<D1> first,
    Unit<D2> second,
    Unit<D3> third,
  ) =>
          f.product3(first, second, third)(this);
}
