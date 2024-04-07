// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/quantity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionQuantity on num {
  Quantity get units => QuantityUnit.units(this);
  Quantity get moles => QuantityUnit.moles(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class QuantityUnit extends Unit<Quantity> {
  const QuantityUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const units = QuantityUnit._(name: 'units', unitMultiplier: 1.0);

  static const moles =
      QuantityUnit._(name: 'mol', unitMultiplier: 1.660539067e-24);

  @override
  Quantity call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Quantity(magnitude, this, precision);

  QuantityUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      QuantityUnit._(
          name: name, unitMultiplier: unitMultiplier, prefix: prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Quantity extends Measurement<Quantity> {
  const Quantity(
    num magnitude,
    Unit<Quantity> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const Quantity.zero([super.interpreter = siUnit]) : super.zero();

  const Quantity.infinite([super.interpreter = siUnit]) : super.infinite();

  const Quantity.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Quantity.nan([super.interpreter = siUnit]) : super.nan();

  Quantity.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const QuantityUnit siUnit = units;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitQuantity(this);

  @override
  construct(
    num magnitude,
    Unit<Quantity> defaultUnit,
    Precision precision,
  ) =>
      Quantity(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Quantity> get per =>
      DerivedMeasurementPerBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin QuantityPrefix {
  static QuantityUnit siUnit = QuantityUnit.units;

  MeasurementPrefix get prefix;
  QuantityUnit get units => QuantityUnit.units.withPrefix(prefix);
  QuantityUnit get moles => QuantityUnit.moles.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const units = QuantityUnit.units;

const moles = QuantityUnit.moles;
