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
  const MassUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const grams = MassUnit._(name: 'g', unitMultiplier: 1.0);

  static const tonnes = MassUnit._(name: 't', unitMultiplier: 0.000001);

  static const atomicMassUnits =
      MassUnit._(name: 'u', unitMultiplier: 6.022136651e+23);

  static const daltons =
      MassUnit._(name: 'Da', unitMultiplier: 6.02214076208e+23);

  static const electronRestMass =
      MassUnit._(name: 'me', unitMultiplier: 1.09776910594e+27);

  static const longTons = MassUnit._(name: 't', unitMultiplier: 9.842065276e-7);

  static const shortTons = MassUnit._(name: 'tn', unitMultiplier: 0.0000011023);

  static const pounds = MassUnit._(name: 'lb', unitMultiplier: 0.0022046226);

  static const ounces = MassUnit._(name: 'oz', unitMultiplier: 0.0352739619);

  @override
  Mass call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Mass(magnitude, this, precision);

  MassUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      MassUnit._(name: name, unitMultiplier: unitMultiplier, prefix: prefix);

  @override
  bool operator ==(Object other) =>
      other is MassUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Mass extends Measurement<Mass> {
  const Mass(
    num magnitude,
    Unit<Mass> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const Mass.zero([super.unit = siUnit]) : super.zero();

  const Mass.infinite([super.unit = siUnit]) : super.infinite();

  const Mass.negativeInfinite([super.unit = siUnit]) : super.negativeInfinite();

  const Mass.nan([super.unit = siUnit]) : super.nan();

  Mass.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const MassUnit siUnit = grams;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitMass(this);

  @override
  construct(
    num magnitude,
    Unit<Mass> defaultUnit,
    Precision precision,
  ) =>
      Mass(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Mass> get per =>
      DerivedMeasurementPerBuilder(this);
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
