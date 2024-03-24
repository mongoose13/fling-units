// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/angle.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionAngle on num {
  Angle get turns => AngleInterpreter.turns(this);
  Angle get radians => AngleInterpreter.radians(this);
  Angle get gradians => AngleInterpreter.gradians(this);
  Angle get degrees => AngleInterpreter.degrees(this);
  Angle get arcMinutes => AngleInterpreter.arcMinutes(this);
  Angle get arcSeconds => AngleInterpreter.arcSeconds(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class AngleInterpreter extends MeasurementInterpreter<Angle> {
  const AngleInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const turns = AngleInterpreter._('turn', 1.0);

  static const radians = AngleInterpreter._('rad', 1.0);

  static const gradians = AngleInterpreter._('ᵍ', 400.0);

  static const degrees = AngleInterpreter._('°', 360.0);

  static const arcMinutes = AngleInterpreter._('′', 21600.0);

  static const arcSeconds = AngleInterpreter._('′', 1296000.0);

  @override
  Angle call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Angle(value, this, precision);

  AngleInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      AngleInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Angle extends Measurement<Angle> {
  const Angle(
    num units,
    MeasurementInterpreter<Angle> interpreter, [
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

  static const AngleInterpreter siUnit = turns;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitAngle(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Angle>? interpreter,
    Precision precision,
  ) =>
      Angle(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin AnglePrefix {
  static AngleInterpreter siUnit = AngleInterpreter.turns;

  MeasurementPrefix get prefix;
  AngleInterpreter get turns => AngleInterpreter.turns.withPrefix(prefix);
  AngleInterpreter get radians => AngleInterpreter.radians.withPrefix(prefix);
  AngleInterpreter get gradians => AngleInterpreter.gradians.withPrefix(prefix);
  AngleInterpreter get degrees => AngleInterpreter.degrees.withPrefix(prefix);
  AngleInterpreter get arcMinutes =>
      AngleInterpreter.arcMinutes.withPrefix(prefix);
  AngleInterpreter get arcSeconds =>
      AngleInterpreter.arcSeconds.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const turns = AngleInterpreter.turns;

const radians = AngleInterpreter.radians;

const gradians = AngleInterpreter.gradians;

const degrees = AngleInterpreter.degrees;

const arcMinutes = AngleInterpreter.arcMinutes;

const arcSeconds = AngleInterpreter.arcSeconds;
