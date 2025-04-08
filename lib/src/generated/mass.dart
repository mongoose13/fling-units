// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/mass.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionMass on num {
  MassMeasurement get grams => MassUnit.grams(this);
  MassMeasurement get tonnes => MassUnit.tonnes(this);
  MassMeasurement get atomicMassUnits => MassUnit.atomicMassUnits(this);
  MassMeasurement get daltons => MassUnit.daltons(this);
  MassMeasurement get electronRestMass => MassUnit.electronRestMass(this);
  MassMeasurement get longTons => MassUnit.longTons(this);
  MassMeasurement get shortTons => MassUnit.shortTons(this);
  MassMeasurement get pounds => MassUnit.pounds(this);
  MassMeasurement get ounces => MassUnit.ounces(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class Mass extends f.Dimension {
  const Mass();
}

class InvertedMass extends f.Inverted {
  const InvertedMass();
}

class MassUnit extends f.Unit<Mass, InvertedMass> {
  const MassUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const MassUnit grams = MassUnit._(
    name: 'g',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit tonnes = MassUnit._(
    name: 't',
    unitMultiplier: 1000000.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit atomicMassUnits = MassUnit._(
    name: 'u',
    unitMultiplier: 1.660540199e-24,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit daltons = MassUnit._(
    name: 'Da',
    unitMultiplier: 1.66053e-24,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit electronRestMass = MassUnit._(
    name: 'me',
    unitMultiplier: 9.109389699e-28,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit longTons = MassUnit._(
    name: 't',
    unitMultiplier: 1016046.9088,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit shortTons = MassUnit._(
    name: 'tn',
    unitMultiplier: 907184.74,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit pounds = MassUnit._(
    name: 'lb',
    unitMultiplier: 453.59237,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const MassUnit ounces = MassUnit._(
    name: 'oz',
    unitMultiplier: 28.349523125,
    prefix: f.MeasurementPrefix.unit(),
  );

  MassMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      MassMeasurement(magnitude, this, f.Precision(precision));

  MassUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      MassUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is MassUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<MassUnit, Mass, InvertedMass> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<MassUnit, Mass, InvertedMass> get dot => f.UnitDot(this);

  @override
  InvertedMassUnit get inverted => InvertedMassUnit._(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class InvertedMassUnit extends f.InvertedUnit<InvertedMass, Mass> {
  const InvertedMassUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const InvertedMassUnit grams = InvertedMassUnit._(
    name: 'g',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedMassUnit tonnes = InvertedMassUnit._(
    name: 't',
    unitMultiplier: 1000000.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedMassUnit atomicMassUnits = InvertedMassUnit._(
    name: 'u',
    unitMultiplier: 1.660540199e-24,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedMassUnit daltons = InvertedMassUnit._(
    name: 'Da',
    unitMultiplier: 1.66053e-24,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedMassUnit electronRestMass = InvertedMassUnit._(
    name: 'me',
    unitMultiplier: 9.109389699e-28,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedMassUnit longTons = InvertedMassUnit._(
    name: 't',
    unitMultiplier: 1016046.9088,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedMassUnit shortTons = InvertedMassUnit._(
    name: 'tn',
    unitMultiplier: 907184.74,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedMassUnit pounds = InvertedMassUnit._(
    name: 'lb',
    unitMultiplier: 453.59237,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedMassUnit ounces = InvertedMassUnit._(
    name: 'oz',
    unitMultiplier: 28.349523125,
    prefix: f.MeasurementPrefix.unit(),
  );

  InvertedMassMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      InvertedMassMeasurement(magnitude, this, f.Precision(precision));

  InvertedMassUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      InvertedMassUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is InvertedMassUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<InvertedMassUnit, InvertedMass, Mass> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<InvertedMassUnit, InvertedMass, Mass> get dot => f.UnitDot(this);

  @override
  MassUnit get inverted => MassUnit._(
        name: name.substring(0, name.length - 2),
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class MassMeasurement extends f.Measurement<Mass, InvertedMass> {
  const MassMeasurement(
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
  MassMeasurement.sum(
    Iterable<f.MassMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    MassUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const MassMeasurement.zero([this.defaultUnit = siUnit]) : super.zero();

  const MassMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const MassMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const MassMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const MassUnit siUnit = grams;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final MassUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  MassMeasurement withPrecision(int precision) => MassMeasurement(
      magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  MassMeasurement operator -() =>
      MassMeasurement(-magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  MassMeasurement operator +(MassMeasurement other) => MassMeasurement(
      defaultUnit.fromSI(si + other.si),
      defaultUnit,
      f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  MassMeasurement operator -(MassMeasurement other) => MassMeasurement(
      defaultUnit.fromSI(si - other.si),
      defaultUnit,
      f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  MassMeasurement operator *(num multiplier) => MassMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  MassMeasurement operator /(num divisor) => MassMeasurement(
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
  MassMeasurement operator %(MassMeasurement other) => MassMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  MassMeasurement butAs(MassUnit unit) =>
      MassMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(MassUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  InvertedMassMeasurement get inverted => InvertedMassMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<MassMeasurement, Mass, InvertedMass> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<MassMeasurement, Mass, InvertedMass> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<Mass, I, InvertedMass, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<Mass, D, InvertedMass, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

class InvertedMassMeasurement extends f.Measurement<InvertedMass, Mass> {
  const InvertedMassMeasurement(
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
  InvertedMassMeasurement.sum(
    Iterable<f.InvertedMassMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    InvertedMassUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const InvertedMassMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const InvertedMassMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const InvertedMassMeasurement.negativeInfinite([this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const InvertedMassMeasurement.nan([this.defaultUnit = siUnit]) : super.nan();

  static const InvertedMassUnit siUnit =
      InvertedMassUnit._(name: "MassConfig grams⁻¹", unitMultiplier: 1.0);

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final InvertedMassUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  InvertedMassMeasurement withPrecision(int precision) =>
      InvertedMassMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  InvertedMassMeasurement operator -() => InvertedMassMeasurement(
      -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  InvertedMassMeasurement operator +(InvertedMassMeasurement other) =>
      InvertedMassMeasurement(defaultUnit.fromSI(si + other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  InvertedMassMeasurement operator -(InvertedMassMeasurement other) =>
      InvertedMassMeasurement(defaultUnit.fromSI(si - other.si), defaultUnit,
          f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  InvertedMassMeasurement operator *(num multiplier) => InvertedMassMeasurement(
      magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  InvertedMassMeasurement operator /(num divisor) => InvertedMassMeasurement(
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
  InvertedMassMeasurement operator %(InvertedMassMeasurement other) =>
      InvertedMassMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  InvertedMassMeasurement butAs(InvertedMassUnit unit) =>
      InvertedMassMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(InvertedMassUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  MassMeasurement get inverted => MassMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<InvertedMassMeasurement, InvertedMass, Mass> get per =>
      f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<InvertedMassMeasurement, InvertedMass, Mass> get dot =>
      f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<InvertedMass, I, Mass, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<InvertedMass, D, Mass, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin MassPrefix {
  f.MeasurementPrefix get prefix;
  MassUnit get grams => MassUnit.grams.withPrefix(prefix);
  MassUnit get tonnes => MassUnit.tonnes.withPrefix(prefix);
  MassUnit get atomicMassUnits => MassUnit.atomicMassUnits.withPrefix(prefix);
  MassUnit get daltons => MassUnit.daltons.withPrefix(prefix);
  MassUnit get electronRestMass => MassUnit.electronRestMass.withPrefix(prefix);
  MassUnit get longTons => MassUnit.longTons.withPrefix(prefix);
  MassUnit get shortTons => MassUnit.shortTons.withPrefix(prefix);
  MassUnit get pounds => MassUnit.pounds.withPrefix(prefix);
  MassUnit get ounces => MassUnit.ounces.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const MassUnit grams = MassUnit.grams;

const MassUnit tonnes = MassUnit.tonnes;

const MassUnit atomicMassUnits = MassUnit.atomicMassUnits;

const MassUnit daltons = MassUnit.daltons;

const MassUnit electronRestMass = MassUnit.electronRestMass;

const MassUnit longTons = MassUnit.longTons;

const MassUnit shortTons = MassUnit.shortTons;

const MassUnit pounds = MassUnit.pounds;

const MassUnit ounces = MassUnit.ounces;
