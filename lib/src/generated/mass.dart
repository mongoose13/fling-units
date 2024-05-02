// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/mass.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionMass on num {
  f.Measurement<Mass> get grams => MassUnit.grams(this);
  f.Measurement<Mass> get tonnes => MassUnit.tonnes(this);
  f.Measurement<Mass> get atomicMassUnits => MassUnit.atomicMassUnits(this);
  f.Measurement<Mass> get daltons => MassUnit.daltons(this);
  f.Measurement<Mass> get electronRestMass => MassUnit.electronRestMass(this);
  f.Measurement<Mass> get longTons => MassUnit.longTons(this);
  f.Measurement<Mass> get shortTons => MassUnit.shortTons(this);
  f.Measurement<Mass> get pounds => MassUnit.pounds(this);
  f.Measurement<Mass> get ounces => MassUnit.ounces(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Mass extends f.Dimension {}

class MassUnit extends f.Unit<Mass> {
  const MassUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const MassUnit grams = MassUnit._(
    name: 'g',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit tonnes = MassUnit._(
    name: 't',
    unitMultiplier: 1000000.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit atomicMassUnits = MassUnit._(
    name: 'u',
    unitMultiplier: 1.660540200186168e-24,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit daltons = MassUnit._(
    name: 'Da',
    unitMultiplier: 1.6605390666003093e-24,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit electronRestMass = MassUnit._(
    name: 'me',
    unitMultiplier: 9.109383699987785e-28,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit longTons = MassUnit._(
    name: 't',
    unitMultiplier: 1016046.9088114186,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit shortTons = MassUnit._(
    name: 'tn',
    unitMultiplier: 907194.0488070399,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit pounds = MassUnit._(
    name: 'lb',
    unitMultiplier: 453.5923744952991,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit ounces = MassUnit._(
    name: 'oz',
    unitMultiplier: 28.349523164847554,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<Mass> call(
    num magnitude, {
    f.Precision precision = f.Precision.max,
  }) =>
      MassMeasurement(magnitude, this, precision);

  MassUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      MassUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

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

class MassMeasurement extends f.Measurement<Mass> {
  const MassMeasurement(
    num magnitude,
    f.Unit<Mass> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const MassMeasurement.zero([super.unit = siUnit]) : super.zero();

  const MassMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const MassMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const MassMeasurement.nan([super.unit = siUnit]) : super.nan();

  static const f.Unit<Mass> siUnit = grams;

  @override
  construct(
    num magnitude,
    f.Unit<Mass> defaultUnit,
    f.Precision precision,
  ) =>
      MassMeasurement(magnitude, defaultUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin MassPrefix {
  f.MeasurementPrefix get prefix;
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

const MassUnit grams = MassUnit.grams;

const MassUnit tonnes = MassUnit.tonnes;

const MassUnit atomicMassUnits = MassUnit.atomicMassUnits;

const MassUnit daltons = MassUnit.daltons;

const MassUnit electronRestMass = MassUnit.electronRestMass;

const MassUnit longTons = MassUnit.longTons;

const MassUnit shortTons = MassUnit.shortTons;

const MassUnit pounds = MassUnit.pounds;

const MassUnit ounces = MassUnit.ounces;
