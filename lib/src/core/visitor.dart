part of fling_units;

/// Base class for measurement visitors.
///
/// The [Visitor Pattern](https://en.wikipedia.org/wiki/Visitor_pattern) allows
/// for double-dispatch on an object structure so that a Visitor can operate on
/// any subset of [Measurement] types and treat each type differently without
/// needing control statements or type checks (e.g. `if`, `switch`, or `is`).
abstract class MeasurementVisitor {
  /// Visit an [Area].
  void visitArea(final Area area) {}

  /// Visit a [Charge].
  void visitCharge(final Charge charge) {}

  /// Visit a derived measurement.
  void visitDerived(final DerivedMeasurement measurement) {}

  /// Visit a [Distance].
  void visitDistance(final Distance distance) {}

  /// Visit a [Luminosity].
  void visitLuminosity(final Luminosity luminosity) {}

  /// Visit a [Mass].
  void visitMass(final Mass mass) {}

  /// Visit a [Quantity].
  void visitQuantity(final Quantity quantity) {}

  /// Visit a [Temperature].
  void visitTemperature(final Temperature temperature) {}

  /// Visit a [TemperatureChange].
  void visitTemperatureChange(final TemperatureChange temperatureChange) {}

  /// Visit a [Time].
  void visitTime(final Time time) {}

  /// Visit a [Volume].
  void visitVolume(final Volume volume) {}

  /// Visit a [Pressure].
  void visitPressure(final Pressure pressure) {}

  /// Visit an [Angle].
  void visitAngle(final Angle angle) {}
}
