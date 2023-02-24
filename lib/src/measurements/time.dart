part of fling_units;

/// Interprets [Time] as a specific unit.
class TimeInterpreter extends MeasurementInterpreter<Time> {
  @override
  Time call(final num value, {final Precision precision = Precision.max}) =>
      Time._(_from(value), precision, this);

  /// Constructs a [TimeInterpreter].
  const TimeInterpreter._(
    final String name,
    final double multiplier, [
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
  ]) : super._(name, multiplier, prefix);

  /// Produces a [TimeInterpreter] that is a multiple of this.
  TimeInterpreter _withPrefix(final MeasurementPrefix prefix) =>
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
abstract class TimePrefix {
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
  /// The time of duration zero.
  const Time.zero([final MeasurementInterpreter<Time> interpreter = seconds])
      : super.zero(interpreter);

  /// Infinite time.
  const Time.infinite(
      [final MeasurementInterpreter<Time> interpreter = seconds])
      : super.infinite(interpreter);

  /// Infinite negative time.
  const Time.negativeInfinite(
      [final MeasurementInterpreter<Time> interpreter = seconds])
      : super.negativeInfinite(interpreter);

  /// Constructs a [Time] representing the sum of any number of other [Time]s.
  Time.sum(final Iterable<Time> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Constructs a [Time] from a [Duration].
  Time.ofDuration(
    final Duration duration, {
    final Precision precision = Precision.max,
    final MeasurementInterpreter<Time> interpreter = TimeInterpreter._seconds,
  }) : this._(micro.seconds._from(duration.inMicroseconds), precision,
            interpreter);

  /// Constructs a [Duration] based on this.
  ///
  /// Note that any granularity below microseconds will be lost.
  Duration get asDuration => Duration(microseconds: as(micro.seconds).toInt());

  /// Interprets this using the specified units.
  double as(final MeasurementInterpreter<Time> interpreter) =>
      _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitTime(this);

  /// Constructs a [Time].
  const Time._(
    final double seconds,
    final Precision precision,
    final MeasurementInterpreter<Time> interpreter,
  ) : super(seconds, precision, interpreter);

  @override
  Time _construct(
    final double si,
    final Precision precision,
    final MeasurementInterpreter<Time> interpreter,
  ) =>
      Time._(si, precision, interpreter);
}
