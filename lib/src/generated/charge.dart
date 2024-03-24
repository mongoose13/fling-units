// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/charge.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionCharge on num {
  Charge get amperes => ChargeInterpreter.amperes(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class ChargeInterpreter extends MeasurementInterpreter<Charge> {
  const ChargeInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const amperes = ChargeInterpreter._('A', 1.0);

  @override
  Charge call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Charge(value, this, precision);

  ChargeInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      ChargeInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Charge extends Measurement<Charge> {
  const Charge(
    num units,
    MeasurementInterpreter<Charge> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

  const Charge.zero([super.interpreter = siUnit]) : super.zero();

  const Charge.infinite([super.interpreter = siUnit]) : super.infinite();

  const Charge.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Charge.nan([super.interpreter = siUnit]) : super.nan();

  Charge.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const ChargeInterpreter siUnit = amperes;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitCharge(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Charge>? interpreter,
    Precision precision,
  ) =>
      Charge(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin ChargePrefix {
  static ChargeInterpreter siUnit = ChargeInterpreter.amperes;

  MeasurementPrefix get prefix;
  ChargeInterpreter get amperes => ChargeInterpreter.amperes.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const amperes = ChargeInterpreter.amperes;
