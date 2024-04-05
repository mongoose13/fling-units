import "package:fling_units/fling_units.dart";

/// Interprets [Area]s as a specific unit.
class AreaUnit extends Unit<Area> {
  @override
  Area call(double value, {Precision precision = Precision.max}) =>
      Area(value, this, precision);

  /// Constructs an [AreaUnit] from any two [DistanceUnit]s.
  AreaUnit(
    Unit<Distance> a,
    Unit<Distance> b, {
    String? name,
  }) : this._(name ?? '${a.toString()}⋅${b.toString()}', a, b);

  /// Constructs an [AreaUnit] that will square a basic
  /// [DistanceUnit].
  AreaUnit.squared(
    Unit<Distance> a, {
    String? name,
  }) : this._(name ?? '${a.name}²', a, a);

  /// Constructs an [AreaUnit].
  AreaUnit._(
    String name,
    Unit<Distance> a,
    Unit<Distance> b,
  ) : super(
          name,
          a.unitMultiplier * b.unitMultiplier / b.prefix.unitMultiplier,
          a.prefix,
        );

  /// Constructs the SI derived area unit, square meters.
  const AreaUnit._m2() : super('m²', 1.0, const MeasurementPrefix.unit());
}

/// Represents the two-dimensional derived unit of perpendicular distances.
class Area extends Measurement<Area> {
  /// Produces an interpreter for the square of a provided distance interpreter.
  static AreaUnit square(Unit<Distance> distanceUnit) =>
      AreaUnit.squared(distanceUnit);

  /// Represents an area of size zero.
  const Area.zero([AreaUnit super.interpreter = const AreaUnit._m2()])
      : super.zero();

  /// Infinite area.
  const Area.infinite([AreaUnit super.interpreter = const AreaUnit._m2()])
      : super.infinite();

  /// Infinite negative area.
  const Area.negativeInfinite(
      [AreaUnit super.interpreter = const AreaUnit._m2()])
      : super.negativeInfinite();

  /// NaN (Not a Number) area.
  const Area.nan([super.interpreter = const AreaUnit._m2()]) : super.nan();

  /// Constructs an [Area] from component parts.
  Area.of(Distance a, Distance b)
      : this(
          a.defaultValue * b.defaultValue,
          AreaUnit._m2(),
          Precision.combine([a.precisionData, b.precisionData]),
        );

  /// Constructs an [Area] representing the sum of any number of other [Area]s.
  Area.sum(super.parts, {super.precision}) : super.sum();

  @override
  DerivedMeasurementBuilder<Area> get per => DerivedMeasurementBuilder(this);

  /// Interprets this [Measurement] in the specified units.
  double asPair(
    Unit<Distance> a,
    Unit<Distance> b,
  ) =>
      precisionData.apply(a.of(b.of(si)));

  /// Interprets this using the specified [Unit].
  double asArea(Unit<Area> a) => precisionData.apply(a.of(si));

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitArea(this);

  @override
  Area construct(
    double amount,
    Unit<Area>? interpreter,
    Precision precision,
  ) =>
      Area(amount, interpreter ?? AreaUnit._m2(), precision);

  /// Constructs an [Area].
  Area(
    num squareMeters,
    Unit<Area> interpreter, [
    Precision precision = Precision.max,
  ]) : super(
          amount: squareMeters,
          precision: precision,
          interpreter: interpreter,
        );
}

mixin AreaVisitorMixin {
  void visitArea(Area area) {}
}
