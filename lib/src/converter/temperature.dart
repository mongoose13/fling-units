class TemperatureConverter {
  static const TemperatureConverter zero = TemperatureConverter._zero();
  static const TemperatureConverter infinity = TemperatureConverter._infinity();
  static const TemperatureConverter negativeInfinity =
      TemperatureConverter._negativeInfinity();

  TemperatureConverter.kelvin(final double kelvin)
      : _kelvin = fromKelvin(kelvin);

  TemperatureConverter.celcius(final double celcius)
      : _kelvin = fromCelcius(celcius);

  TemperatureConverter.fahrenheit(final double fahrenheit)
      : _kelvin = fromFahrenheit(fahrenheit);

  TemperatureConverter.kelvinChange(final double kelvin)
      : _kelvin = fromKelvinChange(kelvin);

  TemperatureConverter.celciusChange(final double celcius)
      : _kelvin = fromCelciusChange(celcius);

  TemperatureConverter.fahrenheitChange(final double fahrenheit)
      : _kelvin = fromFahrenheitChange(fahrenheit);

  double toKelvinChange() => asKelvinChange(_kelvin);

  double toCelciusChange() => asCelciusChange(_kelvin);

  double toFahrenheitChange() => asFahrenheitChange(_kelvin);

  double toKelvin() => asKelvin(_kelvin);

  double toCelcius() => asCelcius(_kelvin);

  double toFahrenheit() => asFahrenheit(_kelvin);

  bool get isNegative => _kelvin.isNegative;

  bool get isNaN => _kelvin.isNaN;

  bool get isFinite => _kelvin.isFinite;

  bool get isInfinite => _kelvin.isInfinite;

  static double asKelvinChange(final double kelvin) => kelvin;

  static double asCelciusChange(final double kelvin) => kelvin;

  static double asFahrenheitChange(final double kelvin) =>
      kelvin * _fahrenheitFactor;

  static double asKelvin(final double kelvin) => kelvin;

  static double asCelcius(final double kelvin) =>
      asCelciusChange(kelvin) + _celciusOffset;

  static double asFahrenheit(final double kelvin) =>
      asFahrenheitChange(kelvin + _celciusOffset) + _fahrenheitOffset;

  static double fromKelvin(final double kelvin) => kelvin;

  static double fromCelcius(final double celcius) => celcius - _celciusOffset;

  static double fromFahrenheit(final double fahrenheit) =>
      fromCelcius((fahrenheit - _fahrenheitOffset) / _fahrenheitFactor);

  static double fromKelvinChange(final double kelvin) => kelvin;

  static double fromCelciusChange(final double celcius) => celcius;

  static double fromFahrenheitChange(final double fahrenheit) =>
      fahrenheit / _fahrenheitFactor;

  const TemperatureConverter._zero() : _kelvin = 0.0;

  const TemperatureConverter._infinity() : _kelvin = double.infinity;

  const TemperatureConverter._negativeInfinity()
      : _kelvin = double.negativeInfinity;

  static final double _fahrenheitFactor = 9.0 / 5.0;
  static final double _celciusOffset = -273.15;
  static final double _fahrenheitOffset = 32.0;

  final double _kelvin;
}
