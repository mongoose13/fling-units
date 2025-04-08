part of "library.dart";

class DerivedMeasurement3<
        D1 extends Dimension,
        D2 extends Dimension,
        D3 extends Dimension,
        I1 extends Dimension,
        I2 extends Dimension,
        I3 extends Dimension>
    extends Measurement<Dimension3<D1, D2, D3>, Dimension3<I1, I2, I3>> {
  @override
  final DerivedUnit3<D1, D2, D3, I1, I2, I3> defaultUnit;

  DerivedMeasurement3({
    required super.magnitude,
    required super.precision,
    required this.defaultUnit,
  });

  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> withPrecision(int precision) =>
      DerivedMeasurement3(
        magnitude: magnitude,
        precision: Precision(precision),
        defaultUnit: defaultUnit,
      );

  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> butAs(
          DerivedUnit3<D1, D2, D3, I1, I2, I3> unit) =>
      DerivedMeasurement3(
        magnitude: unit.fromSI(si),
        precision: Precision(precision),
        defaultUnit: unit,
      );

  double as(DerivedUnit3<D1, D2, D3, I1, I2, I3> unit) =>
      precisionData.apply(unit.fromSI(si));

  f.MeasurementPer<
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>,
      Dimension3<D1, D2, D3>,
      Dimension3<I1, I2, I3>> get per => f.MeasurementPer(this);

  f.MeasurementDot<
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>,
      Dimension3<D1, D2, D3>,
      Dimension3<I1, I2, I3>> get dot => f.MeasurementDot(this);

  /// Returns a measurement representing the opposite magnitude of this.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator -() =>
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>(
        magnitude: -magnitude,
        defaultUnit: defaultUnit,
        precision: precisionData,
      );

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator +(
          DerivedMeasurement3<D1, D2, D3, I1, I2, I3> other) =>
      DerivedMeasurement3(
        magnitude: magnitude + other.as(defaultUnit),
        precision: precisionData,
        defaultUnit: defaultUnit,
      );

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator -(
          DerivedMeasurement3<D1, D2, D3, I1, I2, I3> other) =>
      DerivedMeasurement3(
        magnitude: magnitude - other.as(defaultUnit),
        precision: precisionData,
        defaultUnit: defaultUnit,
      );

  /// Returns a measurement equivalent to a multiple of this.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator *(num multiplier) =>
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>(
        magnitude: magnitude * multiplier.toDouble(),
        defaultUnit: defaultUnit,
        precision: precisionData,
      );

  /// Returns a measurement equivalent to a fraction of this.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator /(num divisor) =>
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>(
        magnitude: magnitude / divisor.toDouble(),
        defaultUnit: defaultUnit,
        precision: precisionData,
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
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator %(
          DerivedMeasurement3<D1, D2, D3, I1, I2, I3> other) =>
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>(
        magnitude:
            defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit: defaultUnit,
        precision: f.Precision.combine([precision, other.precision]),
      );

  DerivedMeasurement3<I1, I2, I3, D1, D2, D3> get inverted =>
      DerivedMeasurement3(
        magnitude: magnitude,
        defaultUnit: defaultUnit.inverted,
        precision: precisionData,
      );

  DerivedMeasurement2<Dimension3<D1, D2, D3>, D, Dimension3<I1, I2, I3>, I>
      by<D extends Dimension, I extends Dimension>(Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);

  DerivedMeasurement2<Dimension3<D1, D2, D3>, I, Dimension3<I1, I2, I3>, D>
      over<D extends Dimension, I extends Dimension>(Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);
}
