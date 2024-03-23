part of '../../fling_units.dart';

/// Interprets [Area]s as a specific unit.
class AreaInterpreter extends MeasurementInterpreter<Area> {
  @override
  Area call(double value, {Precision precision = Precision.max}) =>
      Area(value, this, precision);

  /// Constructs an [AreaInterpreter] from any two [DistanceInterpreter]s.
  AreaInterpreter(
    MeasurementInterpreter<Distance> a,
    MeasurementInterpreter<Distance> b, {
    String? name,
  }) : this._(name ?? '${a.toString()}⋅${b.toString()}', a, b);

  /// Constructs an [AreaInterpreter] that will square a basic
  /// [DistanceInterpreter].
  AreaInterpreter.squared(
    MeasurementInterpreter<Distance> a, {
    String? name,
  }) : this._(name ?? '${a.name}²', a, a);

  /// Constructs an [AreaInterpreter].
  AreaInterpreter._(
    String name,
    MeasurementInterpreter<Distance> a,
    MeasurementInterpreter<Distance> b,
  ) : super._(
          name,
          a.unitMultiplier * b.unitMultiplier / b.prefix._multiplier,
          a.prefix,
        );

  /// Constructs the SI derived area unit, square meters.
  const AreaInterpreter._m2()
      : super._('m²', 1.0, const MeasurementPrefix.unit());
}

/// Represents the two-dimensional derived unit of perpendicular distances.
class Area extends Measurement<Area> {
  /// Produces an interpreter for the square of a provided distance interpreter.
  static AreaInterpreter square(
          MeasurementInterpreter<Distance> distanceInterpreter) =>
      AreaInterpreter.squared(distanceInterpreter);

  /// Represents an area of size zero.
  const Area.zero(
      [AreaInterpreter super.interpreter = const AreaInterpreter._m2()])
      : super.zero();

  /// Infinite area.
  const Area.infinite(
      [AreaInterpreter super.interpreter = const AreaInterpreter._m2()])
      : super.infinite();

  /// Infinite negative area.
  const Area.negativeInfinite(
      [AreaInterpreter super.interpreter = const AreaInterpreter._m2()])
      : super.negativeInfinite();

  /// NaN (Not a Number) area.
  const Area.nan([super.interpreter = const AreaInterpreter._m2()])
      : super.nan();

  /// Constructs an [Area] from component parts.
  Area.of(Distance a, Distance b)
      : this(
          a.defaultValue * b.defaultValue,
          AreaInterpreter._m2(),
          Precision.combine([a._precision, b._precision]),
        );

  /// Constructs an [Area] representing the sum of any number of other [Area]s.
  Area.sum(super.parts, {super.precision}) : super.sum();

  /// Interprets this [Measurement] in the specified units.
  double as(
    MeasurementInterpreter<Distance> a,
    MeasurementInterpreter<Distance> b,
  ) =>
      _precise(a.of(b.of(si)));

  /// Interprets this using the specified [MeasurementInterpreter].
  double asArea(MeasurementInterpreter<Area> a) => _precise(a.of(si));

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitArea(this);

  @override
  Area construct(
    double amount,
    MeasurementInterpreter<Area>? interpreter,
    Precision precision,
  ) =>
      Area(amount, interpreter ?? AreaInterpreter._m2(), precision);

  /// Constructs an [Area].
  Area(
    num squareMeters,
    MeasurementInterpreter<Area> interpreter, [
    Precision precision = Precision.max,
  ]) : super(
          amount: squareMeters,
          precision: precision,
          interpreter: interpreter,
        );
}
