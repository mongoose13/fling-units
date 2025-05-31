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
        final unit = product3(yards, feet, inches);

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
        final unit = DerivedUnit3.from(UnitDenominator(feet),
            UnitDenominator(minutes), UnitDenominator(gallons));

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(2.49e-4, 5e-7));
      });
    });

    group("of", () {
      test("cubic of 1", () {
        // when
        final result = cubic(feet).of(1.0);

        // then
        expect(result, closeTo(35.3, 5e-2));
      });
      test("cubic of several", () {
        // when
        final result = cubic(feet).of(3.0);

        // then
        expect(result, closeTo(105.9, 5e-2));
      });
      test("with a prefix", () {
        // when
        final result = cubic(deci.seconds).withPrefix(centi).of(2.0);

        // then
        expect(result, closeTo(2.0e5, 5e-1));
      });
    });

    group("from", () {
      test("cubic from 1", () {
        // when
        final result = cubic(feet).from(1);

        // then
        expect(result, closeTo(0.0283, 5e-5));
      });
      test("cubic from several", () {
        // when
        final result = cubic(feet).from(10);

        // then
        expect(result, closeTo(0.283, 5e-4));
      });
    });

    group("using", () {
      test("other using other", () {
        // given
        final unit = cubic(feet);

        // when
        final result = unit.using(5.4.feet, 2.feet, 3.feet, precision: 3);

        // then
        expect(result.toString(), "32.4 ft³");
      });
      test("other using SI", () {
        // given
        final unit = cubic(feet);

        // when
        final result = unit.using(1.meters, 1.meters, 1.meters, precision: 3);

        // then
        expect(result.toString(), "35.3 ft³");
      });
      test("SI using SI", () {
        // given
        final unit = cubic(meters);

        // when
        final result = unit.using(2.meters, 3.meters, 4.meters, precision: 3);

        // then
        expect(result.toString(), "24.0 m³");
      });
      test("SI using other", () {
        // given
        final unit = cubic(meters);

        // when
        final result = unit.using(2.7.feet, 4.feet, 1.yards, precision: 3);

        // then
        expect(result.toString(), "0.917 m³");
      });
      test("other using different other", () {
        // given
        final unit = cubic(inches);

        // when
        final result = unit.using(0.25.feet, 0.5.feet, 2.inches, precision: 3);

        // then
        expect(result.toString(), "36.0 in³");
      });
      test("with different unit positions", () {
        // given
        final unit = DerivedUnit3.from(UnitNumerator(inches),
            UnitDenominator(gallons), UnitNumerator(minutes));

        // when
        final result =
            unit.using(0.25.feet, 8.cups, 0.5.hours).withPrecision(3);

        // then
        expect(result.toString(), "0.703 in⋅gal⁻¹⋅min");
      });
      test("with different unit positions again", () {
        // given
        final unit = DerivedUnit3.from(UnitNumerator(inches),
            UnitDenominator(gallons), UnitNumerator(minutes));

        // when
        final result = unit
            .using(5.centi.meters, 2.liters, (1.2).milli.seconds)
            .withPrecision(3);

        // then
        expect(result.toString(), "4.33 in⋅gal⁻¹⋅min");
      });
    });
  });
}
