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

  // -------------------- DEPRECATED -------------------- //
  group('of', () {
    test('microseconds parameter', () {
      // given
      final time = Time.of(
        microseconds: 1,
        precision: Precision(5),
      );

      // when
      final result = time.asSeconds;

      // then
      expect(result, 0.000001);
    });
    test('milliseconds parameter', () {
      // given
      final time = Time.of(
        milliseconds: 1,
        precision: Precision(5),
      );

      // when
      final result = time.asSeconds;

      // then
      expect(result, 0.001);
    });
    test('seconds parameter', () {
      // given
      final time = Time.of(
        seconds: 1,
        precision: Precision(5),
      );

      // when
      final result = time.asSeconds;

      // then
      expect(result, 1.0);
    });
    test('minutes parameter', () {
      // given
      final time = Time.of(
        minutes: 1,
        precision: Precision(5),
      );

      // when
      final result = time.asSeconds;

      // then
      expect(result, 60.0);
    });
    test('hours parameter', () {
      // given
      final time = Time.of(
        hours: 1,
        precision: Precision(5),
      );

      // when
      final result = time.asSeconds;

      // then
      expect(result, 3600.0);
    });
    test('days parameter', () {
      // given
      final time = Time.of(
        days: 1,
        precision: Precision(5),
      );

      // when
      final result = time.asSeconds;

      // then
      expect(result, 86400.0);
    });
    test('sums parts', () {
      // given
      final time = Time.of(
        days: 1,
        hours: 2,
        minutes: 3,
        seconds: 4,
        milliseconds: 567,
        microseconds: 890,
        nanoseconds: 123,
        picoseconds: 456,
        precision: Precision(18),
      );

      // when
      final result = time.asSeconds;

      // then
      expect(result, 93784.567890123456);
    });
  });
  group('ofMicroseconds', () {
    test('converts to base', () {
      // given
      final time = Time.ofMicroseconds(1234.0, precision: Precision(5));

      // when
      final result = time.asSeconds;

      // then
      expect(result, 0.001234);
    });
  });
  group('ofMilliseconds', () {
    test('converts to base', () {
      // given
      final time = Time.ofMilliseconds(1234.0, precision: Precision(5));

      // when
      final result = time.asSeconds;

      // then
      expect(result, 1.234);
    });
  });
  group('ofSeconds', () {
    test('converts to base', () {
      // given
      final time = Time.ofSeconds(1234.0, precision: Precision(5));

      // when
      final result = time.asSeconds;

      // then
      expect(result, 1234.0);
    });
  });
  group('ofMinutes', () {
    test('converts to base', () {
      // given
      final time = Time.ofMinutes(1.234, precision: Precision(5));

      // when
      final result = time.asSeconds;

      // then
      expect(result, 74.04);
    });
  });
  group('ofHours', () {
    test('converts to base', () {
      // given
      final time = Time.ofHours(1.234, precision: Precision(5));

      // when
      final result = time.asSeconds;

      // then
      expect(result, 4442.4);
    });
  });
  group('ofDays', () {
    test('converts to base', () {
      // given
      final time = Time.ofDays(1.234, precision: Precision(5));

      // when
      final result = time.asSeconds;

      // then
      expect(result, 106620.0);
    });
  });

  group('asPicoseconds', () {
    test('converts to unit', () {
      // given
      final time = Time.ofSeconds(1.23456, precision: Precision(5));

      // when
      final result = time.asPicoseconds;

      // then
      expect(result, 1.2346e12);
    });
  });
  group('asNanoseconds', () {
    test('converts to unit', () {
      // given
      final time = Time.ofSeconds(1.23456, precision: Precision(5));

      // when
      final result = time.asNanoseconds;

      // then
      expect(result, 1.2346e9);
    });
  });
  group('asMicroseconds', () {
    test('converts to unit', () {
      // given
      final time = Time.ofSeconds(1.23456, precision: Precision(5));

      // when
      final result = time.asMicroseconds;

      // then
      expect(result, 1.2346e6);
    });
  });
  group('asMilliseconds', () {
    test('converts to unit', () {
      // given
      final time = Time.ofSeconds(1.23456, precision: Precision(5));

      // when
      final result = time.asMilliseconds;

      // then
      expect(result, 1.2346e3);
    });
  });
  group('asSeconds', () {
    test('converts to unit', () {
      // given
      final time = Time.ofSeconds(1.23456, precision: Precision(5));

      // when
      final result = time.asSeconds;

      // then
      expect(result, 1.2346);
    });
  });
  group('asMinutes', () {
    test('converts to unit', () {
      // given
      final time = Time.ofSeconds(1234.0, precision: Precision(5));

      // when
      final result = time.asMinutes;

      // then
      expect(result, 20.567);
    });
  });
  group('asHours', () {
    test('converts to unit', () {
      // given
      final time = Time.ofSeconds(1234.0, precision: Precision(5));

      // when
      final result = time.asHours;

      // then
      expect(result, 0.34278);
    });
  });
  group('asDays', () {
    test('converts to unit', () {
      // given
      final time = Time.ofSeconds(1234.0, precision: Precision(5));

      // when
      final result = time.asDays;

      // then
      expect(result, 0.014282);
    });
  });
}
