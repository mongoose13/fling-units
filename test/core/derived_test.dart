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
          unit(1).as(ratio(seconds, grams));
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
            UnitNumerator(seconds),
            UnitDenominator(grams),
          );

          // TODO: Why does this compile?!?
          // the build() method creates a DerivedUnit<UP<Time>, UP<Mass>, Dimension, Dimension>
          // instead of a DerivedUnit<UP<Time>, UP<Mass>, Time, Mass>
          // then
          // this should not compile:
          unit.using(1.meters, 1.seconds);
          // this should compile:
          unit.using(1.minutes, 1.ounces);
        });
      });
    });
  });
}
