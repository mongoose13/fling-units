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
      test("product 2", () {
        // given
        final measurement = DerivedUnit2(feet, yards)(3.6);

        // when
        final result = measurement.si;

        // then
        expect(result, closeTo(1.0, 0.005));
      });
      test("product 2 inverted", () {
        // given
        final measurement = DerivedUnit2(feet, minutes.inverted)(196.8);

        // when
        final result = measurement.si;

        // then
        expect(result, closeTo(1.0, 0.005));
      });
    });

    group("as", () {
      test("square", () {
        // given
        final measurement =
            square(feet)(10.8).withPrecision(SignificantDigits(3));

        // when
        final result = measurement.as(square(meters));

        // then
        expect(result, 1.0);
      });
      test("dot", () {
        // given
        final measurement =
            feet.dot.feet(10.8).withPrecision(SignificantDigits(3));

        // when
        final result = measurement.as(square(meters));

        // then
        expect(result, 1.0);
      });
      test("per", () {
        // given
        final measurement = feet.per.second(10.8);

        // when
        final result = measurement.as(meters.per.minute);

        // then
        expect(result, closeTo(198.0, 0.5));
      });
      test("from SI to other", () {
        // given
        final measurement = 1.square(meters);

        // when
        final result = measurement.as(square(feet));

        // then
        expect(result, closeTo(10.8, 0.05));
      });
      test("with prefix on destination numerator", () {
        // given
        final measurement = 4.miles.per.gallon;

        // when
        final result = measurement.as(kilo.meters.per.gallon);

        // then
        expect(result, closeTo(6.44, 0.005));
      });
      test("with prefix on destination denominator", () {
        // given
        final measurement = 4.miles.per.ounce;

        // when
        final result = measurement.as(miles.per.deci.ounce);

        // then
        expect(result, closeTo(0.4, 0.05));
      });
      test("with prefix on destination denominator on volume", () {
        // given
        final measurement = 4.miles.per.gallon;

        // when
        final result = measurement.as(miles.per.deci.gallon);

        // then
        expect(result, closeTo(0.4, 0.05));
      });
      test("with prefixes on destination", () {
        // given
        final measurement = 4.miles.per.ounce;

        // when
        final result = measurement.as(miles.per.deci.ounce);

        // then
        expect(result, closeTo(0.4, 0.05));
      });
      test("with prefixes on destination cancel out", () {
        // given
        final measurement = 4.miles.per.ounce;

        // when
        final result = measurement.as(deci.miles.per.deci.ounce);

        // then
        expect(result, closeTo(4.0, 0.05));
      });
      test("with prefixes on destination on volume", () {
        // given
        final measurement = 4.miles.per.gallon;

        // when
        final result = measurement.as(miles.per.deci.gallon);

        // then
        expect(result, closeTo(0.4, 0.05));
      });
      test("with prefixes on destination on volume cancel out", () {
        // given
        final measurement = 4.miles.per.gallon;

        // when
        final result = measurement.as(deci.miles.per.deci.gallon);

        // then
        expect(result, closeTo(4.0, 0.05));
      });
    });

    group("butAs", () {
      test("square", () {
        // given
        final measurement =
            square(feet)(10.8).withPrecision(SignificantDigits(3));

        // when
        final result = measurement.butAs(square(meters));

        // then
        expect(result.defaultValue, 1.0);
        expect(result.defaultUnit, square(meters));
      });
      test("dot", () {
        // given
        final measurement =
            feet.dot.feet(10.8).withPrecision(SignificantDigits(3));

        // when
        final result = measurement.butAs(square(meters));

        // then
        expect(result.defaultValue, 1.0);
        expect(result.defaultUnit, square(meters));
      });
      test("per", () {
        // given
        final measurement =
            feet.per.second(10.8).withPrecision(SignificantDigits(3));

        // when
        final result = measurement.butAs(meters.per.minute);

        // then
        expect(result.defaultValue, 198.0);
        expect(result.defaultUnit, meters.per.minute);
      });
      test("from SI to other", () {
        // given
        final measurement =
            1.square(meters).withPrecision(SignificantDigits(3));

        // when
        final result = measurement.butAs(square(feet));

        // then
        expect(result.defaultValue, 10.8);
        expect(result.defaultUnit, square(feet));
      });
    });
  });
}
