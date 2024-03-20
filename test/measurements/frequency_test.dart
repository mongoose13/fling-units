import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("Frequency", () {
    group("zero", () {
      test("has value of 0.0", () {
        // given
        final measurement = Frequency.zero();

        // when
        final result = measurement.as(hertz);

        // then
        expect(result, 0.0);
      });
      test('has max precision', () {
        // given
        final measurement = Frequency.zero();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = Frequency.zero(mega.hertz);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 MHz');
      });
    });
    group('infinity', () {
      test('has infinite value', () {
        // given
        final measurement = Frequency.infinite();

        // when
        final result = measurement.as(hertz);

        // then
        expect(result, double.infinity);
      });
      test('has max precision', () {
        // given
        final measurement = Frequency.infinite();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = Frequency.infinite(micro.hertz);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity μHz');
      });
    });
    group('negativeInfinity', () {
      test('has infinite negative value', () {
        // given
        final measurement = Frequency.negativeInfinite();

        // when
        final result = measurement.as(hertz);

        // then
        expect(result, double.negativeInfinity);
      });
      test('has max precision', () {
        // given
        final measurement = Frequency.negativeInfinite();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = Frequency.negativeInfinite(giga.hertz);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity GHz');
      });
    });

    

    group('sum', () {
      test('adds parts', () {
        // given
        final measurement = Frequency.sum(
          [
            kilo.hertz(1),
            hecto.hertz(2),
            deka.hertz(3),
            hertz(4),
            deci.hertz(5),
            centi.hertz(6),
            milli.hertz(7),
            micro.hertz(890),
            nano.hertz(123),
            pico.hertz(456),
          ],
          precision: Precision(16),
        );

        // when
        final result = measurement.as(hertz);

        // then
        expect(result, 1234.567890123456);
      });
    });

    group('as', () {
      test('converts to unit', () {
        // given
        final measurement = hertz(1.23456, precision: Precision(8));

        // when
        final result = measurement.as(milli.hertz);

        // then
        expect(result, 1234.56);
      });
    });

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = hertz;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Hz');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.hertz;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mHz');
      });
      test('maintains units', () {
        // given
        final measurement = hertz(3.4).withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 Hz');
      });
      test('maintains prefix', () {
        // given
        final measurement = milli.hertz(3.4).withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mHz');
      });
      test('extension maintains prefix', () {
        // given
        final measurement = 3.4.milli.hertz.withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mHz');
      });
      test('modified precision', () {
        // given
        final measurement = deci.hertz(23.45).withPrecisionOf(3);

        // when
        final result = measurement.withPrecisionOf(2).toString();

        // then
        expect(result, '23.0 dHz');
      });
      test('modified units', () {
        // given
        final measurement = deci.hertz(23.45).withPrecisionOf(3);

        // when
        final result = measurement.withDefaultUnit(milli.hertz).toString();

        // then
        expect(result, '2350.0 mHz');
      });
    });
  });
}
