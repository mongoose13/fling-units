// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/pressure.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionPressure on num {
  PressureMeasurement get pascals => PressureUnit.pascals(this);
  PressureMeasurement get bars => PressureUnit.bars(this);
  PressureMeasurement get baryes => PressureUnit.baryes(this);
  PressureMeasurement get standardAtmospheres =>
      PressureUnit.standardAtmospheres(this);
  PressureMeasurement get technicalAtmospheres =>
      PressureUnit.technicalAtmospheres(this);
  PressureMeasurement get mmHg => PressureUnit.mmHg(this);
  PressureMeasurement get torr => PressureUnit.torr(this);
  PressureMeasurement get psi => PressureUnit.psi(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Pressure extends f.Dimension {
  const Pressure();
}

class InvertedPressure extends f.Inverted {
  const InvertedPressure();
}

class PressureUnit extends f.Unit<Pressure, InvertedPressure> {
  const PressureUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const PressureUnit pascals = PressureUnit._(
    name: 'Pa',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit bars = PressureUnit._(
    name: 'bar',
    unitMultiplier: 100000.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit baryes = PressureUnit._(
    name: 'Ba',
    unitMultiplier: 0.1,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit standardAtmospheres = PressureUnit._(
    name: 'atm',
    unitMultiplier: 101325.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit technicalAtmospheres = PressureUnit._(
    name: 'at',
    unitMultiplier: 98066.5,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit mmHg = PressureUnit._(
    name: 'mmHg',
    unitMultiplier: 133.322,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit torr = PressureUnit._(
    name: 'Torr',
    unitMultiplier: 133.32236842105263,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const PressureUnit psi = PressureUnit._(
    name: 'psi',
    unitMultiplier: 6894.7572932,
    prefix: f.MeasurementPrefix.unit(),
  );

  PressureMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      PressureMeasurement(magnitude, this, f.Precision(precision));

  PressureUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      PressureUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is PressureUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<PressureUnit, Pressure, InvertedPressure> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<PressureUnit, Pressure, InvertedPressure> get dot =>
      f.UnitDot(this);

  @override
  InvertedPressureUnit get inverted => InvertedPressureUnit._(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class InvertedPressureUnit extends f.InvertedUnit<InvertedPressure, Pressure> {
  const InvertedPressureUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const InvertedPressureUnit pascals = InvertedPressureUnit._(
    name: 'Pa',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedPressureUnit bars = InvertedPressureUnit._(
    name: 'bar',
    unitMultiplier: 100000.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedPressureUnit baryes = InvertedPressureUnit._(
    name: 'Ba',
    unitMultiplier: 0.1,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedPressureUnit standardAtmospheres =
      InvertedPressureUnit._(
    name: 'atm',
    unitMultiplier: 101325.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedPressureUnit technicalAtmospheres =
      InvertedPressureUnit._(
    name: 'at',
    unitMultiplier: 98066.5,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedPressureUnit mmHg = InvertedPressureUnit._(
    name: 'mmHg',
    unitMultiplier: 133.322,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedPressureUnit torr = InvertedPressureUnit._(
    name: 'Torr',
    unitMultiplier: 133.32236842105263,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedPressureUnit psi = InvertedPressureUnit._(
    name: 'psi',
    unitMultiplier: 6894.7572932,
    prefix: f.MeasurementPrefix.unit(),
  );

  InvertedPressureMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      InvertedPressureMeasurement(magnitude, this, f.Precision(precision));

  InvertedPressureUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      InvertedPressureUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is InvertedPressureUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<InvertedPressureUnit, InvertedPressure, Pressure> get per =>
      f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<InvertedPressureUnit, InvertedPressure, Pressure> get dot =>
      f.UnitDot(this);

  @override
  PressureUnit get inverted => PressureUnit._(
        name: name.substring(0, name.length - 2),
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class PressureMeasurement extends f.Measurement<Pressure, InvertedPressure> {
  const PressureMeasurement(
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
  PressureMeasurement.sum(
    Iterable<f.PressureMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    PressureUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const PressureMeasurement.zero([this.defaultUnit = siUnit]) : super.zero();

  const PressureMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const PressureMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const PressureMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const PressureUnit siUnit = pascals;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final PressureUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  PressureMeasurement withPrecision(int precision) => PressureMeasurement(
      magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  PressureMeasurement operator -() =>
      PressureMeasurement(-magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  PressureMeasurement operator +(PressureMeasurement other) =>
      PressureMeasurement(defaultUnit.fromSI(si + other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  PressureMeasurement operator -(PressureMeasurement other) =>
      PressureMeasurement(defaultUnit.fromSI(si - other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  PressureMeasurement operator *(num multiplier) => PressureMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  PressureMeasurement operator /(num divisor) => PressureMeasurement(
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
  PressureMeasurement operator %(PressureMeasurement other) =>
      PressureMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  PressureMeasurement butAs(PressureUnit unit) =>
      PressureMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(PressureUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  InvertedPressureMeasurement get inverted => InvertedPressureMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<PressureMeasurement, Pressure, InvertedPressure> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<PressureMeasurement, Pressure, InvertedPressure> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<Pressure, I, InvertedPressure, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<Pressure, D, InvertedPressure, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

class InvertedPressureMeasurement
    extends f.Measurement<InvertedPressure, Pressure> {
  const InvertedPressureMeasurement(
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
  InvertedPressureMeasurement.sum(
    Iterable<f.InvertedPressureMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    InvertedPressureUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const InvertedPressureMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const InvertedPressureMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const InvertedPressureMeasurement.negativeInfinite(
      [this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const InvertedPressureMeasurement.nan([this.defaultUnit = siUnit])
      : super.nan();

  static const InvertedPressureUnit siUnit = InvertedPressureUnit._(
      name: "PressureConfig pascals⁻¹", unitMultiplier: 1.0);

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final InvertedPressureUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  InvertedPressureMeasurement withPrecision(int precision) =>
      InvertedPressureMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  InvertedPressureMeasurement operator -() => InvertedPressureMeasurement(
      -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  InvertedPressureMeasurement operator +(InvertedPressureMeasurement other) =>
      InvertedPressureMeasurement(defaultUnit.fromSI(si + other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  InvertedPressureMeasurement operator -(InvertedPressureMeasurement other) =>
      InvertedPressureMeasurement(defaultUnit.fromSI(si - other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  InvertedPressureMeasurement operator *(num multiplier) =>
      InvertedPressureMeasurement(
          magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  InvertedPressureMeasurement operator /(num divisor) =>
      InvertedPressureMeasurement(
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
  InvertedPressureMeasurement operator %(InvertedPressureMeasurement other) =>
      InvertedPressureMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  InvertedPressureMeasurement butAs(InvertedPressureUnit unit) =>
      InvertedPressureMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(InvertedPressureUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  PressureMeasurement get inverted => PressureMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<InvertedPressureMeasurement, InvertedPressure, Pressure>
      get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<InvertedPressureMeasurement, InvertedPressure, Pressure>
      get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<InvertedPressure, I, Pressure, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<InvertedPressure, D, Pressure, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin PressurePrefix {
  f.MeasurementPrefix get prefix;
  PressureUnit get pascals => PressureUnit.pascals.withPrefix(prefix);
  PressureUnit get bars => PressureUnit.bars.withPrefix(prefix);
  PressureUnit get baryes => PressureUnit.baryes.withPrefix(prefix);
  PressureUnit get standardAtmospheres =>
      PressureUnit.standardAtmospheres.withPrefix(prefix);
  PressureUnit get technicalAtmospheres =>
      PressureUnit.technicalAtmospheres.withPrefix(prefix);
  PressureUnit get mmHg => PressureUnit.mmHg.withPrefix(prefix);
  PressureUnit get torr => PressureUnit.torr.withPrefix(prefix);
  PressureUnit get psi => PressureUnit.psi.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const PressureUnit pascals = PressureUnit.pascals;

const PressureUnit bars = PressureUnit.bars;

const PressureUnit baryes = PressureUnit.baryes;

const PressureUnit standardAtmospheres = PressureUnit.standardAtmospheres;

const PressureUnit technicalAtmospheres = PressureUnit.technicalAtmospheres;

const PressureUnit mmHg = PressureUnit.mmHg;

const PressureUnit torr = PressureUnit.torr;

const PressureUnit psi = PressureUnit.psi;
