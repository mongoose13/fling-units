// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/time.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTime on num {
  Time get seconds => TimeUnit.seconds(this);
  Time get minutes => TimeUnit.minutes(this);
  Time get hours => TimeUnit.hours(this);
  Time get days => TimeUnit.days(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class TimeUnit extends Unit<Time> {
  const TimeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const seconds = TimeUnit._(name: 's', unitMultiplier: 1.0);

  static const minutes =
      TimeUnit._(name: 'min', unitMultiplier: 0.016666666666666666);

  static const hours =
      TimeUnit._(name: 'h', unitMultiplier: 0.0002777777777777778);

  static const days =
      TimeUnit._(name: 'd', unitMultiplier: 0.000011574074074074073);

  @override
  Time call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Time(magnitude, this, precision);

  TimeUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      TimeUnit._(name: name, unitMultiplier: unitMultiplier, prefix: prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Time extends Measurement<Time> {
  const Time(
    num magnitude,
    Unit<Time> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const Time.zero([super.interpreter = siUnit]) : super.zero();

  const Time.infinite([super.interpreter = siUnit]) : super.infinite();

  const Time.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Time.nan([super.interpreter = siUnit]) : super.nan();

  Time.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const TimeUnit siUnit = seconds;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitTime(this);

  @override
  construct(
    num magnitude,
    Unit<Time> defaultUnit,
    Precision precision,
  ) =>
      Time(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Time> get per =>
      DerivedMeasurementPerBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin TimePrefix {
  static TimeUnit siUnit = TimeUnit.seconds;

  MeasurementPrefix get prefix;
  TimeUnit get seconds => TimeUnit.seconds.withPrefix(prefix);
  TimeUnit get minutes => TimeUnit.minutes.withPrefix(prefix);
  TimeUnit get hours => TimeUnit.hours.withPrefix(prefix);
  TimeUnit get days => TimeUnit.days.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const seconds = TimeUnit.seconds;

const minutes = TimeUnit.minutes;

const hours = TimeUnit.hours;

const days = TimeUnit.days;
