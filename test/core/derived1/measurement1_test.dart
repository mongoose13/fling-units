import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("DerivedMeasurement1", () {
    group("equivalence to call", () {
      test("inverted", () {
        expect(feet.inverted(2.0), feet(2.0).inverted);
      });
      test("num extension", () {
        expect(feet.inverted(2.0), 2.0.feet.inverted);
      });
    });

    group("num extension", () {
      test("uses correct default unit", () {
        // given
        final measurement = 2.feet.inverted;

        // then
        expect(measurement.defaultUnit, feet.inverted);
      });
      test("uses correct default value", () {
        // given
        final measurement = 2.feet.inverted;

        // then
        expect(measurement.defaultValue, 2.0);
      });
    });

    group("si", () {
      test("inverse SI", () {
        // given
        final measurement = 2.meters.inverted;

        // then
        expect(measurement.si, 2.0);
      });
      test("inverse non-SI", () {
        // given
        final measurement = 2.feet.inverted;

        // then
        expect(measurement.si, closeTo(6.56, 5e-3));
      });
      test("inverse non-SI with prefix", () {
        // given
        final measurement = 2.deci.feet.inverted;

        // then
        expect(measurement.si, closeTo(65.6, 5e-2));
      });
    });

    group("as", () {
      test("non-SI as SI", () {
        // given
        final measurement = feet.inverted(2);

        // then
        expect(measurement.as(meters.inverted), closeTo(6.56, 5e-3));
      });
      test("non-SI as other non-SI", () {
        // given
        final measurement = feet.inverted(2);

        // then
        expect(measurement.as(yards.inverted), closeTo(6.0, 5e-4));
      });
      test("SI as SI", () {
        // given
        final measurement = meters.inverted(2);

        // then
        expect(measurement.as(meters.inverted), 2);
      });
      test("SI as non-SI", () {
        // given
        final measurement = meters.inverted(2);

        // then
        expect(measurement.as(feet.inverted), closeTo(0.6096, 5e-5));
      });
    });

    group("butAs", () {
      test("SI to SI", () {
        // given
        final measurement = 30.seconds.inverted;

        // when
        final result = measurement.butAs(seconds.inverted);

        // then
        expect(result.defaultUnit, seconds.inverted);
        expect(result.defaultValue, 30.0);
      });
      test("SI to non-SI", () {
        // given
        final measurement = 0.5.seconds.inverted;

        // when
        final result = measurement.butAs(minutes.inverted);

        // then
        expect(result.defaultUnit, minutes.inverted);
        expect(result.defaultValue, 30.0);
      });
      test("SI to non-SI with prefix", () {
        // given
        final measurement = 0.5.seconds.inverted;

        // when
        final result = measurement.butAs(deci.minutes.inverted);

        // then
        expect(result.defaultUnit, deci.minutes.inverted);
        expect(result.defaultValue, 3.0);
      });
      test("SI with prefix to non-SI with prefix", () {
        // given
        final measurement = 30.deka.seconds.inverted;

        // when
        final result = measurement.butAs(deci.minutes.inverted);

        // then
        expect(result.defaultUnit, deci.minutes.inverted);
        expect(result.defaultValue, 18.0);
      });
      test("non-SI to SI", () {
        // given
        final measurement = 30.minutes.inverted;

        // when
        final result = measurement.butAs(seconds.inverted);

        // then
        expect(result.defaultUnit, seconds.inverted);
        expect(result.defaultValue, 0.5);
      });
      test("non-SI to non-SI", () {
        // given
        final measurement = 2.minutes.inverted;

        // when
        final result = measurement.butAs(hours.inverted);

        // then
        expect(result.defaultUnit, hours.inverted);
        expect(result.defaultValue, 120.0);
      });
    });
  });
}
