part of fling_units;

/// Interprets [Time] as a specific unit.
class TimeInterpreter extends MeasurementInterpreter<Time> {
  /// Constructs a [TimeInterpreter].
  TimeInterpreter._(final double multiplier) : super._(multiplier);
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
  /// The [TimeInterpreter] for picoseconds.
  static final TimeInterpreter picoseconds = TimeInterpreter._(1e12);

  /// The [TimeInterpreter] for nanoseconds.
  static final TimeInterpreter nanoseconds = TimeInterpreter._(1e9);

  /// The [TimeInterpreter] for microseconds.
  static final TimeInterpreter microseconds = TimeInterpreter._(1e6);

  /// The [TimeInterpreter] for milliseconds.
  static final TimeInterpreter milliseconds = TimeInterpreter._(1e3);

  /// The [TimeInterpreter] for centiseconds.
  static final TimeInterpreter centiseconds = TimeInterpreter._(1e2);

  /// The [TimeInterpreter] for deciseconds.
  static final TimeInterpreter deciseconds = TimeInterpreter._(1e1);

  /// The [TimeInterpreter] for seconds.
  static final TimeInterpreter seconds = TimeInterpreter._(1e0);

  /// The [TimeInterpreter] for dekaseconds.
  static final TimeInterpreter dekaseconds = TimeInterpreter._(1e-1);

  /// The [TimeInterpreter] for hectoseconds.
  static final TimeInterpreter hectoseconds = TimeInterpreter._(1e-2);

  /// The [TimeInterpreter] for kiloseconds.
  static final TimeInterpreter kiloseconds = TimeInterpreter._(1e-3);

  /// The [TimeInterpreter] for minutes.
  static final TimeInterpreter minutes = TimeInterpreter._(1.0 / 60.0);

  /// The [TimeInterpreter] for hours.
  static final TimeInterpreter hours = TimeInterpreter._(1.0 / 60.0 / 60.0);

  /// The [TimeInterpreter] for days.
  static final TimeInterpreter days =
      TimeInterpreter._(1.0 / 60.0 / 60.0 / 24.0);

  /// The time of duration zero.
  const Time.zero() : super.zero();

  /// Infinite time.
  const Time.infinite() : super.infinite();

  /// Infinite negative time.
  const Time.negativeInfinite() : super.negativeInfinite();

  /// Constructs a [Time] representing the sum of partial amounts.
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
  }) : this._(
            Time.picoseconds._from(picoseconds) +
                Time.nanoseconds._from(nanoseconds) +
                Time.microseconds._from(microseconds) +
                Time.milliseconds._from(milliseconds) +
                Time.seconds._from(seconds) +
                Time.minutes._from(minutes) +
                Time.hours._from(hours) +
                Time.days._from(days),
            precision);

  /// Constructs a [Time] from a picosecond amount.
  Time.ofPicoseconds(final double picoseconds,
      {final Precision precision = Precision.max})
      : this._(Time.picoseconds._from(picoseconds), precision);

  /// Constructs a [Time] from a nanosecond amount.
  Time.ofNanoseconds(final double nanoseconds,
      {final Precision precision = Precision.max})
      : this._(Time.nanoseconds._from(nanoseconds), precision);

  /// Constructs a [Time] from a microsecond amount.
  Time.ofMicroseconds(final double microseconds,
      {final Precision precision = Precision.max})
      : this._(Time.microseconds._from(microseconds), precision);

  /// Constructs a [Time] from a millisecond amount.
  Time.ofMilliseconds(final double milliseconds,
      {final Precision precision = Precision.max})
      : this._(Time.milliseconds._from(milliseconds), precision);

  /// Constructs a [Time] from a second amount.
  Time.ofSeconds(final double seconds,
      {final Precision precision = Precision.max})
      : this._(Time.seconds._from(seconds), precision);

  /// Constructs a [Time] from a minute amount.
  Time.ofMinutes(final double minutes,
      {final Precision precision = Precision.max})
      : this._(Time.minutes._from(minutes), precision);

  /// Constructs a [Time] from an hour amount.
  Time.ofHours(final double hours, {final Precision precision = Precision.max})
      : this._(Time.hours._from(hours), precision);

  /// Constructs a [Time] from a day amount.
  Time.ofDays(final double days, {final Precision precision = Precision.max})
      : this._(Time.days._from(days), precision);

  /// Constructs a [Time] from a [Duration].
  Time.ofDuration(final Duration duration,
      {final Precision precision = Precision.max})
      : this._(Time.microseconds._from(duration.inMicroseconds), precision);

  /// Constructs a [Duration] based on this.
  ///
  /// Note that any granularity below microseconds will be lost.
  Duration get asDuration => Duration(microseconds: asMicroseconds.toInt());

  /// Interprets this as a number of microseconds.
  double get asPicoseconds => _preciseOf(picoseconds);

  /// Interprets this as a number of microseconds.
  double get asNanoseconds => _preciseOf(nanoseconds);

  /// Interprets this as a number of microseconds.
  double get asMicroseconds => _preciseOf(microseconds);

  /// Interprets this as a number of milliseconds.
  double get asMilliseconds => _preciseOf(milliseconds);

  /// Interprets this as a number of seconds.
  double get asSeconds => _preciseOf(seconds);

  /// Interprets this as a number of minutes.
  double get asMinutes => _preciseOf(minutes);

  /// Interprets this as a number of hours.
  double get asHours => _preciseOf(hours);

  /// Interprets this as a number of days.
  double get asDays => _preciseOf(days);

  /// Constructs a [Time].
  Time._(final double seconds, final Precision precision)
      : super(seconds, precision);

  @override
  Time _construct(final double seconds, final Precision precision) =>
      Time._(seconds, precision);
}
