part of '../../fling_units.dart';

/// Interprets [Frequency]ies as a specific unit.
class FrequencyInterpreter extends MeasurementInterpreter<Frequency> {
  @override
  Frequency call(num value, {Precision precision = Precision.max}) =>
      Frequency(value, this, precision);

  /// Constructs a [FrequencyInterpreter].
  const FrequencyInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super._();

  /// Produces an equivalent [FrequencyInterpreter] but with an added multiplier prefix.
  FrequencyInterpreter _withPrefix(MeasurementPrefix prefix) =>
      FrequencyInterpreter._(_name, _unitMultiplier, prefix);

  /// The interpreter for hertz.
  static const _hertz = FrequencyInterpreter._('Hz', 1e0);
}

/// The interpreter for hertz.
const hertz = FrequencyInterpreter._hertz;

/// Applies a prefix to the frequency units.
mixin FrequencyPrefix {
  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;

  /// Applies this to a hertz amount.
  FrequencyInterpreter get hertz =>
      FrequencyInterpreter._hertz._withPrefix(_prefix);
}

/// Represents a single dimension of frequency.
class Frequency extends Measurement<Frequency> {
  /// The SI unit associated with this measurement.
  static const siUnit = hertz;

  /// Zero frequency.
  const Frequency.zero([super.interpreter = siUnit]) : super.zero();

  /// Infinite frequency.
  const Frequency.infinite([super.interpreter = siUnit]) : super.infinite();

  /// Infinite negative frequency.
  const Frequency.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  /// NaN (Not a Number) frequency.
  const Frequency.nan([super.interpreter = siUnit]) : super.nan();

  /// Constructs a [Frequency] representing the sum of any number of other
  /// [Frequency]ies.
  Frequency.sum(super.parts, {super.precision}) : super.sum();

  /// Interprets this using the specified units.
  double as(MeasurementInterpreter<Frequency> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(MeasurementVisitor visitor) =>
      visitor.visitFrequency(this);

  @override
  Frequency _construct(
    double amount,
    MeasurementInterpreter<Frequency>? interpreter,
    Precision precision,
  ) =>
      Frequency(amount, interpreter ?? siUnit, precision);

  /// Constructs a [Frequency].
  const Frequency(
    num amount,
    MeasurementInterpreter<Frequency> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: amount, precision: precision, interpreter: interpreter);
}
