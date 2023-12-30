part of '../../fling_units.dart';

/// Interprets [Mass]es as a specific unit.
class MassInterpreter extends MeasurementInterpreter<Mass> {
  @override
  Mass call(num value, {Precision precision = Precision.max}) =>
      Mass(value, this, precision);

  /// Constructs a [MassInterpreter].
  const MassInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super._();

  /// Produces a [MassInterpreter] that is a multiple of this.
  MassInterpreter _withPrefix(MeasurementPrefix prefix) =>
      MassInterpreter._(_name, _unitMultiplier, prefix);

  /// The interpreter for grams.
  static const _grams = MassInterpreter._('g', 1e0);

  /// The interpreter for tonnes.
  static const _tonnes = MassInterpreter._('t', 1e-6);

  /// The interpreter for atomic mass units.
  static const _atomicMassUnits = MassInterpreter._('u', 6.022136651e23);

  /// The interpreter for daltons.
  static const _daltons = MassInterpreter._('Da', 6.02214076208e23);

  /// The interpreter for electron rest mass.
  static const _electronRestMass = MassInterpreter._('me', 1.09776910594e27);

  /// The interpreter for long tons.
  static const _longTons = MassInterpreter._('t', 9.842065276e-7);

  /// The interpreter for short tons.
  static const _shortTons = MassInterpreter._('tn', 1.1023e-6);

  /// The interpreter for pounds.
  static const _pounds = MassInterpreter._('lb', 0.0022046226);

  /// The interpreter for ounces.
  static const _ounces = MassInterpreter._('oz', 0.0352739619);
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

mixin MassPrefix {
  /// Applies this to a gram amount.
  MassInterpreter get grams => MassInterpreter._grams._withPrefix(_prefix);

  /// Applies this to a tonne amount.
  MassInterpreter get tonnes => MassInterpreter._tonnes._withPrefix(_prefix);

  /// The [MassInterpreter] for atomic mass units.
  MassInterpreter get atomicMassUnits =>
      MassInterpreter._atomicMassUnits._withPrefix(_prefix);

  /// Applies this to a dalton amount.
  MassInterpreter get daltons => MassInterpreter._daltons._withPrefix(_prefix);

  /// Applies this to an electron rest mass amount.
  MassInterpreter get electronRestMass =>
      MassInterpreter._electronRestMass._withPrefix(_prefix);

  /// The [MassInterpreter] for long tons.
  MassInterpreter get longTons =>
      MassInterpreter._longTons._withPrefix(_prefix);

  /// The [MassInterpreter] for short tons.
  MassInterpreter get shortTons =>
      MassInterpreter._shortTons._withPrefix(_prefix);

  /// The [MassInterpreter] for pounds.
  MassInterpreter get pounds => MassInterpreter._pounds._withPrefix(_prefix);

  /// The [MassInterpreter] for ounces.
  MassInterpreter get ounces => MassInterpreter._ounces._withPrefix(_prefix);

  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;
}

/// Represents an amount of mass.
class Mass extends Measurement<Mass> {
  /// The SI unit associated with this measurement.
  static const siUnit = grams;

  /// Zero mass.
  const Mass.zero([super.interpreter = siUnit]) : super.zero();

  /// Infinite mass.
  const Mass.infinite([super.interpreter = siUnit]) : super.infinite();

  /// Infinite negative mass.
  const Mass.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  /// NaN (Not a Number) mass.
  const Mass.nan([super.interpreter = siUnit]) : super.nan();

  /// Constructs a [Mass] representing the sum of any number of other [Mass]es.
  Mass.sum(super.parts, {super.precision}) : super.sum();

  /// Interprets this using the specified units.
  double as(MeasurementInterpreter<Mass> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitMass(this);

  /// Constructs a [Mass].
  const Mass(
    num amount,
    MeasurementInterpreter<Mass> interpreter, [
    Precision precision = Precision.max,
  ]) : super(
          amount: amount,
          interpreter: interpreter,
          precision: precision,
        );

  @override
  Mass _construct(
    num amount,
    MeasurementInterpreter<Mass>? interpreter,
    Precision precision,
  ) =>
      Mass(
        amount,
        interpreter ?? siUnit,
        precision,
      );
}
