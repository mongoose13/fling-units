import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("Measurement", () {
    group("constructors", () {
      test("zero", () {
        // given
        final measurement = Measurement.zero(meters);

        // then
        expect(measurement.isInfinite, false);
        expect(measurement.isFinite, true);
        expect(measurement.isNaN, false);
        expect(measurement.isNegative, false);
        expect(measurement.si, 0.0);
      });
      test("infinite", () {
        // given
        final measurement = Measurement.infinite(meters);

        // then
        expect(measurement.isInfinite, true);
        expect(measurement.isFinite, false);
        expect(measurement.isNaN, false);
        expect(measurement.isNegative, false);
        expect(measurement.si, double.infinity);
      });
      test("negativeInfinite", () {
        // given
        final measurement = Measurement.negativeInfinite(meters);

        // then
        expect(measurement.isInfinite, true);
        expect(measurement.isFinite, false);
        expect(measurement.isNaN, false);
        expect(measurement.isNegative, true);
        expect(measurement.si, double.negativeInfinity);
      });
      test("nan", () {
        // given
        final measurement = Measurement.nan(meters);

        // then
        expect(measurement.isInfinite, false);
        expect(measurement.isFinite, false);
        expect(measurement.isNaN, true);
        expect(measurement.isNegative, false);
      });
    });

    group("si", () {
      test("of an SI unit", () {
        // given
        final measurement = 3.meters;

        final result = measurement.si;

        // then
        expect(result, 3.0);
      });
      test("of a non SI unit", () {
        // given
        final measurement = 3.feet;

        final result = measurement.si;

        // then
        expect(result, closeTo(0.914, 0.0005));
      });
      test("of an SI unit with a prefix", () {
        // given
        final measurement = 3.centi.meters;

        final result = measurement.si;

        // then
        expect(result, 0.03);
      });
      test("of a non SI unit with a prefix", () {
        // given
        final measurement = 3.centi.feet;

        final result = measurement.si;

        // then
        expect(result, closeTo(0.00914, 0.000005));
      });
    });

    group("addition", () {
      test("same units", () {
        // given
        final measurement = 2.centi.meters;

        // when
        final result = measurement + 3.centi.meters;

        // then
        expect(result.defaultUnit, centi.meters);
        expect(result.defaultValue, closeTo(5.0, 0.005));
      });
      test("different units", () {
        // given
        final measurement = 4.centi.meters;

        // when
        final result = (measurement + 2.inches);

        // then
        expect(result.defaultUnit, centi.meters);
        expect(result.defaultValue, closeTo(9.08, 0.005));
      });
    });

    group("sum", () {
      test("different units", () {
        // given
        final measurement = sum([2.centi.meters, 3.inches]);

        // then
        expect(measurement.defaultUnit, centi.meters);
        expect(measurement.defaultValue, closeTo(9.62, 0.005));
      });
      test("specify a default unit", () {
        // given
        final measurement = sum([2.centi.meters, 3.inches], defaultUnit: feet);

        // then
        expect(measurement.defaultUnit, feet);
        expect(measurement.defaultValue, closeTo(0.316, 0.0005));
      });
    });

    group("subtraction", () {
      test("same units", () {
        // given
        final measurement = 5.centi.meters;

        // when
        final result = measurement - 3.centi.meters;

        // then
        expect(result.defaultUnit, centi.meters);
        expect(result.defaultValue, closeTo(2.0, 0.0005));
      });
      test("different units", () {
        // given
        final measurement = 6.centi.meters;

        // when
        final result = (measurement - 2.inches);

        // then
        expect(result.defaultUnit, centi.meters);
        expect(result.defaultValue, closeTo(0.92, 0.0005));
      });
    });
  });
}
