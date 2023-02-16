part of fling_units;

/// Measurement constructor extension for the [num] types.
///
/// This is syntactic sugar for creating measurements given a number, for
/// example:
/// ```dart
/// a = 5.miles;
/// b = (2.3).kilo.meters;
/// ```
extension NumExtension on num {
  /// Creates an ampere measurement.
  Charge get amperes => ChargeInterpreter._amperes(this);

  /// Creates a meter measurement.
  Distance get meters => DistanceInterpreter._meters(this);

  /// Creates a mile measurement.
  Distance get miles => DistanceInterpreter._miles(this);

  /// Creates a yard measurement.
  Distance get yards => DistanceInterpreter._yards(this);

  /// Creates a foot measurement.
  Distance get feet => DistanceInterpreter._feet(this);

  /// Creates an inch measurement.
  Distance get inches => DistanceInterpreter._inches(this);

  /// Creates a nautical mile measurement.
  Distance get nauticalMiles => DistanceInterpreter._nauticalMiles(this);

  /// Creates a candela measurement.
  Luminosity get candela => LuminosityInterpreter._candela(this);

  /// Creates a candlepower measurement.
  Luminosity get candlepower => LuminosityInterpreter._candlepower(this);

  /// Creates a hefnerkerze measurement.
  Luminosity get hefnerkerze => LuminosityInterpreter._hefnerkerze(this);

  /// Creates a gram measurement.
  Mass get grams => MassInterpreter._grams(this);

  /// Creates a tonne measurement.
  Mass get tonnes => MassInterpreter._tonnes(this);

  /// Creates a atomic mass unit measurement.
  Mass get atomicMassUnits => MassInterpreter._atomicMassUnits(this);

  /// Creates a dalton measurement.
  Mass get daltons => MassInterpreter._daltons(this);

  /// Creates an electron mass measurement.
  Mass get electronRestMass => MassInterpreter._electronRestMass(this);

  /// Creates a long ton measurement.
  Mass get longTons => MassInterpreter._longTons(this);

  /// Creates a short ton measurement.
  Mass get shortTons => MassInterpreter._shortTons(this);

  /// Creates a pound measurement.
  Mass get pounds => MassInterpreter._pounds(this);

  /// Creates an ounce measurement.
  Mass get ounces => MassInterpreter._ounces(this);

  /// Creates a unit measurement.
  Quantity get units => RoundingQuantityInterpreter._units(this);

  /// Creates a mole measurement.
  Quantity get moles => StandardQuantityInterpreter._moles(this);

  /// Creates a kelvin change measurement.
  TemperatureChange get kelvin => TemperatureChangeInterpreter._kelvin(this);

  /// Creates a celcius change measurement.
  TemperatureChange get celcius => TemperatureChangeInterpreter._celcius(this);

  /// Creates a fahrenheit change measurement.
  TemperatureChange get fahrenheit =>
      TemperatureChangeInterpreter._fahrenheit(this);

  /// Creates a kelvin measurement.
  Temperature get ofKelvin => Temperature.ofKelvin(this);

  /// Creates a celcius measurement.
  Temperature get ofCelcius => Temperature.ofCelcius(this);

  /// Creates a fahrenheit measurement.
  Temperature get ofFahrenheit => Temperature.ofFahrenheit(this);

  /// Creates a day measurement.
  Time get days => TimeInterpreter._days(this);

  /// Creates an hour measurement.
  Time get hours => TimeInterpreter._hours(this);

  /// Creates a minute measurement.
  Time get minutes => TimeInterpreter._minutes(this);

  /// Creates a second measurement.
  Time get seconds => TimeInterpreter._seconds(this);

  /// Creates a liter measurement.
  Volume get liters => VolumeInterpreter._liters(this);

  /// Creates a teaspoon measurement.
  Volume get teaspoons => VolumeInterpreter._teaspoons(this);

  /// Creates a tablespoon measurement.
  Volume get tablespoons => VolumeInterpreter._tablespoons(this);

  /// Creates a fluid ounce measurement.
  Volume get fluidOunces => VolumeInterpreter._fluidOunces(this);

  /// Creates a cup measurement.
  Volume get cups => VolumeInterpreter._cups(this);

  /// Creates a pint measurement.
  Volume get pints => VolumeInterpreter._pints(this);

  /// Creates a quart measurement.
  Volume get quarts => VolumeInterpreter._quarts(this);

  /// Creates a gallon measurement.
  Volume get gallons => VolumeInterpreter._gallons(this);

  /// Creates a US teaspoon measurement.
  Volume get usTeaspoons => VolumeInterpreter._usTeaspoons(this);

  /// Creates a US tablespoon measurement.
  Volume get usTablespoons => VolumeInterpreter._usTablespoons(this);

  /// Creates a US fluid ounce measurement.
  Volume get usFluidOunces => VolumeInterpreter._usFluidOunces(this);

  /// Creates a US cup measurement.
  Volume get usCups => VolumeInterpreter._usCups(this);

  /// Creates a US pint measurement.
  Volume get usPints => VolumeInterpreter._usPints(this);

  /// Creates a US quart measurement.
  Volume get usQuarts => VolumeInterpreter._usQuarts(this);

  /// Creates a US gallon measurement.
  Volume get usGallons => VolumeInterpreter._usGallons(this);

  /// Creates a US legal cup measurement.
  Volume get usLegalCups => VolumeInterpreter._usLegalCups(this);

  /// SI prefix "quecto".
  NumExtender get quecto => NumExtender(MeasurementPrefix._quecto, this);

  /// SI prefix "ronto".
  NumExtender get ronto => NumExtender(MeasurementPrefix._ronto, this);

  /// SI prefix "yocto".
  NumExtender get yocto => NumExtender(MeasurementPrefix._yocto, this);

  /// SI prefix "zepto".
  NumExtender get zepto => NumExtender(MeasurementPrefix._zepto, this);

  /// SI prefix "atto".
  NumExtender get atto => NumExtender(MeasurementPrefix._atto, this);

  /// SI prefix "femto".
  NumExtender get femto => NumExtender(MeasurementPrefix._femto, this);

  /// SI prefix "pico".
  NumExtender get pico => NumExtender(MeasurementPrefix._pico, this);

  /// SI prefix "nano".
  NumExtender get nano => NumExtender(MeasurementPrefix._nano, this);

  /// SI prefix "micro".
  NumExtender get micro => NumExtender(MeasurementPrefix._micro, this);

  /// SI prefix "milli".
  NumExtender get milli => NumExtender(MeasurementPrefix._milli, this);

  /// SI prefix "centi".
  NumExtender get centi => NumExtender(MeasurementPrefix._centi, this);

  /// SI prefix "deci".
  NumExtender get deci => NumExtender(MeasurementPrefix._deci, this);

  /// SI prefix "deka".
  NumExtender get deka => NumExtender(MeasurementPrefix._deka, this);

  /// SI prefix "hecto".
  NumExtender get hecto => NumExtender(MeasurementPrefix._hecto, this);

  /// SI prefix "kilo".
  NumExtender get kilo => NumExtender(MeasurementPrefix._kilo, this);

  /// SI prefix "mega".
  NumExtender get mega => NumExtender(MeasurementPrefix._mega, this);

  /// SI prefix "giga".
  NumExtender get giga => NumExtender(MeasurementPrefix._giga, this);

  /// SI prefix "tera".
  NumExtender get tera => NumExtender(MeasurementPrefix._tera, this);

  /// SI prefix "peta".
  NumExtender get peta => NumExtender(MeasurementPrefix._peta, this);

  /// SI prefix "exa".
  NumExtender get exa => NumExtender(MeasurementPrefix._exa, this);

  /// SI prefix "zetta".
  NumExtender get zetta => NumExtender(MeasurementPrefix._zetta, this);

  /// SI prefix "yotta".
  NumExtender get yotta => NumExtender(MeasurementPrefix._yotta, this);

  /// SI prefix "ronna".
  NumExtender get ronna => NumExtender(MeasurementPrefix._ronna, this);

  /// SI prefix "quetta".
  NumExtender get quetta => NumExtender(MeasurementPrefix._quetta, this);
}
