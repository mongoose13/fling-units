// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/angle.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionAngle on num {
  f.AngleMeasurement get turns => AngleUnit.turns(this);
  f.AngleMeasurement get radians => AngleUnit.radians(this);
  f.AngleMeasurement get gradians => AngleUnit.gradians(this);
  f.AngleMeasurement get degrees => AngleUnit.degrees(this);
  f.AngleMeasurement get arcMinutes => AngleUnit.arcMinutes(this);
  f.AngleMeasurement get arcSeconds => AngleUnit.arcSeconds(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Angle extends f.Dimension {
  const Angle();
}

class AngleUnit extends f.Unit<Angle> {
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

  f.AngleMeasurement call(
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
      other.name == name &&
      other.prefix == prefix;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<AngleUnit, Angle> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<AngleUnit, Angle> get dot => f.UnitDot(this);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class AngleMeasurement extends f.Measurement<Angle> {
  const AngleMeasurement(
    num magnitude,
    f.Unit<Angle> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  /// Creates a measurement that is the sum of several measurements.
  AngleMeasurement.sum(
    Iterable<f.Measurement<Angle>> parts, {
    int precision = f.Precision.maximumPrecision,
  }) : super(
          magnitude: parts.first.defaultUnit.of(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
          defaultUnit: parts.first.defaultUnit,
        );

  const AngleMeasurement.zero([super.unit = siUnit]) : super.zero();

  const AngleMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const AngleMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const AngleMeasurement.nan([super.unit = siUnit]) : super.nan();

  static const f.Unit<Angle> siUnit = turns;

  @override
  f.AngleMeasurement construct(
    num magnitude,
    f.Unit<Angle> defaultUnit,
    f.Precision precision,
  ) =>
      AngleMeasurement(magnitude, defaultUnit, precision);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit in the numerator and the specified unit in the denominator, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementPer<AngleMeasurement, Angle> get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit multiplied by the specified measurement's unit, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementDot<AngleMeasurement, Angle> get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Angle>, f.UnitDenominator<D>>>
      over<D extends f.Dimension>(f.Measurement<D> denominator) =>
          f.ratio<Angle, D>(defaultUnit, denominator.defaultUnit)(
              defaultValue, denominator.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Angle>, f.UnitNumerator<D>>>
      by<D extends f.Dimension>(f.Measurement<D> term) => f.product2<Angle, D>(
          defaultUnit, term.defaultUnit)(defaultValue, term.defaultValue);

  /// Creates an equivalent measurement with the specified precision (significant digits).
  @override
  f.AngleMeasurement withPrecision(int precision) =>
      construct(magnitude.toDouble(), defaultUnit, f.Precision(precision));
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin AnglePrefix {
  f.MeasurementPrefix get prefix;
  AngleUnit get turns => AngleUnit.turns.withPrefix(prefix);
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

const AngleUnit radians = AngleUnit.radians;

const AngleUnit gradians = AngleUnit.gradians;

const AngleUnit degrees = AngleUnit.degrees;

const AngleUnit arcMinutes = AngleUnit.arcMinutes;

const AngleUnit arcSeconds = AngleUnit.arcSeconds;
