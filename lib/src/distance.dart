part of fling_units;

/// Interprets [Distance]s as a specific unit.
class DistanceInterpreter extends MeasurementInterpreter<Distance> {
  /// Constructs a [DistanceInterpreter].
  DistanceInterpreter._(final double multiplier) : super._(multiplier);
}

/// Represents a single dimension of distance.
class Distance extends Measurement<Distance> {
  /// The [DistanceInterpreter] for kilometers.
  static final DistanceInterpreter kilometers = DistanceInterpreter._(1e-3);

  /// The [DistanceInterpreter] for hectometers.
  static final DistanceInterpreter hectometers = DistanceInterpreter._(1e-2);

  /// The [DistanceInterpreter] for dekameters.
  static final DistanceInterpreter dekameters = DistanceInterpreter._(1e-1);

  /// The [DistanceInterpreter] for meters.
  static final DistanceInterpreter meters = DistanceInterpreter._(1e0);

  /// The [DistanceInterpreter] for decimeters.
  static final DistanceInterpreter decimeters = DistanceInterpreter._(1e1);

  /// The [DistanceInterpreter] for centimeters.
  static final DistanceInterpreter centimeters = DistanceInterpreter._(1e2);

  /// The [DistanceInterpreter] for millimeters.
  static final DistanceInterpreter millimeters = DistanceInterpreter._(1e3);

  /// The [DistanceInterpreter] for miles.
  static final DistanceInterpreter miles = DistanceInterpreter._(0.0006213712);

  /// The [DistanceInterpreter] for yards.
  static final DistanceInterpreter yards = DistanceInterpreter._(1.093613);

  /// The [DistanceInterpreter] for feet.
  static final DistanceInterpreter feet = DistanceInterpreter._(3.28084);

  /// The [DistanceInterpreter] for inches.
  static final DistanceInterpreter inches = DistanceInterpreter._(39.37008);

  /// The [DistanceInterpreter] for nautical miles.
  static final DistanceInterpreter nauticalMiles =
      DistanceInterpreter._(0.000539956803456);

  /// The distance of size zero.
  const Distance.zero() : super.zero();

  /// Infinite distance.
  const Distance.infinite() : super.infinite();

  /// Infinite negative distance.
  const Distance.negativeInfinite() : super.negativeInfinite();

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
  }) : super(
          Distance.kilometers._from(kilometers) +
              Distance.hectometers._from(hectometers) +
              Distance.dekameters._from(dekameters) +
              Distance.meters._from(meters) +
              Distance.decimeters._from(decimeters) +
              Distance.centimeters._from(centimeters) +
              Distance.millimeters._from(millimeters),
          precision,
        );

  /// Constructs a [Distance] representing the sum of partial Imperial amounts.
  Distance.imperial({
    final num miles = 0,
    final num yards = 0,
    final num feet = 0,
    final num inches = 0,
    final Precision precision = Precision.max,
  }) : super(
          Distance.miles._from(miles) +
              Distance.yards._from(yards) +
              Distance.feet._from(feet) +
              Distance.inches._from(inches),
          precision,
        );

  /// Constructs a [Distance] from a kilometer amount.
  Distance.ofKilometers(final num kilometers,
      {final Precision precision = Precision.max})
      : super(Distance.kilometers._from(kilometers), precision);

  /// Constructs a [Distance] from a hectometer amount.
  Distance.ofHectometers(final num hectometers,
      {final Precision precision = Precision.max})
      : super(Distance.hectometers._from(hectometers), precision);

  /// Constructs a [Distance] from a dekameter amount.
  Distance.ofDekameters(final num dekameters,
      {final Precision precision = Precision.max})
      : super(Distance.dekameters._from(dekameters), precision);

  /// Constructs a [Distance] from a meter amount.
  Distance.ofMeters(final num meters,
      {final Precision precision = Precision.max})
      : super(Distance.meters._from(meters), precision);

  /// Constructs a [Distance] from a decimeter amount.
  Distance.ofDecimeters(final num decimeters,
      {final Precision precision = Precision.max})
      : super(Distance.decimeters._from(decimeters), precision);

  /// Constructs a [Distance] from a centimeter amount.
  Distance.ofCentimeters(final num centimeters,
      {final Precision precision = Precision.max})
      : super(Distance.centimeters._from(centimeters), precision);

  /// Constructs a [Distance] from a millimeter amount.
  Distance.ofMillimeters(final num millimeters,
      {final Precision precision = Precision.max})
      : super(Distance.millimeters._from(millimeters), precision);

  /// Constructs a [Distance] from a mile amount.
  Distance.ofMiles(final num miles, {final Precision precision = Precision.max})
      : super(Distance.miles._from(miles), precision);

  /// Constructs a [Distance] from a yard amount.
  Distance.ofYards(final num yards, {final Precision precision = Precision.max})
      : super(Distance.yards._from(yards), precision);

  /// Constructs a [Distance] from a foot amount.
  Distance.ofFeet(final num feet, {final Precision precision = Precision.max})
      : super(Distance.feet._from(feet), precision);

  /// Constructs a [Distance] from an inch amount.
  Distance.ofInches(final num inches,
      {final Precision precision = Precision.max})
      : super(Distance.inches._from(inches), precision);

  /// Constructs a [Distance] from a nautical mile amount.
  Distance.ofNauticalMiles(final num nauticalMiles,
      {final Precision precision = Precision.max})
      : super(Distance.nauticalMiles._from(nauticalMiles), precision);

  /// Interprets this as a number of millimeters.
  double get asMillimeters => _preciseOf(millimeters);

  /// Interprets this as a number of centimeters.
  double get asCentimeters => _preciseOf(centimeters);

  /// Interprets this as a number of decimeters.
  double get asDecimeters => _preciseOf(decimeters);

  /// Interprets this as a number of meters.
  double get asMeters => _preciseOf(meters);

  /// Interprets this as a number of dekameters.
  double get asDekameters => _preciseOf(dekameters);

  /// Interprets this as a number of hectometers.
  double get asHectometers => _preciseOf(hectometers);

  /// Interprets this as a number of kilometers.
  double get asKilometers => _preciseOf(kilometers);

  /// Interprets this as a number of miles.
  double get asMiles => _preciseOf(miles);

  /// Interprets this as a number of yards.
  double get asYards => _preciseOf(yards);

  /// Interprets this as a number of feet.
  double get asFeet => _preciseOf(feet);

  /// Interprets this as a number of inches.
  double get asInches => _preciseOf(inches);

  /// Interprets this as a number of nautical miles.
  double get asNauticalMiles => _preciseOf(Distance.nauticalMiles);

  @override
  String toString() => '${asMeters} m';

  @override
  Distance _construct(final double si, final Precision precision) =>
      Distance._(si, precision);

  /// Constructs a [Distance].
  Distance._(final double meters, final Precision precision)
      : super(meters, precision);
}