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
      [DerivedMeasurementInterpreter<A, B> super.interpreter =
          const _UnknownDerivedMeasurementInterpreter._()])
      : _reciprocal = false,
        super.zero();

  /// The derived measurement of infinite magnitude.
  const DerivedMeasurement.infinite(
      [DerivedMeasurementInterpreter<A, B> super.interpreter =
          const _UnknownDerivedMeasurementInterpreter._()])
      : _reciprocal = false,
        super.infinite();

  /// The derived measurement of negative infinite magnitude.
  const DerivedMeasurement.negativeInfinite(
      [DerivedMeasurementInterpreter<A, B> super.interpreter =
          const _UnknownDerivedMeasurementInterpreter._()])
      : _reciprocal = false,
        super.negativeInfinite();

  /// NaN (Not a Number) derived measurement.
  const DerivedMeasurement.nan(
      [super.interpreter = const _UnknownDerivedMeasurementInterpreter._()])
      : _reciprocal = false,
        super.nan();

  /// Constructs a derived measurement representing the multiplication of a pair
  /// of simpler measurements.
  DerivedMeasurement.multiply(A a, B b, [String? name])
      : this._combine(
            a.defaultValue * b.defaultValue,
            Precision.combine([a._precision, b._precision]),
            a.defaultInterpreter,
            b.defaultInterpreter,
            false,
            name);

  /// Constructs a derived measurement representing the division of a pair of
  /// simpler measurements.
  DerivedMeasurement.divide(A a, B b, [String? name])
      : this._combine(
            a.defaultValue / b.defaultValue,
            Precision.combine([a._precision, b._precision]),
            a.defaultInterpreter,
            b.defaultInterpreter,
            true,
            name);

  /// Creates a derived measurement representing a pair of simpler units.
  DerivedMeasurement._combine(double value, Precision precision,
      [MeasurementInterpreter<A>? a,
      MeasurementInterpreter<B>? b,
      bool reciprocal = false,
      String? name])
      : this(
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
  double as(MeasurementInterpreter<A> a, MeasurementInterpreter<B> b) =>
      _precise(a._of(si) * (_reciprocal ? b._from(1) : b._of(1)));

  /// Interprets this using a [DerivedMeasurementInterpreter].
  double asInterpretedBy(DerivedMeasurementInterpreter<A, B> interpreter) =>
      _precise(interpreter._of(si));

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitDerived(this);

  @override
  DerivedMeasurement<A, B> _construct(
    double amount,
    MeasurementInterpreter<DerivedMeasurement<A, B>>? interpreter,
    Precision precision,
  ) =>
      DerivedMeasurement(amount, precision,
          interpreter ?? const _UnknownDerivedMeasurementInterpreter._());

  /// Constructs a derived measurement.
  const DerivedMeasurement(
    num si,
    Precision precision, [
    MeasurementInterpreter<DerivedMeasurement<A, B>> interpreter =
        const _UnknownDerivedMeasurementInterpreter._(),
    this._reciprocal = false,
  ]) : super(amount: si, precision: precision, interpreter: interpreter);

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
    MeasurementInterpreter<A> a,
    MeasurementInterpreter<B> b, [
    bool reciprocal = false,
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
    String? name,
  ]) : this._unitless(a, b, reciprocal, prefix, name);

  /// Constructs a [DerivedMeasurementInterpreter] with a potentially null
  /// interpreter.
  ///
  /// If a name is not supplied, a standard name will be provided.
  DerivedMeasurementInterpreter._unitless([
    MeasurementInterpreter<A>? a,
    MeasurementInterpreter<B>? b,
    bool reciprocal = false,
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
    String? name,
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
  DerivedMeasurement<A, B> call(double value,
          {Precision precision = Precision.max}) =>
      DerivedMeasurement._combine(
        value,
        precision,
        _interpreterA,
        _interpreterB,
        _reciprocal,
        _name,
      );
}

class _UnknownDerivedMeasurementInterpreter<A extends Measurement<A>,
    B extends Measurement<B>> implements DerivedMeasurementInterpreter<A, B> {
  const _UnknownDerivedMeasurementInterpreter._();

  @override
  String get _name => "unknown";

  @override
  double get _unitMultiplier => 1.0;

  @override
  MeasurementInterpreter<A>? get _interpreterA => throw UnimplementedError();

  @override
  MeasurementInterpreter<B>? get _interpreterB => throw UnimplementedError();

  @override
  bool get _reciprocal => throw UnimplementedError();

  @override
  double _of(num value) => value.toDouble();

  @override
  double _from(num value) => value.toDouble();

  @override
  MeasurementPrefix get _prefix => throw UnimplementedError();

  @override
  DerivedMeasurement<A, B> call(double value,
          {Precision precision = Precision.max}) =>
      throw UnimplementedError();

  @override
  String toString() => "unknown";
}
