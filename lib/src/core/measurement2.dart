part of "library.dart";

class DerivedMeasurement2<D1 extends f.Dimension, D2 extends f.Dimension,
        I1 extends f.Dimension, I2 extends f.Dimension>
    extends Measurement<f.Dimension2<D1, D2>, f.Dimension2<I1, I2>> {
  @override
  final DerivedUnit2<D1, D2, I1, I2> defaultUnit;

  const DerivedMeasurement2({
    required super.magnitude,
    required super.precision,
    required this.defaultUnit,
  });

  DerivedMeasurement2<D1, D2, I1, I2> withPrecision(f.Precision precision) =>
      DerivedMeasurement2(
        magnitude: magnitude,
        precision: precision,
        defaultUnit: defaultUnit,
      );

  DerivedMeasurement2<D1, D2, I1, I2> butAs(
          DerivedUnit2<D1, D2, I1, I2> unit) =>
      DerivedMeasurement2(
        magnitude: unit.fromSI(si),
        precision: precision,
        defaultUnit: unit,
      );

  double as(DerivedUnit2<D1, D2, I1, I2> unit) =>
      unit.fromSI(precision.apply(si));

  /// Returns a measurement representing the opposite magnitude of this.
  DerivedMeasurement2<D1, D2, I1, I2> operator -() =>
      DerivedMeasurement2<D1, D2, I1, I2>(
        magnitude: -magnitude,
        defaultUnit: defaultUnit,
        precision: precision,
      );

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  DerivedMeasurement2<D1, D2, I1, I2> operator +(
          DerivedMeasurement2<D1, D2, I1, I2> other) =>
      DerivedMeasurement2(
        magnitude: magnitude + other.as(defaultUnit),
        precision: f.Precision.addition(this, other),
        defaultUnit: defaultUnit,
      );

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  DerivedMeasurement2<D1, D2, I1, I2> operator -(
          DerivedMeasurement2<D1, D2, I1, I2> other) =>
      DerivedMeasurement2(
        magnitude: magnitude - other.as(defaultUnit),
        precision: f.Precision.addition(this, other),
        defaultUnit: defaultUnit,
      );

  /// Returns a measurement equivalent to a multiple of this.
  DerivedMeasurement2<D1, D2, I1, I2> operator *(num multiplier) =>
      DerivedMeasurement2<D1, D2, I1, I2>(
        magnitude: magnitude * multiplier.toDouble(),
        defaultUnit: defaultUnit,
        precision: precision,
      );

  /// Returns a measurement equivalent to a fraction of this.
  DerivedMeasurement2<D1, D2, I1, I2> operator /(num divisor) =>
      DerivedMeasurement2<D1, D2, I1, I2>(
        magnitude: magnitude / divisor.toDouble(),
        defaultUnit: defaultUnit,
        precision: precision,
      );

  /// Returns the Euclidean remainder of the division between two measurements.
  ///
  /// For example:
  /// ```dart
  /// feet(2) % inches(7); // 3 inches
  /// inches(7) % feet(2); // 7 inches
  /// ```
  ///
  /// For the purposes of this function, a negative divisor is treated identically
  /// to its positive counterpart, and thus the operation always produces a positive
  /// result. This is consistent with the way Dart handles the modulo operator.
  /// For example:
  /// ```dart
  /// feet(2) % inches(-7); // 3 inches
  /// feet(-2) % inches(7); // 4 inches
  /// feet(-2) % inches(-7); // 4 inches
  /// ```
  ///
  /// If the divisor is zero or the dividend is infinite, the result is always NaN.
  DerivedMeasurement2<D1, D2, I1, I2> operator %(
      DerivedMeasurement2<D1, D2, I1, I2> other) {
    final magnitude =
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue);
    return DerivedMeasurement2<D1, D2, I1, I2>(
      magnitude: magnitude,
      defaultUnit: defaultUnit,
      precision: f.Precision.combine([precision, other.precision], magnitude),
    );
  }

  DerivedMeasurement2<I1, I2, D1, D2> get inverted => DerivedMeasurement2(
        magnitude: magnitude,
        defaultUnit: defaultUnit.inverted,
        precision: precision,
      );

  DerivedMeasurement2<f.Dimension2<D1, D2>, D, f.Dimension2<I1, I2>, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);

  DerivedMeasurement2<f.Dimension2<D1, D2>, I, f.Dimension2<I1, I2>, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);
}

/// Extension on [num] to allow two-component derived measurements to be instantiated.
extension Unit2Extension on num {
  /// Creates a [Measurement] whose [Unit] is the square of the specified [Unit].
  ///
  /// ```dart
  /// var threeSquareFeet = 3.square(feet);
  /// ```
  DerivedMeasurement2<D, D, I, I>
      square<D extends f.Dimension, I extends f.Dimension>(Unit<D, I> unit) =>
          f.square<D, I>(unit)(this);
}
