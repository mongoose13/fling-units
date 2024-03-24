// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/frequency.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionFrequency on num {
  Frequency get hertz => FrequencyInterpreter.hertz(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class FrequencyInterpreter extends MeasurementInterpreter<Frequency> {
  const FrequencyInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const hertz = FrequencyInterpreter._('Hz', 1.0);

  @override
  Frequency call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Frequency(value, this, precision);

  FrequencyInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      FrequencyInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Frequency extends Measurement<Frequency> {
  Frequency(
    num units,
    MeasurementInterpreter<Frequency> interpreter, [
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

  static const FrequencyInterpreter siUnit = hertz;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitFrequency(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Frequency>? interpreter,
    Precision precision,
  ) =>
      Frequency(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin FrequencyPrefix {
  static FrequencyInterpreter siUnit = FrequencyInterpreter.hertz;

  MeasurementPrefix get prefix;
  FrequencyInterpreter get hertz =>
      FrequencyInterpreter.hertz.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const hertz = FrequencyInterpreter.hertz;
