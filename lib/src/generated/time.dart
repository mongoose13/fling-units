// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/time.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTime on num {
  f.Measurement<Time> get seconds => TimeUnit.seconds(this);
  f.Measurement<Time> get minutes => TimeUnit.minutes(this);
  f.Measurement<Time> get hours => TimeUnit.hours(this);
  f.Measurement<Time> get days => TimeUnit.days(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Time extends f.Dimension {}

class TimeUnit extends f.Unit<Time> {
  const TimeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const TimeUnit seconds = TimeUnit._(
    name: 's',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const TimeUnit minutes = TimeUnit._(
    name: 'min',
    unitMultiplier: 60.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const TimeUnit hours = TimeUnit._(
    name: 'h',
    unitMultiplier: 3600.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const TimeUnit days = TimeUnit._(
    name: 'd',
    unitMultiplier: 86400.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.Measurement<Time> call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      TimeMeasurement(magnitude, this, f.Precision(precision));

  TimeUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      TimeUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is TimeUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class TimeMeasurement extends f.Measurement<Time> {
  const TimeMeasurement(
    num magnitude,
    f.Unit<Time> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const TimeMeasurement.zero([super.unit = siUnit]) : super.zero();

  const TimeMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const TimeMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const TimeMeasurement.nan([super.unit = siUnit]) : super.nan();

  static const f.Unit<Time> siUnit = seconds;

  @override
  construct(
    num magnitude,
    f.Unit<Time> defaultUnit,
    f.Precision precision,
  ) =>
      TimeMeasurement(magnitude, defaultUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin TimePrefix {
  f.MeasurementPrefix get prefix;
  TimeUnit get seconds => TimeUnit.seconds.withPrefix(prefix);
  TimeUnit get minutes => TimeUnit.minutes.withPrefix(prefix);
  TimeUnit get hours => TimeUnit.hours.withPrefix(prefix);
  TimeUnit get days => TimeUnit.days.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const TimeUnit seconds = TimeUnit.seconds;

const TimeUnit minutes = TimeUnit.minutes;

const TimeUnit hours = TimeUnit.hours;

const TimeUnit days = TimeUnit.days;
