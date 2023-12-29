part of '../../fling_units.dart';

/// Base class for measurement visitors.
///
/// The [Visitor Pattern](https://en.wikipedia.org/wiki/Visitor_pattern) allows
/// for double-dispatch on an object structure so that a Visitor can operate on
/// any subset of [Measurement] types and treat each type differently without
/// needing control statements or type checks (e.g. `if`, `switch`, or `is`).
abstract class MeasurementVisitor {
  /// Visit an [Area].
  void visitArea(Area area) {}

  /// Visit a [Charge].
  void visitCharge(Charge charge) {}

  /// Visit a derived measurement.
  void visitDerived(DerivedMeasurement measurement) {}

  /// Visit a [Distance].
  void visitDistance(Distance distance) {}

  /// Visit a [Luminosity].
  void visitLuminosity(Luminosity luminosity) {}

  /// Visit a [Mass].
  void visitMass(Mass mass) {}

  /// Visit a [Quantity].
  void visitQuantity(Quantity quantity) {}

  /// Visit a [Temperature].
  void visitTemperature(Temperature temperature) {}

  /// Visit a [TemperatureChange].
  void visitTemperatureChange(TemperatureChange temperatureChange) {}

  /// Visit a [Time].
  void visitTime(Time time) {}

  /// Visit a [Volume].
  void visitVolume(Volume volume) {}

  /// Visit a [Pressure].
  void visitPressure(Pressure pressure) {}

  /// Visit an [Angle].
  void visitAngle(Angle angle) {}
}
