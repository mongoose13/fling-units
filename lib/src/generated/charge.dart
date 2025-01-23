// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/charge.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionCharge on num {
  f.Measurement<Charge> get amperes => ChargeUnit.amperes(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Charge extends f.Dimension {
  const Charge();
}

class ChargeUnit extends f.Unit<Charge> {
  const ChargeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const ChargeUnit amperes = ChargeUnit._(
    name: 'A',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<Charge> call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      ChargeMeasurement(magnitude, this, f.Precision(precision));

  ChargeUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      ChargeUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is ChargeUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<ChargeUnit, Charge> get per => f.UnitPer(this);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class ChargeMeasurement extends f.Measurement<Charge> {
  const ChargeMeasurement(
    num magnitude,
    f.Unit<Charge> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const ChargeMeasurement.zero([super.unit = siUnit]) : super.zero();

  const ChargeMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const ChargeMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const ChargeMeasurement.nan([super.unit = siUnit]) : super.nan();

  static const f.Unit<Charge> siUnit = amperes;

  @override
  construct(
    num magnitude,
    f.Unit<Charge> defaultUnit,
    f.Precision precision,
  ) =>
      ChargeMeasurement(magnitude, defaultUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin ChargePrefix {
  f.MeasurementPrefix get prefix;
  ChargeUnit get amperes => ChargeUnit.amperes.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const ChargeUnit amperes = ChargeUnit.amperes;
