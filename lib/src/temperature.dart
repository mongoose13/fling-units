/// Represents a change in temperature.
///
/// Because temperature scales are not zero-based (except for Kelvin), working
/// with temperature numbers can be counter-intuitive. For example, what does
/// it mean to "subtract 10 degrees Celcius from 10 degrees Celcius"? One might
/// say the answer is 0 degrees Celcius, but one might also say the answer is
/// "absolute zero" (-273.15 degrees Celcius). Depending on what you mean when
/// you say "subtract 10 degrees Celcius", one of those two will be correct.
///
/// To resolve this ambiguity, the TemperatureChange class allows one to model
/// differences in temperature (as opposed to "thermometer" temperatures). If
/// you intend to say "it is 10 degrees Celcius colder than yesterday" then you
/// want to use a Temperature alongside a TemperatureChange of 10 degrees
/// Celcius as opposed to two Temperatures of 10 degrees Celcius.
///
/// Instances of this class may also represent the difference between two
/// "thermometer" temperatures. For example, if I calculate the difference in
/// temperature between today's weather and yesterday's weather, I would get a
/// TemperatureChange whose value indicates the amount of difference between
/// the two Temperatures. It would not make sense to say that the difference
/// in temperature is the "thermometer" temperature of 10 degrees.
class TemperatureChange implements Comparable<TemperatureChange> {
  /// The null change, representing no difference in temperature.
  const TemperatureChange.zero() : _kelvin = 0.0;

  /// An infinite change in temperature in the positive direction.
  const TemperatureChange.infinity() : _kelvin = double.infinity;

  /// An infinite change in temperature in the negative direction.
  const TemperatureChange.negativeInfinity()
      : _kelvin = double.negativeInfinity;

  /// Construct a TemperatureChange from a Kelvin amount.
  TemperatureChange.kelvin(final num kelvin) : _kelvin = kelvin.toDouble();

  /// Construct a TemperatureChange from a degree Celcius amount.
  TemperatureChange.celcius(final num celcius) : _kelvin = celcius.toDouble();

  /// Construct a TemperatureChange from a degree Fahrenheit amount.
  TemperatureChange.fahrenheit(final num fahrenheit)
      : _kelvin = fahrenheit.toDouble() * 5.0 / 9.0;

  /// Produces a TemperatureChange that represents the magnitude of this change,
  /// i.e. the unsigned difference. This will always be a positive change.
  TemperatureChange magnitude() => TemperatureChange.kelvin(_kelvin.abs());

  /// The difference in temperature measured in Kelvin.
  double get kelvin => _kelvin;

  /// The difference in temperature measured in degrees Celcius.
  double get celcius => _kelvin;

  /// The difference in temperature measured in degrees Fahrenheit.
  double get fahrenheit => _kelvin * 9.0 / 5.0;

  /// Whether the change in temperature is in the negative direction.
  bool get isNegative => _kelvin.isNegative;

  /// Whether the change in temperature is finite.
  bool get isFinite => _kelvin.isFinite;

  /// Whether the change in temperature is infinite.
  bool get isInfinite => _kelvin.isInfinite;

  /// Whether the change in temperature is not a number.
  bool get isNaN => _kelvin.isNaN;

  @override
  bool operator ==(final dynamic other) =>
      other is TemperatureChange && other._kelvin == _kelvin;

  @override
  int get hashCode => _kelvin.hashCode;

  /// Whether this TemperatureChange represents a greater change than another.
  /// Note that a negative change is considered smaller than a positive change,
  /// so if you are interested in magnitude only, use the magnitude() method
  /// first.
  bool operator >(final TemperatureChange other) => _kelvin > other._kelvin;

  /// Whether this TemperatureChange represents a greater than or equal change
  /// than another. Note that a negative change is considered smaller than a
  /// positive change, so if you are interested in magnitude only, use the
  /// magnitude() method first.
  bool operator >=(final TemperatureChange other) => _kelvin >= other._kelvin;

  /// Whether this TemperatureChange represents a smaller change than another.
  /// Note that a negative change is considered smaller than a positive change,
  /// so if you are interested in magnitude only, use the magnitude() method
  /// first.
  bool operator <(final TemperatureChange other) => _kelvin < other._kelvin;

  /// Whether this TemperatureChange represents a smaller than or equal change
  /// than another. Note that a negative change is considered smaller than a
  /// positive change, so if you are interested in magnitude only, use the
  /// magnitude() method first.
  bool operator <=(final TemperatureChange other) => _kelvin <= other._kelvin;

  @override
  int compareTo(final TemperatureChange other) {
    return _kelvin.compareTo(other._kelvin);
  }

  /// Add two TemperatureChanges together to produce a third TemperatureChange
  /// that represents the sum of the inputs. Note that negative changes will
  /// cancel out.
  ///
  /// TemperatureChange.kelvin(3) + TemperatureChange.zero() == TemperatureChange.kelvin(3)
  /// TemperatureChange.kelvin(3) + TemperatureChange.kelvin(2) == TemperatureChange.kelvin(5)
  /// TemperatureChange.kelvin(3) + TemperatureChange.kelvin(-2) == TemperatureChange.kelvin(1)
  /// TemperatureChange.kelvin(-3) + TemperatureChange.kelvin(2) == TemperatureChange.kelvin(-1)
  TemperatureChange operator +(final TemperatureChange other) {
    return TemperatureChange.kelvin(_kelvin + other._kelvin);
  }

  /// Subtract another TemperatureChange from this one to produce a third
  /// TemperatureChange that represents the difference in the inputs.
  ///
  /// TemperatureChange.kelvin(3) - TemperatureChange.zero() == TemperatureChange.kelvin(3)
  /// TemperatureChange.kelvin(3) - TemperatureChange.kelvin(2) == TemperatureChange.kelvin(1)
  /// TemperatureChange.kelvin(3) - TemperatureChange.kelvin(-2) == TemperatureChange.kelvin(5)
  /// TemperatureChange.kelvin(-3) - TemperatureChange.kelvin(2) == TemperatureChange.kelvin(-5)
  TemperatureChange operator -(final TemperatureChange other) {
    return TemperatureChange.kelvin(_kelvin - other._kelvin);
  }

  /// Multiply the magnitude of this TemperatureChange by a scalar. Providing a
  /// negative scalar will invert the sign on the resulting TemperatureChange.
  ///
  /// TemperatureChange.kelvin(3) * 0 == TemperatureChange.zero()
  /// TemperatureChange.kelvin(3) * 1 == TemperatureChange.kelvin(3)
  /// TemperatureChange.kelvin(3) * 2 == TemperatureChange.kelvin(6)
  /// TemperatureChange.kelvin(3) * -2 == TemperatureChange.kelvin(-6)
  TemperatureChange operator *(final num multiplier) {
    return TemperatureChange.kelvin(_kelvin * multiplier);
  }

  /// Divide the magnitude of this TemperatureChange by a scalar. Providing a
  /// negative scalar will invert the sign on the resulting TemperatureChange.
  ///
  /// TemperatureChange.kelvin(6) / 0 == TemperatureChange.infinity()
  /// TemperatureChange.kelvin(6) / 1 == TemperatureChange.kelvin(6)
  /// TemperatureChange.kelvin(6) / 2 == TemperatureChange.kelvin(3)
  /// TemperatureChange.kelvin(6) / -2 == TemperatureChange.kelvin(-3)
  TemperatureChange operator /(final num divisor) {
    return TemperatureChange.kelvin(_kelvin / divisor);
  }

  String toString() => '$_kelvin K';

  final double _kelvin;
}

/// Represents a "thermometer" temperature.
///
/// This is distinguished from a change in temperature because of the fact that
/// temperature scales are not zero-based. To represent a change in temperature
/// instead, and for an in-depth explanation of this requirement, see the
/// TemperatureChange class.
///
/// Several operations on the Temperature class work with TemperatureChange
/// instances instead of Temperature instances. This is because the natural way
/// to think about those operations is in terms of temperature changes. For
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
      : _kelvin = 0.0,
        _fahrenheit = -459.66999999999996;

  /// Infinite temperature.
  const Temperature.infinity()
      : _kelvin = double.infinity,
        _fahrenheit = double.infinity;

  /// Construct a Temperature from a Kelvin amount.
  Temperature.kelvin(final num kelvin)
      : _kelvin = kelvin.toDouble(),
        _fahrenheit = (kelvin - 273.15) * 9.0 / 5.0 + 32.0 {
    if (_kelvin.isNegative) {
      throw ArgumentError('Temperatures cannot go below 0 Kelvin: $_kelvin');
    }
  }

  /// Construct a Temperature from a degree Celcius amount.
  Temperature.celcius(final num celcius)
      : this.kelvin(celcius.toDouble() + 273.15);

  /// Construct a Temperature from a degree Fahrenheit amount.
  Temperature.fahrenheit(final num fahrenheit)
      : _kelvin = (fahrenheit.toDouble() - 32.0) * 5.0 / 9.0 + 275.15,
        _fahrenheit = fahrenheit.toDouble();

  /// Interpret this Temperature as Kelvin.
  double get kelvin => _kelvin;

  /// Interpret this Temperature as degrees Celcius.
  double get celcius => _kelvin - 273.15;

  /// Interpret this Temperature as degrees Fahrenheit.
  double get fahrenheit => _fahrenheit;

  /// Returns whether this Temperature is below absolute zero.
  bool get belowAbsoluteZero => _kelvin.isNegative;

  /// Returns whether this Temperature represents a finite amount.
  bool get isFinite => _kelvin.isFinite;

  /// Returns whether this Temperature represents an infinite amount (positive or
  /// negative).
  bool get isInfinite => _kelvin.isInfinite;

  @override
  bool operator ==(final dynamic other) =>
      other is Temperature && other._kelvin == _kelvin;

  @override
  int get hashCode => _kelvin.hashCode;

  /// Compares this Temperature to another Temperature, returning true if this
  /// Temperature is larger than the other Temperature, or false otherwise.
  bool operator >(final Temperature other) => _kelvin > other._kelvin;

  /// Compares this Temperature to another Temperature, returning true if this
  /// Temperature is larger than or equal to the other Temperature, or false
  /// otherwise.
  bool operator >=(final Temperature other) => _kelvin >= other._kelvin;

  /// Compares this Temperature to another Temperature, returning true if this
  /// Temperature is smaller than the other Temperature, or false otherwise.
  bool operator <(final Temperature other) => _kelvin < other._kelvin;

  /// Compares this Temperature to another Temperature, returning true if this
  /// Temperature is smaller than or equal to the other Temperature, or false
  /// otherwise.
  bool operator <=(final Temperature other) => _kelvin <= other._kelvin;

  @override
  int compareTo(final Temperature other) => _kelvin.compareTo(other.kelvin);

  /// Add a TemperatureChange to this temperature to produce a new Temperature.
  ///
  /// Temperature.kelvin(2) + TemperatureChange.zero() == Temperature.kelvin(2)
  /// Temperature.kelvin(2) + TemperatureChange.kelvin(3) == Temperature.kelvin(5)
  /// Temperature.kelvin(2) + TemperatureChange.kelvin(-1) == Temperature.kelvin(1)
  Temperature operator +(final TemperatureChange change) =>
      Temperature.kelvin(_kelvin + change._kelvin);

  /// Subtract a TemperatureChange from this Temperature to produce a new
  /// Temperature.
  ///
  /// Temperature.kelvin(3) - TemperatureChange.zero() == Temperature.kelvin(3)
  /// Temperature.kelvin(5) - TemperatureChange.kelvin(3) == Temperature.kelvin(2)
  /// Temperature.kelvin(3) - TemperatureChange.kelvin(-5) == Temperature.kelvin(8)
  Temperature operator -(final TemperatureChange change) =>
      Temperature.kelvin(_kelvin - change._kelvin);

  /// Returns the difference between this Temperature and another.
  ///
  /// The resulting TemperatureChange will be negative if this Temperature is
  /// smaller than the other Temperature.
  TemperatureChange difference(final Temperature other) =>
      TemperatureChange.kelvin(_kelvin - other._kelvin);

  @override
  String toString() => '${_kelvin.toString()} K';

  final double _kelvin;
  final double _fahrenheit;
}
