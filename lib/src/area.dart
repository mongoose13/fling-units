import 'converter/distance.dart';
import 'distance.dart';
import 'precision.dart';

/// Represents the two-dimensional derived unit of perpendicular distances.
class Area implements Comparable<Area> {
  /// Represents an area of size zero.
  Area.zero()
      : _squareMeters = 0.0,
        precision = Precision.max;

  /// Infinite area.
  Area.infinity()
      : _squareMeters = double.infinity,
        precision = Precision.max;

  /// Infinite negative area.
  Area.negativeInfinity()
      : _squareMeters = double.negativeInfinity,
        precision = Precision.max;

  /// Constructs an [Area] from component parts.
  Area(final Distance a, final Distance b)
      : _squareMeters = a.meters * b.meters,
        precision = Precision.combine(a.precision, b.precision);

  /// Constructs an [Area] from a square kilometer amount.
  Area.squareKilometers(final num squareKilometers,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromKilometers(
            DistanceConverter.fromKilometers(squareKilometers.toDouble()));

  /// Constructs an [Area] from a square meter amount.
  Area.squareMeters(final num squareMeters,
      {final this.precision = Precision.max})
      : _squareMeters = squareMeters.toDouble();

  /// Constructs an [Area] from a square centimeter amount.
  Area.squareCentimeters(final num squareCentimeters,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromCentimeters(
            DistanceConverter.fromCentimeters(squareCentimeters.toDouble()));

  /// Constructs an [Area] from a square millimeter amount.
  Area.squareMillimeters(final num squareMillimeters,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromMillimeters(
            DistanceConverter.fromMillimeters(squareMillimeters.toDouble()));

  /// Constructs an [Area] from a square mile amount.
  Area.squareMiles(final num squareMiles,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromMiles(
            DistanceConverter.fromMiles(squareMiles.toDouble()));

  /// Constructs an [Area] from a square yard amount.
  Area.squareYards(final num squareYards,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromYards(
            DistanceConverter.fromYards(squareYards.toDouble()));

  /// Constructs an [Area] from a square foot amount.
  Area.squareFeet(final num squareFeet, {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromFeet(
            DistanceConverter.fromFeet(squareFeet.toDouble()));

  /// Constructs an [Area] from a square inch amount.
  Area.squareInches(final num squareInches,
      {final this.precision = Precision.max})
      : _squareMeters = DistanceConverter.fromInches(
            DistanceConverter.fromInches(squareInches.toDouble()));

  /// Interprets this [Area] in square kilometers.
  double get squareKilometers =>
      precision.withPrecision(DistanceConverter.asKilometers(
          DistanceConverter.asKilometers(_squareMeters)));

  /// Interprets this [Area] in square meters.
  double get squareMeters => precision.withPrecision(_squareMeters);

  /// Interprets this [Area] in square centimeters.
  double get squareCentimeters =>
      precision.withPrecision(DistanceConverter.asCentimeters(
          DistanceConverter.asCentimeters(_squareMeters)));

  /// Interprets this [Area] in square millimeters.
  double get squareMillimeters =>
      precision.withPrecision(DistanceConverter.asMillimeters(
          DistanceConverter.asMillimeters(_squareMeters)));

  /// Interprets this [Area] in square miles.
  double get squareMiles => precision.withPrecision(
      DistanceConverter.asMiles(DistanceConverter.asMiles(_squareMeters)));

  /// Interprets this [Area] in square yards.
  double get squareYards => precision.withPrecision(
      DistanceConverter.asYards(DistanceConverter.asYards(_squareMeters)));

  /// Interprets this [Area] in square feet.
  double get squareFeet => precision.withPrecision(
      DistanceConverter.asFeet(DistanceConverter.asFeet(_squareMeters)));

  /// Interprets this [Area] in square inches.
  double get squareInches => precision.withPrecision(
      DistanceConverter.asInches(DistanceConverter.asInches(_squareMeters)));

  /// Interprets this [Area] using arbitrary Dimension units.
  ///
  /// Note that the nature of an area ([Distance] * [Distance]) is such that the
  /// order in which the dimension units are provided will not matter.
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

  /// Returns `true` if this represents a greater area than the other.
  bool operator >(final Area other) => squareMeters > other.squareMeters;

  /// Returns `true` if this represents an equal or greater area than the other.
  bool operator >=(final Area other) => squareMeters >= other.squareMeters;

  /// Returns `true` if this represents a smaller area than the other.
  bool operator <(final Area other) => squareMeters < other.squareMeters;

  /// Returns `true` if this represents an equal or smaller area than the other.
  bool operator <=(final Area other) => squareMeters <= other.squareMeters;

  @override
  int compareTo(final Area other) => squareMeters.compareTo(other.squareMeters);

  /// Creates an [Area] that is the opposite of this.
  Area operator -() => Area.squareMeters(-squareMeters);

  /// Creates an [Area] representing the sum of two others.
  ///
  /// ```dart
  /// Area.squareMeters(2) + Area.zero() == Area.squareMeters(2)
  /// Area.squareMeters(2) + Area.squareMeters(3) == Area.squareMeters(5)
  /// Area.squareMeters(2) + Area.squareMeters(-3) == Area.squareMeters(-1)
  /// ```
  Area operator +(final Area other) =>
      Area.squareMeters(squareMeters + other.squareMeters);

  /// Creates an [Area] representing the difference between two others.
  ///
  /// The resulting [Area]'s sign will be negative if a larger [Area] is
  /// subtracted from a smaller one.
  ///
  /// ```dart
  /// Area.squareMeters(2) - Area.zero() == Area.squareMeters(2)
  /// Area.squareMeters(2) - Area.squareMeters(3) == Area.squareMeters(-1)
  /// Area.squareMeters(2) - Area.squareMeters(-3) == Area.squareMeters(5)
  /// ```
  Area operator -(final Area other) =>
      Area.squareMeters(squareMeters - other.squareMeters);

  /// Creates an [Area] representing a multiple of this.
  ///
  /// ```dart
  /// Area.squareMeters(3) * 1 == Area.squareMeters(3)
  /// Area.squareMeters(3) * 0 == Area.zero()
  /// Area.squareMeters(3) * 2 == Area.squareMeters(6)
  /// Area.squareMeters(3) * -2 == Area.squareMeters(-6)
  /// ```
  Area operator *(final num multiplier) =>
      Area.squareMeters(squareMeters * multiplier);

  /// Creates an [Area] representing a fraction of this.
  ///
  /// ```dart
  /// Area.squareMeters(6) / 1 == Area.squareMeters(6)
  /// Area.squareMeters(6) / 0 == Area.infinity()
  /// Area.squareMeters(6) / 2 == Area.squareMeters(3)
  /// Area.squareMeters(6) / -2 == Area.squareMeters(-3)
  /// ```
  Area operator /(final num divisor) =>
      Area.squareMeters(squareMeters / divisor);

  @override
  String toString() => '${squareMeters} m^2';

  /// This area expressed as square meters.
  final double _squareMeters;

  /// The [Precision] used in all conversions.
  final Precision precision;
}