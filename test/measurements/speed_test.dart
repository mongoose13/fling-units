import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group("Speed", () {
    group("knots", () {
      test("definition", () {
        expect(knots.multiplier, nauticalMiles.per.hour.multiplier);
      });
      test("extension on num", () {
        // given
        final measurement = 3.knots;

        // then
        expect(measurement.as(nauticalMiles.per.hour), 3);
      });
      test("with prefix", () {
        // given
        final measurement = 3.milli.knots.withPrecision(SignificantDigits(3));

        // then
        expect(measurement.as(nauticalMiles.per.hour), 3e-3);
      });
      test("withPrecision", () {
        // given
        final measurement = 3.14159.knots.withPrecision(SignificantDigits(3));

        // then
        expect(measurement.as(nauticalMiles.per.hour), 3.14);
      });
      test("per", () {
        // given
        final unit = knots.per.minute;

        // then
        expect(unit.multiplier, knots.multiplier / minutes.multiplier);
      });
      test("dot", () {
        // given
        final unit = knots.dot.minutes;

        // then
        expect(unit.multiplier, knots.multiplier * minutes.multiplier);
      });
      test("by", () {
        // given
        final measurement =
            3.knots.by(2.minutes).withPrecision(DigitsAfterDecimal(2));

        // then
        expect(measurement.as(nauticalMiles.per.minute.dot.seconds), 6.0);
      });
      test("over", () {
        // given
        final measurement =
            3.knots.over(2.minutes).withPrecision(DigitsAfterDecimal(2));

        // then
        expect(measurement.as((nauticalMiles.per.minute).per.hour), 1.5);
      });
    });
    group("constants", () {
      test("speedOfLight", () {
        expect(
            speedOfLight.withPrecision(SignificantDigits(3)).as(miles.per.hour),
            6.71e8);
      });
    });
  });
}
