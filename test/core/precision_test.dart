import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('out of range', () {
    test('zero precision', () {
      // given
      const precision = Precision(0);

      // when
      final result = precision.apply(1.234);

      // then
      expect(result, 1.0);
    });
    test('negative precision', () {
      // given
      const precision = Precision(-2);

      // when
      final result = precision.apply(1.234);

      // then
      expect(result, 1.0);
    });
    test('high precision', () {
      // given
      const precision = Precision(22);

      // when
      final result = precision.apply(1.23456789012345678901234567890);

      // then
      expect(result, 1.23456789012345678901);
    });
  });

  group('withPrecision', () {
    test('partial whole number precision', () {
      //given
      const precision = Precision(2);

      // when
      final result = precision.apply(123.4321);

      // then
      expect(result, 120.0);
    });
    test('whole number precision', () {
      //given
      const precision = Precision(3);

      // when
      final result = precision.apply(123.4321);

      // then
      expect(result, 123.0);
    });
    test('whole and decimal number precision', () {
      //given
      const precision = Precision(4);

      // when
      final result = precision.apply(123.4321);

      // then
      expect(result, 123.4);
    });
    test('rounding at .5', () {
      //given
      const precision = Precision(4);

      // when
      final result = precision.apply(123.45);

      // then
      expect(result, 123.5);
    });
    test('additional precision', () {
      //given
      const precision = Precision(5);

      // when
      final result = precision.apply(1.23);

      // then
      expect(result, 1.23);
    });
  });

  group('combine', () {
    test('with no items', () {
      // then
      expect(() => Precision.combine([]), throwsStateError);
    });
    test('with single item', () {
      // given
      const precision1 = Precision(3);

      // when
      final result = Precision.combine([precision1]);

      // then
      expect(result.precision, 3);
    });
    test('chooses smaller value of two', () {
      // given
      const precision1 = Precision(3);
      const precision2 = Precision(2);

      // when
      final result = Precision.combine([precision1, precision2]);

      // then
      expect(result.precision, 2);
    });
    test('chooses smaller value of many', () {
      // when
      final result = Precision.combine([
        Precision(3),
        Precision(5),
        Precision(20),
        Precision(2),
        Precision(10),
      ]);

      // then
      expect(result.precision, 2);
    });
    test('chooses smaller value of many when answer is first', () {
      // when
      final result = Precision.combine([
        Precision(3),
        Precision(5),
        Precision(20),
        Precision(4),
        Precision(10),
      ]);

      // then
      expect(result.precision, 3);
    });
    test('chooses smaller value of many when answer is last', () {
      // when
      final result = Precision.combine([
        Precision(10),
        Precision(5),
        Precision(20),
        Precision(4),
        Precision(3),
      ]);

      // then
      expect(result.precision, 3);
    });
  });

  group('digitsBeforeDecimal', () {
    test('mixed number', () {
      // given
      final measurement = meters(12.3456, precision: Precision(6));

      // when
      final result = Precision.digitsBeforeDecimal(measurement.as(meters));

      // then
      expect(result, 2);
    });
    test('number below 1', () {
      // given
      final measurement = meters(1.23456e-2, precision: Precision(6));

      // when
      final result = Precision.digitsBeforeDecimal(measurement.as(meters));

      // then
      expect(result, 0);
    });
    test('beyond maximum int', () {
      // given
      final measurement = meters(1.23456e25, precision: Precision(6));

      // when
      final result = Precision.digitsBeforeDecimal(measurement.as(meters));

      // then
      expect(result, 26);
    });
    test('beyond minimum double', () {
      // given
      final measurement = meters(1.23456e-35, precision: Precision(6));

      // when
      final result = Precision.digitsBeforeDecimal(measurement.as(meters));

      // then
      expect(result, 0);
    });
    test('negative', () {
      // given
      final measurement = meters(-12.3456, precision: Precision(6));

      // when
      final result = Precision.digitsBeforeDecimal(measurement.as(meters));

      // then
      expect(result, 2);
    });
    test('infinity', () {
      // given
      final measurement = Distance.infinite();

      // when
      final result = Precision.digitsBeforeDecimal(measurement.as(meters));

      // then
      expect(result, Precision.max.precision);
    });
    test('negative infinity', () {
      // given
      final measurement = Distance.negativeInfinite();

      // when
      final result = Precision.digitsBeforeDecimal(measurement.as(meters));

      // then
      expect(result, Precision.max.precision);
    });
    test('NaN', () {
      // given
      final measurement = Distance.infinite() + Distance.negativeInfinite();

      // when
      final result = Precision.digitsBeforeDecimal(measurement.as(meters));

      // then
      expect(result, Precision.max.precision);
    });
  });

  group('digitsAfterDecimal', () {
    test('mixed number, same precision', () {
      // given
      final measurement = meters(12.3456, precision: Precision(6));

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 4);
    });
    test('mixed number, hidden precision', () {
      // given
      final measurement = meters(1.2, precision: Precision(4));

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 3);
    });
    test('number below 1', () {
      // given
      final measurement = meters(1.23456e-3, precision: Precision(6));

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 8);
    });
    test('beyond maximum int', () {
      // given
      final measurement = meters(1.23456e33, precision: Precision(6));

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 0);
    });
    test('single digit negative exponent', () {
      // given
      final measurement = meters(1.2e-9, precision: Precision(2));

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 10);
    });
    test('double digit negative exponent', () {
      // given
      final measurement = meters(1.2e-10, precision: Precision(2));

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 11);
    });
    test('beyond minimum double', () {
      // given
      final measurement = meters(1.2e-33, precision: Precision(2));

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 34);
    });
    test('infinity', () {
      // given
      final measurement = Distance.infinite();

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 0);
    });
    test('negative infinity', () {
      // given
      final measurement = Distance.negativeInfinite();

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 0);
    });
    test('NaN', () {
      // given
      final measurement = Distance.infinite() + Distance.negativeInfinite();

      // when
      final result = Precision.digitsAfterDecimal(measurement);

      // then
      expect(result, 0);
    });
  });

  group('addition', () {
    test('integer numbers', () {
      // given
      final measurement1 = meters(12, precision: Precision(2));
      final measurement2 = meters(345, precision: Precision(3));

      // when
      final result = Precision.addition(measurement1, measurement2);

      // then
      expect(result.precision, 3);
    });
    test('integer numbers with decreased precision', () {
      // given
      final measurement1 = meters(123, precision: Precision(3));
      final measurement2 = meters(-45, precision: Precision(2));

      // when
      final result = Precision.addition(measurement1, measurement2);

      // then
      expect(result.precision, 2);
    });
    test('mixed numbers', () {
      // given
      final measurement1 = meters(1.234, precision: Precision(4));
      final measurement2 = meters(1.234, precision: Precision(4));

      // when
      final result = Precision.addition(measurement1, measurement2);

      // then
      expect(result.precision, 4);
    });
    test('mixed numbers give magnitude increase', () {
      // given
      final measurement1 = meters(1.234, precision: Precision(4));
      final measurement2 = meters(9.234, precision: Precision(4));

      // when
      final result = Precision.addition(measurement1, measurement2);

      // then
      expect(result.precision, 5);
    });
    test('mixed numbers give magnitude decrease', () {
      // given
      final measurement1 = meters(123.45, precision: Precision(5));
      final measurement2 = meters(24.65, precision: Precision(4));

      // when
      final result = Precision.addition(measurement1, -measurement2);

      // then
      expect(result.precision, 4);
    });
    test('smallest decimal is accepted', () {
      // given
      final measurement1 = meters(1.2, precision: Precision(2));
      final measurement2 = meters(1.234, precision: Precision(4));

      // when
      final result = Precision.addition(measurement1, measurement2);

      // then
      expect(result.precision, 2);
    });
    test('numbers lower than 1', () {
      // given
      final measurement1 = milli.meters(1.234, precision: Precision(4));
      final measurement2 = milli.meters(1.234, precision: Precision(4));

      // when
      final result = Precision.addition(measurement1, measurement2);

      // then
      expect(result.precision, 6);
    });
    test('magnitude increase is capped at the limit', () {
      // given
      final measurement1 = meters(1.234, precision: Precision(21));
      final measurement2 = meters(9.234, precision: Precision(21));

      // when
      final result = Precision.addition(measurement1, measurement2);

      // then
      expect(result.precision, 21);
    });
    test(
        'magnitude increase does not breach cap for unspecified precision measurements',
        () {
      // given
      final measurement1 = meters(100);
      final measurement2 = meters(900);

      // when
      final result = Precision.addition(measurement1, measurement2);

      // then
      expect(result.precision, 21);
    });
  });
}
