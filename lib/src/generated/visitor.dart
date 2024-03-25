part of 'package:fling_units/src/core/library.dart';

/// Base class for measurement visitors.
///
/// The [Visitor Pattern](https://en.wikipedia.org/wiki/Visitor_pattern) allows
/// for double-dispatch on an object structure so that a Visitor can operate on
/// any subset of [Measurement] types and treat each type differently without
/// needing control statements or type checks (e.g. `if`, `switch`, or `is`).
abstract class MeasurementVisitor {
  visitDerived(DerivedMeasurement measurement) {}
  visitAngle(Angle measurement) {}
  visitTime(Time measurement) {}
  visitQuantity(Quantity measurement) {}
  visitMass(Mass measurement) {}
  visitDistance(Distance measurement) {}
  visitCharge(Charge measurement) {}
  visitTemperatureChange(TemperatureChange measurement) {}
  visitPressure(Pressure measurement) {}
  visitFrequency(Frequency measurement) {}
  visitVolume(Volume measurement) {}
  visitLuminosity(Luminosity measurement) {}
}
