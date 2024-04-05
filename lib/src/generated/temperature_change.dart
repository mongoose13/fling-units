// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/temperature_change.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTemperatureChange on num {
  TemperatureChange get kelvin => TemperatureChangeUnit.kelvin(this);
  TemperatureChange get celcius => TemperatureChangeUnit.celcius(this);
  TemperatureChange get fahrenheit => TemperatureChangeUnit.fahrenheit(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class TemperatureChangeUnit extends Unit<TemperatureChange> {
  const TemperatureChangeUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const kelvin = TemperatureChangeUnit._('K', 1.0);

  static const celcius = TemperatureChangeUnit._('°C', 1.0);

  static const fahrenheit = TemperatureChangeUnit._('°F', 1.8);

  @override
  TemperatureChange call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      TemperatureChange(value, this, precision);

  TemperatureChangeUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      TemperatureChangeUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class TemperatureChange extends Measurement<TemperatureChange> {
  const TemperatureChange(
    num units,
    Unit<TemperatureChange> interpreter, [
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

  static const TemperatureChangeUnit siUnit = kelvin;

  @override
  acceptVisitor(MeasurementVisitor visitor) =>
      visitor.visitTemperatureChange(this);

  @override
  construct(
    double amount,
    Unit<TemperatureChange>? interpreter,
    Precision precision,
  ) =>
      TemperatureChange(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<TemperatureChange> get per =>
      DerivedMeasurementBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin TemperatureChangePrefix {
  static TemperatureChangeUnit siUnit = TemperatureChangeUnit.kelvin;

  MeasurementPrefix get prefix;
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

const kelvin = TemperatureChangeUnit.kelvin;

const celcius = TemperatureChangeUnit.celcius;

const fahrenheit = TemperatureChangeUnit.fahrenheit;
