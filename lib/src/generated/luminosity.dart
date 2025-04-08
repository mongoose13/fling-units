// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/luminosity.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionLuminosity on num {
  LuminosityMeasurement get candela => LuminosityUnit.candela(this);
  LuminosityMeasurement get candlepower => LuminosityUnit.candlepower(this);
  LuminosityMeasurement get hefnerkerze => LuminosityUnit.hefnerkerze(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Luminosity extends f.Dimension {
  const Luminosity();
}

class InvertedLuminosity extends f.Inverted {
  const InvertedLuminosity();
}

class LuminosityUnit extends f.Unit<Luminosity, InvertedLuminosity> {
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
    unitMultiplier: 0.981,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const LuminosityUnit hefnerkerze = LuminosityUnit._(
    name: 'HK',
    unitMultiplier: 0.92,
    prefix: f.MeasurementPrefix.unit(),
  );

  LuminosityMeasurement call(
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
  f.UnitPer<LuminosityUnit, Luminosity, InvertedLuminosity> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<LuminosityUnit, Luminosity, InvertedLuminosity> get dot =>
      f.UnitDot(this);

  @override
  InvertedLuminosityUnit get inverted => InvertedLuminosityUnit._(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class InvertedLuminosityUnit
    extends f.InvertedUnit<InvertedLuminosity, Luminosity> {
  const InvertedLuminosityUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const InvertedLuminosityUnit candela = InvertedLuminosityUnit._(
    name: 'cd',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedLuminosityUnit candlepower = InvertedLuminosityUnit._(
    name: 'cp',
    unitMultiplier: 0.981,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedLuminosityUnit hefnerkerze = InvertedLuminosityUnit._(
    name: 'HK',
    unitMultiplier: 0.92,
    prefix: f.MeasurementPrefix.unit(),
  );

  InvertedLuminosityMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      InvertedLuminosityMeasurement(magnitude, this, f.Precision(precision));

  InvertedLuminosityUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      InvertedLuminosityUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is InvertedLuminosityUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<InvertedLuminosityUnit, InvertedLuminosity, Luminosity> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<InvertedLuminosityUnit, InvertedLuminosity, Luminosity> get dot =>
      f.UnitDot(this);

  @override
  LuminosityUnit get inverted => LuminosityUnit._(
        name: name.substring(0, name.length - 2),
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class LuminosityMeasurement
    extends f.Measurement<Luminosity, InvertedLuminosity> {
  const LuminosityMeasurement(
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
  LuminosityMeasurement.sum(
    Iterable<f.LuminosityMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    LuminosityUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const LuminosityMeasurement.zero([this.defaultUnit = siUnit]) : super.zero();

  const LuminosityMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const LuminosityMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const LuminosityMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const LuminosityUnit siUnit = candela;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final LuminosityUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  LuminosityMeasurement withPrecision(int precision) => LuminosityMeasurement(
      magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  LuminosityMeasurement operator -() =>
      LuminosityMeasurement(-magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  LuminosityMeasurement operator +(LuminosityMeasurement other) =>
      LuminosityMeasurement(defaultUnit.fromSI(si + other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  LuminosityMeasurement operator -(LuminosityMeasurement other) =>
      LuminosityMeasurement(defaultUnit.fromSI(si - other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  LuminosityMeasurement operator *(num multiplier) => LuminosityMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  LuminosityMeasurement operator /(num divisor) => LuminosityMeasurement(
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
  LuminosityMeasurement operator %(LuminosityMeasurement other) =>
      LuminosityMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  LuminosityMeasurement butAs(LuminosityUnit unit) =>
      LuminosityMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(LuminosityUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  InvertedLuminosityMeasurement get inverted => InvertedLuminosityMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<LuminosityMeasurement, Luminosity, InvertedLuminosity>
      get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<LuminosityMeasurement, Luminosity, InvertedLuminosity>
      get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<Luminosity, I, InvertedLuminosity, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<Luminosity, D, InvertedLuminosity, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

class InvertedLuminosityMeasurement
    extends f.Measurement<InvertedLuminosity, Luminosity> {
  const InvertedLuminosityMeasurement(
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
  InvertedLuminosityMeasurement.sum(
    Iterable<f.InvertedLuminosityMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    InvertedLuminosityUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const InvertedLuminosityMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const InvertedLuminosityMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const InvertedLuminosityMeasurement.negativeInfinite(
      [this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const InvertedLuminosityMeasurement.nan([this.defaultUnit = siUnit])
      : super.nan();

  static const InvertedLuminosityUnit siUnit = InvertedLuminosityUnit._(
      name: "LuminosityConfig candela⁻¹", unitMultiplier: 1.0);

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final InvertedLuminosityUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  InvertedLuminosityMeasurement withPrecision(int precision) =>
      InvertedLuminosityMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  InvertedLuminosityMeasurement operator -() => InvertedLuminosityMeasurement(
      -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  InvertedLuminosityMeasurement operator +(
          InvertedLuminosityMeasurement other) =>
      InvertedLuminosityMeasurement(defaultUnit.fromSI(si + other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  InvertedLuminosityMeasurement operator -(
          InvertedLuminosityMeasurement other) =>
      InvertedLuminosityMeasurement(defaultUnit.fromSI(si - other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  InvertedLuminosityMeasurement operator *(num multiplier) =>
      InvertedLuminosityMeasurement(
          magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  InvertedLuminosityMeasurement operator /(num divisor) =>
      InvertedLuminosityMeasurement(
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
  InvertedLuminosityMeasurement operator %(
          InvertedLuminosityMeasurement other) =>
      InvertedLuminosityMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  InvertedLuminosityMeasurement butAs(InvertedLuminosityUnit unit) =>
      InvertedLuminosityMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(InvertedLuminosityUnit unit) =>
      precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  LuminosityMeasurement get inverted => LuminosityMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<InvertedLuminosityMeasurement, InvertedLuminosity,
      Luminosity> get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<InvertedLuminosityMeasurement, InvertedLuminosity,
      Luminosity> get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<InvertedLuminosity, I, Luminosity, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<InvertedLuminosity, D, Luminosity, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
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
