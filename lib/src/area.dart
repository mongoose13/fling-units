import 'converter/distance.dart';
import 'distance.dart';
import 'precision.dart';

/// Represents the derived unit having two perpendicular distances.
///
/// An area can be negative, representing a difference in area. This happens
/// most commonly when comparing a smaller area to a larger one.
class Area implements Comparable<Area> {
  /// Construct a null area, having zero magnitude.
  Area.zero()
      : _squareMeters = 0.0,
        precision = Precision.max;

  /// Construct an infinite area, having infinite magnitude.
  Area.infinity()
      : _squareMeters = double.infinity,
        precision = Precision.max;

  /// Construct an infinite negative area, having infinite magnitude in the
  /// negative direction.
  Area.negativeInfinity()
      : _squareMeters = double.negativeInfinity,
        precision = Precision.max;

  /// Construct an Area from component parts.
  Area(final Distance a, final Distance b)
      : _squareMeters = a.meters * b.meters,
        precision = Precision.combine(a.precision, b.precision);

  /// Construct an Area from a square kilometer amount.
  Area.squareKilometers(final num squareKilometers,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromKilometers(
            DistanceConverter.fromKilometers(squareKilometers.toDouble()));

  /// Construct an Area from a square meter amount.
  Area.squareMeters(final num squareMeters,
      {final this.precision = Precision.max})
      : _squareMeters = squareMeters.toDouble();

  /// Construct an Area from a square centimeter amount.
  Area.squareCentimeters(final num squareCentimeters,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromCentimeters(
            DistanceConverter.fromCentimeters(squareCentimeters.toDouble()));

  /// Construct an Area from a square millimeter amount.
  Area.squareMillimeters(final num squareMillimeters,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromMillimeters(
            DistanceConverter.fromMillimeters(squareMillimeters.toDouble()));

  /// Construct an Area from a square mile amount.
  Area.squareMiles(final num squareMiles,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromMiles(
            DistanceConverter.fromMiles(squareMiles.toDouble()));

  /// Construct an Area from a square yard amount.
  Area.squareYards(final num squareYards,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromYards(
            DistanceConverter.fromYards(squareYards.toDouble()));

  /// Construct an Area from a square foot amount.
  Area.squareFeet(final num squareFeet, {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromFeet(
            DistanceConverter.fromFeet(squareFeet.toDouble()));

  /// Construct an Area from a square inch amount.
  Area.squareInches(final num squareInches,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromInches(
            DistanceConverter.fromInches(squareInches.toDouble()));

  /// Interpret this Area in square kilometers.
  double get squareKilometers =>
      precision.withPrecision(DistanceConverter.asKilometers(
          DistanceConverter.asKilometers(_squareMeters)));

  /// Interpret this Area in square meters.
  double get squareMeters => precision.withPrecision(_squareMeters);

  /// Interpret this Area in square centimeters.
  double get squareCentimeters =>
      precision.withPrecision(DistanceConverter.asCentimeters(
          DistanceConverter.asCentimeters(_squareMeters)));

  /// Interpret this Area in square millimeters.
  double get squareMillimeters =>
      precision.withPrecision(DistanceConverter.asMillimeters(
          DistanceConverter.asMillimeters(_squareMeters)));

  /// Interpret this Area in square miles.
  double get squareMiles => precision.withPrecision(
      DistanceConverter.asMiles(DistanceConverter.asMiles(_squareMeters)));

  /// Interpret this Area in square yards.
  double get squareYards => precision.withPrecision(
      DistanceConverter.asYards(DistanceConverter.asYards(_squareMeters)));

  /// Interpret this Area in square feet.
  double get squareFeet => precision.withPrecision(
      DistanceConverter.asFeet(DistanceConverter.asFeet(_squareMeters)));

  /// Interpret this Area in square inches.
  double get squareInches => precision.withPrecision(
      DistanceConverter.asInches(DistanceConverter.asInches(_squareMeters)));

  /// Interpret this Area using arbitrary Dimension units.
  ///
  /// Note that the nature of an area (Distance * Distance) is such that that
  /// the order in which the Dimension units are provided will not matter.
  double as(final double Function(Distance d) alpha,
          final double Function(Distance d) beta) =>
      precision.withPrecision(
          alpha(Distance.meters(beta(Distance.meters(_squareMeters)))));

  @override
  bool operator ==(final dynamic other) =>
      other is Area &&
      precision == other.precision &&
      squareMeters == other.squareMeters;

  @override
  int get hashCode => squareMeters.hashCode * precision.hashCode;

  /// Compares this Area to another Area, returning true if this Area is larger
  /// than the other Area, or false otherwise.
  bool operator >(final Area other) => squareMeters > other.squareMeters;

  /// Compares this Area to another Area, returning true if this Area is larger
  /// than or equal to the other Area, or false otherwise.
  bool operator >=(final Area other) => squareMeters >= other.squareMeters;

  /// Compares this Area to another Area, returning true if this Area is smaller
  /// than the other Area, or false otherwise.
  bool operator <(final Area other) => squareMeters < other.squareMeters;

  /// Compares this Area to another Area, returning true if this Area is smaller
  /// than or equal to the other Area, or false otherwise.
  bool operator <=(final Area other) => squareMeters <= other.squareMeters;

  @override
  int compareTo(final Area other) => squareMeters.compareTo(other.squareMeters);

  /// Create a second Area that has opposite sign as this Area.
  Area operator -() => Area.squareMeters(-squareMeters);

  /// Add two Areas together to produce a third Area. The resulting Area is
  /// equivalent to the sum of the two input Areas. Negative Areas may cancel
  /// out.
  ///
  /// Area.squareMeters(2) + Area.zero() == Area.squareMeters(2)
  /// Area.squareMeters(2) + Area.squareMeters(3) == Area.squareMeters(5)
  /// Area.squareMeters(2) + Area.squareMeters(-3) == Area.squareMeters(-1)
  Area operator +(final Area other) =>
      Area.squareMeters(squareMeters + other.squareMeters);

  /// Subtract another Area from this one to produce a third Area. The resulting
  /// Area is equivalent to the difference between the two input Areas and will
  /// be negative if the second Area is larger than the first.
  ///
  /// Area.squareMeters(2) - Area.zero() == Area.squareMeters(2)
  /// Area.squareMeters(2) - Area.squareMeters(3) == Area.squareMeters(-1)
  /// Area.squareMeters(2) - Area.squareMeters(-3) == Area.squareMeters(5)
  Area operator -(final Area other) =>
      Area.squareMeters(squareMeters - other.squareMeters);

  /// Multiply an Area by a scalar to produce a new Area that is a multiple of
  /// the original Area. As you might expect, multiplying by a negative value
  /// inverts the resulting Area.
  ///
  /// Area.squareMeters(3) * 1 == Area.squareMeters(3)
  /// Area.squareMeters(3) * 0 == Area.zero()
  /// Area.squareMeters(3) * 2 == Area.squareMeters(6)
  /// Area.squareMeters(3) * -2 == Area.squareMeters(-6)
  Area operator *(final num multiplier) =>
      Area.squareMeters(squareMeters * multiplier);

  /// Divide an Area by a scalar to produce a new Area that is a fraction of
  /// the original Area. As you might expect, dividing by a negative value
  /// inverts the resulting Area.
  ///
  /// Area.squareMeters(6) / 1 == Area.squareMeters(6)
  /// Area.squareMeters(6) / 0 == Area.infinity()
  /// Area.squareMeters(6) / 2 == Area.squareMeters(3)
  /// Area.squareMeters(6) / -2 == Area.squareMeters(-3)
  Area operator /(final num divisor) =>
      Area.squareMeters(squareMeters / divisor);

  @override
  String toString() => '${squareMeters} m^2';

  final double _squareMeters;
  final Precision precision;
}
