import 'converter/distance.dart';
import 'precision.dart';

/// Unit conversion system for distances.
///
/// Distances measure a single dimension. The value can be negative, indicating
/// a different direction than the one implied (e.g. "-10 meters to the East"
/// would be equivalent to "10 meters to the West") and can occur when comparing
/// smaller to larger distances (e.g. "How much further is the moon than the
/// sun?"). This is also known as "displacement".
///
/// The actual unit used is abstracted, so an instance of Distance does not
/// inherently represent any particular unit (e.g. "kilometers" or "light
/// years") but can be interpreted as a value with any distance unit you like.
/// For instance, given a Distance instance, I could choose to read it in
/// kilometers or in inches, depending on my needs.
///
/// Because unit conversions ("interpretations") require computation, it is
/// recommended to save off conversion results rather than performing the
/// computation multiple times (e.g. calling 'distance.millimeters' twice).
class Distance implements Comparable<Distance> {
  /// A null distance, representing no distance between two points.
  const Distance.zero()
      : _converter = DistanceConverter.zero,
        precision = Precision.max;

  /// Infinite distance.
  const Distance.infinity()
      : _converter = DistanceConverter.infinity,
        precision = Precision.max;

  /// Infinite distance in the opposite direction.
  const Distance.negativeInfinity()
      : _converter = DistanceConverter.negativeInfinity,
        precision = Precision.max;

  /// Construct a Distance from any number of partial metric amounts.
  ///
  /// The resulting Distance will represent the sum of the parts.
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

  /// Construct a Distance from any number of partial Imperial amounts.
  ///
  /// The resulting Distance will represent the sum of the parts.
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

  /// Construct a Distance from a kilometer amount.
  Distance.kilometers(final num kilometers,
      {final Precision precision = Precision.max})
      : this.metric(kilometers: kilometers, precision: precision);

  /// Construct a Distance from a hectometer amount.
  Distance.hectometers(final num hectometers,
      {final Precision precision = Precision.max})
      : this.metric(hectometers: hectometers, precision: precision);

  /// Construct a Distance from a dekameter amount.
  Distance.dekameters(final num dekameters,
      {final Precision precision = Precision.max})
      : this.metric(dekameters: dekameters, precision: precision);

  /// Construct a Distance from a meter amount.
  Distance.meters(final num meters, {final Precision precision = Precision.max})
      : this.metric(meters: meters, precision: precision);

  /// Construct a Distance from a decimeter amount.
  Distance.decimeters(final num decimeters,
      {final Precision precision = Precision.max})
      : this.metric(decimeters: decimeters, precision: precision);

  /// Construct a Distance from a centimeter amount.
  Distance.centimeters(final num centimeters,
      {final Precision precision = Precision.max})
      : this.metric(centimeters: centimeters, precision: precision);

  /// Construct a Distance from a millimeter amount.
  Distance.millimeters(final num millimeters,
      {final Precision precision = Precision.max})
      : this.metric(millimeters: millimeters, precision: precision);

  /// Construct a Distance from a mile amount.
  Distance.miles(final num miles, {final Precision precision = Precision.max})
      : this.imperial(miles: miles, precision: precision);

  /// Construct a Distance from a yard amount.
  Distance.yards(final num yards, {final Precision precision = Precision.max})
      : this.imperial(yards: yards, precision: precision);

  /// Construct a Distance from a foot amount.
  Distance.feet(final num feet, {final Precision precision = Precision.max})
      : this.imperial(feet: feet, precision: precision);

  /// Construct a Distance from an inch amount.
  Distance.inches(final num inches, {final Precision precision = Precision.max})
      : this.imperial(inches: inches, precision: precision);

  /// Construct a Distance from a nautical mile amount.
  Distance.nauticalMiles(final num nauticalMiles,
      {final Precision precision = Precision.max})
      : _converter = DistanceConverter.nauticalMiles(nauticalMiles),
        precision = precision;

  /// Interpret this distance as a number of millimeters.
  double get millimeters => precision.withPrecision(_converter.toMilli());

  /// Interpret this distance as a number of centimeters.
  double get centimeters => precision.withPrecision(_converter.toCenti());

  /// Interpret this distance as a number of decimeters.
  double get decimeters => precision.withPrecision(_converter.toDeci());

  /// Interpret this distance as a number of meters.
  double get meters => precision.withPrecision(_converter.base);

  /// Interpret this distance as a number of dekameters.
  double get dekameters => precision.withPrecision(_converter.toDeka());

  /// Interpret this distance as a number of hectometers.
  double get hectometers => precision.withPrecision(_converter.toHecto());

  /// Interpret this distance as a number of kilometers.
  double get kilometers => precision.withPrecision(_converter.toKilo());

  /// Interpret this distance as a number of miles.
  double get miles => precision.withPrecision(_converter.toMiles());

  /// Interpret this distance as a number of yards.
  double get yards => precision.withPrecision(_converter.toYards());

  /// Interpret this distance as a number of feet.
  double get feet => precision.withPrecision(_converter.toFeet());

  /// Interpret this distance as a number of inches.
  double get inches => precision.withPrecision(_converter.toInches());

  /// Interpret this distance as a number of nautical miles.
  double get nauticalMiles =>
      precision.withPrecision(_converter.toNauticalMiles());

  /// Interprets the specified Distance in kilometers.
  static double asKilometers(final Distance distance) => distance.kilometers;

  /// Interprets the specified Distance in hectometers.
  static double asHectometers(final Distance distance) => distance.hectometers;

  /// Interprets the specified Distance in dekameters.
  static double asDekameters(final Distance distance) => distance.dekameters;

  /// Interprets the specified Distance in meters.
  static double asMeters(final Distance distance) => distance.meters;

  /// Interprets the specified Distance in decimeters.
  static double asDecimeters(final Distance distance) => distance.decimeters;

  /// Interprets the specified Distance in centimeters.
  static double asCentimeters(final Distance distance) => distance.centimeters;

  /// Interprets the specified Distance in millimeters.
  static double asMillimeters(final Distance distance) => distance.millimeters;

  /// Interprets the specified Distance in miles.
  static double asMiles(final Distance distance) => distance.miles;

  /// Interprets the specified Distance in yards.
  static double asYards(final Distance distance) => distance.yards;

  /// Interprets the specified Distance in feet.
  static double asFeet(final Distance distance) => distance.feet;

  /// Interprets the specified Distance in inches.
  static double asInches(final Distance distance) => distance.inches;

  /// Interprets the specified Distance in nautical miles.
  static double asNauticalMiles(final Distance distance) =>
      distance.nauticalMiles;

  /// Returns whether this Distance represents a negative amount.
  bool get isNegative => _converter.isNegative;

  /// Returns whether this Distance represents a finite amount.
  bool get isFinite => _converter.isFinite;

  /// Returns whether this Distance represents an infinite amount (positive or
  /// negative).
  bool get isInfinite => _converter.isInfinite;

  /// Whether this distance is not a number.
  bool get isNaN => _converter.isNaN;

  @override
  bool operator ==(final dynamic other) =>
      other is Distance &&
      other.precision == precision &&
      other.meters == meters;

  @override
  int get hashCode => meters.hashCode * precision.hashCode;

  /// Compares this Distance to another Distance, returning true if this
  /// Distance is larger than the other Distance, or false otherwise.
  bool operator >(final Distance other) => meters > other.meters;

  /// Compares this Distance to another Distance, returning true if this
  /// Distance is larger than or equal to the other Distance, or false
  /// otherwise.
  bool operator >=(final Distance other) => meters >= other.meters;

  /// Compares this Distance to another Distance, returning true if this
  /// Distance is smaller than the other Distance, or false otherwise.
  bool operator <(final Distance other) => meters < other.meters;

  /// Compares this Distance to another Distance, returning true if this
  /// Distance is smaller than or equal to the other Distance, or false
  /// otherwise.
  bool operator <=(final Distance other) => meters <= other.meters;

  @override
  int compareTo(final Distance other) => meters.compareTo(other.meters);

  /// Creates a Distance that is the opposite of this Distance.
  ///
  /// In brief, it will have the opposite sign as this Distance.
  Distance operator -() => Distance._(-meters, precision);

  /// Add two Distances together to produce a third Distance. The resulting
  /// Distance is equivalent to the sum of the two input Distances. Negative
  /// Distances may cancel out.
  ///
  /// Distance.meters(2) + Distance.zero() == Distance.meters(2)
  /// Distance.meters(2) + Distance.meters(3) == Distance.meters(5)
  /// Distance.meters(2) + Distance.meters(-3) == Distance.meters(-1)
  Distance operator +(final Distance other) => Distance._(
        meters + other.meters,
        Precision.add(precision, other.precision),
      );

  /// Subtract two Distances to produce a third Distance. The resulting
  /// Distance is equivalent to the difference between the two input Distances.
  /// The resulting Distance's sign will be inverted if a larger Distance is
  /// subtracted from a smaller Distance.
  ///
  /// Distance.meters(3) - Distance.zero() == Distance.meters(3)
  /// Distance.meters(5) - Distance.meters(3) == Distance.meters(2)
  /// Distance.meters(3) - Distance.meters(5) == Distance.meters(-2)
  /// Distance.meters(3) - Distance.meters(-5) == Distance.meters(8)
  Distance operator -(final Distance other) => Distance._(
        meters - other.meters,
        Precision.add(precision, other.precision),
      );

  /// Multiply a Distance by a scalar to produce a new Distance that is a
  /// multiple of the original Distance. As you might expect, multiplying by a
  /// negative value inverts the resulting Distance.
  ///
  /// Distance.meters(3) * 1 == Distance.meters(3)
  /// Distance.meters(3) * 0 == Distance.zero()
  /// Distance.meters(3) * 2 == Distance.meters(6)
  /// Distance.meters(3) * -2 == Distance.meters(-6)
  Distance operator *(final num multiplier) =>
      Distance._(meters * multiplier, precision);

  /// Divide a Distance by a scalar to produce a new Distance that is a fraction
  /// of the original Distance. As you might expect, dividing by a negative
  /// value inverts the resulting Distance.
  ///
  /// Distance.meters(6) / 1 == Distance.meters(6)
  /// Distance.meters(6) / 2 == Distance.meters(3)
  /// Distance.meters(6) / -2 == Distance.meters(-3)
  /// Distance.meters(6) / 0 == Distance.infinity()
  Distance operator /(final num divisor) =>
      Distance._(meters / divisor, precision);

  @override
  String toString() => '${meters.toString()} m';

  Distance._(final double meters, final Precision precision)
      : _converter = DistanceConverter.meters(meters),
        precision = precision;

  final DistanceConverter _converter;

  /// The precision used in all conversions.
  final Precision precision;
}
