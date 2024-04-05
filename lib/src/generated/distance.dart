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
  const DistanceUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const meters = DistanceUnit._('m', 1.0);

  static const miles = DistanceUnit._('mi', 0.0006213712);

  static const yards = DistanceUnit._('yd', 1.093613);

  static const feet = DistanceUnit._('ft', 3.28084);

  static const inches = DistanceUnit._('in', 39.37008);

  static const nauticalMiles = DistanceUnit._('NM', 0.000539956803456);

  @override
  Distance call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Distance(value, this, precision);

  DistanceUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      DistanceUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Distance extends Measurement<Distance> {
  const Distance(
    num units,
    Unit<Distance> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

  const Distance.zero([super.interpreter = siUnit]) : super.zero();

  const Distance.infinite([super.interpreter = siUnit]) : super.infinite();

  const Distance.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Distance.nan([super.interpreter = siUnit]) : super.nan();

  Distance.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const DistanceUnit siUnit = meters;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitDistance(this);

  @override
  construct(
    double amount,
    Unit<Distance>? interpreter,
    Precision precision,
  ) =>
      Distance(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Distance> get per =>
      DerivedMeasurementBuilder(this);
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
