import 'precision.dart';

/// A generic two-dimensional measurement that can be tailored to the desired
/// units.
///
/// A "derived measurement" is one which represents two simpler measurements,
/// tied together by some operation. The most common operations are division and
/// multiplication. For example, velocity can be modeled as Distance / Time and
/// Area can be modeled as Distance * Distance.
class DerivedMeasurement<A, B> {
  /// Constructs a derived measurement from a pair of simpler measurements and a
  /// function to bind them.
  DerivedMeasurement(
      final A a, final B b, final double Function(double a, double b) function,
      {final this.precision = Precision.max})
      : _a = a,
        _b = b,
        _function = function;

  /// Constructs a derived measurement representing the multiplication of a pair
  /// of simpler measurements.
  DerivedMeasurement.multiply(final A a, final B b,
      {final precision = Precision.max})
      : this(a, b, (double a, double b) => a * b, precision: precision);

  /// Constructs a derived measurement representing the division of a pair of
  /// simpler measurements.
  DerivedMeasurement.divide(final A a, final B b,
      {final precision = Precision.max})
      : this(a, b, (double a, double b) => a / b, precision: precision);

  /// Interprets the derived measurement by binding specific units to each
  /// dimension.
  ///
  /// ```dart
  /// var fuelEfficiency = DerivedMeasurement<Distance, Volume>(distanceTraveled, gasUsed);
  /// var milesPerGallon = fuelEfficiency.as(Distance.asMiles, Volume.asGallons);
  /// ```
  double as(
          final double Function(A a) alpha, final double Function(B b) beta) =>
      precision.withPrecision(_function(alpha(_a), beta(_b)));

  /// The precision used for all measurements.
  final Precision precision;

  final A _a;
  final B _b;
  final double Function(double a, double b) _function;
}