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
    unitMultiplier: 1609.3439798947877,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit yards = DistanceUnit._(
    name: 'yd',
    unitMultiplier: 0.914400249448388,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit feet = DistanceUnit._(
    name: 'ft',
    unitMultiplier: 0.3047999902464003,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit inches = DistanceUnit._(
    name: 'in',
    unitMultiplier: 0.025399999187200026,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit nauticalMiles = DistanceUnit._(
    name: 'NM',
    unitMultiplier: 1851.9999999990516,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<Distance> call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      DistanceMeasurement(magnitude, this, f.Precision(precision));

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
