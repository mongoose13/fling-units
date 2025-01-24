part of "library.dart";

/// A derived [Unit] that has two components.
class DerivedUnit2<
    P1 extends UnitPosition<D1>,
    P2 extends UnitPosition<D2>,
    D1 extends Dimension,
    D2 extends Dimension> extends Unit<Dimension2<P1, P2>> {
  /// Constructor.
  DerivedUnit2._({
    required super.name,
    required super.unitMultiplier,
    required super.prefix,
  });

  /// Constructor using a pair of [UnitPosition]s.
  ///
  /// The optional [d1] and [d2] arguments are useful in defining the
  /// most restrictive type possible for the result. This ensures static
  /// analysis works as intended for derived types.
  /// See [this StackOverflow question](https://stackoverflow.com/questions/79376837)
  /// for details.
  static DerivedUnit2<P1, P2, D1, D2> build<
          P1 extends UnitPosition<D1>,
          P2 extends UnitPosition<D2>,
          D1 extends Dimension,
          D2 extends Dimension>(
    P1 first,
    P2 second, {
    D1? d1,
    D2? d2,
    String? name,
    MeasurementPrefix? prefix,
  }) =>
      DerivedUnit2._(
        name: name ??
            (first == second
                ? "${first.toString()}²"
                : "${first.toString()}⋅${second.toString()}"),
        unitMultiplier: first.multiplier * second.multiplier,
        prefix: prefix ?? const MeasurementPrefix.unit(),
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
  Measurement<Dimension2<P1, P2>> call(
    num a, [
    num? b,
  ]) =>
      Measurement(
        magnitude: b == null
            ? a
            : UnitPosition.typeMultiplier<P1>(a) *
                UnitPosition.typeMultiplier<P2>(b),
        defaultUnit: this,
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
  Measurement<Dimension2<P1, P2>>
      using<M1 extends Measurement<D1>, M2 extends Measurement<D2>>(
    M1 first,
    M2 second, {
    int? precision,
  }) {
    return Measurement(
      magnitude: UnitPosition.typeMultiplier<P1>(first.si) *
          UnitPosition.typeMultiplier<P2>(second.si) /
          multiplier,
      defaultUnit: this,
      precision: precision != null
          ? Precision(precision)
          : Precision.combine([first.precision, second.precision]),
    );
  }

  /// Creates a new [Unit] that is identical to this [Unit] but with a different [MeasurementPrefix].
  ///
  /// If this [Unit] already has a prefix, it is ignored in favor of the provided prefix.
  ///
  /// ```dart
  /// final milliMeters = meters.withPrefix(milli);
  /// final centiMeters = milliMeters.withPrefix(centi);
  /// ```
  DerivedUnit2<P1, P2, D1, D2> withPrefix(MeasurementPrefix prefix) =>
      DerivedUnit2._(
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
  DerivedUnit2<P1, P2, D1, D2> withName(String name) => DerivedUnit2._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  operator ==(Object other) =>
      other is DerivedUnit2<P1, P2, D1, D2> &&
      other.unitMultiplier == unitMultiplier &&
      other.prefix == prefix &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * prefix.hashCode * name.hashCode;
}

/// Creates a derived [Unit] that is the square of the provided [Unit].
///
/// This is equivalent to using [product2] with the same [Unit] twice.
///
/// ```dart
/// final squareFeet = square(feet);
/// ```
DerivedUnit2<UnitNumerator<D>, UnitNumerator<D>, D, D>
    square<D extends Dimension>(
  Unit<D> unit, {
  String? name,
  MeasurementPrefix? prefix,
}) =>
        product2(unit, unit, name: name, prefix: prefix);

/// Creates a derived [Unit] that is a ratio between the two provided [Unit]s.
///
/// ```dart
/// final milesPerHour = ratio(miles, hours);
/// ```
DerivedUnit2<UnitNumerator<D1>, UnitDenominator<D2>, D1, D2>
    ratio<D1 extends Dimension, D2 extends Dimension>(
  Unit<D1> a,
  Unit<D2> b, {
  String? name,
  MeasurementPrefix? prefix,
}) =>
        DerivedUnit2.build(
          UnitNumerator(a),
          UnitDenominator(b),
          name: name,
          prefix: prefix,
        );

/// Creates a derived [Unit] that is the product of the provided [Unit]s.
///
/// ```dart
/// final coulombs = product2(seconds, amperes);
/// ```
DerivedUnit2<UnitNumerator<D1>, UnitNumerator<D2>, D1, D2>
    product2<D1 extends Dimension, D2 extends Dimension>(
  Unit<D1> a,
  Unit<D2> b, {
  String? name,
  MeasurementPrefix? prefix,
}) =>
        DerivedUnit2.build(
          UnitNumerator(a),
          UnitNumerator(b),
          name: name,
          prefix: prefix,
        );

/// Extension on [num] to allow two-component derived measurements to be instantiated.
extension Unit2Extension on num {
  /// Creates a [Measurement] whose [Unit] is the square of the specified [Unit].
  ///
  /// ```dart
  /// var threeSquareFeet = 3.square(feet);
  /// ```
  Measurement<Dimension2<UnitNumerator<D>, UnitNumerator<D>>>
      square<D extends Dimension>(Unit<D> unit) => f.square(unit)(this);

  /// Creates a [Measurement] whose [Unit] is the product of the specified [Unit]s.
  ///
  /// ```dart
  /// var threeFootPounds = 3.product2(feet, pounds);
  /// ```
  Measurement<Dimension2<UnitNumerator<D1>, UnitNumerator<D2>>>
      product2<D1 extends Dimension, D2 extends Dimension>(
              Unit<D1> first, Unit<D2> second) =>
          f.product2(first, second)(this);

  /// Creates a [Measurement] whose [Unit] is the ratio between the provided [Unit]s.
  ///
  /// ```dart
  /// var threeMilesPerHour = 3.ratio(miles, hours);
  /// ```
  Measurement<Dimension2<UnitNumerator<D1>, UnitDenominator<D2>>>
      ratio<D1 extends Dimension, D2 extends Dimension>(
              Unit<D1> numerator, Unit<D2> denominator) =>
          f.ratio(numerator, denominator)(this);
}
