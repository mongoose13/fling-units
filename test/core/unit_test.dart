import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("Unit", () {
    test("of", () {
      // when
      final result = feet.of(3);

      // then
      expect(result, closeTo(9.84, 0.005));
    });
    test("from", () {
      // when
      final result = feet.from(3);

      // then
      expect(result, closeTo(0.914, 0.0005));
    });
  });
  group("DerivedUnit2", () {
    group("multiplier", () {
      test("square", () {
        // given
        final unit = square(feet);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(10.76, 0.005));
      });
      test("product", () {
        // given
        final unit = product(feet, inches);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(129.17, 0.005));
      });
      test("ratio", () {
        // given
        final unit = ratio(feet, deci.seconds);

        // when
        final result = unit.multiplier;

        // then
        expect(result, closeTo(32.81, 0.005));
      });
      test("with prefix", () {
        // given
        final unit = square(feet);

        // when
        final result = unit.withPrefix(deci).multiplier;

        // then
        expect(result, closeTo(1.076, 0.0005));
      });
    });
    group("of", () {
      test("square of 1", () {
        // when
        final result = square(feet).of(1.0);

        // then
        expect(result, closeTo(10.76, 0.005));
      });
      test("square of several", () {
        // when
        final result = square(feet).of(3.0);

        // then
        expect(result, closeTo(32.3, 0.05));
      });
      test("product of 1", () {
        // when
        final result = product(feet, inches).of(1.0);

        // then
        expect(result, closeTo(129.2, 0.05));
      });
      test("product of several", () {
        // when
        final result = product(feet, inches).of(3.0);

        // then
        expect(result, closeTo(387.5, 0.05));
      });
      test("ratio of 1", () {
        // when
        final result = ratio(feet, deci.seconds).of(1.0);

        // then
        expect(result, closeTo(32.8, 0.05));
      });
      test("ratio of several", () {
        // when
        final result = ratio(feet, deci.seconds).of(2.0);

        // then
        expect(result, closeTo(65.6, 0.05));
      });
    });
    group("from", () {
      test("square from 1", () {
        // when
        final result = square(feet).from(1);

        // then
        expect(result, closeTo(0.0929, 0.00005));
      });
      test("square from several", () {
        // when
        final result = square(feet).from(10);

        // then
        expect(result, closeTo(0.929, 0.0005));
      });
      test("product from 1", () {
        // when
        final result = product(feet, inches).from(1);

        // then
        expect(result, closeTo(0.00774, 0.000005));
      });
      test("product from several", () {
        // when
        final result = product(feet, inches).from(10);

        // then
        expect(result, closeTo(0.0774, 0.00005));
      });
      test("ratio from 1", () {
        // when
        final result = ratio(feet, deci.seconds).from(1);

        // then
        expect(result, closeTo(0.0305, 0.00005));
      });
      test("ratio from several", () {
        // when
        final result = ratio(feet, deci.seconds).from(10);

        // then
        expect(result, closeTo(0.305, 0.0005));
      });
    });
  });
}
