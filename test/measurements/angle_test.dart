import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 value', () {
      // given
      final measurement = Angle.zero();

      // when
      final result = measurement.as(radians);

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final measurement = Angle.zero();

      // when
      final result = measurement.precision;

      // then
      expect(result, Precision.max.precision);
    });
    test('with custom default interpreter', () {
      // given
      final interpreter = Angle.zero(radians);

      // when
      final result = interpreter.toString();

      // then
      expect(result, '0.0 rad');
    });
  });
  group('infinity', () {
    test('has infinite value', () {
      // given
      final measurement = Angle.infinite();

      // when
      final result = measurement.as(radians);

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final measurement = Angle.infinite();

      // when
      final result = measurement.precision;

      // then
      expect(result, Precision.max.precision);
    });
    test('with custom default interpreter', () {
      // given
      final interpreter = Angle.infinite(radians);

      // when
      final result = interpreter.toString();

      // then
      expect(result, 'Infinity rad');
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative value', () {
      // given
      final measurement = Angle.negativeInfinite();

      // when
      final result = measurement.as(radians);

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final measurement = Angle.negativeInfinite();

      // when
      final result = measurement.precision;

      // then
      expect(result, Precision.max.precision);
    });
    test('with custom default interpreter', () {
      // given
      final interpreter = Angle.negativeInfinite(radians);

      // when
      final result = interpreter.toString();

      // then
      expect(result, '-Infinity rad');
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final measurement = Angle.sum([
        degrees(2.1),
        arcMinutes(5.0),
        arcSeconds(0.3),
      ], precision: Precision(5));

      // when
      final result = measurement.as(degrees);

      // then
      expect(result, 2.1834);
    });
  });

  group('as', () {
    test('converts to unit', () {
      // given
      final measurement = turns(1.234, precision: Precision(5));

      // when
      final result = measurement.as(radians);

      // then
      expect(result, 7.7535);
    });
  });

  group('turns', () {
    test('converts to base', () {
      // given
      final measurement = turns(1.234, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 1.234);
    });
    test('applies prefixes', () {
      // given
      final measurement = milli.turns(1.234e3, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 1.234);
    });
  });

  group('radians', () {
    test('converts to base', () {
      // given
      final measurement = radians(1.234, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 0.19640);
    });
    test('applies prefixes', () {
      // given
      final measurement = milli.radians(1.234e3, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 0.19640);
    });
  });

  group('gradians', () {
    test('converts to base', () {
      // given
      final measurement = gradians(1.234, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 3.0850e-3);
    });
    test('applies prefixes', () {
      // given
      final measurement = milli.gradians(1.234e3, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 3.0850e-3);
    });
  });

  group('degrees', () {
    test('converts to base', () {
      // given
      final measurement = degrees(123.4, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 0.34278);
    });
    test('applies prefixes', () {
      // given
      final measurement = milli.degrees(123.4e3, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 0.34278);
    });
  });

  group('arc minutes', () {
    test('converts to base', () {
      // given
      final measurement = arcMinutes(123.4, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 5.713e-3);
    });
    test('applies prefixes', () {
      // given
      final measurement = milli.arcMinutes(123.4e3, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 5.713e-3);
    });
  });

  group('arc seconds', () {
    test('converts to base', () {
      // given
      final measurement = arcSeconds(1234, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 9.5216e-4);
    });
    test('applies prefixes', () {
      // given
      final measurement = milli.arcSeconds(1234e3, precision: Precision(5));

      // when
      final result = measurement.as(turns);

      // then
      expect(result, 9.5216e-4);
    });
  });

  group('toString', () {
    test('interpreter name', () {
      // given
      final interpreter = degrees;

      // when
      final result = interpreter.toString();

      // then
      expect(result, '°');
    });
    test('interpreter name with prefix', () {
      // given
      final interpreter = milli.degrees;

      // when
      final result = interpreter.toString();

      // then
      expect(result, 'm°');
    });
    test('maintains units', () {
      // given
      final measurement = degrees(3.4).withPrecision(Precision(3));

      // when
      final result = measurement.toString();

      // then
      expect(result, '3.4 °');
    });
    test('maintains prefix', () {
      // given
      final measurement = milli.degrees(3.4).withPrecision(Precision(3));

      // when
      final result = measurement.toString();

      // then
      expect(result, '3.4 m°');
    });
    test('extension maintains prefix', () {
      // given
      final measurement = 3.4.milli.degrees.withPrecision(Precision(3));

      // when
      final result = measurement.toString();

      // then
      expect(result, '3.4 m°');
    });
    test('modified precision', () {
      // given
      final measurement = deci.degrees(23.45).withPrecision(Precision(3));

      // when
      final result = measurement.withPrecision(Precision(2)).toString();

      // then
      expect(result, '23.0 d°');
    });
  });
}
