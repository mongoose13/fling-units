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
  @Deprecated("Use 'pico.seconds' instead")
  static final TimeInterpreter picoseconds = pico.seconds;

  @Deprecated("Use 'nano.seconds' instead")
  static final TimeInterpreter nanoseconds = nano.seconds;

  @Deprecated("Use 'micro.seconds' instead")
  static final TimeInterpreter microseconds = micro.seconds;

  @Deprecated("Use 'milli.seconds' instead")
  static final TimeInterpreter milliseconds = milli.seconds;

  @Deprecated("Use 'centi.seconds' instead")
  static final TimeInterpreter centiseconds = centi.seconds;

  @Deprecated("Use 'deci.seconds' instead")
  static final TimeInterpreter deciseconds = deci.seconds;

  @Deprecated("Use 'seconds' instead")
  static final TimeInterpreter seconds = TimeInterpreter._seconds;

  @Deprecated("Use 'deka.seconds' instead")
  static final TimeInterpreter dekaseconds = deka.seconds;

  @Deprecated("Use 'hecto.seconds' instead")
  static final TimeInterpreter hectoseconds = hecto.seconds;

  @Deprecated("Use 'kilo.seconds' instead")
  static final TimeInterpreter kiloseconds = kilo.seconds;

  @Deprecated("Use 'minutes' instead")
  static final TimeInterpreter minutes = TimeInterpreter._minutes;

  @Deprecated("Use 'hours' instead")
  static final TimeInterpreter hours = TimeInterpreter._hours;

  @Deprecated("Use 'days' instead")
  static final TimeInterpreter days = TimeInterpreter._days;

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

  @Deprecated("Use 'Time.sum()' instead")
  Time.of({
    final num picoseconds = 0,
    final num nanoseconds = 0,
    final num microseconds = 0,
    final num milliseconds = 0,
    final num seconds = 0,
    final num minutes = 0,
    final num hours = 0,
    final num days = 0,
    final Precision precision = Precision.max,
  }) : this.sum([
          pico.seconds(picoseconds),
          nano.seconds(nanoseconds),
          micro.seconds(microseconds),
          milli.seconds(milliseconds),
          TimeInterpreter._seconds(seconds),
          TimeInterpreter._minutes(minutes),
          TimeInterpreter._hours(hours),
          TimeInterpreter._days(days),
        ], precision: precision);

  @Deprecated("Use 'pico.seconds()' instead")
  Time.ofPicoseconds(final double picoseconds,
      {final Precision precision = Precision.max})
      : this._(pico.seconds._from(picoseconds), precision);

  @Deprecated("Use 'nano.seconds()' instead")
  Time.ofNanoseconds(final double nanoseconds,
      {final Precision precision = Precision.max})
      : this._(nano.seconds._from(nanoseconds), precision);

  @Deprecated("Use 'micro.seconds()' instead")
  Time.ofMicroseconds(final double microseconds,
      {final Precision precision = Precision.max})
      : this._(micro.seconds._from(microseconds), precision);

  @Deprecated("Use 'milli.seconds()' instead")
  Time.ofMilliseconds(final double milliseconds,
      {final Precision precision = Precision.max})
      : this._(milli.seconds._from(milliseconds), precision);

  @Deprecated("Use 'seconds()' instead")
  Time.ofSeconds(final double seconds,
      {final Precision precision = Precision.max})
      : this._(TimeInterpreter._seconds._from(seconds), precision);

  @Deprecated("Use 'minutes()' instead")
  Time.ofMinutes(final double minutes,
      {final Precision precision = Precision.max})
      : this._(TimeInterpreter._minutes._from(minutes), precision);

  @Deprecated("Use 'hours()' instead")
  Time.ofHours(final double hours, {final Precision precision = Precision.max})
      : this._(TimeInterpreter._hours._from(hours), precision);

  @Deprecated("Use 'days()' instead")
  Time.ofDays(final double days, {final Precision precision = Precision.max})
      : this._(TimeInterpreter._days._from(days), precision);

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

  @Deprecated("Use 'as(pico.seconds)' instead")
  double get asPicoseconds => as(pico.seconds);

  @Deprecated("Use 'as(nano.seconds)' instead")
  double get asNanoseconds => as(nano.seconds);

  @Deprecated("Use 'as(micro.seconds)' instead")
  double get asMicroseconds => as(micro.seconds);

  @Deprecated("Use 'as(milli.seconds)' instead")
  double get asMilliseconds => as(milli.seconds);

  @Deprecated("Use 'as(seconds)' instead")
  double get asSeconds => as(TimeInterpreter._seconds);

  @Deprecated("Use 'as(minutes)' instead")
  double get asMinutes => as(TimeInterpreter._minutes);

  @Deprecated("Use 'as(hours)' instead")
  double get asHours => as(TimeInterpreter._hours);

  @Deprecated("Use 'as(days)' instead")
  double get asDays => as(TimeInterpreter._days);

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
