// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/angle.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionAngle on num {
  AngleMeasurement get turns => AngleUnit.turns(this);
  AngleMeasurement get quadrants => AngleUnit.quadrants(this);
  AngleMeasurement get sextants => AngleUnit.sextants(this);
  AngleMeasurement get radians => AngleUnit.radians(this);
  AngleMeasurement get gradians => AngleUnit.gradians(this);
  AngleMeasurement get degrees => AngleUnit.degrees(this);
  AngleMeasurement get arcMinutes => AngleUnit.arcMinutes(this);
  AngleMeasurement get arcSeconds => AngleUnit.arcSeconds(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Angle extends f.Dimension {
  const Angle();
}

class InvertedAngle extends f.Inverted {
  const InvertedAngle();
}

class AngleUnit extends f.Unit<Angle, InvertedAngle> {
  const AngleUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const AngleUnit turns = AngleUnit._(
    name: 'turn',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit quadrants = AngleUnit._(
    name: 'quadrant',
    unitMultiplier: 0.25,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit sextants = AngleUnit._(
    name: 'sextant',
    unitMultiplier: 0.16666666666666666,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit radians = AngleUnit._(
    name: 'rad',
    unitMultiplier: 0.15915494309189535,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit gradians = AngleUnit._(
    name: 'ᵍ',
    unitMultiplier: 0.0025,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit degrees = AngleUnit._(
    name: '°',
    unitMultiplier: 0.002777777777777778,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit arcMinutes = AngleUnit._(
    name: '′',
    unitMultiplier: 0.000046296296296296294,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const AngleUnit arcSeconds = AngleUnit._(
    name: '′',
    unitMultiplier: 7.716049382716049e-7,
    prefix: f.MeasurementPrefix.unit(),
  );

  AngleMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      AngleMeasurement(magnitude, this, f.Precision(precision));

  AngleUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      AngleUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is AngleUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<AngleUnit, Angle, InvertedAngle> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<AngleUnit, Angle, InvertedAngle> get dot => f.UnitDot(this);

  @override
  InvertedAngleUnit get inverted => InvertedAngleUnit._(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class InvertedAngleUnit extends f.InvertedUnit<InvertedAngle, Angle> {
  const InvertedAngleUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const InvertedAngleUnit turns = InvertedAngleUnit._(
    name: 'turn',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedAngleUnit quadrants = InvertedAngleUnit._(
    name: 'quadrant',
    unitMultiplier: 0.25,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedAngleUnit sextants = InvertedAngleUnit._(
    name: 'sextant',
    unitMultiplier: 0.16666666666666666,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedAngleUnit radians = InvertedAngleUnit._(
    name: 'rad',
    unitMultiplier: 0.15915494309189535,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedAngleUnit gradians = InvertedAngleUnit._(
    name: 'ᵍ',
    unitMultiplier: 0.0025,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedAngleUnit degrees = InvertedAngleUnit._(
    name: '°',
    unitMultiplier: 0.002777777777777778,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedAngleUnit arcMinutes = InvertedAngleUnit._(
    name: '′',
    unitMultiplier: 0.000046296296296296294,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedAngleUnit arcSeconds = InvertedAngleUnit._(
    name: '′',
    unitMultiplier: 7.716049382716049e-7,
    prefix: f.MeasurementPrefix.unit(),
  );

  InvertedAngleMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      InvertedAngleMeasurement(magnitude, this, f.Precision(precision));

  InvertedAngleUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      InvertedAngleUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is InvertedAngleUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<InvertedAngleUnit, InvertedAngle, Angle> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<InvertedAngleUnit, InvertedAngle, Angle> get dot => f.UnitDot(this);

  @override
  AngleUnit get inverted => AngleUnit._(
        name: name.substring(0, name.length - 2),
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class AngleMeasurement extends f.Measurement<Angle, InvertedAngle> {
  const AngleMeasurement(
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
  AngleMeasurement.sum(
    Iterable<f.AngleMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    AngleUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const AngleMeasurement.zero([this.defaultUnit = siUnit]) : super.zero();

  const AngleMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const AngleMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const AngleMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const AngleUnit siUnit = turns;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final AngleUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  AngleMeasurement withPrecision(int precision) => AngleMeasurement(
      magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  AngleMeasurement operator -() =>
      AngleMeasurement(-magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  AngleMeasurement operator +(AngleMeasurement other) => AngleMeasurement(
      defaultUnit.fromSI(si + other.si),
      defaultUnit,
      f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  AngleMeasurement operator -(AngleMeasurement other) => AngleMeasurement(
      defaultUnit.fromSI(si - other.si),
      defaultUnit,
      f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  AngleMeasurement operator *(num multiplier) => AngleMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  AngleMeasurement operator /(num divisor) => AngleMeasurement(
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
  AngleMeasurement operator %(AngleMeasurement other) => AngleMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  AngleMeasurement butAs(AngleUnit unit) =>
      AngleMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(AngleUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  InvertedAngleMeasurement get inverted => InvertedAngleMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<AngleMeasurement, Angle, InvertedAngle> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<AngleMeasurement, Angle, InvertedAngle> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<Angle, I, InvertedAngle, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<Angle, D, InvertedAngle, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

class InvertedAngleMeasurement extends f.Measurement<InvertedAngle, Angle> {
  const InvertedAngleMeasurement(
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
  InvertedAngleMeasurement.sum(
    Iterable<f.InvertedAngleMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    InvertedAngleUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const InvertedAngleMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const InvertedAngleMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const InvertedAngleMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const InvertedAngleMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const InvertedAngleUnit siUnit =
      InvertedAngleUnit._(name: "AngleConfig turns⁻¹", unitMultiplier: 1.0);

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final InvertedAngleUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  InvertedAngleMeasurement withPrecision(int precision) =>
      InvertedAngleMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  InvertedAngleMeasurement operator -() => InvertedAngleMeasurement(
      -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  InvertedAngleMeasurement operator +(InvertedAngleMeasurement other) =>
      InvertedAngleMeasurement(defaultUnit.fromSI(si + other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  InvertedAngleMeasurement operator -(InvertedAngleMeasurement other) =>
      InvertedAngleMeasurement(defaultUnit.fromSI(si - other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  InvertedAngleMeasurement operator *(num multiplier) =>
      InvertedAngleMeasurement(
          magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  InvertedAngleMeasurement operator /(num divisor) => InvertedAngleMeasurement(
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
  InvertedAngleMeasurement operator %(InvertedAngleMeasurement other) =>
      InvertedAngleMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  InvertedAngleMeasurement butAs(InvertedAngleUnit unit) =>
      InvertedAngleMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(InvertedAngleUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  AngleMeasurement get inverted => AngleMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<InvertedAngleMeasurement, InvertedAngle, Angle> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<InvertedAngleMeasurement, InvertedAngle, Angle> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<InvertedAngle, I, Angle, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<InvertedAngle, D, Angle, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin AnglePrefix {
  f.MeasurementPrefix get prefix;
  AngleUnit get turns => AngleUnit.turns.withPrefix(prefix);
  AngleUnit get quadrants => AngleUnit.quadrants.withPrefix(prefix);
  AngleUnit get sextants => AngleUnit.sextants.withPrefix(prefix);
  AngleUnit get radians => AngleUnit.radians.withPrefix(prefix);
  AngleUnit get gradians => AngleUnit.gradians.withPrefix(prefix);
  AngleUnit get degrees => AngleUnit.degrees.withPrefix(prefix);
  AngleUnit get arcMinutes => AngleUnit.arcMinutes.withPrefix(prefix);
  AngleUnit get arcSeconds => AngleUnit.arcSeconds.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const AngleUnit turns = AngleUnit.turns;

const AngleUnit quadrants = AngleUnit.quadrants;

const AngleUnit sextants = AngleUnit.sextants;

const AngleUnit radians = AngleUnit.radians;

const AngleUnit gradians = AngleUnit.gradians;

const AngleUnit degrees = AngleUnit.degrees;

const AngleUnit arcMinutes = AngleUnit.arcMinutes;

const AngleUnit arcSeconds = AngleUnit.arcSeconds;
