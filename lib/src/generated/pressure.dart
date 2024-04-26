// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/pressure.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionPressure on num {
  f.Measurement<Pressure> get pascals => PressureUnit.pascals(this);
  f.Measurement<Pressure> get bars => PressureUnit.bars(this);
  f.Measurement<Pressure> get baryes => PressureUnit.baryes(this);
  f.Measurement<Pressure> get standardAtmospheres =>
      PressureUnit.standardAtmospheres(this);
  f.Measurement<Pressure> get technicalAtmospheres =>
      PressureUnit.technicalAtmospheres(this);
  f.Measurement<Pressure> get mmHg => PressureUnit.mmHg(this);
  f.Measurement<Pressure> get inHg => PressureUnit.inHg(this);
  f.Measurement<Pressure> get torr => PressureUnit.torr(this);
  f.Measurement<Pressure> get psi => PressureUnit.psi(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Pressure extends f.Dimension {}

class PressureUnit extends f.Unit<Pressure> {
  const PressureUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const PressureUnit pascals = PressureUnit._(
    name: 'Pa',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit bars = PressureUnit._(
    name: 'bar',
    unitMultiplier: 0.00001,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit baryes = PressureUnit._(
    name: 'Ba',
    unitMultiplier: 0.1,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit standardAtmospheres = PressureUnit._(
    name: 'atm',
    unitMultiplier: 0.000009869232667160129,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit technicalAtmospheres = PressureUnit._(
    name: 'at',
    unitMultiplier: 98.0665,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit mmHg = PressureUnit._(
    name: 'mmHg',
    unitMultiplier: 0.0075006,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit inHg = PressureUnit._(
    name: 'inHg',
    unitMultiplier: 3386.39,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit torr = PressureUnit._(
    name: 'Torr',
    unitMultiplier: 133.32236842105263,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit psi = PressureUnit._(
    name: 'psi',
    unitMultiplier: 6894.76,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<Pressure> call(
    num magnitude, {
    f.Precision precision = f.Precision.max,
  }) =>
      PressureMeasurement(magnitude, this, precision);

  PressureUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      PressureUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is PressureUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class PressureMeasurement extends f.Measurement<Pressure> {
  const PressureMeasurement(
    num magnitude,
    f.Unit<Pressure> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const PressureMeasurement.zero([super.unit = siUnit]) : super.zero();

  const PressureMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const PressureMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const PressureMeasurement.nan([super.unit = siUnit]) : super.nan();

  PressureMeasurement.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const f.Unit<Pressure> siUnit = pascals;

  @override
  acceptVisitor(f.MeasurementVisitor visitor) => visitor.visitPressure(this);

  @override
  construct(
    num magnitude,
    f.Unit<Pressure> defaultUnit,
    f.Precision precision,
  ) =>
      PressureMeasurement(magnitude, defaultUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin PressurePrefix {
  f.MeasurementPrefix get prefix;
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

const PressureUnit pascals = PressureUnit.pascals;

const PressureUnit bars = PressureUnit.bars;

const PressureUnit baryes = PressureUnit.baryes;

const PressureUnit standardAtmospheres = PressureUnit.standardAtmospheres;

const PressureUnit technicalAtmospheres = PressureUnit.technicalAtmospheres;

const PressureUnit mmHg = PressureUnit.mmHg;

const PressureUnit inHg = PressureUnit.inHg;

const PressureUnit torr = PressureUnit.torr;

const PressureUnit psi = PressureUnit.psi;
