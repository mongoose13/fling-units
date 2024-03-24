// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/distance.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionDistance on num {
  Distance get meters => DistanceInterpreter.meters(this);
  Distance get miles => DistanceInterpreter.miles(this);
  Distance get yards => DistanceInterpreter.yards(this);
  Distance get feet => DistanceInterpreter.feet(this);
  Distance get inches => DistanceInterpreter.inches(this);
  Distance get nauticalMiles => DistanceInterpreter.nauticalMiles(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class DistanceInterpreter extends MeasurementInterpreter<Distance> {
  const DistanceInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const meters = DistanceInterpreter._('m', 1.0);

  static const miles = DistanceInterpreter._('mi', 0.0006213712);

  static const yards = DistanceInterpreter._('yd', 1.093613);

  static const feet = DistanceInterpreter._('ft', 3.28084);

  static const inches = DistanceInterpreter._('in', 39.37008);

  static const nauticalMiles = DistanceInterpreter._('NM', 0.000539956803456);

  @override
  Distance call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Distance(value, this, precision);

  DistanceInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      DistanceInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Distance extends Measurement<Distance> {
  const Distance(
    num units,
    MeasurementInterpreter<Distance> interpreter, [
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

  static const DistanceInterpreter siUnit = meters;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitDistance(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Distance>? interpreter,
    Precision precision,
  ) =>
      Distance(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin DistancePrefix {
  static DistanceInterpreter siUnit = DistanceInterpreter.meters;

  MeasurementPrefix get prefix;
  DistanceInterpreter get meters =>
      DistanceInterpreter.meters.withPrefix(prefix);
  DistanceInterpreter get miles => DistanceInterpreter.miles.withPrefix(prefix);
  DistanceInterpreter get yards => DistanceInterpreter.yards.withPrefix(prefix);
  DistanceInterpreter get feet => DistanceInterpreter.feet.withPrefix(prefix);
  DistanceInterpreter get inches =>
      DistanceInterpreter.inches.withPrefix(prefix);
  DistanceInterpreter get nauticalMiles =>
      DistanceInterpreter.nauticalMiles.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const meters = DistanceInterpreter.meters;

const miles = DistanceInterpreter.miles;

const yards = DistanceInterpreter.yards;

const feet = DistanceInterpreter.feet;

const inches = DistanceInterpreter.inches;

const nauticalMiles = DistanceInterpreter.nauticalMiles;
