// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/time.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTime on num {
  f.TimeMeasurement get seconds => TimeUnit.seconds(this);
  f.TimeMeasurement get minutes => TimeUnit.minutes(this);
  f.TimeMeasurement get hours => TimeUnit.hours(this);
  f.TimeMeasurement get days => TimeUnit.days(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Time extends f.Dimension {
  const Time();
}

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

  f.TimeMeasurement call(
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
      other.name == name &&
      other.prefix == prefix;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<TimeUnit, Time> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<TimeUnit, Time> get dot => f.UnitDot(this);
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

  /// Creates a measurement that is the sum of several measurements.
  TimeMeasurement.sum(
    Iterable<f.Measurement<Time>> parts, {
    int precision = f.Precision.maximumPrecision,
  }) : super(
          magnitude: parts.first.defaultUnit.of(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
          defaultUnit: parts.first.defaultUnit,
        );

  const TimeMeasurement.zero([super.unit = siUnit]) : super.zero();

  const TimeMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const TimeMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const TimeMeasurement.nan([super.unit = siUnit]) : super.nan();

  static const f.Unit<Time> siUnit = seconds;

  @override
  f.TimeMeasurement construct(
    num magnitude,
    f.Unit<Time> defaultUnit,
    f.Precision precision,
  ) =>
      TimeMeasurement(magnitude, defaultUnit, precision);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit in the numerator and the specified unit in the denominator, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementPer<TimeMeasurement, Time> get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit multiplied by the specified measurement's unit, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementDot<TimeMeasurement, Time> get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Time>, f.UnitDenominator<D>>>
      over<D extends f.Dimension>(f.Measurement<D> denominator) =>
          f.ratio<Time, D>(defaultUnit, denominator.defaultUnit)(
              defaultValue, denominator.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Time>, f.UnitNumerator<D>>>
      by<D extends f.Dimension>(f.Measurement<D> term) => f.product2<Time, D>(
          defaultUnit, term.defaultUnit)(defaultValue, term.defaultValue);

  /// Creates an equivalent measurement with the specified precision (significant digits).
  @override
  f.TimeMeasurement withPrecision(int precision) =>
      construct(magnitude.toDouble(), defaultUnit, f.Precision(precision));
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
