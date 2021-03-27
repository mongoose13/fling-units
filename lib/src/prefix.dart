part of fling_units;

/// Multiplies a [Measurement] by a prefix.
class MeasurementPrefix
    with
        ChargePrefix,
        DistancePrefix,
        LuminosityPrefix,
        MassPrefix,
        QuantityPrefix,
        TemperaturePrefix,
        TimePrefix,
        VolumePrefix {
  /// Constructs an arbitrary [MeasurementPrefix].
  const MeasurementPrefix(final this._multiplier);

  /// The configured multiplier.
  @override
  final double _multiplier;
}

/// SI prefix "yocto".
final MeasurementPrefix yocto = MeasurementPrefix(1e-24);

/// SI prefix "zepto".
final MeasurementPrefix zepto = MeasurementPrefix(1e-21);

/// SI prefix "atto".
final MeasurementPrefix atto = MeasurementPrefix(1e-18);

/// SI prefix "femto".
final MeasurementPrefix femto = MeasurementPrefix(1e-15);

/// SI prefix "pico".
final MeasurementPrefix pico = MeasurementPrefix(1e-12);

/// SI prefix "nano".
final MeasurementPrefix nano = MeasurementPrefix(1e-9);

/// SI prefix "micro".
final MeasurementPrefix micro = MeasurementPrefix(1e-6);

/// SI prefix "milli".
final MeasurementPrefix milli = MeasurementPrefix(1e-3);

/// SI prefix "centi".
final MeasurementPrefix centi = MeasurementPrefix(1e-2);

/// SI prefix "deci".
final MeasurementPrefix deci = MeasurementPrefix(1e-1);

/// SI prefix "deka".
final MeasurementPrefix deka = MeasurementPrefix(1e1);

/// SI prefix "hecto".
final MeasurementPrefix hecto = MeasurementPrefix(1e2);

/// SI prefix "kilo".
final MeasurementPrefix kilo = MeasurementPrefix(1e3);

/// SI prefix "mega".
final MeasurementPrefix mega = MeasurementPrefix(1e6);

/// SI prefix "giga".
final MeasurementPrefix giga = MeasurementPrefix(1e9);

/// SI prefix "tera".
final MeasurementPrefix tera = MeasurementPrefix(1e12);

/// SI prefix "peta".
final MeasurementPrefix peta = MeasurementPrefix(1e15);

/// SI prefix "exa".
final MeasurementPrefix exa = MeasurementPrefix(1e18);

/// SI prefix "zetta".
final MeasurementPrefix zetta = MeasurementPrefix(1e21);

/// SI prefix "yotta".
final MeasurementPrefix yotta = MeasurementPrefix(1e24);
