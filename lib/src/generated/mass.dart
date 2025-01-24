// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/mass.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionMass on num {
  f.MassMeasurement get grams => MassUnit.grams(this);
  f.MassMeasurement get tonnes => MassUnit.tonnes(this);
  f.MassMeasurement get atomicMassUnits => MassUnit.atomicMassUnits(this);
  f.MassMeasurement get daltons => MassUnit.daltons(this);
  f.MassMeasurement get electronRestMass => MassUnit.electronRestMass(this);
  f.MassMeasurement get longTons => MassUnit.longTons(this);
  f.MassMeasurement get shortTons => MassUnit.shortTons(this);
  f.MassMeasurement get pounds => MassUnit.pounds(this);
  f.MassMeasurement get ounces => MassUnit.ounces(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Mass extends f.Dimension {
  const Mass();
}

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

  f.MassMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      MassMeasurement(magnitude, this, f.Precision(precision));

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

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<MassUnit, Mass> get per => f.UnitPer(this);
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

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit in the numerator and the specified unit in the denominator, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementPer<MassMeasurement, Mass> get per => f.MeasurementPer(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Mass>, f.UnitDenominator<D>>>
      over<D extends f.Dimension>(f.Measurement<D> denominator) =>
          f.ratio<Mass, D>(defaultUnit, denominator.defaultUnit)(
              defaultValue, denominator.defaultValue);
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
