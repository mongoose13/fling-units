// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/distance.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionDistance on num {
  f.Measurement<Distance> get meters => DistanceUnit.meters(this);
  f.Measurement<Distance> get miles => DistanceUnit.miles(this);
  f.Measurement<Distance> get yards => DistanceUnit.yards(this);
  f.Measurement<Distance> get feet => DistanceUnit.feet(this);
  f.Measurement<Distance> get inches => DistanceUnit.inches(this);
  f.Measurement<Distance> get nauticalMiles => DistanceUnit.nauticalMiles(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Distance extends f.Dimension {}

class DistanceUnit extends f.Unit<Distance> {
  const DistanceUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const DistanceUnit meters = DistanceUnit._(
    name: 'm',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit miles = DistanceUnit._(
    name: 'mi',
    unitMultiplier: 0.0006213712,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit yards = DistanceUnit._(
    name: 'yd',
    unitMultiplier: 1.093613,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit feet = DistanceUnit._(
    name: 'ft',
    unitMultiplier: 3.28084,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit inches = DistanceUnit._(
    name: 'in',
    unitMultiplier: 39.37008,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit nauticalMiles = DistanceUnit._(
    name: 'NM',
    unitMultiplier: 0.000539956803456,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<Distance> call(
    num magnitude, {
    f.Precision precision = f.Precision.max,
  }) =>
      DistanceMeasurement(magnitude, this, precision);

  DistanceUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      DistanceUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is DistanceUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class DistanceMeasurement extends f.Measurement<Distance> {
  const DistanceMeasurement(
    num magnitude,
    f.Unit<Distance> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const DistanceMeasurement.zero([super.unit = siUnit]) : super.zero();

  const DistanceMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const DistanceMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const DistanceMeasurement.nan([super.unit = siUnit]) : super.nan();

  DistanceMeasurement.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const f.Unit<Distance> siUnit = meters;

  @override
  construct(
    num magnitude,
    f.Unit<Distance> defaultUnit,
    f.Precision precision,
  ) =>
      DistanceMeasurement(magnitude, defaultUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin DistancePrefix {
  f.MeasurementPrefix get prefix;
  DistanceUnit get meters => DistanceUnit.meters.withPrefix(prefix);
  DistanceUnit get miles => DistanceUnit.miles.withPrefix(prefix);
  DistanceUnit get yards => DistanceUnit.yards.withPrefix(prefix);
  DistanceUnit get feet => DistanceUnit.feet.withPrefix(prefix);
  DistanceUnit get inches => DistanceUnit.inches.withPrefix(prefix);
  DistanceUnit get nauticalMiles =>
      DistanceUnit.nauticalMiles.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const DistanceUnit meters = DistanceUnit.meters;

const DistanceUnit miles = DistanceUnit.miles;

const DistanceUnit yards = DistanceUnit.yards;

const DistanceUnit feet = DistanceUnit.feet;

const DistanceUnit inches = DistanceUnit.inches;

const DistanceUnit nauticalMiles = DistanceUnit.nauticalMiles;
