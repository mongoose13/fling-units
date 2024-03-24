// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/time.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTime on num {
  Time get seconds => TimeInterpreter.seconds(this);
  Time get minutes => TimeInterpreter.minutes(this);
  Time get hours => TimeInterpreter.hours(this);
  Time get days => TimeInterpreter.days(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class TimeInterpreter extends MeasurementInterpreter<Time> {
  const TimeInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const seconds = TimeInterpreter._('s', 1.0);

  static const minutes = TimeInterpreter._('min', 0.016666666666666666);

  static const hours = TimeInterpreter._('h', 0.0002777777777777778);

  static const days = TimeInterpreter._('d', 0.000011574074074074073);

  @override
  Time call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Time(value, this, precision);

  TimeInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      TimeInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Time extends Measurement<Time> {
  const Time(
    num units,
    MeasurementInterpreter<Time> interpreter, [
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

  static const TimeInterpreter siUnit = seconds;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitTime(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Time>? interpreter,
    Precision precision,
  ) =>
      Time(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin TimePrefix {
  static TimeInterpreter siUnit = TimeInterpreter.seconds;

  MeasurementPrefix get prefix;
  TimeInterpreter get seconds => TimeInterpreter.seconds.withPrefix(prefix);
  TimeInterpreter get minutes => TimeInterpreter.minutes.withPrefix(prefix);
  TimeInterpreter get hours => TimeInterpreter.hours.withPrefix(prefix);
  TimeInterpreter get days => TimeInterpreter.days.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const seconds = TimeInterpreter.seconds;

const minutes = TimeInterpreter.minutes;

const hours = TimeInterpreter.hours;

const days = TimeInterpreter.days;
