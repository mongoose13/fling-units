// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/temperature_change.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTemperatureChange on num {
  f.TemperatureChangeMeasurement get kelvin =>
      TemperatureChangeUnit.kelvin(this);
  f.TemperatureChangeMeasurement get celcius =>
      TemperatureChangeUnit.celcius(this);
  f.TemperatureChangeMeasurement get celsius =>
      TemperatureChangeUnit.celsius(this);
  f.TemperatureChangeMeasurement get fahrenheit =>
      TemperatureChangeUnit.fahrenheit(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class TemperatureChange extends f.Dimension {
  const TemperatureChange();
}

class TemperatureChangeUnit extends f.Unit<TemperatureChange> {
  const TemperatureChangeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const TemperatureChangeUnit kelvin = TemperatureChangeUnit._(
    name: 'K',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const TemperatureChangeUnit celcius = TemperatureChangeUnit._(
    name: '°C',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const TemperatureChangeUnit celsius = TemperatureChangeUnit._(
    name: '°C',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const TemperatureChangeUnit fahrenheit = TemperatureChangeUnit._(
    name: '°F',
    unitMultiplier: 0.5555555555555556,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.TemperatureChangeMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      TemperatureChangeMeasurement(magnitude, this, f.Precision(precision));

  TemperatureChangeUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      TemperatureChangeUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is TemperatureChangeUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name &&
      other.prefix == prefix;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<TemperatureChangeUnit, TemperatureChange> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<TemperatureChangeUnit, TemperatureChange> get dot =>
      f.UnitDot(this);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class TemperatureChangeMeasurement extends f.Measurement<TemperatureChange> {
  const TemperatureChangeMeasurement(
    num magnitude,
    f.Unit<TemperatureChange> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  /// Creates a measurement that is the sum of several measurements.
  TemperatureChangeMeasurement.sum(
    Iterable<f.Measurement<TemperatureChange>> parts, {
    int precision = f.Precision.maximumPrecision,
  }) : super(
          magnitude: parts.first.defaultUnit.of(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
          defaultUnit: parts.first.defaultUnit,
        );

  const TemperatureChangeMeasurement.zero([super.unit = siUnit]) : super.zero();

  const TemperatureChangeMeasurement.infinite([super.unit = siUnit])
      : super.infinite();

  const TemperatureChangeMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const TemperatureChangeMeasurement.nan([super.unit = siUnit]) : super.nan();

  static const f.Unit<TemperatureChange> siUnit = kelvin;

  @override
  f.TemperatureChangeMeasurement construct(
    num magnitude,
    f.Unit<TemperatureChange> defaultUnit,
    f.Precision precision,
  ) =>
      TemperatureChangeMeasurement(magnitude, defaultUnit, precision);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit in the numerator and the specified unit in the denominator, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementPer<TemperatureChangeMeasurement, TemperatureChange> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit multiplied by the specified measurement's unit, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementDot<TemperatureChangeMeasurement, TemperatureChange> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.Measurement<
          f
          .Dimension2<f.UnitNumerator<TemperatureChange>, f.UnitDenominator<D>>>
      over<D extends f.Dimension>(f.Measurement<D> denominator) =>
          f.ratio<TemperatureChange, D>(defaultUnit, denominator.defaultUnit)(
              defaultValue, denominator.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.Measurement<
          f.Dimension2<f.UnitNumerator<TemperatureChange>, f.UnitNumerator<D>>>
      by<D extends f.Dimension>(f.Measurement<D> term) =>
          f.product2<TemperatureChange, D>(defaultUnit, term.defaultUnit)(
              defaultValue, term.defaultValue);

  /// Creates an equivalent measurement with the specified precision (significant digits).
  @override
  f.TemperatureChangeMeasurement withPrecision(int precision) =>
      construct(magnitude.toDouble(), defaultUnit, f.Precision(precision));
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin TemperatureChangePrefix {
  f.MeasurementPrefix get prefix;
  TemperatureChangeUnit get kelvin =>
      TemperatureChangeUnit.kelvin.withPrefix(prefix);
  TemperatureChangeUnit get celcius =>
      TemperatureChangeUnit.celcius.withPrefix(prefix);
  TemperatureChangeUnit get celsius =>
      TemperatureChangeUnit.celsius.withPrefix(prefix);
  TemperatureChangeUnit get fahrenheit =>
      TemperatureChangeUnit.fahrenheit.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const TemperatureChangeUnit kelvin = TemperatureChangeUnit.kelvin;

const TemperatureChangeUnit celcius = TemperatureChangeUnit.celcius;

const TemperatureChangeUnit celsius = TemperatureChangeUnit.celsius;

const TemperatureChangeUnit fahrenheit = TemperatureChangeUnit.fahrenheit;
