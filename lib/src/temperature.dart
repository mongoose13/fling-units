import 'converter/temperature.dart';
import 'precision.dart';

/// Represents a change in temperature.
///
/// Because temperature scales are not zero-based (except for Kelvin), working
/// with temperature numbers can be counter-intuitive. For example, what does
/// it mean to "subtract 10 degrees Celcius from 10 degrees Celcius"? One might
/// say the answer is 0 degrees Celcius, but one might also say the answer is
/// "absolute zero" (-273.15 degrees Celcius). Depending on what you mean when
/// you say "subtract 10 degrees Celcius", one of those two will be correct.
///
/// To resolve this ambiguity, the [TemperatureChange] class allows one to model
/// differences in temperature (as opposed to "thermometer" temperatures). If
/// you intend to say "it is 10 degrees Celcius colder than yesterday" then you
/// want to use a [Temperature] alongside a [TemperatureChange] of 10 degrees
/// Celcius as opposed to two [Temperature]s of 10 degrees Celcius.
///
/// Instances of this class may also represent the difference between two
/// "thermometer" temperatures. For example, if I calculate the difference in
/// temperature between today's weather and yesterday's weather, I would get a
/// [TemperatureChange] whose value indicates the amount of difference between
/// the two [Temperature]s. It would not make sense to say that the difference
/// in temperature is the "thermometer" temperature of 10 degrees.
class TemperatureChange implements Comparable<TemperatureChange> {
  /// No change in temperature.
  const TemperatureChange.zero()
      : _converter = TemperatureConverter.zero,
        precision = Precision.max;

  /// Infinite temperature change.
  const TemperatureChange.infinity()
      : _converter = TemperatureConverter.infinity,
        precision = Precision.max;

  /// Negative infinite temperature change.
  const TemperatureChange.negativeInfinity()
      : _converter = TemperatureConverter.negativeInfinity,
        precision = Precision.max;

  /// Constructs a [TemperatureChange] from a Kelvin amount.
  TemperatureChange.kelvin(final num kelvin,
      {final this.precision = Precision.max})
      : _converter = TemperatureConverter.kelvinChange(kelvin.toDouble());

  /// Constructs a [TemperatureChange] from a degree Celcius amount.
  TemperatureChange.celcius(final num celcius,
      {final this.precision = Precision.max})
      : _converter = TemperatureConverter.celciusChange(celcius.toDouble());

  /// Constructs a [TemperatureChange] from a degree Fahrenheit amount.
  TemperatureChange.fahrenheit(final num fahrenheit,
      {final this.precision = Precision.max})
      : _converter =
            TemperatureConverter.fahrenheitChange(fahrenheit.toDouble());

  /// Returns a [TemperatureChange] that represents the positive magnitude of
  /// this.
  TemperatureChange magnitude() => isNegative
      ? TemperatureChange.kelvin(-kelvin, precision: precision)
      : this;

  /// Interprets this in Kelvin.
  double get kelvin => precision.withPrecision(_converter.toKelvinChange());

  /// Interprets this in degrees Celcius.
  double get celcius => precision.withPrecision(_converter.toCelciusChange());

  /// Interprets this in degrees Fahrenheit.
  double get fahrenheit =>
      precision.withPrecision(_converter.toFahrenheitChange());

  /// Returns `true` if this represents a decrease in temperature.
  bool get isNegative => _converter.isNegative;

  /// Returns `true` if this represents a finite change.
  bool get isFinite => _converter.isFinite;

  /// Returns `true` if this represents an infinite change.
  bool get isInfinite => _converter.isInfinite;

  /// Returns `true` if this change cannot be expressed as a number.
  bool get isNaN => _converter.isNaN;

  @override
  bool operator ==(final dynamic other) =>
      other is TemperatureChange &&
      other.kelvin == kelvin &&
      other.precision == precision;

  @override
  int get hashCode => kelvin.hashCode * precision.hashCode;

  /// Returns `true` if this represents a greater change than another.
  ///
  /// Note that a negative change is considered smaller than a positive change,
  /// so if you are interested in magnitude only, use
  /// [TemperatureChange.magnitude] first.
  bool operator >(final TemperatureChange other) => kelvin > other.kelvin;

  /// Returns `true` if this represents an equal or greater change than another.
  ///
  /// Note that a negative change is considered smaller than a positive change,
  /// so if you are interested in magnitude only, use
  /// [TemperatureChange.magnitude] first.
  bool operator >=(final TemperatureChange other) => kelvin >= other.kelvin;

  /// Returns `true` if this represents a smaller change than another.
  ///
  /// Note that a negative change is considered smaller than a positive change,
  /// so if you are interested in magnitude only, use
  /// [TemperatureChange.magnitude] first.
  bool operator <(final TemperatureChange other) => kelvin < other.kelvin;

  /// Returns `true` if this represents an equal or smaller change than another.
  ///
  /// Note that a negative change is considered smaller than a positive change,
  /// so if you are interested in magnitude only, use
  /// [TemperatureChange.magnitude] first.
  bool operator <=(final TemperatureChange other) => kelvin <= other.kelvin;

  @override
  int compareTo(final TemperatureChange other) {
    return kelvin.compareTo(other.kelvin);
  }

  /// Returns the opposite of this.
  TemperatureChange operator -() =>
      TemperatureChange.kelvin(-kelvin, precision: precision);

  /// Creates a [TemperatureChange] that is the sum of two others.
  ///
  /// ```dart
  /// TemperatureChange.kelvin(3) + TemperatureChange.zero() == TemperatureChange.kelvin(3)
  /// TemperatureChange.kelvin(3) + TemperatureChange.kelvin(2) == TemperatureChange.kelvin(5)
  /// TemperatureChange.kelvin(3) + TemperatureChange.kelvin(-2) == TemperatureChange.kelvin(1)
  /// TemperatureChange.kelvin(-3) + TemperatureChange.kelvin(2) == TemperatureChange.kelvin(-1)
  /// ```
  TemperatureChange operator +(final TemperatureChange other) {
    return TemperatureChange.kelvin(kelvin + other.kelvin,
        precision: Precision.add(precision, other.precision));
  }

  /// Creates a [TemperatureChange] that is the difference of two others.
  ///
  /// ```dart
  /// TemperatureChange.kelvin(3) - TemperatureChange.zero() == TemperatureChange.kelvin(3)
  /// TemperatureChange.kelvin(3) - TemperatureChange.kelvin(2) == TemperatureChange.kelvin(1)
  /// TemperatureChange.kelvin(3) - TemperatureChange.kelvin(-2) == TemperatureChange.kelvin(5)
  /// TemperatureChange.kelvin(-3) - TemperatureChange.kelvin(2) == TemperatureChange.kelvin(-5)
  /// ```
  TemperatureChange operator -(final TemperatureChange other) {
    return TemperatureChange.kelvin(kelvin - other.kelvin,
        precision: Precision.add(precision, other.precision));
  }

  /// Creates a [TemperatureChange] that is a multiple of this.
  ///
  /// ```dart
  /// TemperatureChange.kelvin(3) * 0 == TemperatureChange.zero()
  /// TemperatureChange.kelvin(3) * 1 == TemperatureChange.kelvin(3)
  /// TemperatureChange.kelvin(3) * 2 == TemperatureChange.kelvin(6)
  /// TemperatureChange.kelvin(3) * -2 == TemperatureChange.kelvin(-6)
  /// ```
  TemperatureChange operator *(final num multiplier) {
    return TemperatureChange.kelvin(kelvin * multiplier.toDouble(),
        precision: precision);
  }

  /// Creates a [TemperatureChange] that is a fraction of this.
  ///
  /// ```dart
  /// TemperatureChange.kelvin(6) / 0 == TemperatureChange.infinity()
  /// TemperatureChange.kelvin(6) / 1 == TemperatureChange.kelvin(6)
  /// TemperatureChange.kelvin(6) / 2 == TemperatureChange.kelvin(3)
  /// TemperatureChange.kelvin(6) / -2 == TemperatureChange.kelvin(-3)
  /// ```
  TemperatureChange operator /(final num divisor) {
    return TemperatureChange.kelvin(kelvin / divisor.toDouble(),
        precision: precision);
  }

  @override
  String toString() => '$kelvin K';

  final TemperatureConverter _converter;

  /// The precision used in all conversions.
  final Precision precision;
}

/// Represents a "thermometer" temperature.
///
/// This is distinguished from a change in temperature because of the fact that
/// temperature scales are not zero-based. To represent a change in temperature
/// instead, and for an in-depth explanation of this requirement, see the
/// [TemperatureChange] class documentation.
///
/// Several operations on the [Temperature] class work with [TemperatureChange]
/// instances instead of [Temperature] instances. This is because the natural
/// way to think about those operations is in terms of temperature changes. For
/// example, the `+` operator applies a change in temperature rather than a
/// "thermometer" temperature. While physicists may intend to actually add two
/// "thermometer" temperatures together in some cases, this is not the common
/// meaning of "adding temperature," so the more esoteric uses are supported
/// with special methods rather than the built-in operators. Pay special
/// attention to the operations in this class to ensure proper use of the
/// library. The type system should catch most errors, e.g. adding together two
/// "thermometer" temperatures with the `+` operator.
class Temperature implements Comparable<Temperature> {
  /// Absolute zero.
  const Temperature.absoluteZero()
      : _converter = TemperatureConverter.zero,
        precision = Precision.max;

  /// Infinite temperature.
  const Temperature.infinity()
      : _converter = TemperatureConverter.infinity,
        precision = Precision.max;

  /// Constructs a [Temperature] from a Kelvin amount.
  Temperature.kelvin(final num kelvin, {final this.precision = Precision.max})
      : _converter = TemperatureConverter.kelvin(kelvin.toDouble()) {
    if (kelvin.isNegative) {
      throw ArgumentError('Temperatures cannot go below 0 Kelvin: $kelvin');
    }
  }

  /// Constructs a [Temperature] from a degree Celcius amount.
  Temperature.celcius(final num celcius, {final this.precision = Precision.max})
      : _converter = TemperatureConverter.celcius(celcius.toDouble());

  /// Constructs a [Temperature] from a degree Fahrenheit amount.
  Temperature.fahrenheit(final num fahrenheit,
      {final this.precision = Precision.max})
      : _converter = TemperatureConverter.fahrenheit(fahrenheit.toDouble());

  /// Interprets this as Kelvin.
  double get kelvin => precision.withPrecision(_converter.toKelvin());

  /// Interprets this as degrees Celcius.
  double get celcius => precision.withPrecision(_converter.toCelcius());

  /// Interprets this as degrees Fahrenheit.
  double get fahrenheit => precision.withPrecision(_converter.toFahrenheit());

  /// Returns `true` if this is finite.
  bool get isFinite => _converter.isFinite;

  /// Returns `true` if this is infinite.
  bool get isInfinite => _converter.isInfinite;

  @override
  bool operator ==(final dynamic other) =>
      other is Temperature &&
      other.kelvin == kelvin &&
      other.precision == precision;

  @override
  int get hashCode => kelvin.hashCode * precision.hashCode;

  /// Returns `true` if this is larger than the other [Temperature].
  bool operator >(final Temperature other) => kelvin > other.kelvin;

  /// Returns `true` if this is larger than or equal to the other [Temperature].
  bool operator >=(final Temperature other) => kelvin >= other.kelvin;

  /// Returns `true` if this is smaller than the other [Temperature].
  bool operator <(final Temperature other) => kelvin < other.kelvin;

  /// Returns `true` if this is smaller than or equal to the other [Temperature].
  bool operator <=(final Temperature other) => kelvin <= other.kelvin;

  @override
  int compareTo(final Temperature other) => kelvin.compareTo(other.kelvin);

  /// Creates a [Temperature] representing the application of a [Temperature]
  /// and a [TemperatureChange].
  ///
  /// ```dart
  /// Temperature.kelvin(2) + TemperatureChange.zero() == Temperature.kelvin(2)
  /// Temperature.kelvin(2) + TemperatureChange.kelvin(3) == Temperature.kelvin(5)
  /// Temperature.kelvin(2) + TemperatureChange.kelvin(-1) == Temperature.kelvin(1)
  /// ```
  Temperature operator +(final TemperatureChange change) =>
      Temperature.kelvin(kelvin + change.kelvin,
          precision: Precision.add(precision, change.precision));

  /// Creates a [Temperature] representing the application of a [Temperature]
  /// and the opposite of a [TemperatureChange].
  ///
  /// ```dart
  /// Temperature.kelvin(3) - TemperatureChange.zero() == Temperature.kelvin(3)
  /// Temperature.kelvin(5) - TemperatureChange.kelvin(3) == Temperature.kelvin(2)
  /// Temperature.kelvin(3) - TemperatureChange.kelvin(-5) == Temperature.kelvin(8)
  /// ```
  Temperature operator -(final TemperatureChange change) =>
      Temperature.kelvin(kelvin - change.kelvin,
          precision: Precision.add(precision, change.precision));

  /// Returns the difference between this and another [Temperature].
  ///
  /// The resulting [TemperatureChange] will be negative if this is smaller than
  /// the other [Temperature].
  TemperatureChange difference(final Temperature other) =>
      TemperatureChange.kelvin(kelvin - other.kelvin,
          precision: Precision.add(precision, other.precision));

  @override
  String toString() => '$kelvin K';

  /// The unit converter being used.
  final TemperatureConverter _converter;

  /// The precision used in all conversions.
  final Precision precision;
}