// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/temperature_change.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTemperatureChange on num {
  f.Measurement<TemperatureChange> get kelvin =>
      TemperatureChangeUnit.kelvin(this);
  f.Measurement<TemperatureChange> get celcius =>
      TemperatureChangeUnit.celcius(this);
  f.Measurement<TemperatureChange> get fahrenheit =>
      TemperatureChangeUnit.fahrenheit(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class TemperatureChange extends f.Dimension {}

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

  static const TemperatureChangeUnit fahrenheit = TemperatureChangeUnit._(
    name: '°F',
    unitMultiplier: 1.8,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<TemperatureChange> call(
    num magnitude, {
    f.Precision precision = f.Precision.max,
  }) =>
      TemperatureChangeMeasurement(magnitude, this, precision);

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
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
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

  const TemperatureChangeMeasurement.zero([super.unit = siUnit]) : super.zero();

  const TemperatureChangeMeasurement.infinite([super.unit = siUnit])
      : super.infinite();

  const TemperatureChangeMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const TemperatureChangeMeasurement.nan([super.unit = siUnit]) : super.nan();

  TemperatureChangeMeasurement.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const f.Unit<TemperatureChange> siUnit = kelvin;

  @override
  acceptVisitor(f.MeasurementVisitor visitor) =>
      visitor.visitTemperatureChange(this);

  @override
  construct(
    num magnitude,
    f.Unit<TemperatureChange> defaultUnit,
    f.Precision precision,
  ) =>
      TemperatureChangeMeasurement(magnitude, defaultUnit, precision);
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
  TemperatureChangeUnit get fahrenheit =>
      TemperatureChangeUnit.fahrenheit.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const TemperatureChangeUnit kelvin = TemperatureChangeUnit.kelvin;

const TemperatureChangeUnit celcius = TemperatureChangeUnit.celcius;

const TemperatureChangeUnit fahrenheit = TemperatureChangeUnit.fahrenheit;
