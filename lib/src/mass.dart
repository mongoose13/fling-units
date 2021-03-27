part of fling_units;

/// Interprets [Mass]es as a specific unit.
class MassInterpreter extends MeasurementInterpreter<Mass> {
  @override
  Mass call(final num value, {final Precision precision = Precision.max}) =>
      Mass._(_from(value), precision);

  /// Constructs a [MassInterpreter].
  const MassInterpreter._(final double multiplier) : super._(multiplier);

  /// Produces a [MassInterpreter] that is a multiple of this.
  MassInterpreter _withPrefix(final double multiplier) =>
      MassInterpreter._(_unitMultiplier / multiplier);

  /// The interpreter for grams.
  static const _grams = MassInterpreter._(1e0);

  /// The interpreter for tonnes.
  static const _tonnes = MassInterpreter._(1e-6);

  /// The interpreter for atomic mass units.
  static const _atomicMassUnits = MassInterpreter._(6.022136651e23);

  /// The interpreter for daltons.
  static const _daltons = MassInterpreter._(6.02214076208e23);

  /// The interpreter for electron rest mass.
  static const _electronRestMass = MassInterpreter._(1.09776910594e27);

  /// The interpreter for long tons.
  static const _longTons = MassInterpreter._(9.842065276e-7);

  /// The interpreter for short tons.
  static const _shortTons = MassInterpreter._(1.1023e-6);

  /// The interpreter for pounds.
  static const _pounds = MassInterpreter._(0.0022046226);

  /// The interpreter for ounces.
  static const _ounces = MassInterpreter._(0.0352739619);
}

/// The interpreter for grams.
const grams = MassInterpreter._grams;

/// The interpreter for tonnes.
const tonnes = MassInterpreter._tonnes;

/// The interpreter for atomic mass units.
const atomicMassUnits = MassInterpreter._atomicMassUnits;

/// The interpreter for daltons.
const daltons = MassInterpreter._daltons;

/// The interpreter for electron rest mass.
const electronRestMass = MassInterpreter._electronRestMass;

/// The interpreter for long tons.
const longTons = MassInterpreter._longTons;

/// The interpreter for short tons.
const shortTons = MassInterpreter._shortTons;

/// The interpreter for pounds.
const pounds = MassInterpreter._pounds;

/// The interpreter for ounces.
const ounces = MassInterpreter._ounces;

abstract class MassPrefix {
  /// Applies this to a gram amount.
  MassInterpreter get grams => MassInterpreter._grams._withPrefix(_multiplier);

  /// Applies this to a tonne amount.
  MassInterpreter get tonnes =>
      MassInterpreter._tonnes._withPrefix(_multiplier);

  /// The [MassInterpreter] for atomic mass units.
  MassInterpreter get atomicMassUnits =>
      MassInterpreter._atomicMassUnits._withPrefix(_multiplier);

  /// Applies this to a dalton amount.
  MassInterpreter get daltons =>
      MassInterpreter._daltons._withPrefix(_multiplier);

  /// Applies this to an electron rest mass amount.
  MassInterpreter get electronRestMass =>
      MassInterpreter._electronRestMass._withPrefix(_multiplier);

  /// The [MassInterpreter] for long tons.
  MassInterpreter get longTons =>
      MassInterpreter._longTons._withPrefix(_multiplier);

  /// The [MassInterpreter] for short tons.
  MassInterpreter get shortTons =>
      MassInterpreter._shortTons._withPrefix(_multiplier);

  /// The [MassInterpreter] for pounds.
  MassInterpreter get pounds =>
      MassInterpreter._pounds._withPrefix(_multiplier);

  /// The [MassInterpreter] for ounces.
  MassInterpreter get ounces =>
      MassInterpreter._ounces._withPrefix(_multiplier);

  /// The prefix multiplier applied to this measurement.
  double get _multiplier;
}

/// Represents an amount of mass.
class Mass extends Measurement<Mass> {
  @Deprecated("Use 'milli.grams' instead")
  static final MassInterpreter milligrams = milli.grams;

  @Deprecated("Use 'centi.grams' instead")
  static final MassInterpreter centigrams = centi.grams;

  @Deprecated("Use 'deci.grams' instead")
  static final MassInterpreter decigrams = deci.grams;

  @Deprecated("Use 'grams' instead")
  static final MassInterpreter grams = MassInterpreter._grams;

  @Deprecated("Use 'deka.grams' instead")
  static final MassInterpreter dekagrams = deka.grams;

  @Deprecated("Use 'hecto.grams' instead")
  static final MassInterpreter hectograms = hecto.grams;

  @Deprecated("Use 'kilo.grams' instead")
  static final MassInterpreter kilograms = kilo.grams;

  @Deprecated("Use 'tonnes' instead")
  static final MassInterpreter tonnes = MassInterpreter._tonnes;

  @Deprecated("Use 'atomicMassUnits' instead")
  static final MassInterpreter atomicMassUnit =
      MassInterpreter._atomicMassUnits;

  @Deprecated("Use 'longTons' instead")
  static final MassInterpreter longTons = MassInterpreter._longTons;

  @Deprecated("Use 'shortTons' instead")
  static final MassInterpreter shortTons = MassInterpreter._shortTons;

  @Deprecated("Use 'pounds' instead")
  static final MassInterpreter pounds = MassInterpreter._pounds;

  @Deprecated("Use 'ounces' instead")
  static final MassInterpreter ounces = MassInterpreter._ounces;

  /// Zero mass.
  const Mass.zero() : super.zero();

  /// Infinite mass.
  const Mass.infinite() : super.infinite();

  /// Infinite negative mass.
  const Mass.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Mass] representing the sum of any number of other [Mass]es.
  Mass.sum(final Iterable<Mass> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  @Deprecated("Use 'Mass.sum()' instead")
  Mass.ofMetric({
    final num milligrams = 0,
    final num centigrams = 0,
    final num decigrams = 0,
    final num grams = 0,
    final num dekagrams = 0,
    final num hectograms = 0,
    final num kilograms = 0,
    final Precision precision = Precision.max,
  }) : this.sum([
          milli.grams(milligrams),
          centi.grams(centigrams),
          deci.grams(decigrams),
          MassInterpreter._grams(grams),
          deka.grams(dekagrams),
          hecto.grams(hectograms),
          kilo.grams(kilograms),
        ], precision: precision);

  @Deprecated("Use 'Mass.sum()' instead")
  Mass.ofImperial({
    final num pounds = 0,
    final num ounces = 0,
    final Precision precision = Precision.max,
  }) : this.sum([
          MassInterpreter._pounds(pounds),
          MassInterpreter._ounces(ounces),
        ], precision: precision);

  @Deprecated("Use 'milli.grams()' instead")
  Mass.ofMilligrams(final num milligrams,
      {final Precision precision = Precision.max})
      : this._(milli.grams._from(milligrams), precision);

  @Deprecated("Use 'centi.grams()' instead")
  Mass.ofCentigrams(final num centigrams,
      {final Precision precision = Precision.max})
      : this._(centi.grams._from(centigrams), precision);

  @Deprecated("Use 'deci.grams()' instead")
  Mass.ofDecigrams(final num decigrams,
      {final Precision precision = Precision.max})
      : this._(deci.grams._from(decigrams), precision);

  @Deprecated("Use 'grams()' instead")
  Mass.ofGrams(final num grams, {final Precision precision = Precision.max})
      : this._(MassInterpreter._grams._from(grams), precision);

  @Deprecated("Use 'deka.grams()' instead")
  Mass.ofDekagrams(final num dekagrams,
      {final Precision precision = Precision.max})
      : this._(deka.grams._from(dekagrams), precision);

  @Deprecated("Use 'hecto.grams()' instead")
  Mass.ofHectograms(final num hectograms,
      {final Precision precision = Precision.max})
      : this._(hecto.grams._from(hectograms), precision);

  @Deprecated("Use 'kilo.grams()' instead")
  Mass.ofKilograms(final num kilograms,
      {final Precision precision = Precision.max})
      : this._(kilo.grams._from(kilograms), precision);

  @Deprecated("Use 'tonnes()' instead")
  Mass.ofTonnes(final num tonnes, {final Precision precision = Precision.max})
      : this._(MassInterpreter._tonnes._from(tonnes), precision);

  @Deprecated("Use 'ounces()' instead")
  Mass.ofOunces(final num ounces, {final Precision precision = Precision.max})
      : this._(MassInterpreter._ounces._from(ounces), precision);

  @Deprecated("Use 'pounds()' instead")
  Mass.ofPounds(final num pounds, {final Precision precision = Precision.max})
      : this._(MassInterpreter._pounds._from(pounds), precision);

  @Deprecated("Use 'shortTons()' instead")
  Mass.ofShortTons(final num shortTons,
      {final Precision precision = Precision.max})
      : this._(MassInterpreter._shortTons._from(shortTons), precision);

  @Deprecated("Use 'longTons()' instead")
  Mass.ofLongTons(final num longTons,
      {final Precision precision = Precision.max})
      : this._(MassInterpreter._longTons._from(longTons), precision);

  /// Interprets this using the specified units.
  double as(final MassInterpreter interpreter) => _preciseOf(interpreter);

  @Deprecated("Use 'as(milli.grams)' instead")
  double get asMilligrams => as(milli.grams);

  @Deprecated("Use 'as(centi.grams)' instead")
  double get asCentigrams => as(centi.grams);

  @Deprecated("Use 'as(deci.grams)' instead")
  double get asDecigrams => as(deci.grams);

  @Deprecated("Use 'as(grams)' instead")
  double get asGrams => as(MassInterpreter._grams);

  @Deprecated("Use 'as(deka.grams)' instead")
  double get asDekagrams => as(deka.grams);

  @Deprecated("Use 'as(hecto.grams)' instead")
  double get asHectograms => as(hecto.grams);

  @Deprecated("Use 'as(kilo.grams)' instead")
  double get asKilograms => as(kilo.grams);

  @Deprecated("Use 'as(tonnes)' instead")
  double get asTonnes => as(MassInterpreter._tonnes);

  @Deprecated("Use 'as(ounces)' instead")
  double get asOunces => as(MassInterpreter._ounces);

  @Deprecated("Use 'as(pounds)' instead")
  double get asPounds => as(MassInterpreter._pounds);

  @Deprecated("Use 'as(shortTons)' instead")
  double get asShortTons => as(MassInterpreter._shortTons);

  @Deprecated("Use 'as(longTons)' instead")
  double get asLongTons => as(MassInterpreter._longTons);

  @override
  String toString() => '${as(MassInterpreter._grams)} g';

  /// Constructs a [Mass].
  const Mass._(final double grams, final Precision precision)
      : super(grams, precision);

  @override
  Mass _construct(final double grams, final Precision precision) =>
      Mass._(grams, precision);
}
