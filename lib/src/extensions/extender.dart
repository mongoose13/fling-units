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
  /// The prefix being applied to the number.
  final MeasurementPrefix _prefix;

  /// The number being extended.
  final num _value;

  /// Constructs a new extender.
  const NumExtender(this._prefix, this._value);

  /// Creates an ampere measurement.
  Charge get amperes => ChargeInterpreter._amperes._withPrefix(_prefix)(_value);

  /// Creates a meter measurement.
  Distance get meters =>
      DistanceInterpreter._meters._withPrefix(_prefix)(_value);

  /// Creates a mile measurement.
  Distance get miles => DistanceInterpreter._miles._withPrefix(_prefix)(_value);

  /// Creates a yard measurement.
  Distance get yards => DistanceInterpreter._yards._withPrefix(_prefix)(_value);

  /// Creates a feet measurement.
  Distance get feet => DistanceInterpreter._feet._withPrefix(_prefix)(_value);

  /// Creates an inch measurement.
  Distance get inches =>
      DistanceInterpreter._inches._withPrefix(_prefix)(_value);

  /// Creates a nautical mile measurement.
  Distance get nauticalMiles =>
      DistanceInterpreter._nauticalMiles._withPrefix(_prefix)(_value);

  /// Creates a candela measurement.
  Luminosity get candela =>
      LuminosityInterpreter._candela._withPrefix(_prefix)(_value);

  /// Creates a candlepower measurement.
  Luminosity get candlepower =>
      LuminosityInterpreter._candlepower._withPrefix(_prefix)(_value);

  /// Creates a hefnerkerze measurement.
  Luminosity get hefnerkerze =>
      LuminosityInterpreter._hefnerkerze._withPrefix(_prefix)(_value);

  /// Creates a gram measurement.
  Mass get grams => MassInterpreter._grams._withPrefix(_prefix)(_value);

  /// Creates a tonne measurement.
  Mass get tonnes => MassInterpreter._tonnes._withPrefix(_prefix)(_value);

  /// Creates an atomic mass unit measurement.
  Mass get atomicMassUnits =>
      MassInterpreter._atomicMassUnits._withPrefix(_prefix)(_value);

  /// Creates a dalton measurement.
  Mass get daltons => MassInterpreter._daltons._withPrefix(_prefix)(_value);

  /// Creates an electron rest mass measurement.
  Mass get electronRestMass =>
      MassInterpreter._electronRestMass._withPrefix(_prefix)(_value);

  /// Creates a long ton measurement.
  Mass get longTons => MassInterpreter._longTons._withPrefix(_prefix)(_value);

  /// Creates a short ton measurement.
  Mass get shortTons => MassInterpreter._shortTons._withPrefix(_prefix)(_value);

  /// Creates a pound measurement.
  Mass get pounds => MassInterpreter._pounds._withPrefix(_prefix)(_value);

  /// Creates an ounce measurement.
  Mass get ounces => MassInterpreter._ounces._withPrefix(_prefix)(_value);

  /// Creates a unit measurement.
  Quantity get units =>
      RoundingQuantityInterpreter._units._withPrefix(_prefix)(_value);

  /// Creates a mole measurement.
  Quantity get moles =>
      StandardQuantityInterpreter._moles._withPrefix(_prefix)(_value);

  /// Creates a kelvin change measurement.
  TemperatureChange get kelvin =>
      TemperatureChangeInterpreter._kelvin._withPrefix(_prefix)(_value);

  /// Creates a celcius change measurement.
  TemperatureChange get celcius =>
      TemperatureChangeInterpreter._celcius._withPrefix(_prefix)(_value);

  /// Creates a fahrenheit change measurement.
  TemperatureChange get fahrenheit =>
      TemperatureChangeInterpreter._fahrenheit._withPrefix(_prefix)(_value);

  /// Creates a kelvin measurement.
  Temperature get ofKelvin => _value.ofKelvin;

  /// Creates a celcius measurement.
  Temperature get ofCelcius => _value.ofCelcius;

  /// Creates a fahrenheit measurement.
  Temperature get ofFahrenheit => _value.ofFahrenheit;

  /// Creates a day measurement.
  Time get days => TimeInterpreter._days._withPrefix(_prefix)(_value);

  /// Creates an hour measurement.
  Time get hours => TimeInterpreter._hours._withPrefix(_prefix)(_value);

  /// Creates a minute measurement.
  Time get minutes => TimeInterpreter._minutes._withPrefix(_prefix)(_value);

  /// Creates a second measurement.
  Time get seconds => TimeInterpreter._seconds._withPrefix(_prefix)(_value);

  /// Creates a liter measurement.
  Volume get liters => VolumeInterpreter._liters._withPrefix(_prefix)(_value);

  /// Creates a teaspoon measurement.
  Volume get teaspoons =>
      VolumeInterpreter._teaspoons._withPrefix(_prefix)(_value);

  /// Creates a tablespoon measurement.
  Volume get tablespoons =>
      VolumeInterpreter._tablespoons._withPrefix(_prefix)(_value);

  /// Creates a fluid ounce measurement.
  Volume get fluidOunces =>
      VolumeInterpreter._fluidOunces._withPrefix(_prefix)(_value);

  /// Creates a cup measurement.
  Volume get cups => VolumeInterpreter._cups._withPrefix(_prefix)(_value);

  /// Creates a pint measurement.
  Volume get pints => VolumeInterpreter._pints._withPrefix(_prefix)(_value);

  /// Creates a quart measurement.
  Volume get quarts => VolumeInterpreter._quarts._withPrefix(_prefix)(_value);

  /// Creates a gallon measurement.
  Volume get gallons => VolumeInterpreter._gallons._withPrefix(_prefix)(_value);

  /// Creates a US teaspoon measurement.
  Volume get usTeaspoons =>
      VolumeInterpreter._usTeaspoons._withPrefix(_prefix)(_value);

  /// Creates a US tablespoon measurement.
  Volume get usTablespoons =>
      VolumeInterpreter._usTablespoons._withPrefix(_prefix)(_value);

  /// Creates a US fluid ounce measurement.
  Volume get usFluidOunces =>
      VolumeInterpreter._usFluidOunces._withPrefix(_prefix)(_value);

  /// Creates a US cup measurement.
  Volume get usCups => VolumeInterpreter._usCups._withPrefix(_prefix)(_value);

  /// Creates a US pint measurement.
  Volume get usPints => VolumeInterpreter._usPints._withPrefix(_prefix)(_value);

  /// Creates a US quart measurement.
  Volume get usQuarts =>
      VolumeInterpreter._usQuarts._withPrefix(_prefix)(_value);

  /// Creates a US gallon measurement.
  Volume get usGallons =>
      VolumeInterpreter._usGallons._withPrefix(_prefix)(_value);

  /// Creates a US legal cup measurement.
  Volume get usLegalCups =>
      VolumeInterpreter._usLegalCups._withPrefix(_prefix)(_value);

  /// Creates a Pascal measurement.
  Pressure get pascals =>
      PressureInterpreter._pascals._withPrefix(_prefix)(_value);

  /// Creates a bars of pressure measurement.
  Pressure get bars => PressureInterpreter._bars._withPrefix(_prefix)(_value);

  /// Creates a Baryes measurement.
  Pressure get baryes =>
      PressureInterpreter._baryes._withPrefix(_prefix)(_value);

  /// Creates a Torr measurement.
  Pressure get torr => PressureInterpreter._torr._withPrefix(_prefix)(_value);

  /// Creates a PSI measurement.
  Pressure get psi => PressureInterpreter._psi._withPrefix(_prefix)(_value);
}
