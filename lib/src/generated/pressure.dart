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
  const PressureUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const pascals = PressureUnit._(name: 'Pa', unitMultiplier: 1.0);

  static const bars = PressureUnit._(name: 'bar', unitMultiplier: 0.00001);

  static const baryes = PressureUnit._(name: 'Ba', unitMultiplier: 0.1);

  static const standardAtmospheres =
      PressureUnit._(name: 'atm', unitMultiplier: 0.000009869232667160129);

  static const technicalAtmospheres =
      PressureUnit._(name: 'at', unitMultiplier: 98.0665);

  static const mmHg = PressureUnit._(name: 'mmHg', unitMultiplier: 0.0075006);

  static const inHg = PressureUnit._(name: 'inHg', unitMultiplier: 3386.39);

  static const torr =
      PressureUnit._(name: 'Torr', unitMultiplier: 133.32236842105263);

  static const psi = PressureUnit._(name: 'psi', unitMultiplier: 6894.76);

  @override
  Pressure call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Pressure(magnitude, this, precision);

  PressureUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      PressureUnit._(
          name: name, unitMultiplier: unitMultiplier, prefix: prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Pressure extends Measurement<Pressure> {
  const Pressure(
    num magnitude,
    Unit<Pressure> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

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
    num magnitude,
    Unit<Pressure> defaultUnit,
    Precision precision,
  ) =>
      Pressure(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Pressure> get per =>
      DerivedMeasurementPerBuilder(this);
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
