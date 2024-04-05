part of 'package:fling_units/src/core/library.dart';

// TODO: generate this file!

class DerivedUnitBuilder<T extends Measurement<T>> {
  final Unit<T> _first;
  final bool _reciprocal;

  DerivedUnitBuilder(this._first, this._reciprocal);

  DerivedUnit<T, Distance> get meter =>
      DerivedUnit(_first, f.meters, _reciprocal);
}

class DerivedMeasurementBuilder<T extends Measurement<T>> {
  final T _measurement;
  final bool _reciprocal;

  DerivedMeasurementBuilder(this._measurement, this._reciprocal);

  DerivedMeasurement<T, Distance> get meter => _reciprocal
      ? DerivedMeasurement.divide(_measurement, 1.meters)
      : DerivedMeasurement.multiply(_measurement, 1.meters);
}
