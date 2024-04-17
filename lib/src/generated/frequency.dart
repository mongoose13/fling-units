// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/frequency.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionFrequency on num {
  Frequency get hertz => FrequencyUnit.hertz(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class FrequencyUnit extends Unit<Frequency> {
  const FrequencyUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const hertz = FrequencyUnit._(name: 'Hz', unitMultiplier: 1.0);

  @override
  Frequency call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Frequency(magnitude, this, precision);

  FrequencyUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      FrequencyUnit._(
          name: name, unitMultiplier: unitMultiplier, prefix: prefix);

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

class Frequency extends Measurement<Frequency> {
  const Frequency(
    num magnitude,
    Unit<Frequency> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const Frequency.zero([super.unit = siUnit]) : super.zero();

  const Frequency.infinite([super.unit = siUnit]) : super.infinite();

  const Frequency.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const Frequency.nan([super.unit = siUnit]) : super.nan();

  Frequency.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const FrequencyUnit siUnit = hertz;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitFrequency(this);

  @override
  construct(
    num magnitude,
    Unit<Frequency> defaultUnit,
    Precision precision,
  ) =>
      Frequency(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Frequency> get per =>
      DerivedMeasurementPerBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin FrequencyPrefix {
  static FrequencyUnit siUnit = FrequencyUnit.hertz;

  MeasurementPrefix get prefix;
  FrequencyUnit get hertz => FrequencyUnit.hertz.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const hertz = FrequencyUnit.hertz;
