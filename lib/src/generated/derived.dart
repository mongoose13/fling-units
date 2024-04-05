part of 'package:fling_units/src/core/library.dart';

class DerivedUnitBuilder<T extends Measurement<T>> {
  final Unit<T> _first;

  DerivedUnitBuilder(this._first);

  DerivedUnit<T, Distance> get meters => DerivedUnit(_first, f.meters);
}

class DerivedMeasurementBuilder<T extends Measurement<T>> {
  final T _measurement;

  DerivedMeasurementBuilder(this._measurement);

  DerivedMeasurement<T, Distance> get meters => DerivedMeasurement.divide(_measurement, 1.meters);
}