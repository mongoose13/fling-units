part of fling_units;

/// A measurement representing two simpler measurements tied together by either
/// multiplication or division.
///
/// For example, velocity can be modeled as [Distance] / [Time] and [Area] can
/// be modeled as [Distance] * [Distance].
class DerivedMeasurement<A extends Measurement<A>, B extends Measurement<B>>
    extends Measurement<DerivedMeasurement<A, B>> {
  /// The derived measurement of zero magnitude.
  const DerivedMeasurement.zero(
      final DerivedMeasurementInterpreter<A, B> interpreter)
      : _reciprocal = false,
        super.zero(interpreter);

  /// The derived measurement of infinite magnitude.
  const DerivedMeasurement.infinite(
      final DerivedMeasurementInterpreter<A, B> interpreter)
      : _reciprocal = false,
        super.infinite(interpreter);

  /// The derived measurement of negative infinite magnitude.
  const DerivedMeasurement.negativeInfinite(
      final DerivedMeasurementInterpreter<A, B> interpreter)
      : _reciprocal = false,
        super.negativeInfinite(interpreter);

  /// Constructs a derived measurement representing the multiplication of a pair
  /// of simpler measurements.
  DerivedMeasurement.multiply(final A a, final B b, [final String? name])
      : this._(
          a.si * b.si,
          Precision.combine(a._precision, b._precision),
          DerivedMeasurementInterpreter(
            a._interpreter,
            b._interpreter,
            false,
            const MeasurementPrefix.unit(),
            name,
          ),
          false,
        );

  /// Constructs a derived measurement representing the division of a pair of
  /// simpler measurements.
  DerivedMeasurement.divide(final A a, final B b, [final String? name])
      : this._(
          a.si / b.si,
          Precision.combine(a._precision, b._precision),
          DerivedMeasurementInterpreter(
            a._interpreter,
            b._interpreter,
            true,
            const MeasurementPrefix.unit(),
            name,
          ),
          true,
        );

  /// Interprets this using specific units.
  double as(final MeasurementInterpreter<A> a,
          final MeasurementInterpreter<B> b) =>
      _precise(a._of(si) * (_reciprocal ? b._from(1) : b._of(1)));

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitDerived(this);

  @override
  DerivedMeasurement<A, B> _construct(
    final double si,
    final Precision precision,
    final MeasurementInterpreter<DerivedMeasurement<A, B>> interpreter,
  ) =>
      DerivedMeasurement._(si, precision, interpreter);

  /// Constructs a derived measurement.
  const DerivedMeasurement._(
    final double si,
    final Precision precision,
    final MeasurementInterpreter<DerivedMeasurement<A, B>> interpreter, [
    this._reciprocal = false,
  ]) : super(si, precision, interpreter);

  /// Whether this has a reciprocal unit.
  final bool _reciprocal;
}

class DerivedMeasurementInterpreter<A extends Measurement<A>,
        B extends Measurement<B>>
    extends MeasurementInterpreter<DerivedMeasurement<A, B>> {
  final bool _reciprocal;
  final MeasurementInterpreter<A> _interpreterA;
  final MeasurementInterpreter<B> _interpreterB;

  DerivedMeasurementInterpreter(
    final MeasurementInterpreter<A> a,
    final MeasurementInterpreter<B> b, [
    final bool reciprocal = false,
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
    final String? name,
  ])  : _reciprocal = reciprocal,
        _interpreterA = a,
        _interpreterB = b,
        super._(
          name ?? '$a${reciprocal ? '/' : '⋅'}$b',
          reciprocal
              ? a._unitMultiplier / b._unitMultiplier
              : a._unitMultiplier * b._unitMultiplier,
          prefix,
        );

  @override
  DerivedMeasurement<A, B> call(final double value,
          {final Precision precision = Precision.max}) =>
      _reciprocal
          ? DerivedMeasurement.divide(
              _interpreterA.call(value), _interpreterB.call(value))
          : DerivedMeasurement.multiply(
              _interpreterA.call(value), _interpreterB.call(value));
}
