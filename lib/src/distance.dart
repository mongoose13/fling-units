part of fling_units;

/// Interprets [Distance]s as a specific unit.
class DistanceInterpreter extends MeasurementInterpreter<Distance> {
  @override
  Distance call(final num value, {final Precision precision = Precision.max}) =>
      Distance._(_from(value), precision);

  /// Constructs a [DistanceInterpreter].
  const DistanceInterpreter._(final double multiplier) : super._(multiplier);

  /// Produces a [DistanceInterpreter] that is a fraction of this.
  DistanceInterpreter _withPrefix(final double multiplier) =>
      DistanceInterpreter._(_unitMultiplier / multiplier);

  /// The interpreter for meters.
  static const _meters = DistanceInterpreter._(1e0);

  /// The interpreter for miles.
  static const _miles = DistanceInterpreter._(0.0006213712);

  /// The interpreter for yards.
  static const _yards = DistanceInterpreter._(1.093613);

  /// The interpreter for feet.
  static const _feet = DistanceInterpreter._(3.28084);

  /// The interpreter for inches.
  static const _inches = DistanceInterpreter._(39.37008);

  /// The interpreter for nautical miles.
  static const _nauticalMiles = DistanceInterpreter._(0.000539956803456);
}

/// The interpreter for meters.
const meters = DistanceInterpreter._meters;

/// The interpreter for miles.
const miles = DistanceInterpreter._miles;

/// The interpreter for yards.
const yards = DistanceInterpreter._yards;

/// The interpreter for feet.
const feet = DistanceInterpreter._feet;

/// The interpreter for inches.
const inches = DistanceInterpreter._inches;

/// The interpreter for nautical miles.
const nauticalMiles = DistanceInterpreter._nauticalMiles;

/// Applies a prefix to various distance units.
abstract class DistancePrefix {
  /// Applies this to a meter amount.
  DistanceInterpreter get meters =>
      DistanceInterpreter._meters._withPrefix(_multiplier);

  /// Applies this to a mile amount.
  DistanceInterpreter get miles =>
      DistanceInterpreter._miles._withPrefix(_multiplier);

  /// Applies this to a yard amount.
  DistanceInterpreter get yards =>
      DistanceInterpreter._yards._withPrefix(_multiplier);

  /// Applies this to a foot amount.
  DistanceInterpreter get feet =>
      DistanceInterpreter._feet._withPrefix(_multiplier);

  /// Applies this to an inch amount.
  DistanceInterpreter get inches =>
      DistanceInterpreter._inches._withPrefix(_multiplier);

  /// Applies this to a nautical mile amount.
  DistanceInterpreter get nauticalMiles =>
      DistanceInterpreter._nauticalMiles._withPrefix(_multiplier);

  /// The prefix multiplier applied to this measurement.
  double get _multiplier;
}

/// Represents a single dimension of distance.
class Distance extends Measurement<Distance> {
  @Deprecated("Use 'kilo.meters' instead")
  static final DistanceInterpreter kilometers = kilo.meters;

  @Deprecated("Use 'hecto.meters' instead")
  static final DistanceInterpreter hectometers = hecto.meters;

  @Deprecated("Use 'deka.meters' instead")
  static final DistanceInterpreter dekameters = deka.meters;

  @Deprecated("Use 'meters' instead")
  static final DistanceInterpreter meters = DistanceInterpreter._meters;

  @Deprecated("Use 'deci.meters' instead")
  static final DistanceInterpreter decimeters = deci.meters;

  @Deprecated("Use 'centi.meters' instead")
  static final DistanceInterpreter centimeters = centi.meters;

  @Deprecated("Use 'milli.meters' instead")
  static final DistanceInterpreter millimeters = milli.meters;

  @Deprecated("Use 'micro.meters' instead")
  static final DistanceInterpreter micrometers = micro.meters;

  @Deprecated("Use 'nano.meters' instead")
  static final DistanceInterpreter nanometers = nano.meters;

  @Deprecated("Use 'pico.meters' instead")
  static final DistanceInterpreter picometers = pico.meters;

  @Deprecated("Use 'miles' instead")
  static final DistanceInterpreter miles = DistanceInterpreter._miles;

  @Deprecated("Use 'yards' instead")
  static final DistanceInterpreter yards = DistanceInterpreter._yards;

  @Deprecated("Use 'feet' instead")
  static final DistanceInterpreter feet = DistanceInterpreter._feet;

  @Deprecated("Use 'inches' instead")
  static final DistanceInterpreter inches = DistanceInterpreter._inches;

  @Deprecated("Use 'nauticalMiles' instead")
  static final DistanceInterpreter nauticalMiles =
      DistanceInterpreter._nauticalMiles;

  /// The distance of size zero.
  const Distance.zero() : super.zero();

  /// Infinite distance.
  const Distance.infinite() : super.infinite();

  /// Infinite negative distance.
  const Distance.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Distance] representing the sum of any number of other
  /// [Distance]s.
  Distance.sum(final Iterable<Distance> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  @Deprecated("Use 'Distance.sum()' instead")
  Distance.ofMetric({
    final num picometers = 0,
    final num nanometers = 0,
    final num micrometers = 0,
    final num millimeters = 0,
    final num centimeters = 0,
    final num decimeters = 0,
    final num meters = 0,
    final num dekameters = 0,
    final num hectometers = 0,
    final num kilometers = 0,
    final Precision precision = Precision.max,
  }) : this.sum([
          kilo.meters(kilometers),
          hecto.meters(hectometers),
          deka.meters(dekameters),
          DistanceInterpreter._meters(meters),
          deci.meters(decimeters),
          centi.meters(centimeters),
          milli.meters(millimeters),
          micro.meters(micrometers),
          nano.meters(nanometers),
          pico.meters(picometers),
        ], precision: precision);

  @Deprecated("Use 'Distance.sum()' instead")
  Distance.ofImperial({
    final num miles = 0,
    final num yards = 0,
    final num feet = 0,
    final num inches = 0,
    final Precision precision = Precision.max,
  }) : this.sum([
          DistanceInterpreter._miles(miles),
          DistanceInterpreter._yards(yards),
          DistanceInterpreter._feet(feet),
          DistanceInterpreter._inches(inches),
        ], precision: precision);

  @Deprecated("Use 'kilo.meters()' instead")
  Distance.ofKilometers(final num kilometers,
      {final Precision precision = Precision.max})
      : super(kilo.meters._from(kilometers), precision);

  @Deprecated("Use 'hecto.meters()' instead")
  Distance.ofHectometers(final num hectometers,
      {final Precision precision = Precision.max})
      : super(hecto.meters._from(hectometers), precision);

  @Deprecated("Use 'deka.meters()' instead")
  Distance.ofDekameters(final num dekameters,
      {final Precision precision = Precision.max})
      : super(deka.meters._from(dekameters), precision);

  @Deprecated("Use 'meters()' instead")
  Distance.ofMeters(final num meters,
      {final Precision precision = Precision.max})
      : super(DistanceInterpreter._meters._from(meters), precision);

  @Deprecated("Use 'deci.meters()' instead")
  Distance.ofDecimeters(final num decimeters,
      {final Precision precision = Precision.max})
      : super(deci.meters._from(decimeters), precision);

  @Deprecated("Use 'centi.meters()' instead")
  Distance.ofCentimeters(final num centimeters,
      {final Precision precision = Precision.max})
      : super(centi.meters._from(centimeters), precision);

  @Deprecated("Use 'milli.meters()' instead")
  Distance.ofMillimeters(final num millimeters,
      {final Precision precision = Precision.max})
      : super(milli.meters._from(millimeters), precision);

  @Deprecated("Use 'micro.meters()' instead")
  Distance.ofMicrometers(final num micrometers,
      {final Precision precision = Precision.max})
      : super(micro.meters._from(micrometers), precision);

  @Deprecated("Use 'nano.meters()' instead")
  Distance.ofNanometers(final num nanometers,
      {final Precision precision = Precision.max})
      : super(nano.meters._from(nanometers), precision);

  @Deprecated("Use 'pico.meters()' instead")
  Distance.ofPicometers(final num picometers,
      {final Precision precision = Precision.max})
      : super(pico.meters._from(picometers), precision);

  @Deprecated("Use 'miles()' instead")
  Distance.ofMiles(final num miles, {final Precision precision = Precision.max})
      : super(DistanceInterpreter._miles._from(miles), precision);

  @Deprecated("Use 'yards()' instead")
  Distance.ofYards(final num yards, {final Precision precision = Precision.max})
      : super(DistanceInterpreter._yards._from(yards), precision);

  @Deprecated("Use 'feet()' instead")
  Distance.ofFeet(final num feet, {final Precision precision = Precision.max})
      : super(DistanceInterpreter._feet._from(feet), precision);

  @Deprecated("Use 'inches()' instead")
  Distance.ofInches(final num inches,
      {final Precision precision = Precision.max})
      : super(DistanceInterpreter._inches._from(inches), precision);

  @Deprecated("Use 'nauticalMiles()' instead")
  Distance.ofNauticalMiles(final num nauticalMiles,
      {final Precision precision = Precision.max})
      : super(
            DistanceInterpreter._nauticalMiles._from(nauticalMiles), precision);

  /// Interprets this using the specified units.
  double as(final DistanceInterpreter interpreter) => _preciseOf(interpreter);

  @Deprecated("Use 'as(pico.meters)' instead")
  double get asPicometers => as(pico.meters);

  @Deprecated("Use 'as(nano.meters)' instead")
  double get asNanometers => as(nano.meters);

  @Deprecated("Use 'as(micro.meters)' instead")
  double get asMicrometers => as(micro.meters);

  @Deprecated("Use 'as(milli.meters)' instead")
  double get asMillimeters => as(milli.meters);

  @Deprecated("Use 'as(centi.meters)' instead")
  double get asCentimeters => as(centi.meters);

  @Deprecated("Use 'as(deci.meters)' instead")
  double get asDecimeters => as(deci.meters);

  @Deprecated("Use 'as(meters)' instead")
  double get asMeters => as(meters);

  @Deprecated("Use 'as(deka.meters)' instead")
  double get asDekameters => as(deka.meters);

  @Deprecated("Use 'as(hecto.meters)' instead")
  double get asHectometers => as(hecto.meters);

  @Deprecated("Use 'as(kilo.meters)' instead")
  double get asKilometers => as(kilo.meters);

  @Deprecated("Use 'as(miles)' instead")
  double get asMiles => as(miles);

  @Deprecated("Use 'as(yards)' instead")
  double get asYards => as(yards);

  @Deprecated("Use 'as(feet)' instead")
  double get asFeet => as(feet);

  @Deprecated("Use 'as(inches)' instead")
  double get asInches => as(inches);

  @Deprecated("Use 'as(nauticalMiles)' instead")
  double get asNauticalMiles => as(nauticalMiles);

  @override
  String toString() => '${as(DistanceInterpreter._meters)} m';

  @override
  Distance _construct(final double si, final Precision precision) =>
      Distance._(si, precision);

  /// Constructs a [Distance].
  const Distance._(final double meters, final Precision precision)
      : super(meters, precision);
}
