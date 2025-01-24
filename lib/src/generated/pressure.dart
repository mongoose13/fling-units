// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/pressure.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionPressure on num {
  f.PressureMeasurement get pascals => PressureUnit.pascals(this);
  f.PressureMeasurement get bars => PressureUnit.bars(this);
  f.PressureMeasurement get baryes => PressureUnit.baryes(this);
  f.PressureMeasurement get standardAtmospheres =>
      PressureUnit.standardAtmospheres(this);
  f.PressureMeasurement get technicalAtmospheres =>
      PressureUnit.technicalAtmospheres(this);
  f.PressureMeasurement get mmHg => PressureUnit.mmHg(this);
  f.PressureMeasurement get inHg => PressureUnit.inHg(this);
  f.PressureMeasurement get torr => PressureUnit.torr(this);
  f.PressureMeasurement get psi => PressureUnit.psi(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Pressure extends f.Dimension {
  const Pressure();
}

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
    unitMultiplier: 99999.99999999999,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit baryes = PressureUnit._(
    name: 'Ba',
    unitMultiplier: 10.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit standardAtmospheres = PressureUnit._(
    name: 'atm',
    unitMultiplier: 101325.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit technicalAtmospheres = PressureUnit._(
    name: 'at',
    unitMultiplier: 0.010197162129779282,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit mmHg = PressureUnit._(
    name: 'mmHg',
    unitMultiplier: 133.32266751993174,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit inHg = PressureUnit._(
    name: 'inHg',
    unitMultiplier: 0.00029529971444517615,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit torr = PressureUnit._(
    name: 'Torr',
    unitMultiplier: 0.007500616827041697,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit psi = PressureUnit._(
    name: 'psi',
    unitMultiplier: 0.0001450376807894691,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.PressureMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      PressureMeasurement(magnitude, this, f.Precision(precision));

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

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<PressureUnit, Pressure> get per => f.UnitPer(this);
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

  static const f.Unit<Pressure> siUnit = pascals;

  @override
  construct(
    num magnitude,
    f.Unit<Pressure> defaultUnit,
    f.Precision precision,
  ) =>
      PressureMeasurement(magnitude, defaultUnit, precision);

  f.MeasurementPer<PressureMeasurement, Pressure> get per =>
      f.MeasurementPer(this);
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
