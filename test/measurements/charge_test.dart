import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 charge', () {
      // given
      final measurement = Charge.zero();

      // when
      final result = measurement.as(amperes);

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final measurement = Charge.zero();

      // when
      final result = measurement.precision;

      // then
      expect(result, Precision.max.precision);
    });
    test('with custom default interpreter', () {
      // given
      final interpreter = Charge.zero(amperes);

      // when
      final result = interpreter.toString();

      // then
      expect(result, '0.0 A');
    });
  });
  group('infinity', () {
    test('has infinite charge', () {
      // given
      final measurement = Charge.infinite();

      // when
      final result = measurement.as(amperes);

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final measurement = Charge.infinite();

      // when
      final result = measurement.precision;

      // then
      expect(result, Precision.max.precision);
    });
    test('with custom default interpreter', () {
      // given
      final interpreter = Charge.infinite(amperes);

      // when
      final result = interpreter.toString();

      // then
      expect(result, 'Infinity A');
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative charge', () {
      // given
      final measurement = Charge.negativeInfinite();

      // when
      final result = measurement.as(amperes);

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final measurement = Charge.negativeInfinite();

      // when
      final result = measurement.precision;

      // then
      expect(result, Precision.max.precision);
    });
    test('with custom default interpreter', () {
      // given
      final interpreter = Charge.negativeInfinite(amperes);

      // when
      final result = interpreter.toString();

      // then
      expect(result, '-Infinity A');
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final measurement = Charge.sum([
        amperes(2.1),
        amperes(5.0),
        amperes(0.3),
      ], precision: Precision(5));

      // when
      final result = measurement.as(amperes);

      // then
      expect(result, 7.4);
    });
  });

  group('as', () {
    test('converts to unit', () {
      // given
      final measurement = amperes(1.234, precision: Precision(8));

      // when
      final result = measurement.as(amperes);

      // then
      expect(result, 1.234);
    });
  });

  group('amperes', () {
    test('converts to base', () {
      // given
      final measurement = amperes(1.234, precision: Precision(5));

      // when
      final result = measurement.as(amperes);

      // then
      expect(result, 1.234);
    });
    test('applies prefixes', () {
      // given
      final measurement = milli.amperes(1.234e3, precision: Precision(5));

      // when
      final result = measurement.as(amperes);

      // then
      expect(result, 1.234);
    });
  });

  group('toString', () {
    test('interpreter name', () {
      // given
      final interpreter = amperes;

      // when
      final result = interpreter.toString();

      // then
      expect(result, 'A');
    });
    test('interpreter name with prefix', () {
      // given
      final interpreter = milli.amperes;

      // when
      final result = interpreter.toString();

      // then
      expect(result, 'mA');
    });
    test('maintains units', () {
      // given
      final measurement = amperes(3.4).withPrecision(Precision(3));

      // when
      final result = measurement.toString();

      // then
      expect(result, '3.4 A');
    });
    test('maintains prefix', () {
      // given
      final measurement = milli.amperes(3.4).withPrecision(Precision(3));

      // when
      final result = measurement.toString();

      // then
      expect(result, '3.4 mA');
    });
    test('extension maintains prefix', () {
      // given
      final measurement = 3.4.milli.amperes.withPrecision(Precision(3));

      // when
      final result = measurement.toString();

      // then
      expect(result, '3.4 mA');
    });
    test('modified precision', () {
      // given
      final measurement = deci.amperes(23.45).withPrecision(Precision(3));

      // when
      final result = measurement.withPrecision(Precision(2)).toString();

      // then
      expect(result, '23.0 dA');
    });
  });
}
