part of fling_units;

/// Wrapper class for extensions on [num] types.
///
/// The main purpose is to limit the legal syntax to things that make sense, in
/// particular for extensions that make use of an SI prefix. For example, if we
/// were to have the prefixes return another [num] instead, the following would
/// be possible, but not necessarily desirable:
/// ```dart
/// a = 3.kilo.meters;       // Sensible.
/// b = 3.kilo.kilo.meters;  // Confusing! Prefixes should not be chained.
/// c = 3.kilo.floor();      // Confusing! Other methods on num should not be used.
/// d = 3.kilo;              // Confusing! Can be used anywhere a num is required.
/// ```
///
/// Having the prefix extensions return instances of this class instead of [num]
/// prevents all but the first usage demonstrated above.
class NumExtender {
  const NumExtender._(final this._value);

  /// Creates an ampere measurement.
  Charge get amperes => _value.amperes;

  /// Creates a meter measurement.
  Distance get meters => _value.meters;
  /// Creates a mile measurement.
  Distance get miles => _value.miles;
  /// Creates a yard measurement.
  Distance get yards => _value.yards;
  /// Creates a feet measurement.
  Distance get feet => _value.feet;
  /// Creates an inch measurement.
  Distance get inches => _value.inches;
  /// Creates a nautical mile measurement.
  Distance get nauticalMiles => _value.nauticalMiles;

  /// Creates a candela measurement.
  Luminosity get candela => _value.candela;
  /// Creates a candlepower measurement.
  Luminosity get candlepower => _value.candlepower;
  /// Creates a hefnerkerze measurement.
  Luminosity get hefnerkerze => _value.hefnerkerze;

  /// Creates a gram measurement.
  Mass get grams => _value.grams;
  /// Creates a tonne measurement.
  Mass get tonnes => _value.tonnes;
  /// Creates an atomic mass unit measurement.
  Mass get atomicMassUnits => _value.atomicMassUnits;
  /// Creates a dalton measurement.
  Mass get daltons => _value.daltons;
  /// Creates an electron rest mass measurement.
  Mass get electronRestMass => _value.electronRestMass;
  /// Creates a long ton measurement.
  Mass get longTons => _value.longTons;
  /// Creates a short ton measurement.
  Mass get shortTons => _value.shortTons;
  /// Creates a pound measurement.
  Mass get pounds => _value.pounds;
  /// Creates an ounce measurement.
  Mass get ounces => _value.ounces;

  /// Creates a unit measurement.
  Quantity get units => _value.units;
  /// Creates a mole measurement.
  Quantity get moles => _value.moles;

  /// Creates a kelvin change measurement.
  TemperatureChange get kelvin => _value.kelvin;
  /// Creates a celcius change measurement.
  TemperatureChange get celcius => _value.celcius;
  /// Creates a fahrenheit change measurement.
  TemperatureChange get fahrenheit => _value.fahrenheit;

  /// Creates a kelvin measurement.
  Temperature get ofKelvin => _value.ofKelvin;
  /// Creates a celcius measurement.
  Temperature get ofCelcius => _value.ofCelcius;
  /// Creates a fahrenheit measurement.
  Temperature get ofFahrenheit => _value.ofFahrenheit;

  /// Creates a day measurement.
  Time get days => _value.days;
  /// Creates an hour measurement.
  Time get hours => _value.hours;
  /// Creates a minute measurement.
  Time get minutes => _value.minutes;
  /// Creates a second measurement.
  Time get seconds => _value.seconds;

  /// Creates a liter measurement.
  Volume get liters => _value.liters;
  /// Creates a teaspoon measurement.
  Volume get teaspoons => _value.teaspoons;
  /// Creates a tablespoon measurement.
  Volume get tablespoons => _value.tablespoons;
  /// Creates a fluid ounce measurement.
  Volume get fluidOunces => _value.fluidOunces;
  /// Creates a cup measurement.
  Volume get cups => _value.cups;
  /// Creates a pint measurement.
  Volume get pints => _value.pints;
  /// Creates a quart measurement.
  Volume get quarts => _value.quarts;
  /// Creates a gallon measurement.
  Volume get gallons => _value.gallons;
  /// Creates a US teaspoon measurement.
  Volume get usTeaspoons => _value.usTeaspoons;
  /// Creates a US tablespoon measurement.
  Volume get usTablespoons => _value.usTablespoons;
  /// Creates a US fluid ounce measurement.
  Volume get usFluidOunces => _value.usFluidOunces;
  /// Creates a US cup measurement.
  Volume get usCups => _value.usCups;
  /// Creates a US pint measurement.
  Volume get usPints => _value.usPints;
  /// Creates a US quart measurement.
  Volume get usQuarts => _value.usQuarts;
  /// Creates a US gallon measurement.
  Volume get usGallons => _value.usGallons;
  /// Creates a US legal cup measurement.
  Volume get usLegalCups => _value.usLegalCups;

  final double _value;
}