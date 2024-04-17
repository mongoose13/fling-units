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
  const TemperatureChangeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const kelvin = TemperatureChangeUnit._(name: 'K', unitMultiplier: 1.0);

  static const celcius =
      TemperatureChangeUnit._(name: '°C', unitMultiplier: 1.0);

  static const fahrenheit =
      TemperatureChangeUnit._(name: '°F', unitMultiplier: 1.8);

  @override
  TemperatureChange call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      TemperatureChange(magnitude, this, precision);

  TemperatureChangeUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      TemperatureChangeUnit._(
          name: name, unitMultiplier: unitMultiplier, prefix: prefix);

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

class TemperatureChange extends Measurement<TemperatureChange> {
  const TemperatureChange(
    num magnitude,
    Unit<TemperatureChange> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const TemperatureChange.zero([super.unit = siUnit]) : super.zero();

  const TemperatureChange.infinite([super.unit = siUnit]) : super.infinite();

  const TemperatureChange.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const TemperatureChange.nan([super.unit = siUnit]) : super.nan();

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
    num magnitude,
    Unit<TemperatureChange> defaultUnit,
    Precision precision,
  ) =>
      TemperatureChange(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<TemperatureChange> get per =>
      DerivedMeasurementPerBuilder(this);
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
