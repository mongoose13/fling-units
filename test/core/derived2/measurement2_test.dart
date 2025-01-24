import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("DerivedMeasurement2", () {
    group("num extension", () {
      test("uses correct default unit", () {
        // given
        final measurement = 3.square(milli.feet);

        // then
        expect(measurement.defaultUnit, square(milli.feet));
      });
      test("uses correct default value", () {
        // given
        final measurement = 3.square(feet);

        // then
        expect(measurement.defaultValue, 3.0);
      });
    });

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
      test("with prefix on destination numerator", () {
        // given
        final measurement = 4.miles.per.gallon.withPrecision(3);

        // when
        final result = measurement.as(kilo.meters.per.gallon);

        // then
        expect(result, 6.44);
      });
      test("with prefix on destination denominator", () {
        // given
        final measurement = 4.miles.per.ounce.withPrecision(3);

        // when
        final result = measurement.as(miles.per.deci.ounce);

        // then
        expect(result, 0.4);
      });
      test("with prefix on destination denominator on volume", () {
        // given
        final measurement = 4.miles.per.gallon.withPrecision(3);

        // when
        final result = measurement.as(miles.per.deci.gallon);

        // then
        expect(result, 0.4);
      });
      test("with prefixes on destination", () {
        // given
        final measurement = 4.miles.per.ounce.withPrecision(3);

        // when
        final result = measurement.as(deci.miles.per.deci.ounce);

        // then
        expect(result, 4.0);
      });
      test("with prefixes on destination on volume", () {
        // given
        final measurement = 4.miles.per.gallon.withPrecision(3);

        // when
        final result = measurement.as(deci.miles.per.deci.gallon);

        // then
        expect(result, 4.0);
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

    group("over", () {
      test("combines two units properly", () {
        // given
        final distance = 6.miles;
        final time = 2.hours;

        // when
        final derived = distance.over(time);

        // then
        expect(derived.defaultUnit, miles.per.hour);
        expect(derived.defaultValue, 3.0);
      });
    });
  });
}
