import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 temperature', () {
      // given
      final temperature = TemperatureChange.zero();

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final temperature = TemperatureChange.zero();

      // when
      final result = temperature.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite temperature', () {
      // given
      final temperature = TemperatureChange.infinite();

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final temperature = TemperatureChange.infinite();

      // when
      final result = temperature.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative mass', () {
      // given
      final temperature = TemperatureChange.negativeInfinite();

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final temperature = TemperatureChange.negativeInfinite();

      // when
      final result = temperature.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final temperature = TemperatureChange.sum([
        kelvin(1),
        celcius(2),
        fahrenheit(3),
      ], precision: Precision(5));

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, 4.6667);
    });
  });

  group('as', () {
    test('converts to unit', () {
      // given
      final temperature = kelvin(1.23456, precision: Precision(8));

      // when
      final result = temperature.as(fahrenheit);

      // then
      expect(result, 2.222208);
    });
  });

  group('kelvin', () {
    test('converts to base', () {
      // given
      final temperature = kelvin(1.234, precision: Precision(5));

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, 1.234);
    });
    test('applies prefixes', () {
      // given
      final temperature = milli.kelvin(1234.0, precision: Precision(5));

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, 1.234);
    });
  });
  group('celcius', () {
    test('converts to base', () {
      // given
      final temperature = celcius(1.234, precision: Precision(5));

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, 1.234);
    });
    test('applies prefixes', () {
      // given
      final temperature = milli.celcius(1234.0, precision: Precision(5));

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, 1.234);
    });
  });
  group('fahrenheit', () {
    test('converts to base', () {
      // given
      final temperature = fahrenheit(1.234, precision: Precision(5));

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, 0.68556);
    });
    test('applies prefixes', () {
      // given
      final temperature = milli.fahrenheit(1234.0, precision: Precision(5));

      // when
      final result = temperature.as(kelvin);

      // then
      expect(result, 0.68556);
    });
  });
}
