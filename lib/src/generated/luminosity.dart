// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/luminosity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionLuminosity on num {
  Luminosity get candela => LuminosityInterpreter.candela(this);
  Luminosity get candlepower => LuminosityInterpreter.candlepower(this);
  Luminosity get hefnerkerze => LuminosityInterpreter.hefnerkerze(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class LuminosityInterpreter extends MeasurementInterpreter<Luminosity> {
  const LuminosityInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const candela = LuminosityInterpreter._('cd', 1.0);

  static const candlepower = LuminosityInterpreter._('cp', 1.0194);

  static const hefnerkerze = LuminosityInterpreter._('HK', 1.087);

  @override
  Luminosity call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Luminosity(value, this, precision);

  LuminosityInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      LuminosityInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Luminosity extends Measurement<Luminosity> {
  Luminosity(
    num units,
    MeasurementInterpreter<Luminosity> interpreter, [
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

  static const LuminosityInterpreter siUnit = candela;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitLuminosity(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Luminosity>? interpreter,
    Precision precision,
  ) =>
      Luminosity(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin LuminosityPrefix {
  static LuminosityInterpreter siUnit = LuminosityInterpreter.candela;

  MeasurementPrefix get prefix;
  LuminosityInterpreter get candela =>
      LuminosityInterpreter.candela.withPrefix(prefix);
  LuminosityInterpreter get candlepower =>
      LuminosityInterpreter.candlepower.withPrefix(prefix);
  LuminosityInterpreter get hefnerkerze =>
      LuminosityInterpreter.hefnerkerze.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const candela = LuminosityInterpreter.candela;

const candlepower = LuminosityInterpreter.candlepower;

const hefnerkerze = LuminosityInterpreter.hefnerkerze;
