import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('TemperatureChange', () {
    group('zero', () {
      test('has 0.0 temperature', () {
        // given
        final temperature = TemperatureChangeMeasurement.zero();

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, 0.0);
      });
      test('has max precision', () {
        // given
        final temperature = TemperatureChangeMeasurement.zero();

        // when
        final result = temperature.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = TemperatureChangeMeasurement.zero(fahrenheit);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 °F');
      });
    });
    group('infinity', () {
      test('has infinite temperature', () {
        // given
        final temperature = TemperatureChangeMeasurement.infinite();

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, double.infinity);
      });
      test('has max precision', () {
        // given
        final temperature = TemperatureChangeMeasurement.infinite();

        // when
        final result = temperature.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = TemperatureChangeMeasurement.infinite(fahrenheit);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity °F');
      });
    });
    group('negativeInfinity', () {
      test('has infinite negative mass', () {
        // given
        final temperature = TemperatureChangeMeasurement.negativeInfinite();

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, double.negativeInfinity);
      });
      test('has max precision', () {
        // given
        final temperature = TemperatureChangeMeasurement.negativeInfinite();

        // when
        final result = temperature.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter =
            TemperatureChangeMeasurement.negativeInfinite(fahrenheit);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity °F');
      });
    });

    group('sum', () {
      test('adds parts', () {
        // given
        final temperature = sum([
          kelvin(1),
          celcius(2),
          fahrenheit(3),
        ], precision: 5);

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, 4.6667);
      });
    });

    group('as', () {
      test('converts to unit', () {
        // given
        final temperature = kelvin(1.23456, precision: 8);

        // when
        final result = temperature.as(fahrenheit);

        // then
        expect(result, 2.222208);
      });
    });

    group('kelvin', () {
      test('converts to base', () {
        // given
        final temperature = kelvin(1.234, precision: 5);

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, 1.234);
      });
      test('applies prefixes', () {
        // given
        final temperature = milli.kelvin(1234.0, precision: 5);

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, 1.234);
      });
    });
    group('celcius', () {
      test('converts to base', () {
        // given
        final temperature = celcius(1.234, precision: 5);

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, 1.234);
      });
      test('applies prefixes', () {
        // given
        final temperature = milli.celcius(1234.0, precision: 5);

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, 1.234);
      });
    });
    group('fahrenheit', () {
      test('converts to base', () {
        // given
        final temperature = fahrenheit(1.234, precision: 5);

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, 0.68556);
      });
      test('applies prefixes', () {
        // given
        final temperature = milli.fahrenheit(1234.0, precision: 5);

        // when
        final result = temperature.as(kelvin);

        // then
        expect(result, 0.68556);
      });
    });

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = fahrenheit;

        // when
        final result = interpreter.toString();

        // then
        expect(result, '°F');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.fahrenheit;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'm°F');
      });
      test('maintains units', () {
        // given
        final measurement = fahrenheit(3.4).withPrecision(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 °F');
      });
      test('maintains prefix', () {
        // given
        final measurement = milli.fahrenheit(3.4).withPrecision(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 m°F');
      });
      test('extension maintains prefix', () {
        // given
        final measurement = 3.4.milli.fahrenheit.withPrecision(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 m°F');
      });
      test('modified precision', () {
        // given
        final measurement = deci.fahrenheit(23.45).withPrecision(3);

        // when
        final result = measurement.withPrecision(2).toString();

        // then
        expect(result, '23.0 d°F');
      });
      test('modified units', () {
        // given
        final measurement = deci.fahrenheit(23.45).withPrecision(3);

        // when
        final result = measurement.butAs(milli.celcius).toString();

        // then
        expect(result, '1300.0 m°C');
      });
    });
  });
}
