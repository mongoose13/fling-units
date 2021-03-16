part of fling_units;

/// Interprets [Mass]es as a specific unit.
class MassInterpreter extends MeasurementInterpreter<Mass> {
  /// Constructs a [MassInterpreter].
  MassInterpreter._(final double multiplier) : super._(multiplier);
}

/// Represents an amount of mass.
class Mass extends Measurement<Mass> {
  /// The [MassInterpreter] for milligrams.
  static final MassInterpreter milligrams = MassInterpreter._(1e3);

  /// The [MassInterpreter] for centigrams.
  static final MassInterpreter centigrams = MassInterpreter._(1e2);

  /// The [MassInterpreter] for decigrams.
  static final MassInterpreter decigrams = MassInterpreter._(1e1);

  /// The [MassInterpreter] for grams.
  static final MassInterpreter grams = MassInterpreter._(1e0);

  /// The [MassInterpreter] for dekagrams.
  static final MassInterpreter dekagrams = MassInterpreter._(1e-1);

  /// The [MassInterpreter] for hectograms.
  static final MassInterpreter hectograms = MassInterpreter._(1e-2);

  /// The [MassInterpreter] for kilograms.
  static final MassInterpreter kilograms = MassInterpreter._(1e-3);

  /// The [MassInterpreter] for tonnes.
  static final MassInterpreter tonnes = MassInterpreter._(1e-6);

  /// The [MassInterpreter] for atomic mass units.
  static final MassInterpreter atomicMassUnit =
      MassInterpreter._(6.022136651e23);

  /// The [MassInterpreter] for long tons.
  static final MassInterpreter longTons = MassInterpreter._(9.842065276e-7);

  /// The [MassInterpreter] for short tons.
  static final MassInterpreter shortTons = MassInterpreter._(1.1023e-6);

  /// The [MassInterpreter] for pounds.
  static final MassInterpreter pounds = MassInterpreter._(0.0022046226);

  /// The [MassInterpreter] for ounces.
  static final MassInterpreter ounces = MassInterpreter._(0.0352739619);

  /// Zero mass.
  const Mass.zero() : super.zero();

  /// Infinite mass.
  const Mass.infinite() : super.infinite();

  /// Infinite negative mass.
  const Mass.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Mass] representing the sum of partial metric amounts.
  Mass.ofMetric({
    final num milligrams = 0,
    final num centigrams = 0,
    final num decigrams = 0,
    final num grams = 0,
    final num dekagrams = 0,
    final num hectograms = 0,
    final num kilograms = 0,
    final Precision precision = Precision.max,
  }) : this._(
            Mass.milligrams._from(milligrams) +
                Mass.centigrams._from(centigrams) +
                Mass.decigrams._from(decigrams) +
                Mass.grams._from(grams) +
                Mass.dekagrams._from(dekagrams) +
                Mass.hectograms._from(hectograms) +
                Mass.kilograms._from(kilograms),
            precision);

  /// Constructs a [Mass] representing the sum of partial imperial amounts.
  Mass.ofImperial({
    final num pounds = 0,
    final num ounces = 0,
    final Precision precision = Precision.max,
  }) : this._(Mass.pounds._from(pounds) + Mass.ounces._from(ounces), precision);

  /// Constructs a [Mass] from a milligram amount.
  Mass.ofMilligrams(final num milligrams,
      {final Precision precision = Precision.max})
      : this._(Mass.milligrams._from(milligrams), precision);

  /// Constructs a [Mass] from a centigram amount.
  Mass.ofCentigrams(final num centigrams,
      {final Precision precision = Precision.max})
      : this._(Mass.centigrams._from(centigrams), precision);

  /// Constructs a [Mass] from a decigram amount.
  Mass.ofDecigrams(final num decigrams,
      {final Precision precision = Precision.max})
      : this._(Mass.decigrams._from(decigrams), precision);

  /// Constructs a [Mass] from a gram amount.
  Mass.ofGrams(final num grams, {final Precision precision = Precision.max})
      : this._(Mass.grams._from(grams), precision);

  /// Constructs a [Mass] from a dekagram amount.
  Mass.ofDekagrams(final num dekagrams,
      {final Precision precision = Precision.max})
      : this._(Mass.dekagrams._from(dekagrams), precision);

  /// Constructs a [Mass] from a hectogram amount.
  Mass.ofHectograms(final num hectograms,
      {final Precision precision = Precision.max})
      : this._(Mass.hectograms._from(hectograms), precision);

  /// Constructs a [Mass] from a kilogram amount.
  Mass.ofKilograms(final num kilograms,
      {final Precision precision = Precision.max})
      : this._(Mass.kilograms._from(kilograms), precision);

  /// Constructs a [Mass] from a tonne amount.
  Mass.ofTonnes(final num tonnes, {final Precision precision = Precision.max})
      : this._(Mass.tonnes._from(tonnes), precision);

  /// Constructs a [Mass] from an ounce amount.
  Mass.ofOunces(final num ounces, {final Precision precision = Precision.max})
      : this._(Mass.ounces._from(ounces), precision);

  /// Constructs a [Mass] from a pound amount.
  Mass.ofPounds(final num pounds, {final Precision precision = Precision.max})
      : this._(Mass.pounds._from(pounds), precision);

  /// Constructs a [Mass] from a short ton amount.
  Mass.ofShortTons(final num shortTons,
      {final Precision precision = Precision.max})
      : this._(Mass.shortTons._from(shortTons), precision);

  /// Constructs a [Mass] from a long ton amount.
  Mass.ofLongTons(final num longTons,
      {final Precision precision = Precision.max})
      : this._(Mass.longTons._from(longTons), precision);

  /// Interprets this as a number of milligrams.
  double get asMilligrams => _preciseOf(milligrams);

  /// Interprets this as a number of centigrams.
  double get asCentigrams => _preciseOf(centigrams);

  /// Interprets this as a number of decigrams.
  double get asDecigrams => _preciseOf(decigrams);

  /// Interprets this as a number of grams.
  double get asGrams => _preciseOf(grams);

  /// Interprets this as a number of dekagrams.
  double get asDekagrams => _preciseOf(dekagrams);

  /// Interprets this as a number of hectograms.
  double get asHectograms => _preciseOf(hectograms);

  /// Interprets this as a number of kilograms.
  double get asKilograms => _preciseOf(kilograms);

  /// Interprets this as a number of metric tonnes.
  double get asTonnes => _preciseOf(tonnes);

  /// Interprets this as a number of ounces.
  double get asOunces => _preciseOf(ounces);

  /// Interprets this as a number of pounds.
  double get asPounds => _preciseOf(pounds);

  /// Interprets this as a number of short (US) tons.
  double get asShortTons => _preciseOf(shortTons);

  /// Interprets this as a number of long (UK) tons.
  double get asLongTons => _preciseOf(longTons);

  /// Constructs a [Mass].
  Mass._(final double grams, final Precision precision)
      : super(grams, precision);

  @override
  Mass _construct(final double grams, final Precision precision) =>
      Mass._(grams, precision);
}