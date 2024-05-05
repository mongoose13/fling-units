import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("DerivedUnit2", () {
    group("si", () {
      test("square", () {
        // given
        final measurement = square(feet)(10.8);

        // when
        final result = measurement.si;

        // then
        expect(result, closeTo(1.0, 0.005));
      });
      test("product", () {
        // given
        final measurement = product2(feet, yards)(3.6);

        // when
        final result = measurement.si;

        // then
        expect(result, closeTo(1.0, 0.005));
      });
      test("ratio", () {
        // given
        final measurement = ratio(feet, minutes)(196.8);

        // when
        final result = measurement.si;

        // then
        expect(result, closeTo(1.0, 0.005));
      });
    });

    group("as", () {
      test("square", () {
        // given
        final measurement = square(feet)(10.8).withPrecision(3);

        // when
        final result = measurement.as(square(meters));

        // then
        expect(result, 1.0);
      });
      test("product", () {
        // given
        final measurement = product2(feet, feet)(10.8).withPrecision(3);

        // when
        final result = measurement.as(square(meters));

        // then
        expect(result, 1.0);
      });
      test("ratio", () {
        // given
        final measurement = ratio(feet, seconds)(10.8).withPrecision(3);

        // when
        final result = measurement.as(ratio(meters, minutes));

        // then
        expect(result, 198.0);
      });
      test("from SI to other", () {
        // given
        final measurement = 1.square(meters).withPrecision(3);

        // when
        final result = measurement.as(square(feet));

        // then
        expect(result, 10.8);
      });
    });

    group("butAs", () {
      test("square", () {
        // given
        final measurement = square(feet)(10.8).withPrecision(3);

        // when
        final result = measurement.butAs(square(meters));

        // then
        expect(result.defaultValue, 1.0);
        expect(result.defaultUnit, square(meters));
      });
      test("product", () {
        // given
        final measurement = product2(feet, feet)(10.8).withPrecision(3);

        // when
        final result = measurement.butAs(square(meters));

        // then
        expect(result.defaultValue, 1.0);
        expect(result.defaultUnit, square(meters));
      });
      test("ratio", () {
        // given
        final measurement = ratio(feet, seconds)(10.8).withPrecision(3);

        // when
        final result = measurement.butAs(ratio(meters, minutes));

        // then
        expect(result.defaultValue, 198.0);
        expect(result.defaultUnit, ratio(meters, minutes));
      });
      test("from SI to other", () {
        // given
        final measurement = 1.square(meters).withPrecision(3);

        // when
        final result = measurement.butAs(square(feet));

        // then
        expect(result.defaultValue, 10.8);
        expect(result.defaultUnit, square(feet));
      });
    });
  });
}
