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
  });
}
