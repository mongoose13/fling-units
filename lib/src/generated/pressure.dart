// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/pressure.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionPressure on num {
  Pressure get pascals => PressureInterpreter.pascals(this);
  Pressure get bars => PressureInterpreter.bars(this);
  Pressure get baryes => PressureInterpreter.baryes(this);
  Pressure get standardAtmospheres =>
      PressureInterpreter.standardAtmospheres(this);
  Pressure get technicalAtmospheres =>
      PressureInterpreter.technicalAtmospheres(this);
  Pressure get mmHg => PressureInterpreter.mmHg(this);
  Pressure get inHg => PressureInterpreter.inHg(this);
  Pressure get torr => PressureInterpreter.torr(this);
  Pressure get psi => PressureInterpreter.psi(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class PressureInterpreter extends MeasurementInterpreter<Pressure> {
  const PressureInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const pascals = PressureInterpreter._('Pa', 1.0);

  static const bars = PressureInterpreter._('bar', 0.00001);

  static const baryes = PressureInterpreter._('Ba', 0.1);

  static const standardAtmospheres =
      PressureInterpreter._('atm', 0.000009869232667160129);

  static const technicalAtmospheres = PressureInterpreter._('at', 98.0665);

  static const mmHg = PressureInterpreter._('mmHg', 0.0075006);

  static const inHg = PressureInterpreter._('inHg', 3386.39);

  static const torr = PressureInterpreter._('Torr', 133.32236842105263);

  static const psi = PressureInterpreter._('psi', 6894.76);

  @override
  Pressure call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Pressure(value, this, precision);

  PressureInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      PressureInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Pressure extends Measurement<Pressure> {
  const Pressure(
    num units,
    MeasurementInterpreter<Pressure> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

  const Pressure.zero([super.interpreter = siUnit]) : super.zero();

  const Pressure.infinite([super.interpreter = siUnit]) : super.infinite();

  const Pressure.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Pressure.nan([super.interpreter = siUnit]) : super.nan();

  Pressure.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const PressureInterpreter siUnit = pascals;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitPressure(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Pressure>? interpreter,
    Precision precision,
  ) =>
      Pressure(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin PressurePrefix {
  static PressureInterpreter siUnit = PressureInterpreter.pascals;

  MeasurementPrefix get prefix;
  PressureInterpreter get pascals =>
      PressureInterpreter.pascals.withPrefix(prefix);
  PressureInterpreter get bars => PressureInterpreter.bars.withPrefix(prefix);
  PressureInterpreter get baryes =>
      PressureInterpreter.baryes.withPrefix(prefix);
  PressureInterpreter get standardAtmospheres =>
      PressureInterpreter.standardAtmospheres.withPrefix(prefix);
  PressureInterpreter get technicalAtmospheres =>
      PressureInterpreter.technicalAtmospheres.withPrefix(prefix);
  PressureInterpreter get mmHg => PressureInterpreter.mmHg.withPrefix(prefix);
  PressureInterpreter get inHg => PressureInterpreter.inHg.withPrefix(prefix);
  PressureInterpreter get torr => PressureInterpreter.torr.withPrefix(prefix);
  PressureInterpreter get psi => PressureInterpreter.psi.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const pascals = PressureInterpreter.pascals;

const bars = PressureInterpreter.bars;

const baryes = PressureInterpreter.baryes;

const standardAtmospheres = PressureInterpreter.standardAtmospheres;

const technicalAtmospheres = PressureInterpreter.technicalAtmospheres;

const mmHg = PressureInterpreter.mmHg;

const inHg = PressureInterpreter.inHg;

const torr = PressureInterpreter.torr;

const psi = PressureInterpreter.psi;
