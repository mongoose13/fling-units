// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/quantity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionQuantity on num {
  QuantityMeasurement get units => QuantityUnit.units(this);
  QuantityMeasurement get moles => QuantityUnit.moles(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Quantity extends f.Dimension {
  const Quantity();
}

class InvertedQuantity extends f.Inverted {
  const InvertedQuantity();
}

class QuantityUnit extends f.Unit<Quantity, InvertedQuantity> {
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
    unitMultiplier: 6.02214076e+23,
    prefix: f.MeasurementPrefix.unit(),
  );

  QuantityMeasurement call(
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
  f.UnitPer<QuantityUnit, Quantity, InvertedQuantity> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<QuantityUnit, Quantity, InvertedQuantity> get dot =>
      f.UnitDot(this);

  @override
  InvertedQuantityUnit get inverted => InvertedQuantityUnit._(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class InvertedQuantityUnit extends f.InvertedUnit<InvertedQuantity, Quantity> {
  const InvertedQuantityUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const InvertedQuantityUnit units = InvertedQuantityUnit._(
    name: 'units',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedQuantityUnit moles = InvertedQuantityUnit._(
    name: 'mol',
    unitMultiplier: 6.02214076e+23,
    prefix: f.MeasurementPrefix.unit(),
  );

  InvertedQuantityMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      InvertedQuantityMeasurement(magnitude, this, f.Precision(precision));

  InvertedQuantityUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      InvertedQuantityUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is InvertedQuantityUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<InvertedQuantityUnit, InvertedQuantity, Quantity> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<InvertedQuantityUnit, InvertedQuantity, Quantity> get dot =>
      f.UnitDot(this);

  @override
  QuantityUnit get inverted => QuantityUnit._(
        name: name.substring(0, name.length - 2),
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class QuantityMeasurement extends f.Measurement<Quantity, InvertedQuantity> {
  const QuantityMeasurement(
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
  QuantityMeasurement.sum(
    Iterable<f.QuantityMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    QuantityUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const QuantityMeasurement.zero([this.defaultUnit = siUnit]) : super.zero();

  const QuantityMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const QuantityMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const QuantityMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const QuantityUnit siUnit = units;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final QuantityUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  QuantityMeasurement withPrecision(int precision) => QuantityMeasurement(
      magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  QuantityMeasurement operator -() =>
      QuantityMeasurement(-magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  QuantityMeasurement operator +(QuantityMeasurement other) =>
      QuantityMeasurement(defaultUnit.fromSI(si + other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  QuantityMeasurement operator -(QuantityMeasurement other) =>
      QuantityMeasurement(defaultUnit.fromSI(si - other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  QuantityMeasurement operator *(num multiplier) => QuantityMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  QuantityMeasurement operator /(num divisor) => QuantityMeasurement(
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
  QuantityMeasurement operator %(QuantityMeasurement other) =>
      QuantityMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  QuantityMeasurement butAs(QuantityUnit unit) =>
      QuantityMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(QuantityUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  InvertedQuantityMeasurement get inverted => InvertedQuantityMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<QuantityMeasurement, Quantity, InvertedQuantity> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<QuantityMeasurement, Quantity, InvertedQuantity> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<Quantity, I, InvertedQuantity, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<Quantity, D, InvertedQuantity, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

class InvertedQuantityMeasurement
    extends f.Measurement<InvertedQuantity, Quantity> {
  const InvertedQuantityMeasurement(
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
  InvertedQuantityMeasurement.sum(
    Iterable<f.InvertedQuantityMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    InvertedQuantityUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const InvertedQuantityMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const InvertedQuantityMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const InvertedQuantityMeasurement.negativeInfinite(
      [this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const InvertedQuantityMeasurement.nan([this.defaultUnit = siUnit])
      : super.nan();

  static const InvertedQuantityUnit siUnit = InvertedQuantityUnit._(
      name: "QuantityConfig units⁻¹", unitMultiplier: 1.0);

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final InvertedQuantityUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  InvertedQuantityMeasurement withPrecision(int precision) =>
      InvertedQuantityMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  InvertedQuantityMeasurement operator -() => InvertedQuantityMeasurement(
      -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  InvertedQuantityMeasurement operator +(InvertedQuantityMeasurement other) =>
      InvertedQuantityMeasurement(defaultUnit.fromSI(si + other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  InvertedQuantityMeasurement operator -(InvertedQuantityMeasurement other) =>
      InvertedQuantityMeasurement(defaultUnit.fromSI(si - other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  InvertedQuantityMeasurement operator *(num multiplier) =>
      InvertedQuantityMeasurement(
          magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  InvertedQuantityMeasurement operator /(num divisor) =>
      InvertedQuantityMeasurement(
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
  InvertedQuantityMeasurement operator %(InvertedQuantityMeasurement other) =>
      InvertedQuantityMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  InvertedQuantityMeasurement butAs(InvertedQuantityUnit unit) =>
      InvertedQuantityMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(InvertedQuantityUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  QuantityMeasurement get inverted => QuantityMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<InvertedQuantityMeasurement, InvertedQuantity, Quantity>
      get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<InvertedQuantityMeasurement, InvertedQuantity, Quantity>
      get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<InvertedQuantity, I, Quantity, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<InvertedQuantity, D, Quantity, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
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
