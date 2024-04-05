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
  const TimeUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const seconds = TimeUnit._('s', 1.0);

  static const minutes = TimeUnit._('min', 0.016666666666666666);

  static const hours = TimeUnit._('h', 0.0002777777777777778);

  static const days = TimeUnit._('d', 0.000011574074074074073);

  @override
  Time call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Time(value, this, precision);

  TimeUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      TimeUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Time extends Measurement<Time> {
  const Time(
    num units,
    Unit<Time> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

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
    double amount,
    Unit<Time>? interpreter,
    Precision precision,
  ) =>
      Time(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Time> get per => DerivedMeasurementBuilder(this);
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
