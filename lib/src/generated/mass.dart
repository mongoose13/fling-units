// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/mass.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionMass on num {
  Mass get grams => MassInterpreter.grams(this);
  Mass get tonnes => MassInterpreter.tonnes(this);
  Mass get atomicMassUnits => MassInterpreter.atomicMassUnits(this);
  Mass get daltons => MassInterpreter.daltons(this);
  Mass get electronRestMass => MassInterpreter.electronRestMass(this);
  Mass get longTons => MassInterpreter.longTons(this);
  Mass get shortTons => MassInterpreter.shortTons(this);
  Mass get pounds => MassInterpreter.pounds(this);
  Mass get ounces => MassInterpreter.ounces(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class MassInterpreter extends MeasurementInterpreter<Mass> {
  const MassInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const grams = MassInterpreter._('g', 1.0);

  static const tonnes = MassInterpreter._('t', 0.000001);

  static const atomicMassUnits = MassInterpreter._('u', 6.022136651e+23);

  static const daltons = MassInterpreter._('Da', 6.02214076208e+23);

  static const electronRestMass = MassInterpreter._('me', 1.09776910594e+27);

  static const longTons = MassInterpreter._('t', 9.842065276e-7);

  static const shortTons = MassInterpreter._('tn', 0.0000011023);

  static const pounds = MassInterpreter._('lb', 0.0022046226);

  static const ounces = MassInterpreter._('oz', 0.0352739619);

  @override
  Mass call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Mass(value, this, precision);

  MassInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      MassInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Mass extends Measurement<Mass> {
  const Mass(
    num units,
    MeasurementInterpreter<Mass> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

  const Mass.zero([super.interpreter = siUnit]) : super.zero();

  const Mass.infinite([super.interpreter = siUnit]) : super.infinite();

  const Mass.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Mass.nan([super.interpreter = siUnit]) : super.nan();

  Mass.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const MassInterpreter siUnit = grams;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitMass(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Mass>? interpreter,
    Precision precision,
  ) =>
      Mass(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin MassPrefix {
  static MassInterpreter siUnit = MassInterpreter.grams;

  MeasurementPrefix get prefix;
  MassInterpreter get grams => MassInterpreter.grams.withPrefix(prefix);
  MassInterpreter get tonnes => MassInterpreter.tonnes.withPrefix(prefix);
  MassInterpreter get atomicMassUnits =>
      MassInterpreter.atomicMassUnits.withPrefix(prefix);
  MassInterpreter get daltons => MassInterpreter.daltons.withPrefix(prefix);
  MassInterpreter get electronRestMass =>
      MassInterpreter.electronRestMass.withPrefix(prefix);
  MassInterpreter get longTons => MassInterpreter.longTons.withPrefix(prefix);
  MassInterpreter get shortTons => MassInterpreter.shortTons.withPrefix(prefix);
  MassInterpreter get pounds => MassInterpreter.pounds.withPrefix(prefix);
  MassInterpreter get ounces => MassInterpreter.ounces.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const grams = MassInterpreter.grams;

const tonnes = MassInterpreter.tonnes;

const atomicMassUnits = MassInterpreter.atomicMassUnits;

const daltons = MassInterpreter.daltons;

const electronRestMass = MassInterpreter.electronRestMass;

const longTons = MassInterpreter.longTons;

const shortTons = MassInterpreter.shortTons;

const pounds = MassInterpreter.pounds;

const ounces = MassInterpreter.ounces;
