// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/ponies.dart';

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class PonyInterpreter extends MeasurementInterpreter<Pony> {
  const PonyInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const _fat = PonyInterpreter._('F', 2.0);

  static const _ugly = PonyInterpreter._('U', 1.0);

  static const _lazy = PonyInterpreter._('L', 0.05);

  @override
  Pony call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Pony(value, this, precision);

  PonyInterpreter _withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      PonyInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Pony extends Measurement<Pony> {
  Pony(
    num units,
    MeasurementInterpreter<Pony> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

  const Pony.zero([super.interpreter = siUnit]) : super.zero();

  const Pony.infinite([super.interpreter = siUnit]) : super.infinite();

  const Pony.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Pony.nan([super.interpreter = siUnit]) : super.nan();

  Pony.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const PonyInterpreter siUnit = ugly;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitPony(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Pony>? interpreter,
    Precision precision,
  ) =>
      Pony(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin PonyPrefix {
  static PonyInterpreter siUnit = PonyInterpreter._ugly;

  MeasurementPrefix get prefix;
  PonyInterpreter get fat => PonyInterpreter._fat._withPrefix(prefix);
  PonyInterpreter get ugly => PonyInterpreter._ugly._withPrefix(prefix);
  PonyInterpreter get lazy => PonyInterpreter._lazy._withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const fat = PonyInterpreter._fat;

const ugly = PonyInterpreter._ugly;

const lazy = PonyInterpreter._lazy;
