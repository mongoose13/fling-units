import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("DerivedUnit2", () {
    group("multiplier", () {
      test("square", () {
        // given
        final unit = square(feet);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(0.0929, 5e-5));
      });
      test("product", () {
        // given
        final unit = product2(feet, inches);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(7.74e-3, 5e-4));
      });
      test("ratio", () {
        // given
        final unit = ratio(feet, deci.seconds);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(3.05, 5e-3));
      });
      test("with global prefix", () {
        // given
        final unit = square(feet, prefix: deka);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(0.929, 5e-4));
      });
      test("with local prefix", () {
        // given
        final unit = square(deci.feet);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(9.29e-4, 5e-5));
      });
      test("both denominators", () {
        // given
        final unit =
            DerivedUnit2.from(UnitDenominator(feet), UnitDenominator(minutes));

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(5.47e-2, 5e-5));
      });
    });

    group("of", () {
      test("square of 1", () {
        // when
        final result = square(feet).of(1.0);

        // then
        expect(result, closeTo(10.76, 5e-3));
      });
      test("square of several", () {
        // when
        final result = square(feet).of(3.0);

        // then
        expect(result, closeTo(32.3, 5e-2));
      });
      test("product of 1", () {
        // when
        final result = product2(feet, inches).of(1.0);

        // then
        expect(result, closeTo(129.2, 5e-2));
      });
      test("product of several", () {
        // when
        final result = product2(feet, inches).of(3.0);

        // then
        expect(result, closeTo(387.5, 5e-2));
      });
      test("ratio of 1", () {
        // when
        final result = ratio(feet, deci.seconds).of(1.0);

        // then
        expect(result, closeTo(0.328, 5e-4));
      });
      test("ratio of several", () {
        // when
        final result = ratio(feet, deci.seconds).of(2.0);

        // then
        expect(result, closeTo(0.656, 5e-4));
      });
      test("with a prefix", () {
        // when
        final result = ratio(feet, deci.seconds).withPrefix(centi).of(2.0);

        // then
        expect(result, closeTo(65.6, 5e-2));
      });
    });
    group("from", () {
      test("square from 1", () {
        // when
        final result = square(feet).from(1);

        // then
        expect(result, closeTo(0.0929, 5e-5));
      });
      test("square from several", () {
        // when
        final result = square(feet).from(10);

        // then
        expect(result, closeTo(0.929, 5e-4));
      });
      test("product from 1", () {
        // when
        final result = product2(feet, inches).from(1);

        // then
        expect(result, closeTo(0.00774, 0.000005));
      });
      test("product from several", () {
        // when
        final result = product2(feet, inches).from(10);

        // then
        expect(result, closeTo(0.0774, 5e-5));
      });
      test("ratio from 1", () {
        // when
        final result = ratio(feet, deci.seconds).from(1);

        // then
        expect(result, closeTo(3.05, 5e-3));
      });
      test("ratio from several", () {
        // when
        final result = ratio(feet, deci.seconds).from(10);

        // then
        expect(result, closeTo(30.5, 5e-2));
      });
    });

    group("using", () {
      test("other using other", () {
        // given
        final unit = square(feet);

        // when
        final result = unit.using(5.4.feet, 2.feet, precision: 3);

        // then
        expect(result.toString(), "10.8 ft²");
      });
      test("other using SI", () {
        // given
        final unit = square(feet);

        // when
        final result = unit.using(1.meters, 1.meters, precision: 3);

        // then
        expect(result.toString(), "10.8 ft²");
      });
      test("SI using SI", () {
        // given
        final unit = square(meters);

        // when
        final result = unit.using(2.meters, 3.meters, precision: 3);

        // then
        expect(result.toString(), "6.0 m²");
      });
      test("SI using other", () {
        // given
        final unit = square(meters);

        // when
        final result = unit.using(2.7.feet, 4.feet, precision: 3);

        // then
        expect(result.toString(), "1.0 m²");
      });
      test("other using different other", () {
        // given
        final unit = square(inches);

        // when
        final result = unit.using(0.25.feet, 0.5.feet, precision: 3);

        // then
        expect(result.toString(), "18.0 in²");
      });
    });
  });
}
