import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("type safety", () {
    group("Unit", () {
      group("as", () {
        test("valid", () {
          // given
          final unit = DerivedUnit2.build(
              UnitNumerator(seconds), UnitDenominator(grams));

          // then
          // this should compile:
          // TODO: find a way to test whether this can compile in a test
          unit(1).as(ratio(seconds, grams));
        });
        test("invalid", () {
          // given
          final unit = DerivedUnit2.build(
              UnitNumerator(seconds), UnitDenominator(grams));

          // then
          // this should not compile:
          //unit(1).as(ratio(seconds, meters));
        });
      });
      group("using", () {
        test("valid", () {
          // given
          final unit = DerivedUnit2.build(
              UnitNumerator(seconds), UnitDenominator(grams));

          // then
          // this should compile:
          unit.using(1.minutes, 1.pounds);
        });
        test("invalid", () {
          // given
          final unit = DerivedUnit2.build(
              UnitNumerator(seconds), UnitDenominator(grams));

          // TODO: Why does this compile?!?
          // then
          // this should not compile:
          unit.using(1.meters, 1.seconds);
        });
      });
    });
  });
}
