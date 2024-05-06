import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  test("WHA??", () {
    final p =
        DerivedUnit2.build(UnitNumerator(seconds), UnitDenominator(grams));

    final q = p(3);
    q.as(ratio(seconds, grams));

    // TODO: Why does this compile?!?
    p.using(1.meters, 1.seconds);
  });
}
