// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/luminosity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionLuminosity on num {
  Luminosity get candela => LuminosityUnit.candela(this);
  Luminosity get candlepower => LuminosityUnit.candlepower(this);
  Luminosity get hefnerkerze => LuminosityUnit.hefnerkerze(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class LuminosityUnit extends Unit<Luminosity> {
  const LuminosityUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const candela = LuminosityUnit._(name: 'cd', unitMultiplier: 1.0);

  static const candlepower =
      LuminosityUnit._(name: 'cp', unitMultiplier: 1.0194);

  static const hefnerkerze =
      LuminosityUnit._(name: 'HK', unitMultiplier: 1.087);

  @override
  Luminosity call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Luminosity(magnitude, this, precision);

  LuminosityUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      LuminosityUnit._(
          name: name, unitMultiplier: unitMultiplier, prefix: prefix);

  @override
  bool operator ==(Object other) =>
      other is LuminosityUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Luminosity extends Measurement<Luminosity> {
  const Luminosity(
    num magnitude,
    Unit<Luminosity> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const Luminosity.zero([super.unit = siUnit]) : super.zero();

  const Luminosity.infinite([super.unit = siUnit]) : super.infinite();

  const Luminosity.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const Luminosity.nan([super.unit = siUnit]) : super.nan();

  Luminosity.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const LuminosityUnit siUnit = candela;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitLuminosity(this);

  @override
  construct(
    num magnitude,
    Unit<Luminosity> defaultUnit,
    Precision precision,
  ) =>
      Luminosity(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Luminosity> get per =>
      DerivedMeasurementPerBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin LuminosityPrefix {
  static LuminosityUnit siUnit = LuminosityUnit.candela;

  MeasurementPrefix get prefix;
  LuminosityUnit get candela => LuminosityUnit.candela.withPrefix(prefix);
  LuminosityUnit get candlepower =>
      LuminosityUnit.candlepower.withPrefix(prefix);
  LuminosityUnit get hefnerkerze =>
      LuminosityUnit.hefnerkerze.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const candela = LuminosityUnit.candela;

const candlepower = LuminosityUnit.candlepower;

const hefnerkerze = LuminosityUnit.hefnerkerze;
