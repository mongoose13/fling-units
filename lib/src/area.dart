part of fling_units;

/// Interprets [Area]s as a specific unit.
class AreaInterpreter extends MeasurementInterpreter<Area> {
  /// Constructs an [AreaInterpreter] from any two [DistanceInterpreter]s.
  AreaInterpreter(final DistanceInterpreter a, final DistanceInterpreter b)
      : this._(a._multiplier * b._multiplier);

  /// Constructs an [AreaInterpreter] that will square a basic [DistanceInterpreter].
  AreaInterpreter.squared(final DistanceInterpreter a)
      : this._(math.pow(a._multiplier, 2).toDouble());

  /// Constructs an [AreaInterpreter].
  AreaInterpreter._(final double squareMeters) : super._(squareMeters);
}

/// Represents the two-dimensional derived unit of perpendicular distances.
class Area extends Measurement<Area> {
  /// The [AreaInterpreter] for square kilometers.
  static final AreaInterpreter squareKilometers =
      AreaInterpreter.squared(Distance.kilometers);

  /// The [AreaInterpreter] for square hectometers.
  static final AreaInterpreter squareHectometers =
      AreaInterpreter.squared(Distance.hectometers);

  /// The [AreaInterpreter] for square dekameters.
  static final AreaInterpreter squareDekameters =
      AreaInterpreter.squared(Distance.dekameters);

  /// The [AreaInterpreter] for square meters.
  static final AreaInterpreter squareMeters =
      AreaInterpreter.squared(Distance.meters);

  /// The [AreaInterpreter] for square decimeters.
  static final AreaInterpreter squareDecimeters =
      AreaInterpreter.squared(Distance.decimeters);

  /// The [AreaInterpreter] for square centimeters.
  static final AreaInterpreter squareCentimeters =
      AreaInterpreter.squared(Distance.centimeters);

  /// The [AreaInterpreter] for square millimeters.
  static final AreaInterpreter squareMillimeters =
      AreaInterpreter.squared(Distance.millimeters);

  /// The [AreaInterpreter] for square miles.
  static final AreaInterpreter squareMiles =
      AreaInterpreter.squared(Distance.miles);

  /// The [AreaInterpreter] for square yards.
  static final AreaInterpreter squareYards =
      AreaInterpreter.squared(Distance.yards);

  /// The [AreaInterpreter] for square feet.
  static final AreaInterpreter squareFeet =
      AreaInterpreter.squared(Distance.feet);

  /// The [AreaInterpreter] for square inches.
  static final AreaInterpreter squareInches =
      AreaInterpreter.squared(Distance.inches);

  /// The [AreaInterpreter] for square nautical miles.
  static final AreaInterpreter squareNauticalMiles =
      AreaInterpreter.squared(Distance.nauticalMiles);

  /// Represents an area of size zero.
  const Area.zero() : super.zero();

  /// Infinite area.
  const Area.infinite() : super.infinite();

  /// Infinite negative area.
  const Area.negativeInfinite() : super.negativeInfinite();

  /// Constructs an [Area] from component parts.
  Area.of(final Distance a, final Distance b)
      : this._(a.si * b.si, Precision.combine(a._precision, b._precision));

  /// Constructs an [Area] from a square kilometer amount.
  Area.ofSquareKilometers(final num squareKilometers,
      {final Precision precision = Precision.max})
      : super(Area.squareKilometers._from(squareKilometers), precision);

  /// Constructs an [Area] from a square meter amount.
  Area.ofSquareMeters(final num squareMeters,
      {final Precision precision = Precision.max})
      : super(Area.squareMeters._from(squareMeters), precision);

  /// Constructs an [Area] from a square centimeter amount.
  Area.ofSquareCentimeters(final num squareCentimeters,
      {final Precision precision = Precision.max})
      : super(Area.squareCentimeters._from(squareCentimeters), precision);

  /// Constructs an [Area] from a square millimeter amount.
  Area.ofSquareMillimeters(final num squareMillimeters,
      {final Precision precision = Precision.max})
      : super(Area.squareMillimeters._from(squareMillimeters), precision);

  /// Constructs an [Area] from a square mile amount.
  Area.ofSquareMiles(final num squareMiles,
      {final Precision precision = Precision.max})
      : super(Area.squareMiles._from(squareMiles), precision);

  /// Constructs an [Area] from a square yard amount.
  Area.ofSquareYards(final num squareYards,
      {final Precision precision = Precision.max})
      : super(Area.squareYards._from(squareYards), precision);

  /// Constructs an [Area] from a square foot amount.
  Area.ofSquareFeet(final num squareFeet,
      {final Precision precision = Precision.max})
      : super(Area.squareFeet._from(squareFeet), precision);

  /// Constructs an [Area] from a square inch amount.
  Area.ofSquareInches(final num squareInches,
      {final Precision precision = Precision.max})
      : super(Area.squareInches._from(squareInches), precision);

  /// Interprets this in the specified units.
  double as(final DistanceInterpreter a, final DistanceInterpreter b) =>
      _precise(a._of(b._of(si)));

  /// Interprets this in square kilometers.
  double get asSquareKilometers => _precise(Area.squareKilometers._of(si));

  /// Interprets this in square meters.
  double get asSquareMeters => _precise(Area.squareMeters._of(si));

  /// Interprets this in square centimeters.
  double get asSquareCentimeters => _precise(Area.squareCentimeters._of(si));

  /// Interprets this in square millimeters.
  double get asSquareMillimeters => _precise(Area.squareMillimeters._of(si));

  /// Interprets this in square miles.
  double get asSquareMiles => _precise(Area.squareMiles._of(si));

  /// Interprets this in square yards.
  double get asSquareYards => _precise(Area.squareYards._of(si));

  /// Interprets this in square feet.
  double get asSquareFeet => _precise(Area.squareFeet._of(si));

  /// Interprets this in square inches.
  double get asSquareInches => _precise(Area.squareInches._of(si));

  @override
  String toString() => '$asSquareMeters m²';

  @override
  Area _construct(final double squareMeters, final Precision precision) =>
      Area._(squareMeters, precision);

  /// Constructs an [Area].
  Area._(final double squareMeters, final Precision precision)
      : super(squareMeters, precision);
}
