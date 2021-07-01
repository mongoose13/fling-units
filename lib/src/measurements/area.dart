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

  /// Interprets this in the specified units.
  double as(final DistanceInterpreter a, final DistanceInterpreter b) =>
      _precise(a._of(b._of(si)));

  /// Interprets this in the specified area
  double asArea(final AreaInterpreter a) => _precise(a._of(si));

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitArea(this);

  @override
  String toString() => '${asArea(square(meters))} m²';

  @override
  Area _construct(final double squareMeters, final Precision precision) =>
      Area._(squareMeters, precision);

  /// Constructs an [Area].
  Area._(final double squareMeters, final Precision precision)
      : super(squareMeters, precision);
}
