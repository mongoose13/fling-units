// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/temperature_change.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTemperatureChange on num {
  TemperatureChange get kelvin => TemperatureChangeInterpreter.kelvin(this);
  TemperatureChange get celcius => TemperatureChangeInterpreter.celcius(this);
  TemperatureChange get fahrenheit =>
      TemperatureChangeInterpreter.fahrenheit(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class TemperatureChangeInterpreter
    extends MeasurementInterpreter<TemperatureChange> {
  const TemperatureChangeInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const kelvin = TemperatureChangeInterpreter._('K', 1.0);

  static const celcius = TemperatureChangeInterpreter._('°C', 1.0);

  static const fahrenheit = TemperatureChangeInterpreter._('°F', 1.8);

  @override
  TemperatureChange call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      TemperatureChange(value, this, precision);

  TemperatureChangeInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      TemperatureChangeInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class TemperatureChange extends Measurement<TemperatureChange> {
  const TemperatureChange(
    num units,
    MeasurementInterpreter<TemperatureChange> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

  const TemperatureChange.zero([super.interpreter = siUnit]) : super.zero();

  const TemperatureChange.infinite([super.interpreter = siUnit])
      : super.infinite();

  const TemperatureChange.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const TemperatureChange.nan([super.interpreter = siUnit]) : super.nan();

  TemperatureChange.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const TemperatureChangeInterpreter siUnit = kelvin;

  @override
  acceptVisitor(MeasurementVisitor visitor) =>
      visitor.visitTemperatureChange(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<TemperatureChange>? interpreter,
    Precision precision,
  ) =>
      TemperatureChange(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin TemperatureChangePrefix {
  static TemperatureChangeInterpreter siUnit =
      TemperatureChangeInterpreter.kelvin;

  MeasurementPrefix get prefix;
  TemperatureChangeInterpreter get kelvin =>
      TemperatureChangeInterpreter.kelvin.withPrefix(prefix);
  TemperatureChangeInterpreter get celcius =>
      TemperatureChangeInterpreter.celcius.withPrefix(prefix);
  TemperatureChangeInterpreter get fahrenheit =>
      TemperatureChangeInterpreter.fahrenheit.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const kelvin = TemperatureChangeInterpreter.kelvin;

const celcius = TemperatureChangeInterpreter.celcius;

const fahrenheit = TemperatureChangeInterpreter.fahrenheit;
