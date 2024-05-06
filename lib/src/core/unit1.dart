part of "library.dart";

/// A derived [Unit] that has a single component.
class DerivedUnit1<P extends UnitPosition<D>, D extends Dimension>
    extends Unit<Dimension1<P>> {

  // Constructor.
  DerivedUnit1._({
    required super.name,
    required super.unitMultiplier,
    required super.prefix,
  });

  /// Constructor using a [UnitPosition].
  DerivedUnit1._from(
    P position, {
    String? name,
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  }) : this._(
          name: name ?? position.toString(),
          unitMultiplier: position.multiplier,
          prefix: prefix,
        );

  /// Instantiates a [Measurement] using this [Unit] and the provided magnitude.
  ///
  /// ```dart
  /// // Creates a measurement representing 3 feet.
  /// feet(3);
  /// ```
  Measurement<Dimension1<P>> call(num a) => Measurement(
        magnitude: a,
        defaultUnit: this,
      );

  /// Creates a [Measurement] from this [Unit] using existing [Measurement]s of
  /// the same dimension.
  ///
  /// ```dart
  /// // Creates a "meters" measurement that is the equivalent of 3 feet.
  /// meters.using(3.feet);
  /// ```
  Measurement<Dimension1<P>> using<M extends Measurement<D>>(
    M measurement, {
    int precision = Precision.maximumPrecision,
  }) {
    return Measurement(
      magnitude: UnitPosition.typeMultiplier<P>(measurement.si) / multiplier,
      defaultUnit: this,
      precision: Precision(precision),
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
  DerivedUnit1<P, D> withPrefix(MeasurementPrefix prefix) => DerivedUnit1._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) => other is DerivedUnit1<P, D>;

  @override
  int get hashCode => P.hashCode * D.hashCode;
}

/// Creates a derived [Unit] that is the inverse of the specified [Unit].
///
/// ```dart
/// final hertz = inverse(seconds);
/// ```
DerivedUnit1<UnitDenominator<D>, D> inverse<D extends Dimension>(
  Unit<D> unit, {
  String? name,
}) =>
    DerivedUnit1._from(
      UnitDenominator(unit),
      name: name,
    );

/// Extension on [num] to allow single-component derived measurements to be instantiated.
extension Unit1Extension on num {
  /// Creates a [Measurement] whose [Unit] is the inverse of the specified [Unit].
  ///
  /// ```dart
  /// var threeHertz = 3.inverse(seconds);
  /// ```
  Measurement<Dimension1<UnitDenominator<D>>>
      inverse<D extends Dimension>(Unit<D> unit) => f.inverse(unit)(this);
}
