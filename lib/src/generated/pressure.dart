// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/pressure.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionPressure on num {
  Pressure get pascals => PressureUnit.pascals(this);
  Pressure get bars => PressureUnit.bars(this);
  Pressure get baryes => PressureUnit.baryes(this);
  Pressure get standardAtmospheres => PressureUnit.standardAtmospheres(this);
  Pressure get technicalAtmospheres => PressureUnit.technicalAtmospheres(this);
  Pressure get mmHg => PressureUnit.mmHg(this);
  Pressure get inHg => PressureUnit.inHg(this);
  Pressure get torr => PressureUnit.torr(this);
  Pressure get psi => PressureUnit.psi(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class PressureUnit extends Unit<Pressure> {
  const PressureUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const pascals = PressureUnit._('Pa', 1.0);

  static const bars = PressureUnit._('bar', 0.00001);

  static const baryes = PressureUnit._('Ba', 0.1);

  static const standardAtmospheres =
      PressureUnit._('atm', 0.000009869232667160129);

  static const technicalAtmospheres = PressureUnit._('at', 98.0665);

  static const mmHg = PressureUnit._('mmHg', 0.0075006);

  static const inHg = PressureUnit._('inHg', 3386.39);

  static const torr = PressureUnit._('Torr', 133.32236842105263);

  static const psi = PressureUnit._('psi', 6894.76);

  @override
  Pressure call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Pressure(value, this, precision);

  PressureUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      PressureUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Pressure extends Measurement<Pressure> {
  const Pressure(
    num units,
    Unit<Pressure> interpreter, [
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

  static const PressureUnit siUnit = pascals;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitPressure(this);

  @override
  construct(
    double amount,
    Unit<Pressure>? interpreter,
    Precision precision,
  ) =>
      Pressure(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Pressure> get per =>
      DerivedMeasurementBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin PressurePrefix {
  static PressureUnit siUnit = PressureUnit.pascals;

  MeasurementPrefix get prefix;
  PressureUnit get pascals => PressureUnit.pascals.withPrefix(prefix);
  PressureUnit get bars => PressureUnit.bars.withPrefix(prefix);
  PressureUnit get baryes => PressureUnit.baryes.withPrefix(prefix);
  PressureUnit get standardAtmospheres =>
      PressureUnit.standardAtmospheres.withPrefix(prefix);
  PressureUnit get technicalAtmospheres =>
      PressureUnit.technicalAtmospheres.withPrefix(prefix);
  PressureUnit get mmHg => PressureUnit.mmHg.withPrefix(prefix);
  PressureUnit get inHg => PressureUnit.inHg.withPrefix(prefix);
  PressureUnit get torr => PressureUnit.torr.withPrefix(prefix);
  PressureUnit get psi => PressureUnit.psi.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const pascals = PressureUnit.pascals;

const bars = PressureUnit.bars;

const baryes = PressureUnit.baryes;

const standardAtmospheres = PressureUnit.standardAtmospheres;

const technicalAtmospheres = PressureUnit.technicalAtmospheres;

const mmHg = PressureUnit.mmHg;

const inHg = PressureUnit.inHg;

const torr = PressureUnit.torr;

const psi = PressureUnit.psi;
