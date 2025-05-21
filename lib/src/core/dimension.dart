abstract class Dimension {
  const Dimension();
}

//----------------------------------------------------------------\\
// waiting for https://github.com/dart-lang/language/issues/1774
// to scale this up infinitely
//----------------------------------------------------------------\\

class Dimension2<D1 extends Dimension, D2 extends Dimension> extends Dimension {
  const Dimension2();
}

class InvertedDimension2<D1 extends Dimension, D2 extends Dimension> {
  const InvertedDimension2();
}

class Dimension3<D1 extends Dimension, D2 extends Dimension,
    D3 extends Dimension> extends Dimension {
  const Dimension3();
}
