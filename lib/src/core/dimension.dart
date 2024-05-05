part of "library.dart";

abstract class Dimension {}

//----------------------------------------------------------------\\
// waiting for https://github.com/dart-lang/language/issues/1774
// to scale this up infinitely
//----------------------------------------------------------------\\

class Dimension1<A extends UnitPosition> extends Dimension {}

class Dimension2<A extends UnitPosition, B extends UnitPosition>
    extends Dimension {}

typedef Ratio<A extends Dimension, B extends Dimension>
    = Dimension2<UnitNumerator<Unit<A>>, UnitDenominator<Unit<B>>>;

class Dimension3<A extends UnitPosition, B extends UnitPosition,
    C extends UnitPosition> extends Dimension {}
