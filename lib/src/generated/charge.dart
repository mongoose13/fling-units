// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/charge.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionCharge on num {
  ChargeMeasurement get amperes => ChargeUnit.amperes(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Charge extends f.Dimension {
  const Charge();
}

class InvertedCharge extends f.Inverted {
  const InvertedCharge();
}

class ChargeUnit extends f.Unit<Charge, InvertedCharge> {
  const ChargeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const ChargeUnit amperes = ChargeUnit._(
    name: 'A',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  ChargeMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      ChargeMeasurement(magnitude, this, f.Precision(precision));

  ChargeUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      ChargeUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is ChargeUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<ChargeUnit, Charge, InvertedCharge> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<ChargeUnit, Charge, InvertedCharge> get dot => f.UnitDot(this);

  @override
  InvertedChargeUnit get inverted => InvertedChargeUnit._(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class InvertedChargeUnit extends f.InvertedUnit<InvertedCharge, Charge> {
  const InvertedChargeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const InvertedChargeUnit amperes = InvertedChargeUnit._(
    name: 'A',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  InvertedChargeMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      InvertedChargeMeasurement(magnitude, this, f.Precision(precision));

  InvertedChargeUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      InvertedChargeUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is InvertedChargeUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<InvertedChargeUnit, InvertedCharge, Charge> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<InvertedChargeUnit, InvertedCharge, Charge> get dot =>
      f.UnitDot(this);

  @override
  ChargeUnit get inverted => ChargeUnit._(
        name: name.substring(0, name.length - 2),
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class ChargeMeasurement extends f.Measurement<Charge, InvertedCharge> {
  const ChargeMeasurement(
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
  ChargeMeasurement.sum(
    Iterable<f.ChargeMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    ChargeUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const ChargeMeasurement.zero([this.defaultUnit = siUnit]) : super.zero();

  const ChargeMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const ChargeMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const ChargeMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const ChargeUnit siUnit = amperes;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final ChargeUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  ChargeMeasurement withPrecision(int precision) => ChargeMeasurement(
      magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  ChargeMeasurement operator -() =>
      ChargeMeasurement(-magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  ChargeMeasurement operator +(ChargeMeasurement other) => ChargeMeasurement(
      defaultUnit.fromSI(si + other.si),
      defaultUnit,
      f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  ChargeMeasurement operator -(ChargeMeasurement other) => ChargeMeasurement(
      defaultUnit.fromSI(si - other.si),
      defaultUnit,
      f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  ChargeMeasurement operator *(num multiplier) => ChargeMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  ChargeMeasurement operator /(num divisor) => ChargeMeasurement(
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
  ChargeMeasurement operator %(ChargeMeasurement other) => ChargeMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  ChargeMeasurement butAs(ChargeUnit unit) =>
      ChargeMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(ChargeUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  InvertedChargeMeasurement get inverted => InvertedChargeMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<ChargeMeasurement, Charge, InvertedCharge> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<ChargeMeasurement, Charge, InvertedCharge> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<Charge, I, InvertedCharge, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<Charge, D, InvertedCharge, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

class InvertedChargeMeasurement extends f.Measurement<InvertedCharge, Charge> {
  const InvertedChargeMeasurement(
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
  InvertedChargeMeasurement.sum(
    Iterable<f.InvertedChargeMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    InvertedChargeUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const InvertedChargeMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const InvertedChargeMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const InvertedChargeMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const InvertedChargeMeasurement.nan([this.defaultUnit = siUnit])
      : super.nan();

  static const InvertedChargeUnit siUnit =
      InvertedChargeUnit._(name: "ChargeConfig amperes⁻¹", unitMultiplier: 1.0);

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final InvertedChargeUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  InvertedChargeMeasurement withPrecision(int precision) =>
      InvertedChargeMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  InvertedChargeMeasurement operator -() => InvertedChargeMeasurement(
      -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  InvertedChargeMeasurement operator +(InvertedChargeMeasurement other) =>
      InvertedChargeMeasurement(defaultUnit.fromSI(si + other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  InvertedChargeMeasurement operator -(InvertedChargeMeasurement other) =>
      InvertedChargeMeasurement(defaultUnit.fromSI(si - other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  InvertedChargeMeasurement operator *(num multiplier) =>
      InvertedChargeMeasurement(
          magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  InvertedChargeMeasurement operator /(num divisor) =>
      InvertedChargeMeasurement(
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
  InvertedChargeMeasurement operator %(InvertedChargeMeasurement other) =>
      InvertedChargeMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  InvertedChargeMeasurement butAs(InvertedChargeUnit unit) =>
      InvertedChargeMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(InvertedChargeUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  ChargeMeasurement get inverted => ChargeMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<InvertedChargeMeasurement, InvertedCharge, Charge> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<InvertedChargeMeasurement, InvertedCharge, Charge> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<InvertedCharge, I, Charge, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<InvertedCharge, D, Charge, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin ChargePrefix {
  f.MeasurementPrefix get prefix;
  ChargeUnit get amperes => ChargeUnit.amperes.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const ChargeUnit amperes = ChargeUnit.amperes;
