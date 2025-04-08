import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("DerivedMeasurement3", () {
    group("num extension", () {
      test("uses correct default unit", () {
        // given
        final measurement = 3.cubic(milli.feet);

        // then
        expect(measurement.defaultUnit, cubic(milli.feet));
      });
      test("uses correct default value", () {
        // given
        final measurement = 3.cubic(feet);

        // then
        expect(measurement.defaultValue, 3.0);
      });
    });

    group("si", () {
      test("cubic", () {
        // given
        final measurement = cubic(feet)(35.3);

        // when
        final result = measurement.si;

        // then
        expect(result, closeTo(1.0, 0.005));
      });
      test("product", () {
        // given
        final measurement = DerivedUnit3.build(feet, yards, inches)(141.7);

        // when
        final result = measurement.si;

        // then
        expect(result, closeTo(1.0, 0.005));
      });
    });

    group("as", () {
      test("cubic", () {
        // given
        final measurement = cubic(feet)(35.3).withPrecision(3);

        // when
        final result = measurement.as(cubic(meters));

        // then
        expect(result, 1.0);
      });
      test("product", () {
        // given
        final measurement =
            DerivedUnit3.build(feet, feet, feet)(35.3).withPrecision(3);

        // when
        final result = measurement.as(cubic(meters));

        // then
        expect(result, 1.0);
      });
      test("from SI to other", () {
        // given
        final measurement = 1.cubic(meters).withPrecision(3);

        // when
        final result = measurement.as(cubic(feet));

        // then
        expect(result, 35.3);
      });
    });

    group("butAs", () {
      test("cubic", () {
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
        final measurement =
            DerivedUnit3.build(feet, feet, feet)(35.3).withPrecision(3);

        // when
        final result = measurement.butAs(cubic(meters));

        // then
        expect(result.defaultValue, 1.0);
        expect(result.defaultUnit, cubic(meters));
      });
      test("from SI to other", () {
        // given
        final measurement = 1.cubic(meters).withPrecision(3);

        // when
        final result = measurement.butAs(cubic(feet));

        // then
        expect(result.defaultValue, 35.3);
        expect(result.defaultUnit, cubic(feet));
      });
    });

    group("over", () {
      test("combines a derived3 unit in the numerator", () {
        // given
        final volume = 6.cubic(feet);
        final time = 2.minutes;

        // when
        final derived = volume.over(time);

        // then
        expect(
            derived.defaultUnit.multiplier,
            closeTo(
                feet.multiplier *
                    feet.multiplier *
                    feet.multiplier /
                    minutes.multiplier,
                5e-5));
        expect(derived.defaultValue, 3.0);
      });
      test("combines a derived3 unit in the denominator", () {
        // given
        final volume = 2.cubic(feet);
        final time = 6.minutes;

        // when
        final derived = time.over(volume);

        // then
        expect(
            derived.defaultUnit.multiplier,
            closeTo(
                minutes.multiplier /
                    (feet.multiplier * feet.multiplier * feet.multiplier),
                5e-5));
        expect(derived.defaultValue, 3.0);
      });
    });

    group("by", () {
      test("combines a derived3 unit first", () {
        // given
        final volume = 6.cubic(feet);
        final time = 2.minutes;

        // when
        final derived = volume.by(time);

        // then
        expect(
            derived.defaultUnit.multiplier,
            feet.multiplier *
                feet.multiplier *
                feet.multiplier *
                minutes.multiplier);
        expect(derived.defaultValue, 12.0);
      });
      test("combines a derived3 unit second", () {
        // given
        final volume = 6.cubic(feet);
        final time = 2.minutes;

        // when
        final derived = time.by(volume);

        // then
        expect(
            derived.defaultUnit.multiplier,
            feet.multiplier *
                feet.multiplier *
                feet.multiplier *
                minutes.multiplier);
        expect(derived.defaultValue, 12.0);
      });
    });
  });
}
