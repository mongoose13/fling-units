part of "library.dart";

/// A measurement representing two simpler measurements tied together by either
/// multiplication or division.
///
/// For example, velocity can be modeled as [Distance] / [Time] and [Area] can
/// be modeled as [Distance] * [Distance].
class DerivedMeasurementPer<A extends Measurement<A>, B extends Measurement<B>>
    extends Measurement<DerivedMeasurementPer<A, B>> {
  /// The derived measurement of zero magnitude.
  const DerivedMeasurementPer.zero(super.interpreter) : super.zero();

  /// The derived measurement of infinite magnitude.
  const DerivedMeasurementPer.infinite(super.interpreter) : super.infinite();

  /// The derived measurement of negative infinite magnitude.
  const DerivedMeasurementPer.negativeInfinite(
      DerivedUnitPer<A, B> super.interpreter)
      : super.negativeInfinite();

  /// NaN (Not a Number) derived measurement.
  const DerivedMeasurementPer.nan(super.interpreter) : super.nan();

  /// Constructs a derived measurement representing the division of a pair of
  /// simpler measurements.
  DerivedMeasurementPer.divide(A a, B b)
      : this(
          magnitude: a.defaultValue / b.defaultValue,
          defaultUnit: a.defaultUnit.divide(b.defaultUnit),
          precision: Precision.combine([a.precisionData, b.precisionData]),
        );

  @override
  DerivedMeasurementPer<A, B> construct(
    double magnitude,
    Unit<DerivedMeasurementPer<A, B>> defaultUnit,
    Precision precision,
  ) =>
      DerivedMeasurementPer(
        magnitude: magnitude,
        defaultUnit: defaultUnit,
        precision: precision,
      );

  @override
  DerivedMeasurementPerBuilder<DerivedMeasurementPer<A, B>> get per =>
      DerivedMeasurementPerBuilder(this);

  @override
  double as(Unit<DerivedMeasurementPer<A, B>> interpreter) =>
      _precise(interpreter.of(si));

  @override
  void acceptVisitor(MeasurementVisitor visitor) =>
      visitor.visitDerivedPer(this);

  /// Constructs a derived measurement.
  const DerivedMeasurementPer({
    required super.magnitude,
    required super.defaultUnit,
    super.precision,
  });
}

class DerivedMeasurementBy<A extends Measurement<A>, B extends Measurement<B>>
    extends Measurement<DerivedMeasurementBy<A, B>> {
  /// Constructs a derived measurement.
  const DerivedMeasurementBy({
    required super.magnitude,
    required super.defaultUnit,
    super.precision,
  });

  /// The derived measurement of zero magnitude.
  const DerivedMeasurementBy.zero(super.defaultUnit) : super.zero();

  /// The derived measurement of infinite magnitude.
  const DerivedMeasurementBy.infinite(super.defaultUnit) : super.infinite();

  /// The derived measurement of negative infinite magnitude.
  const DerivedMeasurementBy.negativeInfinite(super.defaultUnit)
      : super.negativeInfinite();

  /// NaN (Not a Number) derived measurement.
  const DerivedMeasurementBy.nan(super.defaultUnit) : super.nan();

  /// Constructs a derived measurement representing the multiplication of a pair
  /// of simpler measurements.
  DerivedMeasurementBy.multiply(A a, B b)
      : this(
          magnitude: a.defaultValue * b.defaultValue,
          precision: Precision.combine([a.precisionData, b.precisionData]),
          defaultUnit: a.defaultUnit.multiply(b.defaultUnit),
        );

  @override
  DerivedMeasurementBy<A, B> construct(
    double magnitude,
    Unit<DerivedMeasurementBy<A, B>> defaultUnit,
    Precision precision,
  ) =>
      DerivedMeasurementBy(
        magnitude: magnitude,
        defaultUnit: defaultUnit,
        precision: precision,
      );

  @override
  double as(Unit<DerivedMeasurementBy<A, B>> interpreter) =>
      _precise(interpreter.of(si));

  @override
  void acceptVisitor(MeasurementVisitor visitor) =>
      visitor.visitDerivedBy(this);
}

/// An interpreter for derived measurements (from two basic measurements).
class DerivedUnitBy<A extends Measurement<A>, B extends Measurement<B>>
    extends Unit<DerivedMeasurementBy<A, B>> {
  /// The numerator's interpreter.
  final Unit<A> _unitA;

  /// The denominator's interpreter.
  final Unit<B> _unitB;

  /// Constructs an interpreter from two basic interpreters.
  ///
  /// The prefix, if supplied, will apply to the entire interpreter.
  ///
  /// If a name is not supplied, a standard name will be provided.
  DerivedUnitBy(
    this._unitA,
    this._unitB, {
    super.prefix = const MeasurementPrefix.unit(),
    String? name,
  }) : super(
          name: name ?? "${_unitA.name}*${_unitB.name}",
          unitMultiplier: _unitA.unitMultiplier * _unitB.unitMultiplier,
        );

  @override
  DerivedMeasurementBy<A, B> call(num magnitude,
          {Precision precision = Precision.max}) =>
      DerivedMeasurementBy(
        magnitude: magnitude,
        precision: precision,
        defaultUnit: _unitA.multiply(_unitB),
      );

  @override
  DerivedUnitPerBuilder<DerivedMeasurementBy<A, B>> get per =>
      DerivedUnitPerBuilder(this);
}

/// An interpreter for derived measurements (from two basic measurements).
class DerivedUnitPer<A extends Measurement<A>, B extends Measurement<B>>
    extends Unit<DerivedMeasurementPer<A, B>> {
  /// The numerator's interpreter.
  final Unit<A> _unitA;

  /// The denominator's interpreter.
  final Unit<B> _unitB;

  /// Constructs an interpreter from two basic interpreters.
  ///
  /// The prefix, if supplied, will apply to the entire interpreter.
  ///
  /// If a name is not supplied, a standard name will be provided.
  DerivedUnitPer(
    this._unitA,
    this._unitB, {
    super.prefix = const MeasurementPrefix.unit(),
    String? name,
  }) : super(
          name: name ?? "${_unitA.name}/${_unitB.name}",
          unitMultiplier: _unitA.unitMultiplier / _unitB.unitMultiplier,
        );

  @override
  DerivedMeasurementPer<A, B> call(num magnitude,
          {Precision precision = Precision.max}) =>
      DerivedMeasurementPer(
        magnitude: magnitude,
        defaultUnit: _unitA.divide(_unitB),
        precision: precision,
      );

  @override
  DerivedUnitPerBuilder<DerivedMeasurementPer<A, B>> get per =>
      DerivedUnitPerBuilder(this);
}
