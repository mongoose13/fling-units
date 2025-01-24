// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/distance.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionDistance on num {
  f.DistanceMeasurement get meters => DistanceUnit.meters(this);
  f.DistanceMeasurement get miles => DistanceUnit.miles(this);
  f.DistanceMeasurement get yards => DistanceUnit.yards(this);
  f.DistanceMeasurement get feet => DistanceUnit.feet(this);
  f.DistanceMeasurement get inches => DistanceUnit.inches(this);
  f.DistanceMeasurement get nauticalMiles => DistanceUnit.nauticalMiles(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Distance extends f.Dimension {
  const Distance();
}

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

  f.DistanceMeasurement call(
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

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<DistanceUnit, Distance> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<DistanceUnit, Distance> get dot => f.UnitDot(this);
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

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit in the numerator and the specified unit in the denominator, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementPer<DistanceMeasurement, Distance> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit multiplied by the specified measurement's unit, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementDot<DistanceMeasurement, Distance> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Distance>, f.UnitDenominator<D>>>
      over<D extends f.Dimension>(f.Measurement<D> denominator) =>
          f.ratio<Distance, D>(defaultUnit, denominator.defaultUnit)(
              defaultValue, denominator.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Distance>, f.UnitNumerator<D>>>
      by<D extends f.Dimension>(f.Measurement<D> term) =>
          f.product2<Distance, D>(defaultUnit, term.defaultUnit)(
              defaultValue, term.defaultValue);
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
