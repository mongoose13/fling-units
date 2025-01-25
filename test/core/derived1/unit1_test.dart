import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("DerivedUnit1", () {
    group("multiplier", () {
      test("inverse", () {
        // given
        final unit = inverse(feet);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(3.28, 5e-3));
      });
    });

    group("of", () {
      test("inverse of 1", () {
        // when
        final result = inverse(feet).of(1.0);

        // then
        expect(result, closeTo(0.3048, 5e-5));
      });
      test("inverse of several", () {
        // when
        final result = inverse(feet).of(3.0);

        // then
        expect(result, closeTo(0.914, 5e-4));
      });
      test("with a prefix", () {
        // when
        final result = inverse(feet).withPrefix(centi).of(2.0);

        // then
        expect(result, closeTo(60.96, 5e-3));
      });
    });
    group("from", () {
      test("inverse from 1", () {
        // when
        final result = inverse(minutes).from(1);

        // then
        expect(result, closeTo(0.0167, 5e-5));
      });
      test("inverse from fraction", () {
        // when
        final result = inverse(minutes).from(0.5);

        // then
        expect(result, closeTo(8.33e-3, 5e-6));
      });
    });

    group("using", () {
      test("other using other", () {
        // given
        final unit = inverse(feet);

        // when
        final result = unit.using(5.feet, precision: 3);

        // then
        expect(result.toString(), "0.2 ft⁻¹");
      });
      test("other using SI", () {
        // given
        final unit = inverse(feet);

        // when
        final result = unit.using(1.meters, precision: 3);

        // then
        expect(result.toString(), "0.305 ft⁻¹");
      });
      test("SI using SI", () {
        // given
        final unit = inverse(meters);

        // when
        final result = unit.using(2.meters, precision: 3);

        // then
        expect(result.toString(), "0.5 m⁻¹");
      });
      test("SI using other", () {
        // given
        final unit = inverse(meters);

        // when
        final result = unit.using(3.28.feet, precision: 3);

        // then
        expect(result.toString(), "1.0 m⁻¹");
      });
      test("other using different other", () {
        // given
        final unit = inverse(inches);

        // when
        final result = unit.using(0.25.feet, precision: 3);

        // then
        expect(result.toString(), "0.333 in⁻¹");
      });
    });
  });
}
