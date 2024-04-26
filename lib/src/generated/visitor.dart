// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package:fling_units/src/core/library.dart';

/// Base class for measurement visitors.
///
/// The [Visitor Pattern](https://en.wikipedia.org/wiki/Visitor_pattern) allows
/// for double-dispatch on an object structure so that a Visitor can operate on
/// any subset of [Measurement] types and treat each type differently without
/// needing control statements or type checks (e.g. `if`, `switch`, or `is`).
abstract class MeasurementVisitor with f.TemperatureVisitorMixin {
  visitAngle(Measurement<f.Angle> measurement) {}
  visitTime(Measurement<f.Time> measurement) {}
  visitQuantity(Measurement<f.Quantity> measurement) {}
  visitMass(Measurement<f.Mass> measurement) {}
  visitDistance(Measurement<f.Distance> measurement) {}
  visitCharge(Measurement<f.Charge> measurement) {}
  visitTemperatureChange(Measurement<f.TemperatureChange> measurement) {}
  visitPressure(Measurement<f.Pressure> measurement) {}
  visitFrequency(Measurement<f.Frequency> measurement) {}
  visitLuminosity(Measurement<f.Luminosity> measurement) {}
}
