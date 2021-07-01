import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 distance', () {
      // given
      final time = Time.zero();

      // when
      final result = time.as(seconds);

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final time = Time.zero();

      // when
      final result = time.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite distance', () {
      // given
      final time = Time.infinite();

      // when
      final result = time.as(seconds);

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final time = Time.infinite();

      // when
      final result = time.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative distance', () {
      // given
      final time = Time.negativeInfinite();

      // when
      final result = time.as(seconds);

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final time = Time.negativeInfinite();

      // when
      final result = time.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final time = Time.sum([
        seconds(1),
        deci.seconds(2),
        hecto.seconds(3),
        minutes(4),
      ], precision: Precision(5));

      // when
      final result = time.as(seconds);

      // then
      expect(result, 541.2);
    });
  });

  group('as', () {
    test('converts to unit', () {
      // given
      final time = seconds(1.23456e2, precision: Precision(8));

      // when
      final result = time.as(minutes);

      // then
      expect(result, 2.0576);
    });
  });

  group('seconds', () {
    test('converts to base', () {
      // given
      final time = seconds(1.234, precision: Precision(5));

      // when
      final result = time.as(seconds);

      // then
      expect(result, 1.234);
    });
    test('applies prefixes', () {
      // given
      final time = milli.seconds(1234.0, precision: Precision(5));

      // when
      final result = time.as(seconds);

      // then
      expect(result, 1.234);
    });
  });
  group('minutes', () {
    test('converts to base', () {
      // given
      final time = minutes(1.234, precision: Precision(5));

      // when
      final result = time.as(seconds);

      // then
      expect(result, 74.04);
    });
    test('applies prefixes', () {
      // given
      final time = milli.minutes(1234.0, precision: Precision(5));

      // when
      final result = time.as(seconds);

      // then
      expect(result, 74.04);
    });
  });
  group('hours', () {
    test('converts to base', () {
      // given
      final time = hours(1.234, precision: Precision(5));

      // when
      final result = time.as(seconds);

      // then
      expect(result, 4442.4);
    });
    test('applies prefixes', () {
      // given
      final time = milli.hours(1234.0, precision: Precision(5));

      // when
      final result = time.as(seconds);

      // then
      expect(result, 4442.4);
    });
  });
  group('days', () {
    test('converts to base', () {
      // given
      final time = days(1.234, precision: Precision(5));

      // when
      final result = time.as(seconds);

      // then
      expect(result, 106620.0);
    });
    test('applies prefixes', () {
      // given
      final time = milli.days(1234.0, precision: Precision(5));

      // when
      final result = time.as(seconds);

      // then
      expect(result, 106620.0);
    });
  });
}
