// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/charge.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionCharge on num {
  Charge get amperes => ChargeUnit.amperes(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class ChargeUnit extends Unit<Charge> {
  const ChargeUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const amperes = ChargeUnit._('A', 1.0);

  @override
  Charge call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Charge(value, this, precision);

  ChargeUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      ChargeUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Charge extends Measurement<Charge> {
  const Charge(
    num units,
    Unit<Charge> interpreter, [
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

  static const ChargeUnit siUnit = amperes;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitCharge(this);

  @override
  construct(
    double amount,
    Unit<Charge>? interpreter,
    Precision precision,
  ) =>
      Charge(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Charge> get per =>
      DerivedMeasurementBuilder(this, true);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin ChargePrefix {
  static ChargeUnit siUnit = ChargeUnit.amperes;

  MeasurementPrefix get prefix;
  ChargeUnit get amperes => ChargeUnit.amperes.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const amperes = ChargeUnit.amperes;
