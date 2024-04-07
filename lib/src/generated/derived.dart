part of 'package:fling_units/src/core/library.dart';

// TODO: generate this file!

class DerivedUnitByBuilder<T extends Measurement<T>> {
  final Unit<T> _first;

  DerivedUnitByBuilder(this._first);

  DerivedUnitBy<T, Distance> get meter => DerivedUnitBy(_first, f.meters);
}

class DerivedUnitPerBuilder<T extends Measurement<T>> {
  final Unit<T> _first;

  DerivedUnitPerBuilder(this._first);

  DerivedUnitPer<T, Distance> get meter => DerivedUnitPer(_first, f.meters);
}

class DerivedMeasurementByBuilder<T extends Measurement<T>> {
  final Measurement<T> _measurement;

  DerivedMeasurementByBuilder(this._measurement);

  DerivedMeasurementBy<T, Distance> get meter => DerivedMeasurementBy(
        magnitude: _measurement._magnitude,
        defaultUnit: _measurement.defaultUnit.multiply(meters),
      );
}

class DerivedMeasurementPerBuilder<T extends Measurement<T>> {
  final Measurement<T> _measurement;

  DerivedMeasurementPerBuilder(this._measurement);

  DerivedMeasurementPer<T, Distance> get meter => DerivedMeasurementPer(
        magnitude: _measurement._magnitude,
        defaultUnit: _measurement.defaultUnit.divide(meters),
      );
}
