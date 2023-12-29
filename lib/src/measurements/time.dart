part of '../../fling_units.dart';

/// Interprets [Time] as a specific unit.
class TimeInterpreter extends MeasurementInterpreter<Time> {
  @override
  Time call(num value, {Precision precision = Precision.max}) =>
      Time(value, this, precision);

  /// Constructs a [TimeInterpreter].
  const TimeInterpreter._(
    String name,
    double multiplier, [
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, multiplier, prefix);

  /// Produces a [TimeInterpreter] that is a multiple of this.
  TimeInterpreter _withPrefix(MeasurementPrefix prefix) =>
      TimeInterpreter._(_name, _unitMultiplier, prefix);

  /// The interpreter for seconds.
  static const _seconds = TimeInterpreter._('s', 1e0);

  /// The interpreter for minutes.
  static const _minutes = TimeInterpreter._('min', 1.0 / 60.0);

  /// The interpreter for hours.
  static const _hours = TimeInterpreter._('h', 1.0 / 60.0 / 60.0);

  /// The interpreter for days.
  static const _days = TimeInterpreter._('d', 1.0 / 60.0 / 60.0 / 24.0);
}

/// The interpreter for seconds.
const seconds = TimeInterpreter._seconds;

/// The interpreter for minutes.
const minutes = TimeInterpreter._minutes;

/// The interpreter for hours.
const hours = TimeInterpreter._hours;

/// The interpreter for days.
const days = TimeInterpreter._days;

/// Applies a prefix to various time units.
mixin TimePrefix {
  /// The interpreter for seconds.
  TimeInterpreter get seconds => TimeInterpreter._seconds._withPrefix(_prefix);

  /// The interpreter for minutes.
  TimeInterpreter get minutes => TimeInterpreter._minutes._withPrefix(_prefix);

  /// The interpreter for hours.
  TimeInterpreter get hours => TimeInterpreter._hours._withPrefix(_prefix);

  /// The interpreter for days.
  TimeInterpreter get days => TimeInterpreter._days._withPrefix(_prefix);

  /// The prefix multiplier applied to this measurement.
  MeasurementPrefix get _prefix;
}

/// Represents a duration of time.
///
/// This is fairly similar to the built-in [Duration] class, but brings
/// additional granularity to the measurement. [Duration], for instance,
/// operates only on integer values, with the smallest granularity being
/// microseconds.
///
/// It is possible to convert to this class from [Duration] instances, or to
/// create [Duration] instances from instances of this, so long as lossy
/// conversions are acceptable, via the [Time.ofDuration] and [Time.asDuration]
/// methods.
class Time extends Measurement<Time> {
  /// The SI unit associated with this measurement.
  static const siUnit = seconds;

  /// The time of duration zero.
  const Time.zero([MeasurementInterpreter<Time> interpreter = siUnit])
      : super.zero(interpreter);

  /// Infinite time.
  const Time.infinite([MeasurementInterpreter<Time> interpreter = siUnit])
      : super.infinite(interpreter);

  /// Infinite negative time.
  const Time.negativeInfinite(
      [MeasurementInterpreter<Time> interpreter = siUnit])
      : super.negativeInfinite(interpreter);

  /// NaN (Not a Number) time.
  const Time.nan([MeasurementInterpreter<Time> interpreter = siUnit])
      : super.nan(interpreter);

  /// Constructs a [Time] representing the sum of any number of other [Time]s.
  Time.sum(Iterable<Time> parts, {Precision precision = Precision.max})
      : super.sum(parts, precision: precision);

  /// Constructs a [Time] from a [Duration].
  Time.ofDuration(
    Duration duration, {
    Precision precision = Precision.max,
    MeasurementInterpreter<Time> interpreter = TimeInterpreter._seconds,
  }) : this(duration.inMicroseconds, interpreter, precision);

  /// Constructs a [Duration] based on this.
  ///
  /// Note that any granularity below microseconds will be lost.
  Duration get asDuration => Duration(microseconds: as(micro.seconds).toInt());

  /// Interprets this using the specified units.
  double as(MeasurementInterpreter<Time> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitTime(this);

  /// Constructs a [Time].
  const Time(
    num seconds,
    MeasurementInterpreter<Time> interpreter, [
    Precision precision = Precision.max,
  ]) : super(
          amount: seconds,
          precision: precision,
          interpreter: interpreter,
        );

  @override
  Time _construct(
    double amount,
    MeasurementInterpreter<Time>? interpreter,
    Precision precision,
  ) =>
      Time(
        amount,
        interpreter ?? siUnit,
        precision,
      );
}
