// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/quantity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionQuantity on num {
  f.QuantityMeasurement get units => QuantityUnit.units(this);
  f.QuantityMeasurement get moles => QuantityUnit.moles(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Quantity extends f.Dimension {
  const Quantity();
}

class QuantityUnit extends f.Unit<Quantity> {
  const QuantityUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const QuantityUnit units = QuantityUnit._(
    name: 'units',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const QuantityUnit moles = QuantityUnit._(
    name: 'mol',
    unitMultiplier: 6.022140760630475e+23,
    prefix: f.MeasurementPrefix.unit(),
  );

  f.QuantityMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      QuantityMeasurement(magnitude, this, f.Precision(precision));

  QuantityUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      QuantityUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is QuantityUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<QuantityUnit, Quantity> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<QuantityUnit, Quantity> get dot => f.UnitDot(this);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class QuantityMeasurement extends f.Measurement<Quantity> {
  const QuantityMeasurement(
    num magnitude,
    f.Unit<Quantity> defaultUnit, [
    f.Precision precision = f.Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  /// Creates a measurement that is the sum of several measurements.
  QuantityMeasurement.sum(
    Iterable<f.Measurement<Quantity>> parts, {
    int precision = f.Precision.maximumPrecision,
  }) : super(
          magnitude: parts.first.defaultUnit.of(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
          defaultUnit: parts.first.defaultUnit,
        );

  const QuantityMeasurement.zero([super.unit = siUnit]) : super.zero();

  const QuantityMeasurement.infinite([super.unit = siUnit]) : super.infinite();

  const QuantityMeasurement.negativeInfinite([super.unit = siUnit])
      : super.negativeInfinite();

  const QuantityMeasurement.nan([super.unit = siUnit]) : super.nan();

  static const f.Unit<Quantity> siUnit = units;

  @override
  f.QuantityMeasurement construct(
    num magnitude,
    f.Unit<Quantity> defaultUnit,
    f.Precision precision,
  ) =>
      QuantityMeasurement(magnitude, defaultUnit, precision);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit in the numerator and the specified unit in the denominator, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementPer<QuantityMeasurement, Quantity> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement'sunit multiplied by the specified measurement's unit, with this measurement'sdefault value as the default value of the resulting derived unit.
  f.MeasurementDot<QuantityMeasurement, Quantity> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Quantity>, f.UnitDenominator<D>>>
      over<D extends f.Dimension>(f.Measurement<D> denominator) =>
          f.ratio<Quantity, D>(defaultUnit, denominator.defaultUnit)(
              defaultValue, denominator.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.Measurement<f.Dimension2<f.UnitNumerator<Quantity>, f.UnitNumerator<D>>>
      by<D extends f.Dimension>(f.Measurement<D> term) =>
          f.product2<Quantity, D>(defaultUnit, term.defaultUnit)(
              defaultValue, term.defaultValue);

  /// Creates an equivalent measurement with the specified precision (significant digits).
  @override
  f.QuantityMeasurement withPrecision(int precision) =>
      construct(magnitude.toDouble(), defaultUnit, f.Precision(precision));
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin QuantityPrefix {
  f.MeasurementPrefix get prefix;
  QuantityUnit get units => QuantityUnit.units.withPrefix(prefix);
  QuantityUnit get moles => QuantityUnit.moles.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const QuantityUnit units = QuantityUnit.units;

const QuantityUnit moles = QuantityUnit.moles;
