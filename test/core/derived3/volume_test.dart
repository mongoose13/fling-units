import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group("Volume", () {
    group("prefix", () {
      test("description", () {
        // when
        final unit = milli.liters;

        // then
        expect(unit.prefix, milli);
      });
    });

    group("multiplier", () {
      test("SI unit", () {
        // given
        final unit = cubic(meters);

        // then
        expect(unit.multiplier, 1.0);
      });
      test("SI unit with prefix", () {
        // given
        final unit = cubic(meters).withPrefix(deci);

        // then
        expect(unit.multiplier, 0.1);
      });
      test("non-SI unit", () {
        // given
        final unit = liters;

        // then
        expect(unit.multiplier, 0.001);
      });
      test("non-SI unit with prefix", () {
        // given
        final unit = deka.liters;

        // then
        expect(unit.multiplier, 0.01);
      });
    });

    group("of and from", () {
      test("description", () {
        // given
        final unit = milli.liters;

        // then
        expect(unit.of(1.0), 1000000);
      });
      test("description", () {
        // given
        final unit = milli.liters;

        // then
        expect(unit.from(1.0), 0.000001);
      });
    });

    group("as", () {
      test("with prefix converts to same prefix", () {
        // given
        final measurement = milli.liters(1000).withPrecision(3);

        // then
        expect(measurement.as(milli.liters), 1000);
      });
      test("with prefix converts back to base", () {
        // given
        final measurement = milli.liters(1000).withPrecision(3);

        // then
        expect(measurement.as(liters), 1.0);
      });
      test("with prefix converts to a different prefix", () {
        // given
        final measurement = milli.liters(1000).withPrecision(3);

        // then
        expect(measurement.as(deka.liters), 0.1);
      });
      test("without prefix to different unit", () {
        // given
        final measurement = liters(1).withPrecision(3);

        // then
        expect(measurement.as(usFluidOunces), 33.8);
      });
      test("with prefix to different unit", () {
        // given
        final measurement = milli.liters(1000).withPrecision(3);

        // then
        expect(measurement.as(usFluidOunces), 33.8);
      });
    });
  });
}
