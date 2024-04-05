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
  const QuantityUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const units = QuantityUnit._('units', 1.0);

  static const moles = QuantityUnit._('mol', 1.660539067e-24);

  @override
  Quantity call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Quantity(value, this, precision);

  QuantityUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      QuantityUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Quantity extends Measurement<Quantity> {
  const Quantity(
    num units,
    Unit<Quantity> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

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
    double amount,
    Unit<Quantity>? interpreter,
    Precision precision,
  ) =>
      Quantity(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Quantity> get per =>
      DerivedMeasurementBuilder(this, true);
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
