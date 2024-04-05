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
  const AngleUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const turns = AngleUnit._('turn', 1.0);

  static const radians = AngleUnit._('rad', 6.283185307179586);

  static const gradians = AngleUnit._('ᵍ', 400.0);

  static const degrees = AngleUnit._('°', 360.0);

  static const arcMinutes = AngleUnit._('′', 21600.0);

  static const arcSeconds = AngleUnit._('′', 1296000.0);

  @override
  Angle call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Angle(value, this, precision);

  AngleUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      AngleUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Angle extends Measurement<Angle> {
  const Angle(
    num units,
    Unit<Angle> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

  const Angle.zero([super.interpreter = siUnit]) : super.zero();

  const Angle.infinite([super.interpreter = siUnit]) : super.infinite();

  const Angle.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Angle.nan([super.interpreter = siUnit]) : super.nan();

  Angle.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const AngleUnit siUnit = turns;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitAngle(this);

  @override
  construct(
    double amount,
    Unit<Angle>? interpreter,
    Precision precision,
  ) =>
      Angle(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Angle> get per =>
      DerivedMeasurementBuilder(this, true);
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
