import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Distance', () {
    group('zero', () {
      test('has 0.0 distance', () {
        // given
        final measurement = DistanceMeasurement.zero();

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 0.0);
      });
      test('has max precision', () {
        // given
        final measurement = DistanceMeasurement.zero();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = DistanceMeasurement.zero(feet);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 ft');
      });
    });
    group('infinity', () {
      test('has infinite distance', () {
        // given
        final measurement = DistanceMeasurement.infinite();

        // when
        final result = measurement.as(meters);

        // then
        expect(result, double.infinity);
      });
      test('has max precision', () {
        // given
        final measurement = DistanceMeasurement.infinite();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = DistanceMeasurement.infinite(feet);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity ft');
      });
    });
    group('negativeInfinity', () {
      test('has infinite negative distance', () {
        // given
        final measurement = DistanceMeasurement.negativeInfinite();

        // when
        final result = measurement.as(meters);

        // then
        expect(result, double.negativeInfinity);
      });
      test('has max precision', () {
        // given
        final measurement = DistanceMeasurement.negativeInfinite();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = DistanceMeasurement.negativeInfinite(feet);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity ft');
      });
    });

    group('sum', () {
      test('adds parts', () {
        // given
        final measurement = DistanceMeasurement.sum(
          [
            kilo.meters(1),
            hecto.meters(2),
            deka.meters(3),
            meters(4),
            deci.meters(5),
            centi.meters(6),
            milli.meters(7),
            micro.meters(890),
            nano.meters(123),
            pico.meters(456),
          ],
          precision: SignificantDigits(16),
        );

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 1234.567890123456);
      });
    });

    group('as', () {
      test('converts to unit', () {
        // given
        final measurement = meters(123.456, precision: SignificantDigits(8));

        // when
        final result = measurement.as(nauticalMiles);

        // then
        expect(result, 0.066660907);
      });
    });

    group('meters', () {
      test('converts to base', () {
        // given
        final measurement = meters(1234.0, precision: DigitsAfterDecimal(4));

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 1234.0);
      });
      test('applies prefixes', () {
        // given
        final measurement =
            milli.meters(1234.0, precision: DigitsAfterDecimal(4));

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 1.234);
      });
    });
    group('miles', () {
      test('converts to base', () {
        // given
        final measurement = miles(1234.0, precision: DigitsAfterDecimal(-2));

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 1985900.0);
      });
      test('applies prefixes', () {
        // given
        final measurement =
            milli.miles(1234.0, precision: DigitsAfterDecimal(4));

        // when
        final result = measurement.as(miles);

        // then
        expect(result, 1.234);
      });
    });
    group('yards', () {
      test('converts to base', () {
        // given
        final measurement = yards(1234.0, precision: DigitsAfterDecimal(1));

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 1128.4);
      });
      test('applies prefixes', () {
        // given
        final measurement =
            milli.yards(1234.0, precision: DigitsAfterDecimal(4));

        // when
        final result = measurement.as(yards);

        // then
        expect(result, 1.234);
      });
    });
    group('feet', () {
      test('converts to base', () {
        // given
        final measurement = feet(1234.0, precision: DigitsAfterDecimal(2));

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 376.12);
      });
      test('applies prefixes', () {
        // given
        final measurement =
            milli.feet(1234.0, precision: DigitsAfterDecimal(4));

        // when
        final result = measurement.as(feet);

        // then
        expect(result, 1.234);
      });
    });
    group('inches', () {
      test('converts to base', () {
        // given
        final measurement = inches(1234.0, precision: DigitsAfterDecimal(3));

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 31.344);
      });
      test('applies prefixes', () {
        // given
        final measurement =
            milli.inches(1234.0, precision: DigitsAfterDecimal(4));

        // when
        final result = measurement.as(inches);

        // then
        expect(result, 1.234);
      });
    });
    group('nauticalMiles', () {
      test('converts to base', () {
        // given
        final measurement =
            nauticalMiles(1234.0, precision: DigitsAfterDecimal(-2));

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2285400.0);
      });
      test('applies prefixes', () {
        // given
        final measurement =
            milli.nauticalMiles(1234.0, precision: DigitsAfterDecimal(4));

        // when
        final result = measurement.as(nauticalMiles);

        // then
        expect(result, 1.234);
      });
    });

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = feet;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'ft');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.feet;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mft');
      });
      test('maintains units', () {
        // given
        final measurement = feet(3.4).withPrecision(DigitsAfterDecimal(2));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 ft');
      });
      test('maintains prefix', () {
        // given
        final measurement =
            milli.feet(3.4).withPrecision(DigitsAfterDecimal(2));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mft');
      });
      test('extension maintains prefix', () {
        // given
        final measurement = 3.4.milli.feet.withPrecision(DigitsAfterDecimal(2));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mft');
      });
      test('modified precision', () {
        // given
        final measurement =
            deci.feet(23.45).withPrecision(DigitsAfterDecimal(2));

        // when
        final result =
            measurement.withPrecision(DigitsAfterDecimal(0)).toString();

        // then
        expect(result, '23.0 dft');
      });
      test('modified units', () {
        // given
        final measurement =
            deci.feet(23.45).withPrecision(DigitsAfterDecimal(0));

        // when
        final result = measurement.butAs(milli.meters).toString();

        // then
        expect(result, '715.0 mm');
      });
    });
  });
}
