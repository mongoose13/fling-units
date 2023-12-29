part of '../../fling_units.dart';

class AngleInterpreter extends MeasurementInterpreter<Angle> {
  @override
  Angle call(num value, {Precision precision = Precision.max}) =>
      Angle(value, this, precision);

  /// Constructs an [AngleInterpreter].
  const AngleInterpreter._(
    String name,
    double multiplier, [
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(
          name,
          multiplier,
          prefix,
        );

  /// Produces a [MassInterpreter] that is a multiple of this.
  AngleInterpreter _withPrefix(MeasurementPrefix prefix) =>
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
  /// Constructs an [Angle] measurement.
  const Angle(
    num amount,
    MeasurementInterpreter<Angle> interpreter, [
    Precision precision = Precision.max,
  ]) : super(
          amount: amount,
          precision: precision,
          interpreter: interpreter,
        );

  /// Zero angle.
  const Angle.zero([AngleInterpreter interpreter = radians])
      : super.zero(interpreter);

  /// Infinite angle.
  const Angle.infinite([AngleInterpreter interpreter = radians])
      : super.infinite(interpreter);

  /// Infinite negative angle.
  const Angle.negativeInfinite([AngleInterpreter interpreter = radians])
      : super.negativeInfinite(interpreter);

  /// NaN (Not a Number) angle.
  const Angle.nan([MeasurementInterpreter<Angle> interpreter = radians])
      : super.nan(interpreter);

  /// A right angle.
  const Angle.right() : this(0.25, turns);

  /// A straight angle.
  const Angle.straight() : this(0.5, turns);

  /// Constructs an [Angle] representing the sum of any number of other [Angle]s.
  Angle.sum(Iterable<Angle> parts, {Precision precision = Precision.max})
      : super.sum(parts, precision: precision);

  /// Interprets this using the specified units.
  double as(MeasurementInterpreter<Angle> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitAngle(this);

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
    double amount,
    MeasurementInterpreter<Angle>? interpreter,
    Precision precision,
  ) =>
      Angle(amount, interpreter ?? radians, precision);
}
