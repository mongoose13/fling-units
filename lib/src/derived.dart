part of fling_units;

/// A measurement representing two simpler measurements tied together by either
/// multiplication or division.
///
/// For example, velocity can be modeled as [Distance] / [Time] and [Area] can
/// be modeled as [Distance] * [Distance].
class DerivedMeasurement<A extends Measurement<A>, B extends Measurement<B>>
    extends Measurement<DerivedMeasurement<A, B>> {
  /// The derived measurement of zero magnitude.
  const DerivedMeasurement.zero()
      : _reciprocal = false,
        super.zero();

  /// The derived measurement of infinite magnitude.
  const DerivedMeasurement.infinite()
      : _reciprocal = false,
        super.infinite();

  /// The derived measurement of negative infinite magnitude.
  const DerivedMeasurement.negativeInfinite()
      : _reciprocal = false,
        super.negativeInfinite();

  /// Constructs a derived measurement representing the multiplication of a pair
  /// of simpler measurements.
  DerivedMeasurement.multiply(final A a, final B b)
      : this._(a.si * b.si, Precision.combine(a._precision, b._precision));

  /// Constructs a derived measurement representing the division of a pair of
  /// simpler measurements.
  DerivedMeasurement.divide(final A a, final B b)
      : this._(
            a.si / b.si, Precision.combine(a._precision, b._precision), true);

  /// Interprets this using specific units.
  double as(final MeasurementInterpreter<A> a,
          final MeasurementInterpreter<B> b) =>
      _precise(a._of(si) * (_reciprocal ? b._from(1) : b._of(1)));

  @override
  DerivedMeasurement<A, B> _construct(
          final double si, final Precision precision) =>
      DerivedMeasurement._(si, precision);

  /// Constructs a derived measurement.
  DerivedMeasurement._(final double si, final Precision precision,
      [this._reciprocal = false])
      : super(si, precision);

  /// Whether this has a reciprocal unit.
  final bool _reciprocal;
}