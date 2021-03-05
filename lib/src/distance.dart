class Distance {
  final double _meters;

  static final double _millimeterConversion = 1e3;
  static final double _centimeterConversion = 1e2;
  static final double _decimeterConversion = 1e1;
  static final double _dekameterConversion = 1e-1;
  static final double _hectometerConversion = 1e-2;
  static final double _kilometerConversion = 1e-3;

  static final double _mileConversion = 0.000621371;
  static final double _yardConversion = 1.09361;
  static final double _footConversion = 3.28084;
  static final double _inchConversion = 39.3701;
  static final double _nauticalMileConversion = 0.000539957;

  Distance.zero() : _meters = 0.0;

  Distance.infinity() : _meters = double.infinity;

  Distance.negativeInfinity() : _meters = double.negativeInfinity;

  Distance.millimeters(final num millimeters)
      : _meters = millimeters.toDouble() / _millimeterConversion;

  Distance.centimeters(final num centimeters)
      : _meters = centimeters.toDouble() / _centimeterConversion;

  Distance.decimeters(final num decimeters)
      : _meters = decimeters.toDouble() / _decimeterConversion;

  Distance.meters(final this._meters);

  Distance.dekameters(final num dekameters)
      : _meters = dekameters.toDouble() / _dekameterConversion;

  Distance.hectometers(final num hectometers)
      : _meters = hectometers.toDouble() / _hectometerConversion;

  Distance.kilometers(final num kilometers)
      : _meters = kilometers.toDouble() / _kilometerConversion;

  Distance.miles(final num miles)
      : _meters = miles.toDouble() / _mileConversion;

  Distance.yards(final num yards)
      : _meters = yards.toDouble() / _yardConversion;

  Distance.feet(final num feet) : _meters = feet.toDouble() / _footConversion;

  Distance.inches(final num inches)
      : _meters = inches.toDouble() / _inchConversion;

  Distance.nauticalMiles(final num nauticalMiles)
      : _meters = nauticalMiles.toDouble() / _nauticalMileConversion;

  double get millimeters => _meters * _millimeterConversion;

  double get centimeters => _meters * _centimeterConversion;

  double get decimeters => _meters * _decimeterConversion;

  double get meters => _meters;

  double get dekameters => _meters * _dekameterConversion;

  double get hectometers => _meters * _hectometerConversion;

  double get kilometers => _meters * _kilometerConversion;

  double get miles => _meters * _mileConversion;

  double get yards => _meters * _yardConversion;

  double get feet => _meters * _footConversion;

  double get inches => _meters * _inchConversion;

  double get nauticalMiles => _meters * _nauticalMileConversion;

  @override
  bool operator ==(final dynamic other) =>
      other is Distance && other._meters == _meters;

  @override
  int get hashCode => _meters.hashCode;

  Distance operator +(final Distance other) =>
      Distance.meters(_meters + other._meters);

  Distance operator -(final Distance other) =>
      Distance.meters(_meters - other._meters);

  Distance operator *(final double multiplier) =>
      Distance.meters(_meters * multiplier);

  Distance operator /(final double divisor) =>
      Distance.meters(_meters / divisor);

  @override
  String toString() => '${_meters.toString()} m';
}