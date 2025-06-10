import 'package:fling_units/fling_units.dart' as f;

/// Creates a derived [Unit] that is the square of the provided [Unit].
///
/// This is equivalent to using [DerivedUnit2.build] with the same [Unit] twice.
///
/// ```dart
/// final squareFeet = square(feet);
/// ```
f.DerivedUnit2<D, D, I, I> square<D extends f.Dimension, I extends f.Dimension>(
  f.Unit<D, I> unit, {
  String? name,
  f.UnitPrefix prefix = const f.UnitPrefix.unit(),
}) =>
    f.DerivedUnit2.build(unit, unit, name: name, prefix: prefix);

/// Creates a derived [Unit] that is the cube of the provided [Unit].
///
/// This is equivalent to using [product3] with the same [Unit] three times.
///
/// ```dart
/// final cubicFeet = cubic(feet);
/// ```
f.DerivedUnit3<D, D, D, I, I, I>
    cubic<D extends f.Dimension, I extends f.Dimension>(
  f.Unit<D, I> unit, {
  String? name,
  f.UnitPrefix prefix = const f.UnitPrefix.unit(),
}) =>
        f.DerivedUnit3.build(
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
  f.DerivedMeasurement3<D, D, D, I, I, I>
      cubic<D extends f.Dimension, I extends f.Dimension>(f.Unit<D, I> unit) =>
          f.cubic(unit)(this);
}
