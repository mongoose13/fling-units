// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/quantity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionQuantity on num {
  Quantity get units => QuantityInterpreter.units(this);
  Quantity get moles => QuantityInterpreter.moles(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class QuantityInterpreter extends MeasurementInterpreter<Quantity> {
  const QuantityInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const units = QuantityInterpreter._('units', 1.0);

  static const moles = QuantityInterpreter._('mol', 1.660539067e-24);

  @override
  Quantity call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Quantity(value, this, precision);

  QuantityInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      QuantityInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Quantity extends Measurement<Quantity> {
  const Quantity(
    num units,
    MeasurementInterpreter<Quantity> interpreter, [
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

  static const QuantityInterpreter siUnit = units;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitQuantity(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Quantity>? interpreter,
    Precision precision,
  ) =>
      Quantity(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin QuantityPrefix {
  static QuantityInterpreter siUnit = QuantityInterpreter.units;

  MeasurementPrefix get prefix;
  QuantityInterpreter get units => QuantityInterpreter.units.withPrefix(prefix);
  QuantityInterpreter get moles => QuantityInterpreter.moles.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const units = QuantityInterpreter.units;

const moles = QuantityInterpreter.moles;
