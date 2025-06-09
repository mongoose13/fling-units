import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('SignificantDigits', () {
    group('out of range', () {
      test('zero precision', () {
        // given
        const precision = SignificantDigits(0);

        // when
        final result = precision.apply(1.234);

        // then
        expect(result, 1.0);
      });
      test('negative precision', () {
        // given
        const precision = SignificantDigits(-2);

        // when
        final result = precision.apply(1.234);

        // then
        expect(result, 1.0);
      });
      test('high precision', () {
        // given
        const precision = SignificantDigits(22);

        // when
        final result = precision.apply(1.23456789012345678901234567890);

        // then
        expect(result, 1.23456789012345678901);
      });
    });

    group('withPrecision', () {
      test('partial whole number precision', () {
        //given
        const precision = SignificantDigits(2);

        // when
        final result = precision.apply(123.4321);

        // then
        expect(result, 120.0);
      });
      test('whole number precision', () {
        //given
        const precision = SignificantDigits(3);

        // when
        final result = precision.apply(123.4321);

        // then
        expect(result, 123.0);
      });
      test('whole and decimal number precision', () {
        //given
        const precision = SignificantDigits(4);

        // when
        final result = precision.apply(123.4321);

        // then
        expect(result, 123.4);
      });
      test('rounding at .5', () {
        //given
        const precision = SignificantDigits(4);

        // when
        final result = precision.apply(123.45);

        // then
        expect(result, 123.5);
      });
      test('additional precision', () {
        //given
        const precision = SignificantDigits(5);

        // when
        final result = precision.apply(1.23);

        // then
        expect(result, 1.23);
      });
    });

    group('combine', () {
      test('with no items', () {
        // then
        expect(() => Precision.combine([], 0.0), throwsStateError);
      });
      test('with single item', () {
        // when
        final result = Precision.combine([SignificantDigits(3)], 0.0);

        // then
        expect(result.significantDigits(0.0), 3);
      });
      test('chooses smaller value of two', () {
        // when
        final result = Precision.combine(
            [SignificantDigits(3), SignificantDigits(2)], 0.0);

        // then
        expect(result.significantDigits(0.0), 2);
      });
      test('chooses smaller value of many', () {
        // when
        final result = Precision.combine([
          SignificantDigits(3),
          SignificantDigits(5),
          SignificantDigits(20),
          SignificantDigits(2),
          SignificantDigits(10),
        ], 0.0);

        // then
        expect(result.significantDigits(0.0), 2);
      });
      test('chooses smaller value of many when answer is first', () {
        // when
        final result = Precision.combine([
          SignificantDigits(3),
          SignificantDigits(5),
          SignificantDigits(20),
          SignificantDigits(4),
          SignificantDigits(10),
        ], 0.0);

        // then
        expect(result.significantDigits(0.0), 3);
      });
      test('chooses smaller value of many when answer is last', () {
        // when
        final result = Precision.combine([
          SignificantDigits(10),
          SignificantDigits(5),
          SignificantDigits(20),
          SignificantDigits(4),
          SignificantDigits(3),
        ], 0.0);

        // then
        expect(result.significantDigits(0.0), 3);
      });
    });

    group('digitsBeforeDecimal', () {
      test('mixed number', () {
        // given
        final measurement = meters(12.3456, precision: SignificantDigits(6));

        // when
        final result = Precision.digitsBeforeDecimal(measurement.as(meters));

        // then
        expect(result, 2);
      });
      test('number below 1', () {
        // given
        final measurement = meters(1.23456e-2, precision: SignificantDigits(6));

        // when
        final result = Precision.digitsBeforeDecimal(measurement.as(meters));

        // then
        expect(result, 0);
      });
      test('beyond maximum int', () {
        // given
        final measurement = meters(1.23456e25, precision: SignificantDigits(6));

        // when
        final result = Precision.digitsBeforeDecimal(measurement.as(meters));

        // then
        expect(result, 26);
      });
      test('beyond minimum double', () {
        // given
        final measurement =
            meters(1.23456e-35, precision: SignificantDigits(6));

        // when
        final result = Precision.digitsBeforeDecimal(measurement.as(meters));

        // then
        expect(result, 0);
      });
      test('negative', () {
        // given
        final measurement = meters(-12.3456, precision: SignificantDigits(6));

        // when
        final result = Precision.digitsBeforeDecimal(measurement.as(meters));

        // then
        expect(result, 2);
      });
      test('infinity', () {
        // given
        final measurement = DistanceMeasurement.infinite();

        // when
        final result = Precision.digitsBeforeDecimal(measurement.as(meters));

        // then
        expect(result, SignificantDigits.maximumPrecision);
      });
      test('negative infinity', () {
        // given
        final measurement = DistanceMeasurement.negativeInfinite();

        // when
        final result = Precision.digitsBeforeDecimal(measurement.as(meters));

        // then
        expect(result, SignificantDigits.maximumPrecision);
      });
      test('NaN', () {
        // given
        final measurement = DistanceMeasurement.infinite() +
            DistanceMeasurement.negativeInfinite();

        // when
        final result = Precision.digitsBeforeDecimal(measurement.as(meters));

        // then
        expect(result, SignificantDigits.maximumPrecision);
      });
    });

    group('digitsAfterDecimal', () {
      test('mixed number, same precision', () {
        // given
        final measurement = meters(12.3456, precision: SignificantDigits(6));

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 4);
      });
      test('mixed number, hidden precision', () {
        // given
        final measurement = meters(1.2, precision: SignificantDigits(4));

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 3);
      });
      test('number below 1', () {
        // given
        final measurement = meters(1.23456e-3, precision: SignificantDigits(6));

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 8);
      });
      test('beyond maximum int', () {
        // given
        final measurement = meters(1.23456e33, precision: SignificantDigits(6));

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 0);
      });
      test('single digit negative exponent', () {
        // given
        final measurement = meters(1.2e-9, precision: SignificantDigits(2));

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 10);
      });
      test('double digit negative exponent', () {
        // given
        final measurement = meters(1.2e-10, precision: SignificantDigits(2));

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 11);
      });
      test('beyond minimum double', () {
        // given
        final measurement = meters(1.2e-33, precision: SignificantDigits(2));

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 34);
      });
      test('infinity', () {
        // given
        final measurement = DistanceMeasurement.infinite();

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 0);
      });
      test('negative infinity', () {
        // given
        final measurement = DistanceMeasurement.negativeInfinite();

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 0);
      });
      test('NaN', () {
        // given
        final measurement = DistanceMeasurement.infinite() +
            DistanceMeasurement.negativeInfinite();

        // when
        final result = Precision.digitsAfterDecimal(measurement);

        // then
        expect(result, 0);
      });
    });

    group('addition', () {
      test('integer numbers', () {
        // given
        final measurement1 = meters(12, precision: SignificantDigits(2));
        final measurement2 = meters(345, precision: SignificantDigits(3));

        // when
        final result = Precision.addition(measurement1, measurement2);

        // then
        expect(result, SignificantDigits(3));
      });
      test('integer numbers with decreased precision', () {
        // given
        final measurement1 = meters(123, precision: SignificantDigits(3));
        final measurement2 = meters(-45, precision: SignificantDigits(2));

        // when
        final result = Precision.addition(measurement1, measurement2);

        // then
        expect(result, SignificantDigits(2));
      });
      test('mixed numbers', () {
        // given
        final measurement1 = meters(1.234, precision: SignificantDigits(4));
        final measurement2 = meters(1.234, precision: SignificantDigits(4));

        // when
        final result = Precision.addition(measurement1, measurement2);

        // then
        expect(result, SignificantDigits(4));
      });
      test('mixed numbers give magnitude increase', () {
        // given
        final measurement1 = meters(1.234, precision: SignificantDigits(4));
        final measurement2 = meters(9.234, precision: SignificantDigits(4));

        // when
        final result = Precision.addition(measurement1, measurement2);

        // then
        expect(result, SignificantDigits(5));
      });
      test('mixed numbers give magnitude decrease', () {
        // given
        final measurement1 = meters(123.45, precision: DigitsAfterDecimal(4));
        final measurement2 = meters(24.65, precision: SignificantDigits(4));

        // when
        final result = Precision.addition(measurement1, -measurement2);

        // then
        expect(result, SignificantDigits(4));
      });
      test('smallest decimal is accepted', () {
        // given
        final measurement1 = meters(1.2, precision: SignificantDigits(2));
        final measurement2 = meters(1.234, precision: SignificantDigits(4));

        // when
        final result = Precision.addition(measurement1, measurement2);

        // then
        expect(result, SignificantDigits(2));
      });
      test('numbers lower than 1', () {
        // given
        final measurement1 =
            milli.meters(1.234, precision: SignificantDigits(4));
        final measurement2 =
            milli.meters(1.234, precision: SignificantDigits(4));

        // when
        final result = Precision.addition(measurement1, measurement2);

        // then
        expect(result, SignificantDigits(6));
      });
      test('magnitude increase is capped at the limit', () {
        // given
        final measurement1 = meters(1.234, precision: SignificantDigits.max);
        final measurement2 = meters(9.234, precision: SignificantDigits.max);

        // when
        final result = Precision.addition(measurement1, measurement2);

        // then
        expect(result, SignificantDigits.max);
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
        expect(result, SignificantDigits.max);
      });
    });
  });
}
