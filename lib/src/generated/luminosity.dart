// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/luminosity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionLuminosity on num {
  Luminosity get candela => LuminosityUnit.candela(this);
  Luminosity get candlepower => LuminosityUnit.candlepower(this);
  Luminosity get hefnerkerze => LuminosityUnit.hefnerkerze(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class LuminosityUnit extends Unit<Luminosity> {
  const LuminosityUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const candela = LuminosityUnit._('cd', 1.0);

  static const candlepower = LuminosityUnit._('cp', 1.0194);

  static const hefnerkerze = LuminosityUnit._('HK', 1.087);

  @override
  Luminosity call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Luminosity(value, this, precision);

  LuminosityUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      LuminosityUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Luminosity extends Measurement<Luminosity> {
  const Luminosity(
    num units,
    Unit<Luminosity> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

  const Luminosity.zero([super.interpreter = siUnit]) : super.zero();

  const Luminosity.infinite([super.interpreter = siUnit]) : super.infinite();

  const Luminosity.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Luminosity.nan([super.interpreter = siUnit]) : super.nan();

  Luminosity.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const LuminosityUnit siUnit = candela;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitLuminosity(this);

  @override
  construct(
    double amount,
    Unit<Luminosity>? interpreter,
    Precision precision,
  ) =>
      Luminosity(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Luminosity> get per =>
      DerivedMeasurementBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin LuminosityPrefix {
  static LuminosityUnit siUnit = LuminosityUnit.candela;

  MeasurementPrefix get prefix;
  LuminosityUnit get candela => LuminosityUnit.candela.withPrefix(prefix);
  LuminosityUnit get candlepower =>
      LuminosityUnit.candlepower.withPrefix(prefix);
  LuminosityUnit get hefnerkerze =>
      LuminosityUnit.hefnerkerze.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const candela = LuminosityUnit.candela;

const candlepower = LuminosityUnit.candlepower;

const hefnerkerze = LuminosityUnit.hefnerkerze;
