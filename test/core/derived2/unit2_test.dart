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
      test("dot", () {
        // given
        final unit = feet.dot.inches;

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(7.74e-3, 5e-4));
      });
      test("per", () {
        // given
        final unit = feet.per.deci.second;

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
        final unit = DerivedUnit2(
          feet.inverted,
          minutes.inverted,
        );

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(5.47e-2, 5e-5));
      });
    });

    group("of", () {
      test("square of 1", () {
        // when
        final result = square(feet).fromSI(1.0);

        // then
        expect(result, closeTo(10.76, 5e-3));
      });
      test("square of several", () {
        // when
        final result = square(feet).fromSI(3.0);

        // then
        expect(result, closeTo(32.3, 5e-2));
      });
      test("product of 1", () {
        // when
        final result = DerivedUnit2(feet, inches).fromSI(1.0);

        // then
        expect(result, closeTo(129.2, 5e-2));
      });
      test("product of several", () {
        // when
        final result = DerivedUnit2(feet, inches).fromSI(3.0);

        // then
        expect(result, closeTo(387.5, 5e-2));
      });
      test("ratio of 1", () {
        // when
        final result = feet.per.deci.second.fromSI(1.0);

        // then
        expect(result, closeTo(0.328, 5e-4));
      });
      test("ratio of several", () {
        // when
        final result = feet.per.deci.second.fromSI(2.0);

        // then
        expect(result, closeTo(0.656, 5e-4));
      });
      test("with a prefix", () {
        // when
        final result = feet.per.deci.second.withPrefix(centi).fromSI(2.0);

        // then
        expect(result, closeTo(65.6, 5e-2));
      });
      test("using per method", () {
        // when
        final result = centi.feet.per.deci.second.fromSI(2.0);

        // then
        expect(result, closeTo(65.6, 5e-2));
      });
    });
    group("from", () {
      test("square from 1", () {
        // when
        final result = square(feet).toSI(1);

        // then
        expect(result, closeTo(0.0929, 5e-5));
      });
      test("square from several", () {
        // when
        final result = square(feet).toSI(10);

        // then
        expect(result, closeTo(0.929, 5e-4));
      });
      test("product from 1", () {
        // when
        final result = feet.dot.inches.toSI(1);

        // then
        expect(result, closeTo(0.00774, 0.000005));
      });
      test("product from several", () {
        // when
        final result = feet.dot.inches.toSI(10);

        // then
        expect(result, closeTo(0.0774, 5e-5));
      });
      test("ratio from 1", () {
        // when
        final result = feet.per.deci.second.toSI(1);

        // then
        expect(result, closeTo(3.05, 5e-3));
      });
      test("ratio from several", () {
        // when
        final result = feet.per.deci.second.toSI(10);

        // then
        expect(result, closeTo(30.5, 5e-2));
      });
    });

    group("using", () {
      test("other using other", () {
        // given
        final unit = square(feet);

        // when
        final result =
            unit.using(5.4.feet, 2.feet, precision: DigitsAfterDecimal(1));

        // then
        expect(result.toString(), "10.8 ft²");
      });
      test("other using SI", () {
        // given
        final unit = square(feet);

        // when
        final result =
            unit.using(1.meters, 1.meters, precision: DigitsAfterDecimal(1));

        // then
        expect(result.toString(), "10.8 ft²");
      });
      test("SI using SI", () {
        // given
        final unit = square(meters);

        // when
        final result =
            unit.using(2.meters, 3.meters, precision: DigitsAfterDecimal(1));

        // then
        expect(result.toString(), "6.0 m²");
      });
      test("SI using other", () {
        // given
        final unit = square(meters);

        // when
        final result =
            unit.using(2.7.feet, 4.feet, precision: DigitsAfterDecimal(1));

        // then
        expect(result.toString(), "1.0 m²");
      });
      test("other using different other", () {
        // given
        final unit = square(inches);

        // when
        final result =
            unit.using(0.25.feet, 0.5.feet, precision: DigitsAfterDecimal(1));

        // then
        expect(result.toString(), "18.0 in²");
      });
      test("combines precision of existing measurements", () {
        // given
        final unit = square(inches);

        // when
        final result = unit.using(
          0.25.meters.withPrecision(DigitsAfterDecimal(1)),
          0.5.meters.withPrecision(DigitsAfterDecimal(1)),
        );

        // then
        expect(result.toString(), "193.8 in²");
      });
      test("combines precision of one existing measurement", () {
        // given
        final unit = square(inches);

        // when
        final result = unit.using(
          0.25.meters.withPrecision(DigitsAfterDecimal(2)),
          0.5.meters,
        );

        // then
        expect(result.toString(), "193.75 in²");
      });
    });
    group("per", () {
      test("multiplier for SI", () {
        // given
        final unit = meters.per.gram;

        // then
        expect(unit.multiplier, 1.0);
      });
      test("multiplier for basic numerator", () {
        // given
        final unit = feet.per.gram;

        // then
        expect(unit.multiplier, closeTo(0.305, 0.0005));
      });
      test("multiplier for prefixed numerator", () {
        // given
        final unit = deka.feet.per.gram;

        // then
        expect(unit.multiplier, closeTo(3.048, 0.0005));
      });
      test("multiplier for basic denominator", () {
        // given
        final unit = meters.per.ounce;

        // then
        expect(unit.multiplier, closeTo(0.035, 0.0005));
      });
      test("multiplier for prefixed denominator", () {
        // given
        final unit = meters.per.deka.ounce;

        // then
        expect(unit.multiplier, closeTo(0.00353, 0.000005));
      });
      test("multiplier for prefixed everything", () {
        // given
        final unit = kilo.feet.per.deka.ounce;

        // then
        expect(unit.multiplier, closeTo(1.075, 0.0005));
      });
    });
    group("dot", () {
      test("multiplier for SI", () {
        // given
        final unit = meters.dot.grams;

        // then
        expect(unit.multiplier, 1.0);
      });
      test("multiplier for basic first", () {
        // given
        final unit = feet.dot.grams;

        // then
        expect(unit.multiplier, closeTo(0.305, 0.0005));
      });
      test("multiplier for prefixed first", () {
        // given
        final unit = deka.feet.dot.grams;

        // then
        expect(unit.multiplier, closeTo(3.048, 0.0005));
      });
      test("multiplier for basic second", () {
        // given
        final unit = meters.dot.ounces;

        // then
        expect(unit.multiplier, closeTo(28.3, 0.05));
      });
      test("multiplier for prefixed second", () {
        // given
        final unit = meters.dot.deci.ounces;

        // then
        expect(unit.multiplier, closeTo(2.83, 0.005));
      });
      test("multiplier for prefixed everything", () {
        // given
        final unit = deci.feet.dot.deka.ounces;

        // then
        expect(unit.multiplier, closeTo(8.64, 0.005));
      });
    });

    group("sample derived units", () {
      test("newtons", () {
        // given
        final newtons =
            DerivedUnit2(kilo.grams.dot.meters, square(seconds).inverted);

        // when
        final result = newtons(1);

        // then
        expect(result.as(newtons), 1.0);
        expect(
          result.as(DerivedUnit2(grams.dot.meters, square(seconds).inverted)),
          1000.0,
        );
        expect(
          result.as(DerivedUnit2(
              kilo.grams.dot.deka.meters, square(seconds).inverted)),
          0.1,
        );
        expect(
          result.as(
              DerivedUnit2(kilo.grams.dot.meters, square(minutes).inverted)),
          3600.0,
        );
      });
    });
  });
}
