part of fling_units;

/// Multiplies a [Measurement] by a prefix.
class MeasurementPrefix
    with
        AnglePrefix,
        ChargePrefix,
        DistancePrefix,
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
    final String name = '',
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
  static final MeasurementPrefix _quecto =
      const MeasurementPrefix(1e-30, name: 'q');

  /// SI prefix "ronto".
  static final MeasurementPrefix _ronto =
      const MeasurementPrefix(1e-27, name: 'r');

  /// SI prefix "yocto".
  static final MeasurementPrefix _yocto =
      const MeasurementPrefix(1e-24, name: 'y');

  /// SI prefix "zepto".
  static final MeasurementPrefix _zepto =
      const MeasurementPrefix(1e-21, name: 'z');

  /// SI prefix "atto".
  static final MeasurementPrefix _atto =
      const MeasurementPrefix(1e-18, name: 'a');

  /// SI prefix "femto".
  static final MeasurementPrefix _femto =
      const MeasurementPrefix(1e-15, name: 'f');

  /// SI prefix "pico".
  static final MeasurementPrefix _pico =
      const MeasurementPrefix(1e-12, name: 'p');

  /// SI prefix "nano".
  static final MeasurementPrefix _nano =
      const MeasurementPrefix(1e-9, name: 'n');

  /// SI prefix "micro".
  static final MeasurementPrefix _micro =
      const MeasurementPrefix(1e-6, name: 'μ');

  /// SI prefix "milli".
  static final MeasurementPrefix _milli =
      const MeasurementPrefix(1e-3, name: 'm');

  /// SI prefix "centi".
  static final MeasurementPrefix _centi =
      const MeasurementPrefix(1e-2, name: 'c');

  /// SI prefix "deci".
  static final MeasurementPrefix _deci =
      const MeasurementPrefix(1e-1, name: 'd');

  /// SI prefix "deka".
  static final MeasurementPrefix _deka =
      const MeasurementPrefix(1e1, name: 'da');

  /// SI prefix "hecto".
  static final MeasurementPrefix _hecto =
      const MeasurementPrefix(1e2, name: 'h');

  /// SI prefix "kilo".
  static final MeasurementPrefix _kilo =
      const MeasurementPrefix(1e3, name: 'k');

  /// SI prefix "mega".
  static final MeasurementPrefix _mega =
      const MeasurementPrefix(1e6, name: 'M');

  /// SI prefix "giga".
  static final MeasurementPrefix _giga =
      const MeasurementPrefix(1e9, name: 'G');

  /// SI prefix "tera".
  static final MeasurementPrefix _tera =
      const MeasurementPrefix(1e12, name: 'T');

  /// SI prefix "peta".
  static final MeasurementPrefix _peta =
      const MeasurementPrefix(1e15, name: 'P');

  /// SI prefix "exa".
  static final MeasurementPrefix _exa =
      const MeasurementPrefix(1e18, name: 'E');

  /// SI prefix "zetta".
  static final MeasurementPrefix _zetta =
      const MeasurementPrefix(1e21, name: 'Z');

  /// SI prefix "yotta".
  static final MeasurementPrefix _yotta =
      const MeasurementPrefix(1e24, name: 'Y');

  /// SI prefix "ronna".
  static final MeasurementPrefix _ronna =
      const MeasurementPrefix(1e27, name: 'R');

  /// SI prefix "quetta".
  static final MeasurementPrefix _quetta =
      const MeasurementPrefix(1e30, name: 'Q');
}

/// SI prefix "quecto".
final MeasurementPrefix quecto = MeasurementPrefix._quecto;

/// SI prefix "ronto".
final MeasurementPrefix ronto = MeasurementPrefix._ronto;

/// SI prefix "yocto".
final MeasurementPrefix yocto = MeasurementPrefix._yocto;

/// SI prefix "zepto".
final MeasurementPrefix zepto = MeasurementPrefix._zepto;

/// SI prefix "atto".
final MeasurementPrefix atto = MeasurementPrefix._atto;

/// SI prefix "femto".
final MeasurementPrefix femto = MeasurementPrefix._femto;

/// SI prefix "pico".
final MeasurementPrefix pico = MeasurementPrefix._pico;

/// SI prefix "nano".
final MeasurementPrefix nano = MeasurementPrefix._nano;

/// SI prefix "micro".
final MeasurementPrefix micro = MeasurementPrefix._micro;

/// SI prefix "milli".
final MeasurementPrefix milli = MeasurementPrefix._milli;

/// SI prefix "centi".
final MeasurementPrefix centi = MeasurementPrefix._centi;

/// SI prefix "deci".
final MeasurementPrefix deci = MeasurementPrefix._deci;

/// SI prefix "deka".
final MeasurementPrefix deka = MeasurementPrefix._deka;

/// SI prefix "hecto".
final MeasurementPrefix hecto = MeasurementPrefix._hecto;

/// SI prefix "kilo".
final MeasurementPrefix kilo = MeasurementPrefix._kilo;

/// SI prefix "mega".
final MeasurementPrefix mega = MeasurementPrefix._mega;

/// SI prefix "giga".
final MeasurementPrefix giga = MeasurementPrefix._giga;

/// SI prefix "tera".
final MeasurementPrefix tera = MeasurementPrefix._tera;

/// SI prefix "peta".
final MeasurementPrefix peta = MeasurementPrefix._peta;

/// SI prefix "exa".
final MeasurementPrefix exa = MeasurementPrefix._exa;

/// SI prefix "zetta".
final MeasurementPrefix zetta = MeasurementPrefix._zetta;

/// SI prefix "yotta".
final MeasurementPrefix yotta = MeasurementPrefix._yotta;

/// SI prefix "ronna".
final MeasurementPrefix ronna = MeasurementPrefix._ronna;

/// SI prefix "quetta".
final MeasurementPrefix quetta = MeasurementPrefix._quetta;
