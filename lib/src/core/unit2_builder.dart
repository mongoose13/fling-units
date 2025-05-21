part of 'package:fling_units/src/core/library.dart';

class PrefixedUnitPer<N extends f.Unit<D, I>, D extends f.Dimension,
    I extends f.Dimension> {
  PrefixedUnitPer(
    this.numerator, {
    this.prefix = const UnitPrefix.unit(),
  });

  final N numerator;

  final UnitPrefix prefix;

  f.DerivedUnit2<D, Ud, I, Ui>
      build<Ud extends f.Dimension, Ui extends f.Dimension>(
              Unit<Ud, Ui> unit) =>
          f.DerivedUnit2.build(numerator, unit);
}

class UnitPer<N extends f.Unit<D, I>, D extends f.Dimension,
    I extends f.Dimension> extends PrefixedUnitPer<N, D, I> {
  UnitPer(super.numerator);
}

class PrefixedUnitDot<N extends f.Unit<D, I>, D extends f.Dimension,
    I extends f.Dimension> {
  PrefixedUnitDot(
    this.initial, {
    this.prefix = const UnitPrefix.unit(),
  });

  final N initial;

  final UnitPrefix prefix;

  f.DerivedUnit2<D, Ud, I, Ui>
      build<Ud extends f.Dimension, Ui extends f.Dimension>(
              Unit<Ud, Ui> unit) =>
          f.DerivedUnit2.build(initial, unit);
}

class UnitDot<N extends f.Unit<D, I>, D extends f.Dimension,
    I extends f.Dimension> extends PrefixedUnitDot<N, D, I> {
  UnitDot(super.first);
}
