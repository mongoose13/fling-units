// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/angle.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionAngle on num {
  Angle get turns => AngleUnit.turns(this);
  Angle get radians => AngleUnit.radians(this);
  Angle get gradians => AngleUnit.gradians(this);
  Angle get degrees => AngleUnit.degrees(this);
  Angle get arcMinutes => AngleUnit.arcMinutes(this);
  Angle get arcSeconds => AngleUnit.arcSeconds(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class AngleUnit extends Unit<Angle> {
  const AngleUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const turns = AngleUnit._(name: 'turn', unitMultiplier: 1.0);

  static const radians =
      AngleUnit._(name: 'rad', unitMultiplier: 6.283185307179586);

  static const gradians = AngleUnit._(name: 'ᵍ', unitMultiplier: 400.0);

  static const degrees = AngleUnit._(name: '°', unitMultiplier: 360.0);

  static const arcMinutes = AngleUnit._(name: '′', unitMultiplier: 21600.0);

  static const arcSeconds = AngleUnit._(name: '′', unitMultiplier: 1296000.0);

  @override
  Angle call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Angle(magnitude, this, precision);

  AngleUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      AngleUnit._(name: name, unitMultiplier: unitMultiplier, prefix: prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Angle extends Measurement<Angle> {
  const Angle(
    num magnitude,
    Unit<Angle> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const Angle.zero([super.unit = siUnit]) : super.zero();

  const Angle.infinite([super.unit = siUnit]) : super.infinite();

  const Angle.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const Angle.nan([super.unit = siUnit]) : super.nan();

  Angle.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const AngleUnit siUnit = turns;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitAngle(this);

  @override
  construct(
    num magnitude,
    Unit<Angle> defaultUnit,
    Precision precision,
  ) =>
      Angle(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Angle> get per =>
      DerivedMeasurementPerBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin AnglePrefix {
  static AngleUnit siUnit = AngleUnit.turns;

  MeasurementPrefix get prefix;
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

const turns = AngleUnit.turns;

const radians = AngleUnit.radians;

const gradians = AngleUnit.gradians;

const degrees = AngleUnit.degrees;

const arcMinutes = AngleUnit.arcMinutes;

const arcSeconds = AngleUnit.arcSeconds;
