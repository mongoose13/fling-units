part of 'package:fling_units/src/core/library.dart';

abstract class UnitPerDot2<D extends f.Dimension, I extends f.Dimension> {
  const UnitPerDot2(
    this.unit1, {
    this.prefix = const f.UnitPrefix.unit(),
  });

  final Unit<D, I> unit1;

  final UnitPrefix prefix;
}

class PrefixedUnitPer2<D extends f.Dimension, I extends f.Dimension>
    extends UnitPerDot2<D, I> {
  const PrefixedUnitPer2(
    super.unit1, {
    super.prefix,
  });

  f.DerivedUnit2<D, Ui, I, Ud>
      build<Ud extends f.Dimension, Ui extends f.Dimension>(
              Unit<Ud, Ui> unit) =>
          f.DerivedUnit2(unit1, unit.inverted);
}

class UnitPer2<D extends f.Dimension, I extends f.Dimension>
    extends PrefixedUnitPer2<D, I> {
  const UnitPer2(
    super.unit1, {
    super.prefix,
  });
}

class PrefixedUnitDot2<D extends f.Dimension, I extends f.Dimension>
    extends UnitPerDot2<D, I> {
  const PrefixedUnitDot2(
    super.unit1, {
    super.prefix,
  });

  f.DerivedUnit2<D, Ud, I, Ui>
      build<Ud extends f.Dimension, Ui extends f.Dimension>(
              Unit<Ud, Ui> unit) =>
          f.DerivedUnit2(unit1, unit);
}

class UnitDot2<D extends f.Dimension, I extends f.Dimension>
    extends PrefixedUnitDot2<D, I> {
  const UnitDot2(super.unit1);
}

//////// 3 ////////

abstract class UnitPerDot3<D1 extends f.Dimension, D2 extends f.Dimension,
    I1 extends f.Dimension, I2 extends f.Dimension> {
  const UnitPerDot3(
    this.unit1,
    this.unit2, {
    this.prefix = const f.UnitPrefix.unit(),
  });

  final Unit<D1, I1> unit1;
  final Unit<D2, I2> unit2;

  final UnitPrefix prefix;
}

class PrefixedUnitDot3<
    D1 extends f.Dimension,
    D2 extends f.Dimension,
    I1 extends f.Dimension,
    I2 extends f.Dimension> extends UnitPerDot3<D1, D2, I1, I2> {
  const PrefixedUnitDot3(
    super.unit1,
    super.unit2, {
    super.prefix,
  });

  f.DerivedUnit3<D1, D2, Du, I1, I2, Iu>
      build<Du extends f.Dimension, Iu extends f.Dimension>(
              Unit<Du, Iu> unit) =>
          f.DerivedUnit3(unit1, unit2, unit);
}

class UnitDot3<
    D1 extends f.Dimension,
    D2 extends f.Dimension,
    I1 extends f.Dimension,
    I2 extends f.Dimension> extends PrefixedUnitDot3<D1, D2, I1, I2> {
  UnitDot3(
    super.unit1,
    super.unit2,
  );
}

class PrefixedUnitPer3<
    D1 extends f.Dimension,
    D2 extends f.Dimension,
    I1 extends f.Dimension,
    I2 extends f.Dimension> extends UnitPerDot3<D1, D2, I1, I2> {
  const PrefixedUnitPer3(
    super.unit1,
    super.unit2, {
    super.prefix,
  });

  f.DerivedUnit3<D1, D2, Du, I1, I2, Iu>
      build<Du extends f.Dimension, Iu extends f.Dimension>(
              Unit<Du, Iu> unit) =>
          f.DerivedUnit3(unit1, unit2, unit);
}

class UnitPer3<
    D1 extends f.Dimension,
    D2 extends f.Dimension,
    I1 extends f.Dimension,
    I2 extends f.Dimension> extends PrefixedUnitDot3<D1, D2, I1, I2> {
  UnitPer3(
    super.unit1,
    super.unit2,
  );
}
