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
  const FrequencyUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const hertz = FrequencyUnit._('Hz', 1.0);

  @override
  Frequency call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Frequency(value, this, precision);

  FrequencyUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      FrequencyUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Frequency extends Measurement<Frequency> {
  const Frequency(
    num units,
    Unit<Frequency> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

  const Frequency.zero([super.interpreter = siUnit]) : super.zero();

  const Frequency.infinite([super.interpreter = siUnit]) : super.infinite();

  const Frequency.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Frequency.nan([super.interpreter = siUnit]) : super.nan();

  Frequency.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const FrequencyUnit siUnit = hertz;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitFrequency(this);

  @override
  construct(
    double amount,
    Unit<Frequency>? interpreter,
    Precision precision,
  ) =>
      Frequency(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Frequency> get per =>
      DerivedMeasurementBuilder(this);
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
