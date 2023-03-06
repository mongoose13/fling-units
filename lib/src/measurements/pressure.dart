part of fling_units;

class PressureInterpreter extends MeasurementInterpreter<Pressure> {
  @override
  Pressure call(final num value, {final Precision precision = Precision.max}) =>
      Pressure._(_from(value), precision, this);

  /// Constructs a [MassInterpreter].
  const PressureInterpreter._(
    final String name,
    final double multiplier, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(
          name,
          multiplier,
          prefix,
        );

  /// Produces a [PressureInterpreter] that is a multiple of this.
  PressureInterpreter _withPrefix(final MeasurementPrefix prefix) =>
      PressureInterpreter._(_name, _unitMultiplier, prefix);

  /// The interpreter for Pascals.
  static const _pascals = PressureInterpreter._('Pa', 1e0);

  /// The interpreter for bars.
  static const _bars = PressureInterpreter._('bar', 1e-5);

  /// The interpreter for Baryes.
  static const _baryes = PressureInterpreter._('Ba', 1e-1);

  /// The interpreter for standard atmospheres.
  static const _standardAtmospheres =
      PressureInterpreter._('atm', 9.869232667e-6);

  /// The interpreter for technical atmospheres.
  static const _technicalAtmospheres = PressureInterpreter._('at', 98.0665);

  /// The interpreter for millimeters of mercury.
  static const _mmHg = PressureInterpreter._('mmHg', 0.0075006);

  /// The interpreter for inches of mercury.
  static const _inHg = PressureInterpreter._('inHg', 3386.39);

  /// The interpreter for Torr.
  static const _torr = PressureInterpreter._('Torr', 101325 / 760);

  /// The interpreter for pound-force per square inch.
  static const _psi = PressureInterpreter._('psi', 6894.76);
}

mixin PressurePrefix {
  /// Applies this to a Pascals amount.
  PressureInterpreter get pascals =>
      PressureInterpreter._pascals._withPrefix(_prefix);

  /// Applies this to a bars amount.
  PressureInterpreter get bars =>
      PressureInterpreter._bars._withPrefix(_prefix);

  /// Applies this to a Baryes amount.
  PressureInterpreter get baryes =>
      PressureInterpreter._baryes._withPrefix(_prefix);

  /// Applies this to a standard atmospheres amount.
  PressureInterpreter get standardAtmospheres =>
      PressureInterpreter._standardAtmospheres._withPrefix(_prefix);

  /// Applies this to a technical atmospheres amount.
  PressureInterpreter get technicalAtmospheres =>
      PressureInterpreter._technicalAtmospheres._withPrefix(_prefix);

  /// Applies this to a mmHg amount.
  PressureInterpreter get mmHg =>
      PressureInterpreter._mmHg._withPrefix(_prefix);

  /// Applies this to a inHg amount.
  PressureInterpreter get inHg =>
      PressureInterpreter._inHg._withPrefix(_prefix);

  /// Applies this to a Torr amount.
  PressureInterpreter get torr =>
      PressureInterpreter._torr._withPrefix(_prefix);

  /// Applies this to a PSI amount.
  PressureInterpreter get psi => PressureInterpreter._psi._withPrefix(_prefix);

  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;
}

/// The interpreter for Pascals.
const pascals = PressureInterpreter._pascals;

/// The interpreter for bars of pressure.
const bars = PressureInterpreter._bars;

/// The interpreter for Baryes.
const baryes = PressureInterpreter._baryes;

/// The interpreter for standard atmospheres of pressure.
const standardAtmospheres = PressureInterpreter._standardAtmospheres;

/// The interpreter for technical atmospheres of pressure.
const technicalAtmospheres = PressureInterpreter._technicalAtmospheres;

/// The interpreter for millimeters of mercury.
const mmHg = PressureInterpreter._mmHg;

/// The interpreter for inches of mercury.
const inHg = PressureInterpreter._inHg;

/// The interpreter for Torr.
const torr = PressureInterpreter._torr;

/// The interpreter for pound-force per square inch.
const psi = PressureInterpreter._psi;

class Pressure extends Measurement<Pressure> {
  /// Interprets this using the specified units.
  double as(final MeasurementInterpreter<Pressure> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitPressure(this);

  /// Constructs a [Pressure].
  const Pressure._(
    final double grams,
    final Precision precision,
    final MeasurementInterpreter<Pressure>? interpreter,
  ) : super(grams, precision, interpreter);

  /// Constructs a [Pressure] representing the sum of any number of other [Pressure]s.
  Pressure.sum(final Iterable<Pressure> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  @override
  Pressure _construct(
    final double si,
    final Precision precision, [
    final MeasurementInterpreter<Pressure>? interpreter,
  ]) =>
      Pressure._(si, precision, interpreter);

  const Pressure.zero(
      [final MeasurementInterpreter<Pressure> interpreter = pascals])
      : super.zero(interpreter);

  const Pressure.infinite(
      [final MeasurementInterpreter<Pressure> interpreter = pascals])
      : super.infinite(interpreter);

  const Pressure.negativeInfinite(
      [final MeasurementInterpreter<Pressure> interpreter = pascals])
      : super.negativeInfinite(interpreter);
}
