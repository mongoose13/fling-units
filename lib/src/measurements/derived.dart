part of '../../fling_units.dart';

/// A measurement representing two simpler measurements tied together by either
/// multiplication or division.
///
/// For example, velocity can be modeled as [Distance] / [Time] and [Area] can
/// be modeled as [Distance] * [Distance].
class DerivedMeasurement<A extends Measurement<A>, B extends Measurement<B>>
    extends Measurement<DerivedMeasurement<A, B>> {
  /// The derived measurement of zero magnitude.
  const DerivedMeasurement.zero(
      [final DerivedMeasurementInterpreter<A, B>? interpreter])
      : _reciprocal = false,
        super.zero(interpreter);

  /// The derived measurement of infinite magnitude.
  const DerivedMeasurement.infinite(
      [final DerivedMeasurementInterpreter<A, B>? interpreter])
      : _reciprocal = false,
        super.infinite(interpreter);

  /// The derived measurement of negative infinite magnitude.
  const DerivedMeasurement.negativeInfinite(
      [final DerivedMeasurementInterpreter<A, B>? interpreter])
      : _reciprocal = false,
        super.negativeInfinite(interpreter);

  /// Constructs a derived measurement representing the multiplication of a pair
  /// of simpler measurements.
  DerivedMeasurement.multiply(final A a, final B b, [final String? name])
      : this._combine(
            a.si * b.si,
            Precision.combine(a._precision, b._precision),
            a.defaultInterpreter,
            b.defaultInterpreter,
            false,
            name);

  /// Constructs a derived measurement representing the division of a pair of
  /// simpler measurements.
  DerivedMeasurement.divide(final A a, final B b, [final String? name])
      : this._combine(
            a.si / b.si,
            Precision.combine(a._precision, b._precision),
            a.defaultInterpreter,
            b.defaultInterpreter,
            true,
            name);

  /// Creates a derived measurement representing a pair of simpler units.
  DerivedMeasurement._combine(double value, Precision precision,
      [final MeasurementInterpreter<A>? a,
      final MeasurementInterpreter<B>? b,
      final bool reciprocal = false,
      final String? name])
      : this._(
            value,
            precision,
            DerivedMeasurementInterpreter._unitless(
              a,
              b,
              reciprocal,
              const MeasurementPrefix.unit(),
              name,
            ),
            reciprocal);

  /// Interprets this using two specific units.
  double as(final MeasurementInterpreter<A> a,
          final MeasurementInterpreter<B> b) =>
      _precise(a._of(si) * (_reciprocal ? b._from(1) : b._of(1)));

  /// Interprets this using a [DerivedMeasurementInterpreter].
  double asInterpretedBy(
          final DerivedMeasurementInterpreter<A, B> interpreter) =>
      _precise(interpreter._of(si));

  @override
  void acceptVisitor(final MeasurementVisitor visitor) =>
      visitor.visitDerived(this);

  @override
  DerivedMeasurement<A, B> _construct(
    final double si,
    final Precision precision, [
    final MeasurementInterpreter<DerivedMeasurement<A, B>>? interpreter,
  ]) =>
      DerivedMeasurement._(si, precision, interpreter);

  /// Constructs a derived measurement.
  const DerivedMeasurement._(
    final double si,
    final Precision precision, [
    final MeasurementInterpreter<DerivedMeasurement<A, B>>? interpreter,
    this._reciprocal = false,
  ]) : super(si, precision, interpreter);

  /// Whether this has a reciprocal unit.
  final bool _reciprocal;
}

/// An interpreter for derived measurements (from two basic measurements).
class DerivedMeasurementInterpreter<A extends Measurement<A>,
        B extends Measurement<B>>
    extends MeasurementInterpreter<DerivedMeasurement<A, B>> {
  /// Whether the unit is a division.
  ///
  /// For example, "miles / hour" is a division, while "miles * miles" (square
  /// miles) would be a multiplication.
  final bool _reciprocal;

  /// The numerator's interpreter.
  final MeasurementInterpreter<A>? _interpreterA;

  /// The denominator's interpreter.
  final MeasurementInterpreter<B>? _interpreterB;

  /// Constructs an interpreter from two basic interpreters.
  ///
  /// The prefix, if supplied, will apply to the entire interpreter.
  ///
  /// If a name is not supplied, a standard name will be provided.
  DerivedMeasurementInterpreter(
    final MeasurementInterpreter<A> a,
    final MeasurementInterpreter<B> b, [
    final bool reciprocal = false,
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
    final String? name,
  ]) : this._unitless(a, b, reciprocal, prefix, name);

  /// Constructs a [DerivedMeasurementInterpreter] with a potentially null
  /// interpreter.
  DerivedMeasurementInterpreter._unitless([
    final MeasurementInterpreter<A>? a,
    final MeasurementInterpreter<B>? b,
    final bool reciprocal = false,
    final MeasurementPrefix prefix = const MeasurementPrefix.unit(),
    final String? name,
  ])  : _reciprocal = reciprocal,
        _interpreterA = a,
        _interpreterB = b,
        super._(
          name ?? '${a ?? 'X'}${reciprocal ? '/' : '⋅'}${b ?? 'X'}',
          reciprocal
              ? (a?._unitMultiplier ?? 1.0) / (b?._unitMultiplier ?? 1.0)
              : (a?._unitMultiplier ?? 1.0) * (b?._unitMultiplier ?? 1.0),
          prefix,
        );

  @override
  DerivedMeasurement<A, B> call(final double value,
          {final Precision precision = Precision.max}) =>
      DerivedMeasurement._combine(
        value,
        precision,
        _interpreterA,
        _interpreterB,
        _reciprocal,
        _name,
      );
}
