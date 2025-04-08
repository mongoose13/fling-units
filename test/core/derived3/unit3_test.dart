import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("DerivedUnit3", () {
    group("multiplier", () {
      test("cubic", () {
        // given
        final unit = cubic(feet);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(0.0283, 5e-5));
      });
      test("product", () {
        // given
        final unit = DerivedUnit3.build(yards, feet, inches);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(7.08e-3, 5e-4));
      });
      test("with global prefix", () {
        // given
        final unit = cubic(feet, prefix: deka);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(0.283, 5e-4));
      });
      test("with local prefix", () {
        // given
        final unit = cubic(deci.feet);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(2.83e-5, 5e-8));
      });
      test("all denominators", () {
        // given
        final unit = DerivedUnit3.build(
            feet.inverted, minutes.inverted, gallons.inverted);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(12.028, 5e-4));
      });
      test("all denominators equivalent to inverted", () {
        // given
        final unit1 = DerivedUnit3.build(feet, minutes, gallons).inverted;
        final unit2 = DerivedUnit3.build(
            feet.inverted, minutes.inverted, gallons.inverted);

        // then
        expect(unit1.multiplier, closeTo(unit2.multiplier, 5e-4));
      });
      test("inverted has correct multiplier", () {
        // given
        final unit = DerivedUnit3.build(feet, minutes, gallons).inverted;

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(12.028, 5e-4));
      });
    });

    group("of", () {
      test("cubic of 1", () {
        // when
        final result = cubic(feet).fromSI(1.0);

        // then
        expect(result, closeTo(35.3, 5e-2));
      });
      test("cubic of several", () {
        // when
        final result = cubic(feet).fromSI(3.0);

        // then
        expect(result, closeTo(105.9, 5e-2));
      });
      test("with a prefix", () {
        // when
        final result = cubic(deci.seconds).withPrefix(centi).fromSI(2.0);

        // then
        expect(result, closeTo(2.0e5, 5e-1));
      });
    });

    group("from", () {
      test("cubic from 1", () {
        // when
        final result = cubic(feet).toSI(1);

        // then
        expect(result, closeTo(0.0283, 5e-5));
      });
      test("cubic from several", () {
        // when
        final result = cubic(feet).toSI(10);

        // then
        expect(result, closeTo(0.283, 5e-4));
      });
    });
  });
}
