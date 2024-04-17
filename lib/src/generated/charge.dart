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
  const ChargeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const amperes = ChargeUnit._(name: 'A', unitMultiplier: 1.0);

  @override
  Charge call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Charge(magnitude, this, precision);

  ChargeUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      ChargeUnit._(name: name, unitMultiplier: unitMultiplier, prefix: prefix);

  @override
  bool operator ==(Object other) =>
      other is ChargeUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Charge extends Measurement<Charge> {
  const Charge(
    num magnitude,
    Unit<Charge> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const Charge.zero([super.unit = siUnit]) : super.zero();

  const Charge.infinite([super.unit = siUnit]) : super.infinite();

  const Charge.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const Charge.nan([super.unit = siUnit]) : super.nan();

  Charge.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const ChargeUnit siUnit = amperes;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitCharge(this);

  @override
  construct(
    num magnitude,
    Unit<Charge> defaultUnit,
    Precision precision,
  ) =>
      Charge(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Charge> get per =>
      DerivedMeasurementPerBuilder(this);
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
