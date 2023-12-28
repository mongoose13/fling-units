part of '../../fling_units.dart';

/// Interprets [Area]s as a specific unit.
class AreaInterpreter extends MeasurementInterpreter<Area> {
  @override
  Area call(final double value, {final Precision precision = Precision.max}) =>
      Area(value, this, precision);

  /// Constructs an [AreaInterpreter] from any two [DistanceInterpreter]s.
  AreaInterpreter(
    final MeasurementInterpreter<Distance> a,
    final MeasurementInterpreter<Distance> b, {
    final String? name,
  }) : this._(name ?? '${a.toString()}⋅${b.toString()}', a, b);

  /// Constructs an [AreaInterpreter] that will square a basic
  /// [DistanceInterpreter].
  AreaInterpreter.squared(
    final MeasurementInterpreter<Distance> a, {
    final String? name,
  }) : this._(name ?? '${a._name}²', a, a);

  /// Constructs an [AreaInterpreter].
  AreaInterpreter._(
    final String name,
    final MeasurementInterpreter<Distance> a,
    final MeasurementInterpreter<Distance> b,
  ) : super._(
          name,
          a._unitMultiplier * b._unitMultiplier / b._prefix._multiplier,
          a._prefix,
        );

  /// Constructs the SI derived area unit, square meters.
  const AreaInterpreter._m2()
      : super._('m²', 1.0, const MeasurementPrefix.unit());
}

/// Represents the two-dimensional derived unit of perpendicular distances.
class Area extends Measurement<Area> {
  /// Produces an interpreter for the square of a provided distance interpreter.
  static AreaInterpreter square(
          final MeasurementInterpreter<Distance> distanceInterpreter) =>
      AreaInterpreter.squared(distanceInterpreter);

  /// Represents an area of size zero.
  const Area.zero(
      [final AreaInterpreter interpreter = const AreaInterpreter._m2()])
      : super.zero(interpreter);

  /// Infinite area.
  const Area.infinite(
      [final AreaInterpreter interpreter = const AreaInterpreter._m2()])
      : super.infinite(interpreter);

  /// Infinite negative area.
  const Area.negativeInfinite(
      [final AreaInterpreter interpreter = const AreaInterpreter._m2()])
      : super.negativeInfinite(interpreter);

  /// Constructs an [Area] from component parts.
  Area.of(final Distance a, final Distance b)
      : this(
          a.defaultValue * b.defaultValue,
          AreaInterpreter._m2(),
          Precision.combine([a._precision, b._precision]),
        );

  /// Constructs an [Area] representing the sum of any number of other [Area]s.
  Area.sum(final Iterable<Area> parts,
      {final Precision precision = Precision.max})
      : super.sum(parts, precision: precision);

  /// Interprets this [Measurement] in the specified units.
  double as(
    final MeasurementInterpreter<Distance> a,
    final MeasurementInterpreter<Distance> b,
  ) =>
      _precise(a._of(b._of(si)));

  /// Interprets this using the specified [MeasurementInterpreter].
  double asArea(final MeasurementInterpreter<Area> a) => _precise(a._of(si));

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitArea(this);

  @override
  Area _construct(
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
