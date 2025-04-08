// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/temperature_change.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionTemperatureChange on num {
  TemperatureChangeMeasurement get kelvin => TemperatureChangeUnit.kelvin(this);
  TemperatureChangeMeasurement get celcius =>
      TemperatureChangeUnit.celcius(this);
  TemperatureChangeMeasurement get celsius =>
      TemperatureChangeUnit.celsius(this);
  TemperatureChangeMeasurement get fahrenheit =>
      TemperatureChangeUnit.fahrenheit(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class TemperatureChange extends f.Dimension {
  const TemperatureChange();
}

class InvertedTemperatureChange extends f.Inverted {
  const InvertedTemperatureChange();
}

class TemperatureChangeUnit
    extends f.Unit<TemperatureChange, InvertedTemperatureChange> {
  const TemperatureChangeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const TemperatureChangeUnit kelvin = TemperatureChangeUnit._(
    name: 'K',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const TemperatureChangeUnit celcius = TemperatureChangeUnit._(
    name: '°C',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const TemperatureChangeUnit celsius = TemperatureChangeUnit._(
    name: '°C',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const TemperatureChangeUnit fahrenheit = TemperatureChangeUnit._(
    name: '°F',
    unitMultiplier: 0.5555555555555556,
    prefix: f.MeasurementPrefix.unit(),
  );

  TemperatureChangeMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      TemperatureChangeMeasurement(magnitude, this, f.Precision(precision));

  TemperatureChangeUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      TemperatureChangeUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is TemperatureChangeUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<TemperatureChangeUnit, TemperatureChange, InvertedTemperatureChange>
      get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<TemperatureChangeUnit, TemperatureChange, InvertedTemperatureChange>
      get dot => f.UnitDot(this);

  @override
  InvertedTemperatureChangeUnit get inverted => InvertedTemperatureChangeUnit._(
        name: "$name⁻¹",
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

class InvertedTemperatureChangeUnit
    extends f.InvertedUnit<InvertedTemperatureChange, TemperatureChange> {
  const InvertedTemperatureChangeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const f.MeasurementPrefix.unit(),
  });

  static const InvertedTemperatureChangeUnit kelvin =
      InvertedTemperatureChangeUnit._(
    name: 'K',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedTemperatureChangeUnit celcius =
      InvertedTemperatureChangeUnit._(
    name: '°C',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedTemperatureChangeUnit celsius =
      InvertedTemperatureChangeUnit._(
    name: '°C',
    unitMultiplier: 1.0,
    prefix: f.MeasurementPrefix.unit(),
  );

  static const InvertedTemperatureChangeUnit fahrenheit =
      InvertedTemperatureChangeUnit._(
    name: '°F',
    unitMultiplier: 0.5555555555555556,
    prefix: f.MeasurementPrefix.unit(),
  );

  InvertedTemperatureChangeMeasurement call(
    num magnitude, {
    int precision = f.Precision.maximumPrecision,
  }) =>
      InvertedTemperatureChangeMeasurement(
          magnitude, this, f.Precision(precision));

  InvertedTemperatureChangeUnit withPrefix(
    f.MeasurementPrefix prefix, {
    f.Precision precision = f.Precision.max,
  }) =>
      InvertedTemperatureChangeUnit._(
        name: name,
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );

  @override
  bool operator ==(Object other) =>
      other is InvertedTemperatureChangeUnit &&
      other.unitMultiplier == unitMultiplier &&
      other.name == name;

  @override
  int get hashCode => unitMultiplier.hashCode * name.hashCode;

  /// Creates a derived unit builder with this as the numerator.
  f.UnitPer<InvertedTemperatureChangeUnit, InvertedTemperatureChange,
      TemperatureChange> get per => f.UnitPer(this);

  /// Creates a derived unit builder with this as the first unit in a product.
  f.UnitDot<InvertedTemperatureChangeUnit, InvertedTemperatureChange,
      TemperatureChange> get dot => f.UnitDot(this);

  @override
  TemperatureChangeUnit get inverted => TemperatureChangeUnit._(
        name: name.substring(0, name.length - 2),
        unitMultiplier: unitMultiplier,
        prefix: prefix,
      );
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class TemperatureChangeMeasurement
    extends f.Measurement<TemperatureChange, InvertedTemperatureChange> {
  const TemperatureChangeMeasurement(
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
  TemperatureChangeMeasurement.sum(
    Iterable<f.TemperatureChangeMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    TemperatureChangeUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const TemperatureChangeMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const TemperatureChangeMeasurement.infinite([this.defaultUnit = siUnit])
      : super.infinite();

  const TemperatureChangeMeasurement.negativeInfinite(
      [this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const TemperatureChangeMeasurement.nan([this.defaultUnit = siUnit])
      : super.nan();

  static const TemperatureChangeUnit siUnit = kelvin;

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final TemperatureChangeUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  TemperatureChangeMeasurement withPrecision(int precision) =>
      TemperatureChangeMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  TemperatureChangeMeasurement operator -() => TemperatureChangeMeasurement(
      -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  TemperatureChangeMeasurement operator +(TemperatureChangeMeasurement other) =>
      TemperatureChangeMeasurement(defaultUnit.fromSI(si + other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  TemperatureChangeMeasurement operator -(TemperatureChangeMeasurement other) =>
      TemperatureChangeMeasurement(defaultUnit.fromSI(si - other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  TemperatureChangeMeasurement operator *(num multiplier) =>
      TemperatureChangeMeasurement(
          magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  TemperatureChangeMeasurement operator /(num divisor) =>
      TemperatureChangeMeasurement(
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
  TemperatureChangeMeasurement operator %(TemperatureChangeMeasurement other) =>
      TemperatureChangeMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  TemperatureChangeMeasurement butAs(TemperatureChangeUnit unit) =>
      TemperatureChangeMeasurement(unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(TemperatureChangeUnit unit) => precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  InvertedTemperatureChangeMeasurement get inverted =>
      InvertedTemperatureChangeMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<TemperatureChangeMeasurement, TemperatureChange,
      InvertedTemperatureChange> get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<TemperatureChangeMeasurement, TemperatureChange,
      InvertedTemperatureChange> get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<TemperatureChange, I, InvertedTemperatureChange, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<TemperatureChange, D, InvertedTemperatureChange, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

class InvertedTemperatureChangeMeasurement
    extends f.Measurement<InvertedTemperatureChange, TemperatureChange> {
  const InvertedTemperatureChangeMeasurement(
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
  InvertedTemperatureChangeMeasurement.sum(
    Iterable<f.InvertedTemperatureChangeMeasurement> parts, {
    int precision = f.Precision.maximumPrecision,
    InvertedTemperatureChangeUnit? defaultUnit,
  })  : defaultUnit = defaultUnit ?? parts.first.defaultUnit,
        super(
          magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold(
              0.0, (previousValue, element) => previousValue + element.si)),
          precision: f.Precision(precision),
        );

  const InvertedTemperatureChangeMeasurement.zero([this.defaultUnit = siUnit])
      : super.zero();

  const InvertedTemperatureChangeMeasurement.infinite(
      [this.defaultUnit = siUnit])
      : super.infinite();

  const InvertedTemperatureChangeMeasurement.negativeInfinite(
      [this.defaultUnit = siUnit])
      : super.negativeInfinite();

  const InvertedTemperatureChangeMeasurement.nan([this.defaultUnit = siUnit])
      : super.nan();

  static const InvertedTemperatureChangeUnit siUnit =
      InvertedTemperatureChangeUnit._(
          name: "TemperatureChangeConfig kelvin⁻¹", unitMultiplier: 1.0);

  /// The default unit for this measurement.
  ///
  /// Operations that require a unit conversion, but are not provided one (e.g.
  /// [toString]) will make use of this unit.
  ///
  /// By default, this is set as the unit used to create the measurement. It can
  /// be changed using [butAs].
  @override
  final InvertedTemperatureChangeUnit defaultUnit;

  /// Creates an equivalent measurement with the specified precision (significant digits).
  InvertedTemperatureChangeMeasurement withPrecision(int precision) =>
      InvertedTemperatureChangeMeasurement(
          magnitude.toDouble(), defaultUnit, f.Precision(precision));

  /// Returns a measurement representing the opposite magnitude of this.
  InvertedTemperatureChangeMeasurement operator -() =>
      InvertedTemperatureChangeMeasurement(
          -magnitude.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.
  InvertedTemperatureChangeMeasurement operator +(
          InvertedTemperatureChangeMeasurement other) =>
      InvertedTemperatureChangeMeasurement(defaultUnit.fromSI(si + other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, other)));

  /// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.
  InvertedTemperatureChangeMeasurement operator -(
          InvertedTemperatureChangeMeasurement other) =>
      InvertedTemperatureChangeMeasurement(defaultUnit.fromSI(si - other.si),
          defaultUnit, f.Precision(f.Precision.addition(this, -other)));

  /// Returns a measurement equivalent to a multiple of this.
  InvertedTemperatureChangeMeasurement operator *(num multiplier) =>
      InvertedTemperatureChangeMeasurement(
          magnitude * multiplier.toDouble(), defaultUnit, precisionData);

  /// Returns a measurement equivalent to a fraction of this.
  InvertedTemperatureChangeMeasurement operator /(num divisor) =>
      InvertedTemperatureChangeMeasurement(
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
  InvertedTemperatureChangeMeasurement operator %(
          InvertedTemperatureChangeMeasurement other) =>
      InvertedTemperatureChangeMeasurement(
        defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue),
        defaultUnit,
        f.Precision.combine([precision, other.precision]),
      );

  /// Creates a new measurement equivalent to this one but with a different default unit.
  InvertedTemperatureChangeMeasurement butAs(
          InvertedTemperatureChangeUnit unit) =>
      InvertedTemperatureChangeMeasurement(
          unit.fromSI(si), unit, precisionData);

  /// Converts the default value of this measurement to the specified unit.
  double as(InvertedTemperatureChangeUnit unit) =>
      precisionData.apply(unit.fromSI(si));

  /// Creates a measurement that is the inverse of this measurement.
  ///
  /// For example:
  /// ```dart
  /// final hertz = 3.seconds.inverted; // 1/3 Hz
  /// ```
  TemperatureChangeMeasurement get inverted => TemperatureChangeMeasurement(
        magnitude,
        defaultUnit.inverted,
        precisionData,
      );

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit in the numerator and the specified unit in the denominator, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementPer<
      InvertedTemperatureChangeMeasurement,
      InvertedTemperatureChange,
      TemperatureChange> get per => f.MeasurementPer(this);

  /// Creates a derived measurement of a derived unit consisting of this measurement's
  /// unit multiplied by the specified measurement's unit, with this measurement's
  /// default value as the default value of the resulting derived unit.
  f.MeasurementDot<
      InvertedTemperatureChangeMeasurement,
      InvertedTemperatureChange,
      TemperatureChange> get dot => f.MeasurementDot(this);

  /// Creates a derived measurement representing the ratio of this and another measurement.
  f.DerivedMeasurement2<InvertedTemperatureChange, I, TemperatureChange, D>
      over<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(
              defaultValue / term.defaultValue);

  /// Creates a derived measurement representing the product of this and another measurement.
  f.DerivedMeasurement2<InvertedTemperatureChange, D, TemperatureChange, I>
      by<D extends f.Dimension, I extends f.Dimension>(
              f.Measurement<D, I> term) =>
          f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(
              defaultValue * term.defaultValue);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin TemperatureChangePrefix {
  f.MeasurementPrefix get prefix;
  TemperatureChangeUnit get kelvin =>
      TemperatureChangeUnit.kelvin.withPrefix(prefix);
  TemperatureChangeUnit get celcius =>
      TemperatureChangeUnit.celcius.withPrefix(prefix);
  TemperatureChangeUnit get celsius =>
      TemperatureChangeUnit.celsius.withPrefix(prefix);
  TemperatureChangeUnit get fahrenheit =>
      TemperatureChangeUnit.fahrenheit.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const TemperatureChangeUnit kelvin = TemperatureChangeUnit.kelvin;

const TemperatureChangeUnit celcius = TemperatureChangeUnit.celcius;

const TemperatureChangeUnit celsius = TemperatureChangeUnit.celsius;

const TemperatureChangeUnit fahrenheit = TemperatureChangeUnit.fahrenheit;
