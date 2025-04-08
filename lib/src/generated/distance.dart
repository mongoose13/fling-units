// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/distance.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionDistance on num {
  DistanceMeasurement get meters => DistanceUnit.meters(this);
  DistanceMeasurement get miles => DistanceUnit.miles(this);
  DistanceMeasurement get yards => DistanceUnit.yards(this);
  DistanceMeasurement get feet => DistanceUnit.feet(this);
  DistanceMeasurement get inches => DistanceUnit.inches(this);
  DistanceMeasurement get nauticalMiles => DistanceUnit.nauticalMiles(this);
  DistanceMeasurement get microns => DistanceUnit.microns(this);
  DistanceMeasurement get lightYears => DistanceUnit.lightYears(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Distance extends f.Dimension {
  const Distance();
}

class InvertedDistance extends f.Inverted {
  const InvertedDistance();
}

class DistanceUnit extends f.Unit<Distance, InvertedDistance> {
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
    unitMultiplier: 1609.344,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit yards = DistanceUnit._(
    name: 'yd',
    unitMultiplier: 0.9144,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit feet = DistanceUnit._(
    name: 'ft',
    unitMultiplier: 0.3048,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit inches = DistanceUnit._(
    name: 'in',
    unitMultiplier: 0.0254,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit nauticalMiles = DistanceUnit._(
    name: 'NM',
    unitMultiplier: 1852.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit microns = DistanceUnit._(
    name: 'µ',
    unitMultiplier: 0.000001,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const DistanceUnit lightYears = DistanceUnit._(
    name: 'ly',
    unitMultiplier: 9460730472580000.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  DistanceMeasurement call(
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
  f.UnitPer<DistanceUnit, Distance, InvertedDistance> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<DistanceUnit, Distance, InvertedDistance> get dot =>
      f.UnitDot(this);

  @override
  InvertedDistanceUnit get inverted => InvertedDistanceUnit._(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class InvertedDistanceUnit extends f.InvertedUnit<InvertedDistance, Distance> {
  const InvertedDistanceUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const InvertedDistanceUnit meters = InvertedDistanceUnit._(
    name: 'm',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedDistanceUnit miles = InvertedDistanceUnit._(
    name: 'mi',
    unitMultiplier: 1609.344,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedDistanceUnit yards = InvertedDistanceUnit._(
    name: 'yd',
    unitMultiplier: 0.9144,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedDistanceUnit feet = InvertedDistanceUnit._(
    name: 'ft',
    unitMultiplier: 0.3048,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedDistanceUnit inches = InvertedDistanceUnit._(
    name: 'in',
    unitMultiplier: 0.0254,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedDistanceUnit nauticalMiles = InvertedDistanceUnit._(
    name: 'NM',
    unitMultiplier: 1852.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedDistanceUnit microns = InvertedDistanceUnit._(
    name: 'µ',
    unitMultiplier: 0.000001,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedDistanceUnit lightYears = InvertedDistanceUnit._(
    name: 'ly',
    unitMultiplier: 9460730472580000.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  InvertedDistanceMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      InvertedDistanceMeasurement(magnitude, this, f.Precision(precision));

  InvertedDistanceUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      InvertedDistanceUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is InvertedDistanceUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<InvertedDistanceUnit, InvertedDistance, Distance> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<InvertedDistanceUnit, InvertedDistance, Distance> get dot =>
      f.UnitDot(this);

  @override
  DistanceUnit get inverted => DistanceUnit._(
        name: name.substring(0, name.length - 2),
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class DistanceMeasurement extends f.Measurement<Distance, InvertedDistance> {
  const DistanceMeasurement(
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
  DistanceMeasurement.sum(
    Iterable<f.DistanceMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    DistanceUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const DistanceMeasurement.zero([this.defaultUnit = siUnit]) : super.zero();

  const DistanceMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const DistanceMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const DistanceMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const DistanceUnit siUnit = meters;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final DistanceUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  DistanceMeasurement withPrecision(int precision) => DistanceMeasurement(
      magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  DistanceMeasurement operator -() =>
      DistanceMeasurement(-magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  DistanceMeasurement operator +(DistanceMeasurement other) =>
      DistanceMeasurement(defaultUnit.fromSI(si + other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  DistanceMeasurement operator -(DistanceMeasurement other) =>
      DistanceMeasurement(defaultUnit.fromSI(si - other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  DistanceMeasurement operator *(num multiplier) => DistanceMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  DistanceMeasurement operator /(num divisor) => DistanceMeasurement(
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
  DistanceMeasurement operator %(DistanceMeasurement other) =>
      DistanceMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  DistanceMeasurement butAs(DistanceUnit unit) =>
      DistanceMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(DistanceUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  InvertedDistanceMeasurement get inverted => InvertedDistanceMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<DistanceMeasurement, Distance, InvertedDistance> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<DistanceMeasurement, Distance, InvertedDistance> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<Distance, I, InvertedDistance, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<Distance, D, InvertedDistance, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

class InvertedDistanceMeasurement
    extends f.Measurement<InvertedDistance, Distance> {
  const InvertedDistanceMeasurement(
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
  InvertedDistanceMeasurement.sum(
    Iterable<f.InvertedDistanceMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    InvertedDistanceUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const InvertedDistanceMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const InvertedDistanceMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const InvertedDistanceMeasurement.negativeInfinite(
      [this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const InvertedDistanceMeasurement.nan([this.defaultUnit = siUnit])
      : super.nan();

  static const InvertedDistanceUnit siUnit = InvertedDistanceUnit._(
      name: "DistanceConfig meters⁻¹", unitMultiplier: 1.0);

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final InvertedDistanceUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  InvertedDistanceMeasurement withPrecision(int precision) =>
      InvertedDistanceMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  InvertedDistanceMeasurement operator -() => InvertedDistanceMeasurement(
      -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  InvertedDistanceMeasurement operator +(InvertedDistanceMeasurement other) =>
      InvertedDistanceMeasurement(defaultUnit.fromSI(si + other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  InvertedDistanceMeasurement operator -(InvertedDistanceMeasurement other) =>
      InvertedDistanceMeasurement(defaultUnit.fromSI(si - other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  InvertedDistanceMeasurement operator *(num multiplier) =>
      InvertedDistanceMeasurement(
          magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  InvertedDistanceMeasurement operator /(num divisor) =>
      InvertedDistanceMeasurement(
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
  InvertedDistanceMeasurement operator %(InvertedDistanceMeasurement other) =>
      InvertedDistanceMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  InvertedDistanceMeasurement butAs(InvertedDistanceUnit unit) =>
      InvertedDistanceMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(InvertedDistanceUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  DistanceMeasurement get inverted => DistanceMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<InvertedDistanceMeasurement, InvertedDistance, Distance>
      get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<InvertedDistanceMeasurement, InvertedDistance, Distance>
      get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<InvertedDistance, I, Distance, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<InvertedDistance, D, Distance, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
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
  DistanceUnit get microns => DistanceUnit.microns.withPrefix(prefix);
  DistanceUnit get lightYears => DistanceUnit.lightYears.withPrefix(prefix);
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

const DistanceUnit microns = DistanceUnit.microns;

const DistanceUnit lightYears = DistanceUnit.lightYears;
