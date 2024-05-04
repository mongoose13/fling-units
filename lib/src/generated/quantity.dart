// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/quantity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionQuantity on num {
  f.Measurement<Quantity> get units => QuantityUnit.units(this);
  f.Measurement<Quantity> get moles => QuantityUnit.moles(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Quantity extends f.Dimension {}

class QuantityUnit extends f.Unit<Quantity> {
  const QuantityUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const QuantityUnit units = QuantityUnit._(
    name: 'units',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const QuantityUnit moles = QuantityUnit._(
    name: 'mol',
    unitMultiplier: 6.022140760630475e+23,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<Quantity> call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      QuantityMeasurement(magnitude, this, f.Precision(precision));

  QuantityUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      QuantityUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is QuantityUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class QuantityMeasurement extends f.Measurement<Quantity> {
  const QuantityMeasurement(
    num magnitude,
    f.Unit<Quantity> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const QuantityMeasurement.zero([super.unit = siUnit]) : super.zero();

  const QuantityMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const QuantityMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const QuantityMeasurement.nan([super.unit = siUnit]) : super.nan();

  static const f.Unit<Quantity> siUnit = units;

  @override
  construct(
    num magnitude,
    f.Unit<Quantity> defaultUnit,
    f.Precision precision,
  ) =>
      QuantityMeasurement(magnitude, defaultUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin QuantityPrefix {
  f.MeasurementPrefix get prefix;
  QuantityUnit get units => QuantityUnit.units.withPrefix(prefix);
  QuantityUnit get moles => QuantityUnit.moles.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const QuantityUnit units = QuantityUnit.units;

const QuantityUnit moles = QuantityUnit.moles;
