// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/angle.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionAngle on num {
  f.Measurement<Angle> get turns => AngleUnit.turns(this);
  f.Measurement<Angle> get radians => AngleUnit.radians(this);
  f.Measurement<Angle> get gradians => AngleUnit.gradians(this);
  f.Measurement<Angle> get degrees => AngleUnit.degrees(this);
  f.Measurement<Angle> get arcMinutes => AngleUnit.arcMinutes(this);
  f.Measurement<Angle> get arcSeconds => AngleUnit.arcSeconds(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Angle extends f.Dimension {}

class AngleUnit extends f.Unit<Angle> {
  const AngleUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const AngleUnit turns = AngleUnit._(
    name: 'turn',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit radians = AngleUnit._(
    name: 'rad',
    unitMultiplier: 6.283185307179586,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit gradians = AngleUnit._(
    name: 'ᵍ',
    unitMultiplier: 400.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit degrees = AngleUnit._(
    name: '°',
    unitMultiplier: 360.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit arcMinutes = AngleUnit._(
    name: '′',
    unitMultiplier: 21600.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit arcSeconds = AngleUnit._(
    name: '′',
    unitMultiplier: 1296000.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<Angle> call(
    num magnitude, {
    f.Precision precision = f.Precision.max,
  }) =>
      AngleMeasurement(magnitude, this, precision);

  AngleUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      AngleUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is AngleUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class AngleMeasurement extends f.Measurement<Angle> {
  const AngleMeasurement(
    num magnitude,
    f.Unit<Angle> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const AngleMeasurement.zero([super.unit = siUnit]) : super.zero();

  const AngleMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const AngleMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const AngleMeasurement.nan([super.unit = siUnit]) : super.nan();

  AngleMeasurement.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const f.Unit<Angle> siUnit = turns;

  @override
  acceptVisitor(f.MeasurementVisitor visitor) => visitor.visitAngle(this);

  @override
  construct(
    num magnitude,
    f.Unit<Angle> defaultUnit,
    f.Precision precision,
  ) =>
      AngleMeasurement(magnitude, defaultUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin AnglePrefix {
  f.MeasurementPrefix get prefix;
  AngleUnit get turns => AngleUnit.turns.withPrefix(prefix);
  AngleUnit get radians => AngleUnit.radians.withPrefix(prefix);
  AngleUnit get gradians => AngleUnit.gradians.withPrefix(prefix);
  AngleUnit get degrees => AngleUnit.degrees.withPrefix(prefix);
  AngleUnit get arcMinutes => AngleUnit.arcMinutes.withPrefix(prefix);
  AngleUnit get arcSeconds => AngleUnit.arcSeconds.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const AngleUnit turns = AngleUnit.turns;

const AngleUnit radians = AngleUnit.radians;

const AngleUnit gradians = AngleUnit.gradians;

const AngleUnit degrees = AngleUnit.degrees;

const AngleUnit arcMinutes = AngleUnit.arcMinutes;

const AngleUnit arcSeconds = AngleUnit.arcSeconds;
