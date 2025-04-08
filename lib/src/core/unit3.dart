part of "library.dart";

/// A derived [Unit] that has three components.
class DerivedUnit3<
        D1 extends Dimension,
        D2 extends Dimension,
        D3 extends Dimension,
        I1 extends Dimension,
        I2 extends Dimension,
        I3 extends Dimension>
    extends Unit<Dimension3<D1, D2, D3>, Dimension3<I1, I2, I3>> {
  /// Constructor.
  DerivedUnit3({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  /// Constructor using three [UnitPosition]s.
  DerivedUnit3.build(
    Unit<D1, I1> a,
    Unit<D2, I2> b,
    Unit<D3, I3> c, {
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
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> call(
    num magnitude, [
    Precision? precision,
  ]) =>
      DerivedMeasurement3(
        magnitude: magnitude,
        defaultUnit: this,
        precision: precision ?? Precision.max,
      );

  /// Creates a [Measurement] from this [Unit] using existing [Measurement]s of
  /// the same dimension.
  ///
  /// ```dart
  /// // creates a "cubic meter" measurement that is 3 feet wide by 2 feet long by 1 foot high
  /// cubic(meters).using(3.feet, 2.feet, 1.feet);
  /// ```
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> using<
          M1 extends Measurement<D1, I1>,
          M2 extends Measurement<D2, I2>,
          M3 extends Measurement<D3, I3>>(
    M1 first,
    M2 second,
    M3 third, {
    int? precision,
  }) =>
      DerivedMeasurement3(
        magnitude: first.si * second.si * third.si / multiplier,
        precision: precision != null
            ? Precision(precision)
            : Precision.combine(
                [
                  first.precision,
                  second.precision,
                  third.precision,
                ],
              ),
        defaultUnit: this,
      );

  /// Creates a new [Unit] that is identical to this [Unit] but with a different [MeasurementPrefix].
  ///
  /// If this [Unit] already has a prefix, it is ignored in favor of the provided prefix.
  ///
  /// ```dart
  /// final milliMeters = meters.withPrefix(milli);
  /// final centiMeters = milliMeters.withPrefix(centi);
  /// ```
  DerivedUnit3<D1, D2, D3, I1, I2, I3> withPrefix(MeasurementPrefix prefix) =>
      DerivedUnit3(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  DerivedUnit3<I1, I2, I3, D1, D2, D3> get inverted =>
      InvertedDerivedUnit3<I1, I2, I3, D1, D2, D3>(
        name: "($name)⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is DerivedUnit3<D1, D2, D3, I1, I2, I3> &&
      other.unitMultiplier == unitMultiplier &&
      other.prefix == prefix &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * prefix.hashCode * name.hashCode;

  f.UnitPer<DerivedUnit3<D1, D2, D3, I1, I2, I3>, Dimension3<D1, D2, D3>,
      Dimension3<I1, I2, I3>> get per => f.UnitPer(this);

  f.UnitDot<DerivedUnit3<D1, D2, D3, I1, I2, I3>, Dimension3<D1, D2, D3>,
      Dimension3<I1, I2, I3>> get dot => f.UnitDot(this);
}

class InvertedDerivedUnit3<
        D1 extends Dimension,
        D2 extends Dimension,
        D3 extends Dimension,
        I1 extends Dimension,
        I2 extends Dimension,
        I3 extends Dimension> extends DerivedUnit3<D1, D2, D3, I1, I2, I3>
    implements Inverted {
  InvertedDerivedUnit3({
    required super.name,
    required super.unitMultiplier,
    required super.prefix,
  });

  /// Constructor using a pair of [Unit]s.
  InvertedDerivedUnit3.build(
    Unit<D1, I1> first,
    Unit<D2, I2> second,
    Unit<D3, I3> third, {
    String? name,
    MeasurementPrefix? prefix,
  }) : this(
          name: name ??
              (first == second && first == third
                  ? "${first.toString()}³"
                  : "${first.toString()}⋅${second.toString()}⋅${third.toString()}"),
          unitMultiplier:
              first.multiplier * second.multiplier * third.multiplier,
          prefix: prefix ?? const MeasurementPrefix.unit(),
        );

  @override
  DerivedUnit3<I1, I2, I3, D1, D2, D3> get inverted => DerivedUnit3(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  double get multiplier => 1.0 / super.multiplier;
}

/// Creates a derived [Unit] that is the cube of the provided [Unit].
///
/// This is equivalent to using [product3] with the same [Unit] three times.
///
/// ```dart
/// final cubicFeet = cubic(feet);
/// ```
DerivedUnit3<D, D, D, I, I, I> cubic<D extends Dimension, I extends Dimension>(
  Unit<D, I> unit, {
  String? name,
  MeasurementPrefix prefix = const MeasurementPrefix.unit(),
}) =>
    DerivedUnit3.build(
      unit,
      unit,
      unit,
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
  DerivedMeasurement3<D, D, D, I, I, I>
      cubic<D extends Dimension, I extends Dimension>(Unit<D, I> unit) =>
          f.cubic(unit)(this);
}
