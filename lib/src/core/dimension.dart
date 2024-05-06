part of "library.dart";

abstract class Dimension {}

//----------------------------------------------------------------\\
// waiting for https://github.com/dart-lang/language/issues/1774
// to scale this up infinitely
//----------------------------------------------------------------\\

class Dimension1<P extends UnitPosition> extends Dimension {}

class Dimension2<P1 extends UnitPosition, P2 extends UnitPosition>
    extends Dimension {}

class Dimension3<P1 extends UnitPosition, P2 extends UnitPosition,
    P3 extends UnitPosition> extends Dimension {}
