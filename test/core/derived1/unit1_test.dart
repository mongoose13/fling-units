import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("DerivedUnit1", () {
    group("multiplier", () {
      test("inverse", () {
        // given
        final unit = feet.inverted;

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(3.28, 5e-3));
      });
    });

    group("of", () {
      test("inverse of 1", () {
        // when
        final result = feet.inverted.fromSI(1.0);

        // then
        expect(result, closeTo(0.3048, 5e-5));
      });
      test("inverse of several", () {
        // when
        final result = feet.inverted.fromSI(3.0);

        // then
        expect(result, closeTo(0.914, 5e-4));
      });
      test("with a prefix", () {
        // when
        final result = feet.inverted.withPrefix(centi).fromSI(2.0);

        // then
        expect(result, closeTo(6.096e-3, 5e-4));
      });
    });
    group("from", () {
      test("inverse from 1", () {
        // when
        final result = minutes.inverted.toSI(1);

        // then
        expect(result, closeTo(0.0167, 5e-5));
      });
      test("inverse from fraction", () {
        // when
        final result = minutes.inverted.toSI(0.5);

        // then
        expect(result, closeTo(8.33e-3, 5e-6));
      });
    });
  });
}
