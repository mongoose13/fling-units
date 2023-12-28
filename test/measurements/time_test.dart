import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Time', () {
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
      test('with custom default interpreter', () {
        // given
        final interpreter = Time.zero(minutes);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 min');
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
      test('with custom default interpreter', () {
        // given
        final interpreter = Time.infinite(minutes);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity min');
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
      test('with custom default interpreter', () {
        // given
        final interpreter = Time.negativeInfinite(minutes);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity min');
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

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = minutes;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'min');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.minutes;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mmin');
      });
      test('maintains units', () {
        // given
        final measurement = minutes(3.4).withPrecision(Precision(3));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 min');
      });
      test('maintains prefix', () {
        // given
        final measurement = milli.minutes(3.4).withPrecision(Precision(3));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mmin');
      });
      test('extension maintains prefix', () {
        // given
        final measurement = 3.4.milli.minutes.withPrecision(Precision(3));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mmin');
      });
      test('modified precision', () {
        // given
        final measurement = deci.minutes(23.45).withPrecision(Precision(3));

        // when
        final result = measurement.withPrecision(Precision(2)).toString();

        // then
        expect(result, '23.0 dmin');
      });
      test('modified units', () {
        // given
        final measurement = deci.minutes(23.45).withPrecision(Precision(3));

        // when
        final result = measurement.withDefaultUnit(milli.days).toString();

        // then
        expect(result, '1.63 md');
      });
    });
  });
}
