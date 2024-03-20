part of '../../fling_units.dart';

/// Multiplies a [Measurement] by a prefix.
class MeasurementPrefix
    with
        AnglePrefix,
        ChargePrefix,
        DistancePrefix,
        FrequencyPrefix,
        LuminosityPrefix,
        MassPrefix,
        PressurePrefix,
        QuantityPrefix,
        TemperaturePrefix,
        TimePrefix,
        VolumePrefix {
  /// Constructs an arbitrary [MeasurementPrefix].
  const MeasurementPrefix(
    this._multiplier, {
    String name = '',
  }) : _name = name;

  /// The default prefix (equivalent to no prefix).
  const MeasurementPrefix.unit()
      : _multiplier = 1.0,
        _name = '';

  final double _multiplier;

  /// The standardized short form name of the prefix (e.g. "m" for milli).
  final String _name;

  @override
  MeasurementPrefix get _prefix => this;

  @override
  String toString() => _name;

  /// SI prefix "quecto".
  static const MeasurementPrefix _quecto = MeasurementPrefix(1e-30, name: 'q');

  /// SI prefix "ronto".
  static const MeasurementPrefix _ronto = MeasurementPrefix(1e-27, name: 'r');

  /// SI prefix "yocto".
  static const MeasurementPrefix _yocto = MeasurementPrefix(1e-24, name: 'y');

  /// SI prefix "zepto".
  static const MeasurementPrefix _zepto = MeasurementPrefix(1e-21, name: 'z');

  /// SI prefix "atto".
  static const MeasurementPrefix _atto = MeasurementPrefix(1e-18, name: 'a');

  /// SI prefix "femto".
  static const MeasurementPrefix _femto = MeasurementPrefix(1e-15, name: 'f');

  /// SI prefix "pico".
  static const MeasurementPrefix _pico = MeasurementPrefix(1e-12, name: 'p');

  /// SI prefix "nano".
  static const MeasurementPrefix _nano = MeasurementPrefix(1e-9, name: 'n');

  /// SI prefix "micro".
  static const MeasurementPrefix _micro = MeasurementPrefix(1e-6, name: 'μ');

  /// SI prefix "milli".
  static const MeasurementPrefix _milli = MeasurementPrefix(1e-3, name: 'm');

  /// SI prefix "centi".
  static const MeasurementPrefix _centi = MeasurementPrefix(1e-2, name: 'c');

  /// SI prefix "deci".
  static const MeasurementPrefix _deci = MeasurementPrefix(1e-1, name: 'd');

  /// SI prefix "deka".
  static const MeasurementPrefix _deka = MeasurementPrefix(1e1, name: 'da');

  /// SI prefix "hecto".
  static const MeasurementPrefix _hecto = MeasurementPrefix(1e2, name: 'h');

  /// SI prefix "kilo".
  static const MeasurementPrefix _kilo = MeasurementPrefix(1e3, name: 'k');

  /// SI prefix "mega".
  static const MeasurementPrefix _mega = MeasurementPrefix(1e6, name: 'M');

  /// SI prefix "giga".
  static const MeasurementPrefix _giga = MeasurementPrefix(1e9, name: 'G');

  /// SI prefix "tera".
  static const MeasurementPrefix _tera = MeasurementPrefix(1e12, name: 'T');

  /// SI prefix "peta".
  static const MeasurementPrefix _peta = MeasurementPrefix(1e15, name: 'P');

  /// SI prefix "exa".
  static const MeasurementPrefix _exa = MeasurementPrefix(1e18, name: 'E');

  /// SI prefix "zetta".
  static const MeasurementPrefix _zetta = MeasurementPrefix(1e21, name: 'Z');

  /// SI prefix "yotta".
  static const MeasurementPrefix _yotta = MeasurementPrefix(1e24, name: 'Y');

  /// SI prefix "ronna".
  static const MeasurementPrefix _ronna = MeasurementPrefix(1e27, name: 'R');

  /// SI prefix "quetta".
  static const MeasurementPrefix _quetta = MeasurementPrefix(1e30, name: 'Q');
}

/// SI prefix "quecto".
const MeasurementPrefix quecto = MeasurementPrefix._quecto;

/// SI prefix "ronto".
const MeasurementPrefix ronto = MeasurementPrefix._ronto;

/// SI prefix "yocto".
const MeasurementPrefix yocto = MeasurementPrefix._yocto;

/// SI prefix "zepto".
const MeasurementPrefix zepto = MeasurementPrefix._zepto;

/// SI prefix "atto".
const MeasurementPrefix atto = MeasurementPrefix._atto;

/// SI prefix "femto".
const MeasurementPrefix femto = MeasurementPrefix._femto;

/// SI prefix "pico".
const MeasurementPrefix pico = MeasurementPrefix._pico;

/// SI prefix "nano".
const MeasurementPrefix nano = MeasurementPrefix._nano;

/// SI prefix "micro".
const MeasurementPrefix micro = MeasurementPrefix._micro;

/// SI prefix "milli".
const MeasurementPrefix milli = MeasurementPrefix._milli;

/// SI prefix "centi".
const MeasurementPrefix centi = MeasurementPrefix._centi;

/// SI prefix "deci".
const MeasurementPrefix deci = MeasurementPrefix._deci;

/// SI prefix "deka".
const MeasurementPrefix deka = MeasurementPrefix._deka;

/// SI prefix "hecto".
const MeasurementPrefix hecto = MeasurementPrefix._hecto;

/// SI prefix "kilo".
const MeasurementPrefix kilo = MeasurementPrefix._kilo;

/// SI prefix "mega".
const MeasurementPrefix mega = MeasurementPrefix._mega;

/// SI prefix "giga".
const MeasurementPrefix giga = MeasurementPrefix._giga;

/// SI prefix "tera".
const MeasurementPrefix tera = MeasurementPrefix._tera;

/// SI prefix "peta".
const MeasurementPrefix peta = MeasurementPrefix._peta;

/// SI prefix "exa".
const MeasurementPrefix exa = MeasurementPrefix._exa;

/// SI prefix "zetta".
const MeasurementPrefix zetta = MeasurementPrefix._zetta;

/// SI prefix "yotta".
const MeasurementPrefix yotta = MeasurementPrefix._yotta;

/// SI prefix "ronna".
const MeasurementPrefix ronna = MeasurementPrefix._ronna;

/// SI prefix "quetta".
const MeasurementPrefix quetta = MeasurementPrefix._quetta;
