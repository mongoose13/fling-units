part of fling_units;

/// Interprets [Area]s as a specific unit.
class AreaInterpreter extends MeasurementInterpreter<Area> {
  @override
  Area call(final double value, {final Precision precision = Precision.max}) =>
      Area._(_from(value), precision);

  /// Constructs an [AreaInterpreter] from any two [DistanceInterpreter]s.
  AreaInterpreter(final DistanceInterpreter a, final DistanceInterpreter b)
      : this._(a._unitMultiplier * b._unitMultiplier);

  /// Constructs an [AreaInterpreter] that will square a basic
  /// [DistanceInterpreter].
  AreaInterpreter.squared(final DistanceInterpreter a)
      : this._(math.pow(a._unitMultiplier, 2).toDouble());

  /// Constructs an [AreaInterpreter].
  const AreaInterpreter._(final double multiplier) : super._(multiplier);
}

/// Represents the two-dimensional derived unit of perpendicular distances.
class Area extends Measurement<Area> {
  /// Produces an interpreter for the square of a provided distance interpreter.
  static AreaInterpreter square(
          final DistanceInterpreter distanceInterpreter) =>
      AreaInterpreter.squared(distanceInterpreter);

  @Deprecated("Use 'Area.square(kilo.meters)' instead")
  static final AreaInterpreter squareKilometers = square(kilo.meters);

  @Deprecated("Use 'Area.square(hecto.meters)' instead")
  static final AreaInterpreter squareHectometers = square(hecto.meters);

  @Deprecated("Use 'Area.square(deka.meters)' instead")
  static final AreaInterpreter squareDekameters = square(deka.meters);

  @Deprecated("Use 'Area.square(meters)' instead")
  static final AreaInterpreter squareMeters = square(meters);

  @Deprecated("Use 'Area.square(deci.meters)' instead")
  static final AreaInterpreter squareDecimeters = square(deci.meters);

  @Deprecated("Use 'Area.square(centi.meters)' instead")
  static final AreaInterpreter squareCentimeters = square(centi.meters);

  @Deprecated("Use 'Area.square(milli.meters)' instead")
  static final AreaInterpreter squareMillimeters = square(milli.meters);

  @Deprecated("Use 'Area.square(miles)' instead")
  static final AreaInterpreter squareMiles = square(miles);

  @Deprecated("Use 'Area.square(yards)' instead")
  static final AreaInterpreter squareYards = square(yards);

  @Deprecated("Use 'Area.square(feet)' instead")
  static final AreaInterpreter squareFeet = square(feet);

  @Deprecated("Use 'Area.square(inches)' instead")
  static final AreaInterpreter squareInches = square(inches);

  @Deprecated("Use 'Area.square(nauticalMiles)' instead")
  static final AreaInterpreter squareNauticalMiles = square(nauticalMiles);

  /// Represents an area of size zero.
  const Area.zero() : super.zero();

  /// Infinite area.
  const Area.infinite() : super.infinite();

  /// Infinite negative area.
  const Area.negativeInfinite() : super.negativeInfinite();

  /// Constructs an [Area] from component parts.
  Area.of(final Distance a, final Distance b)
      : this._(a.si * b.si, Precision.combine(a._precision, b._precision));

  /// Constructs an [Area] representing the sum of any number of other [Area]s.
  Area.sum(final Iterable<Area> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  @Deprecated("Use 'Area.square(kilo.meters)()' instead")
  Area.ofSquareKilometers(final num squareKilometers,
      {final Precision precision = Precision.max})
      : this._(square(kilo.meters)._from(squareKilometers), precision);

  @Deprecated("Use 'Area.square(meters)()' instead")
  Area.ofSquareMeters(final num squareMeters,
      {final Precision precision = Precision.max})
      : this._(square(meters)._from(squareMeters), precision);

  @Deprecated("Use 'Area.square(centi.meters)()' instead")
  Area.ofSquareCentimeters(final num squareCentimeters,
      {final Precision precision = Precision.max})
      : this._(square(centi.meters)._from(squareCentimeters), precision);

  @Deprecated("Use 'Area.square(milli.meters)()' instead")
  Area.ofSquareMillimeters(final num squareMillimeters,
      {final Precision precision = Precision.max})
      : this._(square(milli.meters)._from(squareMillimeters), precision);

  @Deprecated("Use 'Area.square(miles)()' instead")
  Area.ofSquareMiles(final num squareMiles,
      {final Precision precision = Precision.max})
      : this._(square(miles)._from(squareMiles), precision);

  @Deprecated("Use 'Area.square(yards)()' instead")
  Area.ofSquareYards(final num squareYards,
      {final Precision precision = Precision.max})
      : this._(square(yards)._from(squareYards), precision);

  @Deprecated("Use 'Area.square(feet)()' instead")
  Area.ofSquareFeet(final num squareFeet,
      {final Precision precision = Precision.max})
      : this._(square(feet)._from(squareFeet), precision);

  @Deprecated("Use 'Area.square(inches)()' instead")
  Area.ofSquareInches(final num squareInches,
      {final Precision precision = Precision.max})
      : this._(square(inches)._from(squareInches), precision);

  /// Interprets this in the specified units.
  double as(final DistanceInterpreter a, final DistanceInterpreter b) =>
      _precise(a._of(b._of(si)));

  /// Interprets this in the specified area
  double asArea(final AreaInterpreter a) => _precise(a._of(si));

  @Deprecated("Use 'asArea(Area.square(kilo.meters))' instead")
  double get asSquareKilometers => asArea(square(kilo.meters));

  @Deprecated("Use 'asArea(Area.square(meters))' instead")
  double get asSquareMeters => asArea(square(meters));

  @Deprecated("Use 'asArea(Area.square(centi.meters))' instead")
  double get asSquareCentimeters => asArea(square(centi.meters));

  @Deprecated("Use 'asArea(Area.square(milli.meters))' instead")
  double get asSquareMillimeters => asArea(square(milli.meters));

  @Deprecated("Use 'asArea(Area.square(miles))' instead")
  double get asSquareMiles => asArea(square(miles));

  @Deprecated("Use 'asArea(Area.square(yards))' instead")
  double get asSquareYards => asArea(square(yards));

  @Deprecated("Use 'asArea(Area.square(feet))' instead")
  double get asSquareFeet => asArea(square(feet));

  @Deprecated("Use 'asArea(Area.square(inches))' instead")
  double get asSquareInches => asArea(square(inches));

  @override
  String toString() => '${asArea(square(meters))} m²';

  @override
  Area _construct(final double squareMeters, final Precision precision) =>
      Area._(squareMeters, precision);

  /// Constructs an [Area].
  Area._(final double squareMeters, final Precision precision)
      : super(squareMeters, precision);
}
