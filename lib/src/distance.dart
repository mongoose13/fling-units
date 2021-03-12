import 'converter/distance.dart';
import 'precision.dart';

/// Represents a single dimension of distance.
class Distance implements Comparable<Distance> {
  /// The distance of size zero.
  const Distance.zero()
      : _converter = DistanceConverter.zero,
        precision = Precision.max;

  /// Infinite distance.
  const Distance.infinity()
      : _converter = DistanceConverter.infinity,
        precision = Precision.max;

  /// Infinite negative distance.
  const Distance.negativeInfinity()
      : _converter = DistanceConverter.negativeInfinity,
        precision = Precision.max;

  /// Constructs a [Distance] representing the sum of partial metric amounts.
  Distance.metric({
    final num millimeters = 0,
    final num centimeters = 0,
    final num decimeters = 0,
    final num meters = 0,
    final num dekameters = 0,
    final num hectometers = 0,
    final num kilometers = 0,
    final Precision precision = Precision.max,
  })  : _converter = DistanceConverter.metric(
          millimeters: millimeters,
          centimeters: centimeters,
          decimeters: decimeters,
          meters: meters,
          dekameters: dekameters,
          hectometers: hectometers,
          kilometers: kilometers,
        ),
        precision = precision;

  /// Constructs a [Distance] representing the sum of partial Imperial amounts.
  Distance.imperial({
    final num miles = 0,
    final num yards = 0,
    final num feet = 0,
    final num inches = 0,
    final Precision precision = Precision.max,
  })  : _converter = DistanceConverter.imperial(
          miles: miles,
          yards: yards,
          feet: feet,
          inches: inches,
        ),
        precision = precision;

  /// Constructs a [Distance] from a kilometer amount.
  Distance.kilometers(final num kilometers,
      {final Precision precision = Precision.max})
      : this.metric(kilometers: kilometers, precision: precision);

  /// Constructs a [Distance] from a hectometer amount.
  Distance.hectometers(final num hectometers,
      {final Precision precision = Precision.max})
      : this.metric(hectometers: hectometers, precision: precision);

  /// Constructs a [Distance] from a dekameter amount.
  Distance.dekameters(final num dekameters,
      {final Precision precision = Precision.max})
      : this.metric(dekameters: dekameters, precision: precision);

  /// Constructs a [Distance] from a meter amount.
  Distance.meters(final num meters, {final Precision precision = Precision.max})
      : this.metric(meters: meters, precision: precision);

  /// Constructs a [Distance] from a decimeter amount.
  Distance.decimeters(final num decimeters,
      {final Precision precision = Precision.max})
      : this.metric(decimeters: decimeters, precision: precision);

  /// Constructs a [Distance] from a centimeter amount.
  Distance.centimeters(final num centimeters,
      {final Precision precision = Precision.max})
      : this.metric(centimeters: centimeters, precision: precision);

  /// Constructs a [Distance] from a millimeter amount.
  Distance.millimeters(final num millimeters,
      {final Precision precision = Precision.max})
      : this.metric(millimeters: millimeters, precision: precision);

  /// Constructs a [Distance] from a mile amount.
  Distance.miles(final num miles, {final Precision precision = Precision.max})
      : this.imperial(miles: miles, precision: precision);

  /// Constructs a [Distance] from a yard amount.
  Distance.yards(final num yards, {final Precision precision = Precision.max})
      : this.imperial(yards: yards, precision: precision);

  /// Constructs a [Distance] from a foot amount.
  Distance.feet(final num feet, {final Precision precision = Precision.max})
      : this.imperial(feet: feet, precision: precision);

  /// Constructs a [Distance] from an inch amount.
  Distance.inches(final num inches, {final Precision precision = Precision.max})
      : this.imperial(inches: inches, precision: precision);

  /// Constructs a [Distance] from a nautical mile amount.
  Distance.nauticalMiles(final num nauticalMiles,
      {final Precision precision = Precision.max})
      : _converter = DistanceConverter.nauticalMiles(nauticalMiles),
        precision = precision;

  /// Interprets this as a number of millimeters.
  double get millimeters => precision.withPrecision(_converter.toMilli());

  /// Interprets this as a number of centimeters.
  double get centimeters => precision.withPrecision(_converter.toCenti());

  /// Interprets this as a number of decimeters.
  double get decimeters => precision.withPrecision(_converter.toDeci());

  /// Interprets this as a number of meters.
  double get meters => precision.withPrecision(_converter.base);

  /// Interprets this as a number of dekameters.
  double get dekameters => precision.withPrecision(_converter.toDeka());

  /// Interprets this as a number of hectometers.
  double get hectometers => precision.withPrecision(_converter.toHecto());

  /// Interprets this as a number of kilometers.
  double get kilometers => precision.withPrecision(_converter.toKilo());

  /// Interprets this as a number of miles.
  double get miles => precision.withPrecision(_converter.toMiles());

  /// Interprets this as a number of yards.
  double get yards => precision.withPrecision(_converter.toYards());

  /// Interprets this as a number of feet.
  double get feet => precision.withPrecision(_converter.toFeet());

  /// Interprets this as a number of inches.
  double get inches => precision.withPrecision(_converter.toInches());

  /// Interprets this as a number of nautical miles.
  double get nauticalMiles =>
      precision.withPrecision(_converter.toNauticalMiles());

  /// Interprets the specified [Distance] in kilometers.
  static double asKilometers(final Distance distance) => distance.kilometers;

  /// Interprets the specified [Distance] in hectometers.
  static double asHectometers(final Distance distance) => distance.hectometers;

  /// Interprets the specified [Distance] in dekameters.
  static double asDekameters(final Distance distance) => distance.dekameters;

  /// Interprets the specified [Distance] in meters.
  static double asMeters(final Distance distance) => distance.meters;

  /// Interprets the specified [Distance] in decimeters.
  static double asDecimeters(final Distance distance) => distance.decimeters;

  /// Interprets the specified [Distance] in centimeters.
  static double asCentimeters(final Distance distance) => distance.centimeters;

  /// Interprets the specified [Distance] in millimeters.
  static double asMillimeters(final Distance distance) => distance.millimeters;

  /// Interprets the specified [Distance] in miles.
  static double asMiles(final Distance distance) => distance.miles;

  /// Interprets the specified [Distance] in yards.
  static double asYards(final Distance distance) => distance.yards;

  /// Interprets the specified [Distance] in feet.
  static double asFeet(final Distance distance) => distance.feet;

  /// Interprets the specified [Distance] in inches.
  static double asInches(final Distance distance) => distance.inches;

  /// Interprets the specified [Distance] in nautical miles.
  static double asNauticalMiles(final Distance distance) =>
      distance.nauticalMiles;

  /// Returns `true` if this represents a negative distance.
  bool get isNegative => _converter.isNegative;

  /// Returns `true` if this represents a finite distance.
  bool get isFinite => _converter.isFinite;

  /// Returns `true` if this represents an infinite distance (either positive or
  /// negative).
  bool get isInfinite => _converter.isInfinite;

  /// Returns `true` if this distance cannot be expressed as a number.
  bool get isNaN => _converter.isNaN;

  /// Returns `true` if this is identical to another [Distance].
  ///
  /// In order to be considered identical, both the distances and the
  /// measurement precision of both instances must be identical.
  @override
  bool operator ==(final dynamic other) =>
      other is Distance &&
      other.precision == precision &&
      other.meters == meters;

  @override
  int get hashCode => meters.hashCode * precision.hashCode;

  /// Returns `true` if this represents a greater distance than the other.
  ///
  /// Precision may play a role here, e.g. the following evaluates to `true`:
  /// ```dart
  /// Distance(3.14159, precision: Precision(5)) > Distance(3.142, precision: Precision(3));
  /// ```
  bool operator >(final Distance other) => meters > other.meters;

  /// Returns `true` if this represents an equal or greater distance than the
  /// other.
  ///
  /// Precision may play a role here, e.g. the following evaluates to `true`:
  /// ```dart
  /// Distance(3.14159, precision: Precision(5)) > Distance(3.142, precision: Precision(3));
  /// ```
  bool operator >=(final Distance other) => meters >= other.meters;

  /// Returns `true` if this represents a smaller distance than the other.
  ///
  /// Precision may play a role here, e.g. the following evaluates to `false`:
  /// ```dart
  /// Distance(3.14159, precision: Precision(5)) < Distance(3.142, precision: Precision(3));
  /// ```
  bool operator <(final Distance other) => meters < other.meters;

  /// Returns `true` if this represents an equal or smaller distance than the
  /// other.
  ///
  /// Precision may play a role here, e.g. the following evaluates to `false`:
  /// ```dart
  /// Distance(3.14159, precision: Precision(5)) > Distance(3.142, precision: Precision(3));
  /// ```
  bool operator <=(final Distance other) => meters <= other.meters;

  @override
  int compareTo(final Distance other) => meters.compareTo(other.meters);

  /// Creates a [Distance] representing the opposite of this.
  Distance operator -() => Distance._(-meters, precision);

  /// Creates a [Distance] representing the sum of two others.
  ///
  /// ```dart
  /// Distance.meters(2) + Distance.zero() == Distance.meters(2)
  /// Distance.meters(2) + Distance.meters(3) == Distance.meters(5)
  /// Distance.meters(2) + Distance.meters(-3) == Distance.meters(-1)
  /// ```
  Distance operator +(final Distance other) => Distance._(
        meters + other.meters,
        Precision.add(precision, other.precision),
      );

  /// Creates a [Distance] representing the difference between two others.
  ///
  /// The resulting [Distance]'s sign will be negative if a larger [Distance] is
  /// subtracted from a smaller one.
  ///
  /// ```dart
  /// Distance.meters(3) - Distance.zero() == Distance.meters(3)
  /// Distance.meters(5) - Distance.meters(3) == Distance.meters(2)
  /// Distance.meters(3) - Distance.meters(5) == Distance.meters(-2)
  /// Distance.meters(3) - Distance.meters(-5) == Distance.meters(8)
  /// ```
  Distance operator -(final Distance other) => Distance._(
        meters - other.meters,
        Precision.add(precision, other.precision),
      );

  /// Creates a [Distance] that is a multiple of this.
  ///
  /// ```dart
  /// Distance.meters(3) * 1 == Distance.meters(3)
  /// Distance.meters(3) * 0 == Distance.zero()
  /// Distance.meters(3) * 2 == Distance.meters(6)
  /// Distance.meters(3) * -2 == Distance.meters(-6)
  /// ```
  Distance operator *(final num multiplier) =>
      Distance._(meters * multiplier, precision);

  /// Creates a [Distance] that is a fraction of this.
  ///
  /// ```dart
  /// Distance.meters(6) / 1 == Distance.meters(6)
  /// Distance.meters(6) / 2 == Distance.meters(3)
  /// Distance.meters(6) / -2 == Distance.meters(-3)
  /// Distance.meters(6) / 0 == Distance.infinity()
  /// ```
  Distance operator /(final num divisor) =>
      Distance._(meters / divisor, precision);

  @override
  String toString() => '${meters} m';

  /// Constructs a [Distance].
  Distance._(final double meters, final Precision precision)
      : _converter = DistanceConverter.meters(meters),
        precision = precision;

  /// The unit converter being used.
  final DistanceConverter _converter;

  /// The [Precision] used in all conversions.
  final Precision precision;
}