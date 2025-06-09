part of "library.dart";

class DerivedMeasurement3<
        D1 extends f.Dimension,
        D2 extends f.Dimension,
        D3 extends f.Dimension,
        I1 extends f.Dimension,
        I2 extends f.Dimension,
        I3 extends f.Dimension>
    extends Measurement<f.Dimension3<D1, D2, D3>, f.Dimension3<I1, I2, I3>> {
  @override
  final DerivedUnit3<D1, D2, D3, I1, I2, I3> defaultUnit;

  DerivedMeasurement3({
    required super.magnitude,
    required super.precision,
    required this.defaultUnit,
  });

  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> withPrecision(
          Precision precision) =>
      DerivedMeasurement3(
        magnitude: magnitude,
        precision: precision,
        defaultUnit: defaultUnit,
      );

  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> butAs(
          DerivedUnit3<D1, D2, D3, I1, I2, I3> unit) =>
      DerivedMeasurement3(
        magnitude: unit.fromSI(si),
        precision: precision,
        defaultUnit: unit,
      );

  double as(DerivedUnit3<D1, D2, D3, I1, I2, I3> unit) =>
      precision.apply(unit.fromSI(si));

  f.MeasurementPer<
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>,
      f.Dimension3<D1, D2, D3>,
      f.Dimension3<I1, I2, I3>> get per => f.MeasurementPer(this);

  f.MeasurementDot<
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>,
      f.Dimension3<D1, D2, D3>,
      f.Dimension3<I1, I2, I3>> get dot => f.MeasurementDot(this);

  /// Returns a measurement representing the opposite magnitude of this.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator -() =>
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>(
        magnitude: -magnitude,
        defaultUnit: defaultUnit,
        precision: precision,
      );

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator +(
          DerivedMeasurement3<D1, D2, D3, I1, I2, I3> other) =>
      DerivedMeasurement3(
        magnitude: magnitude + other.as(defaultUnit),
        precision: precision,
        defaultUnit: defaultUnit,
      );

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator -(
          DerivedMeasurement3<D1, D2, D3, I1, I2, I3> other) =>
      DerivedMeasurement3(
        magnitude: magnitude - other.as(defaultUnit),
        precision: precision,
        defaultUnit: defaultUnit,
      );

  /// Returns a measurement equivalent to a multiple of this.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator *(num multiplier) =>
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>(
        magnitude: magnitude * multiplier.toDouble(),
        defaultUnit: defaultUnit,
        precision: precision,
      );

  /// Returns a measurement equivalent to a fraction of this.
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator /(num divisor) =>
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3>(
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
  DerivedMeasurement3<D1, D2, D3, I1, I2, I3> operator %(
      DerivedMeasurement3<D1, D2, D3, I1, I2, I3> other) {
    final magnitude =
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue);
    return DerivedMeasurement3<D1, D2, D3, I1, I2, I3>(
      magnitude: magnitude,
      defaultUnit: defaultUnit,
      precision: f.Precision.combine([precision, other.precision], magnitude),
    );
  }

  DerivedMeasurement3<I1, I2, I3, D1, D2, D3> get inverted =>
      DerivedMeasurement3(
        magnitude: magnitude,
        defaultUnit: defaultUnit.inverted,
        precision: precision,
      );

  DerivedMeasurement2<f.Dimension3<D1, D2, D3>, D, f.Dimension3<I1, I2, I3>, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);

  DerivedMeasurement2<f.Dimension3<D1, D2, D3>, I, f.Dimension3<I1, I2, I3>, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);
}
