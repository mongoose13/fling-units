abstract class Converter {
  const Converter.zero() : _value = 0.0;

  const Converter.infinity() : _value = double.infinity;

  const Converter.negativeInfinity() : _value = double.negativeInfinity;

  Converter.fromSI(final num si) : _value = si;

  Converter.metric({
    final num kilo = 0,
    final num hecto = 0,
    final num deka = 0,
    final num base = 0,
    final num deci = 0,
    final num centi = 0,
    final num milli = 0,
  }) : _value = fromKilo(kilo.toDouble()) +
            fromHecto(hecto.toDouble()) +
            fromDeka(deka.toDouble()) +
            base.toDouble() +
            fromDeci(deci.toDouble()) +
            fromCenti(centi.toDouble()) +
            fromMilli(milli.toDouble());

  // metric
  double toKilo() => asKilo(_value);

  double toHecto() => asHecto(_value);

  double toDeka() => asDeka(_value);

  double get base => _value;

  double toDeci() => asDeci(_value);

  double toCenti() => asCenti(_value);

  double toMilli() => asMilli(_value);

  // checks
  bool get isNegative => _value.isNegative;

  bool get isFinite => _value.isFinite;

  bool get isInfinite => _value.isInfinite;

  bool get isNaN => _value.isNaN;

  static double asKilo(final double value) => value * _kiloConversion;

  static double asHecto(final double value) => value * _hectoConversion;

  static double asDeka(final double value) => value * _dekaConversion;

  static double asDeci(final double value) => value * _deciConversion;

  static double asCenti(final double value) => value * _centiConversion;

  static double asMilli(final double value) => value * _milliConversion;

  static double fromKilo(final double value) => value / _kiloConversion;

  static double fromHecto(final double value) => value / _hectoConversion;

  static double fromDeka(final double value) => value / _dekaConversion;

  static double fromDeci(final double value) => value / _deciConversion;

  static double fromCenti(final double value) => value / _centiConversion;

  static double fromMilli(final double value) => value / _milliConversion;

  final double _value;

  static final double _kiloConversion = 1e-3;
  static final double _hectoConversion = 1e-2;
  static final double _dekaConversion = 1e-1;
  static final double _deciConversion = 1e1;
  static final double _centiConversion = 1e2;
  static final double _milliConversion = 1e3;
}
