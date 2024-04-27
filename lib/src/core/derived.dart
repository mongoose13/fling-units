part of "library.dart";

class DerivedMeasurement<D extends Dimension>
    extends Measurement<D> {
  DerivedMeasurement({
    required super.magnitude,
    required super.defaultUnit,
    super.precision,
  });

  @override
  DerivedMeasurement<D> construct(
    double magnitude,
    Unit<D> defaultUnit,
    Precision precision,
  ) =>
      DerivedMeasurement(
        magnitude: magnitude,
        defaultUnit: defaultUnit,
        precision: precision,
      );
}
