// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/time.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTime on num {
  TimeMeasurement get seconds => TimeUnit.seconds(this);
  TimeMeasurement get minutes => TimeUnit.minutes(this);
  TimeMeasurement get hours => TimeUnit.hours(this);
  TimeMeasurement get days => TimeUnit.days(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Time extends f.Dimension {
  const Time();
}

class InvertedTime extends f.Inverted {
  const InvertedTime();
}

class TimeUnit extends f.Unit<Time, InvertedTime> {
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

  TimeMeasurement call(
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

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<TimeUnit, Time, InvertedTime> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<TimeUnit, Time, InvertedTime> get dot => f.UnitDot(this);

  @override
  InvertedTimeUnit get inverted => InvertedTimeUnit._(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class InvertedTimeUnit extends f.InvertedUnit<InvertedTime, Time> {
  const InvertedTimeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const InvertedTimeUnit seconds = InvertedTimeUnit._(
    name: 's',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedTimeUnit minutes = InvertedTimeUnit._(
    name: 'min',
    unitMultiplier: 60.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedTimeUnit hours = InvertedTimeUnit._(
    name: 'h',
    unitMultiplier: 3600.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedTimeUnit days = InvertedTimeUnit._(
    name: 'd',
    unitMultiplier: 86400.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  InvertedTimeMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      InvertedTimeMeasurement(magnitude, this, f.Precision(precision));

  InvertedTimeUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      InvertedTimeUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is InvertedTimeUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<InvertedTimeUnit, InvertedTime, Time> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<InvertedTimeUnit, InvertedTime, Time> get dot => f.UnitDot(this);

  @override
  TimeUnit get inverted => TimeUnit._(
        name: name.substring(0, name.length - 2),
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class TimeMeasurement extends f.Measurement<Time, InvertedTime> {
  const TimeMeasurement(
    /// The magnitude of the measurement as a multiple of the measurement's [defaultUnit].
    num magnitude,

    /// The [Unit] in which the measurement was made.
    this.defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
        );

  /// Creates a measurement that is the sum of several measurements.
  TimeMeasurement.sum(
    Iterable<f.TimeMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    TimeUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const TimeMeasurement.zero([this.defaultUnit = siUnit]) : super.zero();

  const TimeMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const TimeMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const TimeMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const TimeUnit siUnit = seconds;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final TimeUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  TimeMeasurement withPrecision(int precision) => TimeMeasurement(
      magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  TimeMeasurement operator -() =>
      TimeMeasurement(-magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  TimeMeasurement operator +(TimeMeasurement other) => TimeMeasurement(
      defaultUnit.fromSI(si + other.si),
      defaultUnit,
      f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  TimeMeasurement operator -(TimeMeasurement other) => TimeMeasurement(
      defaultUnit.fromSI(si - other.si),
      defaultUnit,
      f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  TimeMeasurement operator *(num multiplier) => TimeMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  TimeMeasurement operator /(num divisor) => TimeMeasurement(
      magnitude / divisor.toDouble(), defaultUnit, precisionData);

  /// Returns the Euclidean remainder of the division between two measurements.
  ///
  /// For example:
  /// ```dart
  /// feet(2) % inches(7); // 3 inches
  /// inches(7) % feet(2); // 7 inches
  /// ```
  ///
  /// For the purposes of this function, a negative divisor is treated identically
  /// to its positive counterpart, and thus the operation always produces a positive
  /// result. This is consistent with the way Dart handles the modulo operator.
  /// For example:
  /// ```dart
  /// feet(2) % inches(-7); // 3 inches
  /// feet(-2) % inches(7); // 4 inches
  /// feet(-2) % inches(-7); // 4 inches
  /// ```
  ///
  /// If the divisor is zero or the dividend is infinite, the result is always NaN.
  TimeMeasurement operator %(TimeMeasurement other) => TimeMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  TimeMeasurement butAs(TimeUnit unit) =>
      TimeMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(TimeUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  InvertedTimeMeasurement get inverted => InvertedTimeMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<TimeMeasurement, Time, InvertedTime> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<TimeMeasurement, Time, InvertedTime> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<Time, I, InvertedTime, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<Time, D, InvertedTime, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

class InvertedTimeMeasurement extends f.Measurement<InvertedTime, Time> {
  const InvertedTimeMeasurement(
    /// The magnitude of the measurement as a multiple of the measurement's [defaultUnit].
    num magnitude,

    /// The [Unit] in which the measurement was made.
    this.defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
        );

  /// Creates a measurement that is the sum of several measurements.
  InvertedTimeMeasurement.sum(
    Iterable<f.InvertedTimeMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    InvertedTimeUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const InvertedTimeMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const InvertedTimeMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const InvertedTimeMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const InvertedTimeMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const InvertedTimeUnit siUnit =
      InvertedTimeUnit._(name: "TimeConfig seconds⁻¹", unitMultiplier: 1.0);

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final InvertedTimeUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  InvertedTimeMeasurement withPrecision(int precision) =>
      InvertedTimeMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  InvertedTimeMeasurement operator -() => InvertedTimeMeasurement(
      -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  InvertedTimeMeasurement operator +(InvertedTimeMeasurement other) =>
      InvertedTimeMeasurement(defaultUnit.fromSI(si + other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  InvertedTimeMeasurement operator -(InvertedTimeMeasurement other) =>
      InvertedTimeMeasurement(defaultUnit.fromSI(si - other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  InvertedTimeMeasurement operator *(num multiplier) => InvertedTimeMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  InvertedTimeMeasurement operator /(num divisor) => InvertedTimeMeasurement(
      magnitude / divisor.toDouble(), defaultUnit, precisionData);

  /// Returns the Euclidean remainder of the division between two measurements.
  ///
  /// For example:
  /// ```dart
  /// feet(2) % inches(7); // 3 inches
  /// inches(7) % feet(2); // 7 inches
  /// ```
  ///
  /// For the purposes of this function, a negative divisor is treated identically
  /// to its positive counterpart, and thus the operation always produces a positive
  /// result. This is consistent with the way Dart handles the modulo operator.
  /// For example:
  /// ```dart
  /// feet(2) % inches(-7); // 3 inches
  /// feet(-2) % inches(7); // 4 inches
  /// feet(-2) % inches(-7); // 4 inches
  /// ```
  ///
  /// If the divisor is zero or the dividend is infinite, the result is always NaN.
  InvertedTimeMeasurement operator %(InvertedTimeMeasurement other) =>
      InvertedTimeMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  InvertedTimeMeasurement butAs(InvertedTimeUnit unit) =>
      InvertedTimeMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(InvertedTimeUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  TimeMeasurement get inverted => TimeMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<InvertedTimeMeasurement, InvertedTime, Time> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<InvertedTimeMeasurement, InvertedTime, Time> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<InvertedTime, I, Time, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<InvertedTime, D, Time, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
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
