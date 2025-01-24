// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/charge.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionCharge on num {
  f.ChargeMeasurement get amperes => ChargeUnit.amperes(this);
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

  f.ChargeMeasurement call(
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

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<ChargeUnit, Charge> get dot => f.UnitDot(this);
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

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit in the numerator and the specified unit in the denominator, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementPer<ChargeMeasurement, Charge> get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit multiplied by the specified measurement's unit, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementDot<ChargeMeasurement, Charge> get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Charge>, f.UnitDenominator<D>>>
      over<D extends f.Dimension>(f.Measurement<D> denominator) =>
          f.ratio<Charge, D>(defaultUnit, denominator.defaultUnit)(
              defaultValue, denominator.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Charge>, f.UnitNumerator<D>>>
      by<D extends f.Dimension>(f.Measurement<D> term) => f.product2<Charge, D>(
          defaultUnit, term.defaultUnit)(defaultValue, term.defaultValue);
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
