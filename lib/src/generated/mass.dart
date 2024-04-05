// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/mass.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionMass on num {
  Mass get grams => MassUnit.grams(this);
  Mass get tonnes => MassUnit.tonnes(this);
  Mass get atomicMassUnits => MassUnit.atomicMassUnits(this);
  Mass get daltons => MassUnit.daltons(this);
  Mass get electronRestMass => MassUnit.electronRestMass(this);
  Mass get longTons => MassUnit.longTons(this);
  Mass get shortTons => MassUnit.shortTons(this);
  Mass get pounds => MassUnit.pounds(this);
  Mass get ounces => MassUnit.ounces(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class MassUnit extends Unit<Mass> {
  const MassUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const grams = MassUnit._('g', 1.0);

  static const tonnes = MassUnit._('t', 0.000001);

  static const atomicMassUnits = MassUnit._('u', 6.022136651e+23);

  static const daltons = MassUnit._('Da', 6.02214076208e+23);

  static const electronRestMass = MassUnit._('me', 1.09776910594e+27);

  static const longTons = MassUnit._('t', 9.842065276e-7);

  static const shortTons = MassUnit._('tn', 0.0000011023);

  static const pounds = MassUnit._('lb', 0.0022046226);

  static const ounces = MassUnit._('oz', 0.0352739619);

  @override
  Mass call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Mass(value, this, precision);

  MassUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      MassUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Mass extends Measurement<Mass> {
  const Mass(
    num units,
    Unit<Mass> interpreter, [
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

  static const MassUnit siUnit = grams;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitMass(this);

  @override
  construct(
    double amount,
    Unit<Mass>? interpreter,
    Precision precision,
  ) =>
      Mass(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Mass> get per =>
      DerivedMeasurementBuilder(this, true);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin MassPrefix {
  static MassUnit siUnit = MassUnit.grams;

  MeasurementPrefix get prefix;
  MassUnit get grams => MassUnit.grams.withPrefix(prefix);
  MassUnit get tonnes => MassUnit.tonnes.withPrefix(prefix);
  MassUnit get atomicMassUnits => MassUnit.atomicMassUnits.withPrefix(prefix);
  MassUnit get daltons => MassUnit.daltons.withPrefix(prefix);
  MassUnit get electronRestMass => MassUnit.electronRestMass.withPrefix(prefix);
  MassUnit get longTons => MassUnit.longTons.withPrefix(prefix);
  MassUnit get shortTons => MassUnit.shortTons.withPrefix(prefix);
  MassUnit get pounds => MassUnit.pounds.withPrefix(prefix);
  MassUnit get ounces => MassUnit.ounces.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const grams = MassUnit.grams;

const tonnes = MassUnit.tonnes;

const atomicMassUnits = MassUnit.atomicMassUnits;

const daltons = MassUnit.daltons;

const electronRestMass = MassUnit.electronRestMass;

const longTons = MassUnit.longTons;

const shortTons = MassUnit.shortTons;

const pounds = MassUnit.pounds;

const ounces = MassUnit.ounces;
