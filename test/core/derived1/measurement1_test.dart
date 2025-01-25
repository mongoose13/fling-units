import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("DerivedMeasurement1", () {
    group("equivalence to call", () {
      test("using inverse", () {
        expect(inverse(feet)(2.0), inverse(feet).using(0.5.feet));
      });
      test("num extension", () {
        expect(inverse(feet)(2.0), 2.0.inverse(feet));
      });
    });

    group("num extension", () {
      test("uses correct default unit", () {
        // given
        final measurement = 2.inverse(feet);

        // then
        expect(measurement.defaultUnit, inverse(feet));
      });
      test("uses correct default value", () {
        // given
        final measurement = 2.inverse(feet);

        // then
        expect(measurement.defaultValue, 2.0);
      });
    });

    group("si", () {
      test("inverse SI", () {
        // given
        final measurement = 2.inverse(meters);

        // then
        expect(measurement.si, 2.0);
      });
      test("inverse non-SI", () {
        // given
        final measurement = 2.inverse(feet);

        // then
        expect(measurement.si, closeTo(6.56, 5e-3));
      });
      test("inverse non-SI with prefix", () {
        // given
        final measurement = 2.inverse(deci.feet);

        // then
        expect(measurement.si, closeTo(65.6, 5e-2));
      });
    });

    group("as", () {
      test("non-SI as SI", () {
        // given
        final measurement = inverse(feet)(2);

        // then
        expect(measurement.as(inverse(meters)), closeTo(6.56, 5e-3));
      });
      test("non-SI as other non-SI", () {
        // given
        final measurement = inverse(feet)(2);

        // then
        expect(measurement.as(inverse(yards)), closeTo(6.0, 5e-4));
      });
      test("SI as SI", () {
        // given
        final measurement = inverse(meters)(2);

        // then
        expect(measurement.as(inverse(meters)), 2);
      });
      test("SI as non-SI", () {
        // given
        final measurement = inverse(meters)(2);

        // then
        expect(measurement.as(inverse(feet)), closeTo(0.6096, 5e-5));
      });
    });

    group("butAs", () {
      test("SI to SI", () {
        // given
        final measurement = 30.inverse(seconds);

        // when
        final result = measurement.butAs(inverse(seconds));

        // then
        expect(result.defaultUnit, inverse(seconds));
        expect(result.defaultValue, 30.0);
      });
      test("SI to non-SI", () {
        // given
        final measurement = 0.5.inverse(seconds);

        // when
        final result = measurement.butAs(inverse(minutes));

        // then
        expect(result.defaultUnit, inverse(minutes));
        expect(result.defaultValue, 30.0);
      });
      test("SI to non-SI with prefix", () {
        // given
        final measurement = 0.5.inverse(seconds);

        // when
        final result = measurement.butAs(inverse(deci.minutes));

        // then
        expect(result.defaultUnit, inverse(deci.minutes));
        expect(result.defaultValue, 3.0);
      });
      test("SI with prefix to non-SI with prefix", () {
        // given
        final measurement = 30.inverse(deka.seconds);

        // when
        final result = measurement.butAs(inverse(deci.minutes));

        // then
        expect(result.defaultUnit, inverse(deci.minutes));
        expect(result.defaultValue, 18.0);
      });
      test("non-SI to SI", () {
        // given
        final measurement = 30.inverse(minutes);

        // when
        final result = measurement.butAs(inverse(seconds));

        // then
        expect(result.defaultUnit, inverse(seconds));
        expect(result.defaultValue, 0.5);
      });
      test("non-SI to non-SI", () {
        // given
        final measurement = 2.inverse(minutes);

        // when
        final result = measurement.butAs(inverse(hours));

        // then
        expect(result.defaultUnit, inverse(hours));
        expect(result.defaultValue, 120.0);
      });
    });
  });
}
