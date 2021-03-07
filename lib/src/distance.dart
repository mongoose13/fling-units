/// Unit conversion system for distances.
///
/// Distances measure a single dimension. The value can be negative, indicating
/// a different direction than the one implied (e.g. "-10 meters to the East"
/// would be equivalent to "10 meters to the West") and can occur when comparing
/// smaller to larger distances (e.g. "How much further is the moon than the
/// sun?"). This is also known as "displacement".
///
/// The actual unit used is abstracted, so an instance of Distance does not
/// inherently represent any particular unit (e.g. "kilometers" or "light
/// years") but can be interpreted as a value with any distance unit you like.
/// For instance, given a Distance instance, I could choose to read it in
/// kilometers or in inches, depending on my needs.
///
/// Because unit conversions ("interpretations") require computation, it is
/// recommended to save off conversion results rather than performing the
/// computation multiple times (e.g. calling 'distance.millimeters' twice).
class Distance implements Comparable<Distance> {
  /// A null distance, representing no distance between two points.
  const Distance.zero() : _meters = 0.0;

  /// Infinite distance.
  const Distance.infinity() : _meters = double.infinity;

  /// Infinite distance in the opposite direction.
  const Distance.negativeInfinity() : _meters = double.negativeInfinity;

  /// Construct a Distance from any number of partial metric amounts.
  ///
  /// The resulting Distance will represent the sum of the parts.
  Distance.metric({
    final num millimeters = 0,
    final num centimeters = 0,
    final num decimeters = 0,
    final num meters = 0,
    final num dekameters = 0,
    final num hectometers = 0,
    final num kilometers = 0,
  }) : _meters = millimeters.toDouble() / _millimeterConversion +
            centimeters.toDouble() / _centimeterConversion +
            decimeters.toDouble() / _decimeterConversion +
            meters.toDouble() +
            dekameters.toDouble() / _dekameterConversion +
            hectometers.toDouble() / _hectometerConversion +
            kilometers.toDouble() / _kilometerConversion;

  /// Construct a Distance from any number of partial Imperial amounts.
  ///
  /// The resulting Distance will represent the sum of the parts.
  Distance.imperial({
    final num miles = 0,
    final num yards = 0,
    final num feet = 0,
    final num inches = 0,
  }) : _meters = miles.toDouble() / _mileConversion +
            yards.toDouble() / _yardConversion +
            feet.toDouble() / _footConversion +
            inches.toDouble() / _inchConversion;

  /// Construct a Distance from a millimeter amount.
  Distance.millimeters(final num millimeters)
      : _meters = millimeters.toDouble() / _millimeterConversion;

  /// Construct a Distance from a centimeter amount.
  Distance.centimeters(final num centimeters)
      : _meters = centimeters.toDouble() / _centimeterConversion;

  /// Construct a Distance from a decimeter amount.
  Distance.decimeters(final num decimeters)
      : _meters = decimeters.toDouble() / _decimeterConversion;

  /// Construct a Distance from a meter amount.
  Distance.meters(final num meters) : _meters = meters.toDouble();

  /// Construct a Distance from a dekameter amount.
  Distance.dekameters(final num dekameters)
      : _meters = dekameters.toDouble() / _dekameterConversion;

  /// Construct a Distance from a hectometer amount.
  Distance.hectometers(final num hectometers)
      : _meters = hectometers.toDouble() / _hectometerConversion;

  /// Construct a Distance from a kilometer amount.
  Distance.kilometers(final num kilometers)
      : _meters = kilometers.toDouble() / _kilometerConversion;

  /// Construct a Distance from a mile amount.
  Distance.miles(final num miles)
      : _meters = miles.toDouble() / _mileConversion;

  /// Construct a Distance from a yard amount.
  Distance.yards(final num yards)
      : _meters = yards.toDouble() / _yardConversion;

  /// Construct a Distance from a foot amount.
  Distance.feet(final num feet) : _meters = feet.toDouble() / _footConversion;

  /// Construct a Distance from an inch amount.
  Distance.inches(final num inches)
      : _meters = inches.toDouble() / _inchConversion;

  /// Construct a Distance from a nautical mile amount.
  Distance.nauticalMiles(final num nauticalMiles)
      : _meters = nauticalMiles.toDouble() / _nauticalMileConversion;

  /// Interpret this distance as a number of millimeters.
  double get millimeters => _meters * _millimeterConversion;

  /// Interpret this distance as a number of centimeters.
  double get centimeters => _meters * _centimeterConversion;

  /// Interpret this distance as a number of decimeters.
  double get decimeters => _meters * _decimeterConversion;

  /// Interpret this distance as a number of meters.
  double get meters => _meters;

  /// Interpret this distance as a number of dekameters.
  double get dekameters => _meters * _dekameterConversion;

  /// Interpret this distance as a number of hectometers.
  double get hectometers => _meters * _hectometerConversion;

  /// Interpret this distance as a number of kilometers.
  double get kilometers => _meters * _kilometerConversion;

  /// Interpret this distance as a number of miles.
  double get miles => _meters * _mileConversion;

  /// Interpret this distance as a number of yards.
  double get yards => _meters * _yardConversion;

  /// Interpret this distance as a number of feet.
  double get feet => _meters * _footConversion;

  /// Interpret this distance as a number of inches.
  double get inches => _meters * _inchConversion;

  /// Interpret this distance as a number of nautical miles.
  double get nauticalMiles => _meters * _nauticalMileConversion;

  /// Returns whether this Distance represents a negative amount.
  bool get isNegative => _meters.isNegative;

  /// Returns whether this Distance represents a finite amount.
  bool get isFinite => _meters.isFinite;

  /// Returns whether this Distance represents an infinite amount (positive or
  /// negative).
  bool get isInfinite => _meters.isInfinite;

  /// Whether this distance is not a number.
  bool get isNaN => _meters.isNaN;

  @override
  bool operator ==(final dynamic other) =>
      other is Distance && other._meters == _meters;

  @override
  int get hashCode => _meters.hashCode;

  /// Compares this Distance to another Distance, returning true if this
  /// Distance is larger than the other Distance, or false otherwise.
  bool operator >(final Distance other) => _meters > other._meters;

  /// Compares this Distance to another Distance, returning true if this
  /// Distance is larger than or equal to the other Distance, or false
  /// otherwise.
  bool operator >=(final Distance other) => _meters >= other._meters;

  /// Compares this Distance to another Distance, returning true if this
  /// Distance is smaller than the other Distance, or false otherwise.
  bool operator <(final Distance other) => _meters < other._meters;

  /// Compares this Distance to another Distance, returning true if this
  /// Distance is smaller than or equal to the other Distance, or false
  /// otherwise.
  bool operator <=(final Distance other) => _meters <= other._meters;

  @override
  int compareTo(final Distance other) => _meters.compareTo(other.meters);

  /// Add two Distances together to produce a third Distance. The resulting
  /// Distance is equivalent to the sum of the two input Distances. Negative
  /// Distances may cancel out.
  ///
  /// Distance.meters(2) + Distance.zero() == Distance.meters(2)
  /// Distance.meters(2) + Distance.meters(3) == Distance.meters(5)
  /// Distance.meters(2) + Distance.meters(-3) == Distance.meters(-1)
  Distance operator +(final Distance other) =>
      Distance.meters(_meters + other._meters);

  /// Subtract two Distances to produce a third Distance. The resulting
  /// Distance is equivalent to the difference between the two input Distances.
  /// The resulting Distance's sign will be inverted if a larger Distance is
  /// subtracted from a smaller Distance.
  ///
  /// Distance.meters(3) - Distance.zero() == Distance.meters(3)
  /// Distance.meters(5) - Distance.meters(3) == Distance.meters(2)
  /// Distance.meters(3) - Distance.meters(5) == Distance.meters(-2)
  /// Distance.meters(3) - Distance.meters(-5) == Distance.meters(8)
  Distance operator -(final Distance other) =>
      Distance.meters(_meters - other._meters);

  /// Multiply a Distance by a scalar to produce a new Distance that is a
  /// multiple of the original Distance. As you might expect, multiplying by a
  /// negative value inverts the resulting Distance.
  ///
  /// Distance.meters(3) * 1 == Distance.meters(3)
  /// Distance.meters(3) * 0 == Distance.zero()
  /// Distance.meters(3) * 2 == Distance.meters(6)
  /// Distance.meters(3) * -2 == Distance.meters(-6)
  Distance operator *(final num multiplier) =>
      Distance.meters(_meters * multiplier);

  /// Divide a Distance by a scalar to produce a new Distance that is a fraction
  /// of the original Distance. As you might expect, dividing by a negative
  /// value inverts the resulting Distance.
  ///
  /// Distance.meters(6) / 1 == Distance.meters(6)
  /// Distance.meters(6) / 2 == Distance.meters(3)
  /// Distance.meters(6) / -2 == Distance.meters(-3)
  /// Distance.meters(6) / 0 == Distance.infinity()
  Distance operator /(final num divisor) => Distance.meters(_meters / divisor);

  @override
  String toString() => '${_meters.toString()} m';

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

  final double _meters;
}
