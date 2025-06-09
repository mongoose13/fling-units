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
        final measurement = 3.milli.knots;

        // when
        final result = measurement.as(nauticalMiles.per.hour);

        // then
        expect(result, closeTo(3e-3, 5e-6));
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
        final measurement = 3.knots.by(2.minutes);

        // then
        expect(measurement.as(nauticalMiles.per.minute.dot.seconds),
            closeTo(6.0, 0.005));
      });
      test("over", () {
        // given
        final measurement = 3.knots.over(2.minutes);

        // then
        expect(measurement.as((nauticalMiles.per.minute).per.hour),
            closeTo(1.5, 0.005));
      });
    });
    group("constants", () {
      test("speedOfLight", () {
        expect(speedOfLight.as(miles.per.hour), closeTo(6.71e8, 5e5));
      });
    });
  });
}
