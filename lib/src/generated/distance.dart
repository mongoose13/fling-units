// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/distance.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionDistance on num {
  Distance get meters => DistanceUnit.meters(this);
  Distance get miles => DistanceUnit.miles(this);
  Distance get yards => DistanceUnit.yards(this);
  Distance get feet => DistanceUnit.feet(this);
  Distance get inches => DistanceUnit.inches(this);
  Distance get nauticalMiles => DistanceUnit.nauticalMiles(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class DistanceUnit extends Unit<Distance> {
  const DistanceUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const meters = DistanceUnit._(name: 'm', unitMultiplier: 1.0);

  static const miles = DistanceUnit._(name: 'mi', unitMultiplier: 0.0006213712);

  static const yards = DistanceUnit._(name: 'yd', unitMultiplier: 1.093613);

  static const feet = DistanceUnit._(name: 'ft', unitMultiplier: 3.28084);

  static const inches = DistanceUnit._(name: 'in', unitMultiplier: 39.37008);

  static const nauticalMiles =
      DistanceUnit._(name: 'NM', unitMultiplier: 0.000539956803456);

  @override
  Distance call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Distance(magnitude, this, precision);

  DistanceUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      DistanceUnit._(
          name: name, unitMultiplier: unitMultiplier, prefix: prefix);

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

class Distance extends Measurement<Distance> {
  const Distance(
    num magnitude,
    Unit<Distance> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const Distance.zero([super.unit = siUnit]) : super.zero();

  const Distance.infinite([super.unit = siUnit]) : super.infinite();

  const Distance.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const Distance.nan([super.unit = siUnit]) : super.nan();

  Distance.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const DistanceUnit siUnit = meters;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitDistance(this);

  @override
  construct(
    num magnitude,
    Unit<Distance> defaultUnit,
    Precision precision,
  ) =>
      Distance(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Distance> get per =>
      DerivedMeasurementPerBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin DistancePrefix {
  static DistanceUnit siUnit = DistanceUnit.meters;

  MeasurementPrefix get prefix;
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

const meters = DistanceUnit.meters;

const miles = DistanceUnit.miles;

const yards = DistanceUnit.yards;

const feet = DistanceUnit.feet;

const inches = DistanceUnit.inches;

const nauticalMiles = DistanceUnit.nauticalMiles;
