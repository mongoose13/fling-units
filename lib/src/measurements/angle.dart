part of fling_units;

class AngleInterpreter extends MeasurementInterpreter<Angle> {
  @override
  Angle call(final num value, {final Precision precision = Precision.max}) =>
      Angle._(_from(value), precision, this);

  /// Constructs an [AngleInterpreter].
  const AngleInterpreter._(
    final String name,
    final double multiplier, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(
          name,
          multiplier,
          prefix,
        );

  /// Produces a [MassInterpreter] that is a multiple of this.
  AngleInterpreter _withPrefix(final MeasurementPrefix prefix) =>
      AngleInterpreter._(_name, _unitMultiplier, prefix);

  /// The interpreter for turns.
  static const _turns = AngleInterpreter._('turn', 1e0);

  /// The interpreter for radians.
  static const _radians = AngleInterpreter._('rad', 2.0 * math.pi);

  /// The interpreter for gradians.
  static const _gradians = AngleInterpreter._('ᵍ', 4e2);

  /// The interpreter for degrees.
  static const _degrees = AngleInterpreter._('°', 360.0);

  /// The interpreter for arc minutes.
  static const _arcMinutes = AngleInterpreter._('′', 360.0 * 60.0);

  /// The interpreter for arc seconds.
  static const _arcSeconds = AngleInterpreter._('′', 360.0 * 3600.0);
}

/// The interpreter for turns.
const turns = AngleInterpreter._turns;

/// The interpreter for radians.
const radians = AngleInterpreter._radians;

/// The interpreter for gradians.
const gradians = AngleInterpreter._gradians;

/// The interpreter for degrees.
const degrees = AngleInterpreter._degrees;

/// The interpreter for arc minutes.
const arcMinutes = AngleInterpreter._arcMinutes;

/// The interpreter for arc seconds.
const arcSeconds = AngleInterpreter._arcSeconds;

mixin AnglePrefix {
  /// Applies this to a turn amount.
  AngleInterpreter get turns => AngleInterpreter._turns._withPrefix(_prefix);

  /// Applies this to a radian amount.
  AngleInterpreter get radians =>
      AngleInterpreter._radians._withPrefix(_prefix);

  /// Applies this to a gradian amount.
  AngleInterpreter get gradians =>
      AngleInterpreter._gradians._withPrefix(_prefix);

  /// Applies this to a degree amount.
  AngleInterpreter get degrees =>
      AngleInterpreter._degrees._withPrefix(_prefix);

  /// Applies this to an arc minute amount.
  AngleInterpreter get arcMinutes =>
      AngleInterpreter._arcMinutes._withPrefix(_prefix);

  /// Applies this to an arc minute amount.
  AngleInterpreter get arcSeconds =>
      AngleInterpreter._arcSeconds._withPrefix(_prefix);

  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;
}

/// Represents an angle.
class Angle extends Measurement<Angle> {
  const Angle._(
      double si, Precision precision, MeasurementInterpreter<Angle> interpreter)
      : super(si, precision, interpreter);

  /// Zero angle.
  const Angle.zero([final AngleInterpreter interpreter = radians])
      : super.zero(interpreter);

  /// Infinite angle.
  const Angle.infinite([final AngleInterpreter interpreter = radians])
      : super.infinite(interpreter);

  /// Infinite negative angle.
  const Angle.negativeInfinite([final AngleInterpreter interpreter = radians])
      : super.negativeInfinite(interpreter);

  /// A right angle.
  const Angle.right([final AngleInterpreter interpreter = radians])
      : super(
          0.25,
          Precision.max,
          interpreter,
        );

  /// A straight angle.
  const Angle.straight([final AngleInterpreter interpreter = radians])
      : super(
          0.5,
          Precision.max,
          interpreter,
        );

  /// Constructs an [Angle] representing the sum of any number of other [Angle]s.
  Angle.sum(final Iterable<Angle> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Interprets this using the specified units.
  double as(final MeasurementInterpreter<Angle> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitAngle(this);

  /// Whether this is an acute angle.
  bool get isAcute => si.abs() < 0.25;

  /// Whether this is an obtuse angle.
  bool get isObtuse => si.abs() > 0.25 && si.abs() < 0.5;

  /// Whether this is a right angle.
  bool get isRight => si.abs() == 0.25;

  /// Whether this is a straight angle.
  bool get isStraight => si.abs() == 0.5;

  @override
  Angle _construct(
    final double si,
    final Precision precision,
    final MeasurementInterpreter<Angle> interpreter,
  ) =>
      Angle._(si, precision, interpreter);
}
