part of "library.dart";

/// A measurement representing two simpler measurements tied together by either
/// multiplication or division.
///
/// For example, velocity can be modeled as [Distance] / [Time] and [Area] can
/// be modeled as [Distance] * [Distance].
class DerivedMeasurement<A extends Measurement<A>, B extends Measurement<B>>
    extends Measurement<DerivedMeasurement<A, B>> {
  /// The derived measurement of zero magnitude.
  const DerivedMeasurement.zero(
      [DerivedUnit<A, B> super.interpreter = const _UnknownDerivedUnit._()])
      : _reciprocal = false,
        super.zero();

  /// The derived measurement of infinite magnitude.
  const DerivedMeasurement.infinite(
      [DerivedUnit<A, B> super.interpreter = const _UnknownDerivedUnit._()])
      : _reciprocal = false,
        super.infinite();

  /// The derived measurement of negative infinite magnitude.
  const DerivedMeasurement.negativeInfinite(
      [DerivedUnit<A, B> super.interpreter = const _UnknownDerivedUnit._()])
      : _reciprocal = false,
        super.negativeInfinite();

  /// NaN (Not a Number) derived measurement.
  const DerivedMeasurement.nan(
      [super.interpreter = const _UnknownDerivedUnit._()])
      : _reciprocal = false,
        super.nan();

  /// Constructs a derived measurement representing the multiplication of a pair
  /// of simpler measurements.
  DerivedMeasurement.multiply(A a, B b, [String? name])
      : this._combine(
            a.defaultValue * b.defaultValue,
            Precision.combine([a.precisionData, b.precisionData]),
            a.defaultUnit,
            b.defaultUnit,
            false,
            name);

  /// Constructs a derived measurement representing the division of a pair of
  /// simpler measurements.
  DerivedMeasurement.divide(A a, B b, [String? name])
      : this._combine(
            a.defaultValue / b.defaultValue,
            Precision.combine([a.precisionData, b.precisionData]),
            a.defaultUnit,
            b.defaultUnit,
            true,
            name);

  /// Creates a derived measurement representing a pair of simpler units.
  DerivedMeasurement._combine(double value, Precision precision,
      [Unit<A>? a, Unit<B>? b, bool reciprocal = false, String? name])
      : this(
            value,
            precision,
            DerivedUnit._unitless(
              a,
              b,
              reciprocal,
              const MeasurementPrefix.unit(),
              name,
            ),
            reciprocal);

  @override
  DerivedMeasurementBuilder<DerivedMeasurement<A, B>> get per =>
      DerivedMeasurementBuilder(this, true);

  /// Interprets this using two specific units.
  double asPair(Unit<A> a, Unit<B> b) =>
      _precise(a.of(si) * (_reciprocal ? b.from(1) : b.of(1)));

  /// Interprets this using a [DerivedUnit].
  double asInterpretedBy(DerivedUnit<A, B> interpreter) =>
      _precise(interpreter.of(si));

  @override
  void acceptVisitor(MeasurementVisitor visitor) => visitor.visitDerived(this);

  @override
  DerivedMeasurement<A, B> construct(
    double amount,
    Unit<DerivedMeasurement<A, B>>? interpreter,
    Precision precision,
  ) =>
      DerivedMeasurement(
          amount, precision, interpreter ?? const _UnknownDerivedUnit._());

  /// Constructs a derived measurement.
  const DerivedMeasurement(
    num si,
    Precision precision, [
    Unit<DerivedMeasurement<A, B>> interpreter = const _UnknownDerivedUnit._(),
    this._reciprocal = false,
  ]) : super(amount: si, precision: precision, interpreter: interpreter);

  /// Whether this has a reciprocal unit.
  final bool _reciprocal;
}

/// An interpreter for derived measurements (from two basic measurements).
class DerivedUnit<A extends Measurement<A>, B extends Measurement<B>>
    extends Unit<DerivedMeasurement<A, B>> {
  /// Whether the unit is a division.
  ///
  /// For example, "miles / hour" is a division, while "miles * miles" (square
  /// miles) would be a multiplication.
  final bool _reciprocal;

  /// The numerator's interpreter.
  final Unit<A>? _unitA;

  /// The denominator's interpreter.
  final Unit<B>? _unitB;

  /// Constructs an interpreter from two basic interpreters.
  ///
  /// The prefix, if supplied, will apply to the entire interpreter.
  ///
  /// If a name is not supplied, a standard name will be provided.
  DerivedUnit(
    Unit<A> a,
    Unit<B> b, [
    bool reciprocal = false,
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
    String? name,
  ]) : this._unitless(a, b, reciprocal, prefix, name);

  /// Constructs a [DerivedUnit] with a potentially null
  /// interpreter.
  ///
  /// If a name is not supplied, a standard name will be provided.
  DerivedUnit._unitless([
    Unit<A>? a,
    Unit<B>? b,
    bool reciprocal = false,
    MeasurementPrefix prefix = const MeasurementPrefix.unit(),
    String? name,
  ])  : _reciprocal = reciprocal,
        _unitA = a,
        _unitB = b,
        super(
          name ?? '${a ?? 'X'}${reciprocal ? '/' : '⋅'}${b ?? 'X'}',
          reciprocal
              ? (a?.unitMultiplier ?? 1.0) / (b?.unitMultiplier ?? 1.0)
              : (a?.unitMultiplier ?? 1.0) * (b?.unitMultiplier ?? 1.0),
          prefix,
        );

  @override
  DerivedMeasurement<A, B> call(double value,
          {Precision precision = Precision.max}) =>
      DerivedMeasurement._combine(
        value,
        precision,
        _unitA,
        _unitB,
        _reciprocal,
        name,
      );

  @override
  DerivedUnitBuilder<DerivedMeasurement<A, B>> get per =>
      DerivedUnitBuilder(this, true);
}

/// A class representing an unknown derived measurement.
class _UnknownDerivedUnit<A extends Measurement<A>, B extends Measurement<B>>
    implements DerivedUnit<A, B> {
  const _UnknownDerivedUnit._();

  @override
  String get name => "unknown";

  @override
  double get unitMultiplier => 1.0;

  @override
  Unit<A>? get _unitA => throw UnimplementedError();

  @override
  Unit<B>? get _unitB => throw UnimplementedError();

  @override
  bool get _reciprocal => throw UnimplementedError();

  @override
  double of(num value) => value.toDouble();

  @override
  double from(num value) => value.toDouble();

  @override
  MeasurementPrefix get prefix => throw UnimplementedError();

  @override
  DerivedMeasurement<A, B> call(double value,
          {Precision precision = Precision.max}) =>
      throw UnimplementedError();

  @override
  DerivedUnitBuilder<DerivedMeasurement<A, B>> get per =>
      DerivedUnitBuilder(this, true);

  @override
  String toString() => "unknown";
}
