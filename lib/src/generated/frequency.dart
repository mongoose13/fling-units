// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/frequency.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionFrequency on num {
  f.Measurement<Frequency> get hertz => FrequencyUnit.hertz(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Frequency extends f.Dimension {}

class FrequencyUnit extends f.Unit<Frequency> {
  const FrequencyUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const FrequencyUnit hertz = FrequencyUnit._(
    name: 'Hz',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<Frequency> call(
    num magnitude, {
    f.Precision precision = f.Precision.max,
  }) =>
      FrequencyMeasurement(magnitude, this, precision);

  FrequencyUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      FrequencyUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is FrequencyUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class FrequencyMeasurement extends f.Measurement<Frequency> {
  const FrequencyMeasurement(
    num magnitude,
    f.Unit<Frequency> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const FrequencyMeasurement.zero([super.unit = siUnit]) : super.zero();

  const FrequencyMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const FrequencyMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const FrequencyMeasurement.nan([super.unit = siUnit]) : super.nan();

  FrequencyMeasurement.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const f.Unit<Frequency> siUnit = hertz;

  @override
  construct(
    num magnitude,
    f.Unit<Frequency> defaultUnit,
    f.Precision precision,
  ) =>
      FrequencyMeasurement(magnitude, defaultUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin FrequencyPrefix {
  f.MeasurementPrefix get prefix;
  FrequencyUnit get hertz => FrequencyUnit.hertz.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const FrequencyUnit hertz = FrequencyUnit.hertz;
