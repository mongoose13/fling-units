// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/luminosity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionLuminosity on num {
  f.LuminosityMeasurement get candela => LuminosityUnit.candela(this);
  f.LuminosityMeasurement get candlepower => LuminosityUnit.candlepower(this);
  f.LuminosityMeasurement get hefnerkerze => LuminosityUnit.hefnerkerze(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Luminosity extends f.Dimension {
  const Luminosity();
}

class LuminosityUnit extends f.Unit<Luminosity> {
  const LuminosityUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const LuminosityUnit candela = LuminosityUnit._(
    name: 'cd',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const LuminosityUnit candlepower = LuminosityUnit._(
    name: 'cp',
    unitMultiplier: 0.9809691975671964,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const LuminosityUnit hefnerkerze = LuminosityUnit._(
    name: 'HK',
    unitMultiplier: 0.9199632014719411,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.LuminosityMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      LuminosityMeasurement(magnitude, this, f.Precision(precision));

  LuminosityUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      LuminosityUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is LuminosityUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<LuminosityUnit, Luminosity> get per => f.UnitPer(this);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class LuminosityMeasurement extends f.Measurement<Luminosity> {
  const LuminosityMeasurement(
    num magnitude,
    f.Unit<Luminosity> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const LuminosityMeasurement.zero([super.unit = siUnit]) : super.zero();

  const LuminosityMeasurement.infinite([super.unit = siUnit])
      : super.infinite();

  const LuminosityMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const LuminosityMeasurement.nan([super.unit = siUnit]) : super.nan();

  static const f.Unit<Luminosity> siUnit = candela;

  @override
  construct(
    num magnitude,
    f.Unit<Luminosity> defaultUnit,
    f.Precision precision,
  ) =>
      LuminosityMeasurement(magnitude, defaultUnit, precision);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit in the numerator and the specified unit in the denominator, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementPer<LuminosityMeasurement, Luminosity> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Luminosity>, f.UnitDenominator<D>>>
      over<D extends f.Dimension>(f.Measurement<D> denominator) =>
          f.ratio<Luminosity, D>(defaultUnit, denominator.defaultUnit)(
              defaultValue, denominator.defaultValue);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin LuminosityPrefix {
  f.MeasurementPrefix get prefix;
  LuminosityUnit get candela => LuminosityUnit.candela.withPrefix(prefix);
  LuminosityUnit get candlepower =>
      LuminosityUnit.candlepower.withPrefix(prefix);
  LuminosityUnit get hefnerkerze =>
      LuminosityUnit.hefnerkerze.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const LuminosityUnit candela = LuminosityUnit.candela;

const LuminosityUnit candlepower = LuminosityUnit.candlepower;

const LuminosityUnit hefnerkerze = LuminosityUnit.hefnerkerze;
