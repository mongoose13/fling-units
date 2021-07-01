part of fling_units;

/// Interprets [Time] as a specific unit.
class TimeInterpreter extends MeasurementInterpreter<Time> {
  @override
  Time call(final num value, {final Precision precision = Precision.max}) =>
      Time._(_from(value), precision);

  /// Constructs a [TimeInterpreter].
  const TimeInterpreter._(final double multiplier) : super._(multiplier);

  /// Produces a [TimeInterpreter] that is a multiple of this.
  TimeInterpreter _withPrefix(final double multiplier) =>
      TimeInterpreter._(_unitMultiplier / multiplier);

  /// The interpreter for seconds.
  static const _seconds = TimeInterpreter._(1e0);

  /// The interpreter for minutes.
  static const _minutes = TimeInterpreter._(1.0 / 60.0);

  /// The interpreter for hours.
  static const _hours = TimeInterpreter._(1.0 / 60.0 / 60.0);

  /// The interpreter for days.
  static const _days = TimeInterpreter._(1.0 / 60.0 / 60.0 / 24.0);
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
  TimeInterpreter get seconds =>
      TimeInterpreter._seconds._withPrefix(_multiplier);

  /// The interpreter for minutes.
  TimeInterpreter get minutes =>
      TimeInterpreter._minutes._withPrefix(_multiplier);

  /// The interpreter for hours.
  TimeInterpreter get hours => TimeInterpreter._hours._withPrefix(_multiplier);

  /// The interpreter for days.
  TimeInterpreter get days => TimeInterpreter._days._withPrefix(_multiplier);

  /// The prefix multiplier applied to this measurement.
  double get _multiplier;
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
  const Time.zero() : super.zero();

  /// Infinite time.
  const Time.infinite() : super.infinite();

  /// Infinite negative time.
  const Time.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Time] representing the sum of any number of other [Time]s.
  Time.sum(final Iterable<Time> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision);

  /// Constructs a [Time] from a [Duration].
  Time.ofDuration(final Duration duration,
      {final Precision precision = Precision.max})
      : this._(micro.seconds._from(duration.inMicroseconds), precision);

  /// Constructs a [Duration] based on this.
  ///
  /// Note that any granularity below microseconds will be lost.
  Duration get asDuration => Duration(microseconds: as(micro.seconds).toInt());

  /// Interprets this using the specified units.
  double as(final TimeInterpreter interpreter) => _preciseOf(interpreter);

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitTime(this);

  @override
  String toString() => '${as(TimeInterpreter._seconds)} s';

  /// Constructs a [Time].
  const Time._(final double seconds, final Precision precision)
      : super(seconds, precision);

  @override
  Time _construct(final double seconds, final Precision precision) =>
      Time._(seconds, precision);
}
