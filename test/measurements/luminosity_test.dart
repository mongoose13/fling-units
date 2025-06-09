import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Luminosity', () {
    group('zero', () {
      test('has 0.0 charge', () {
        // given
        final charge = LuminosityMeasurement.zero();

        // when
        final result = charge.as(candela);

        // then
        expect(result, 0.0);
      });
      test('has max precision', () {
        // given
        final charge = LuminosityMeasurement.zero();

        // when
        final result = charge.precision;

        // then
        expect(result, Precision.max);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = LuminosityMeasurement.zero(hefnerkerze);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 HK');
      });
    });
    group('infinity', () {
      test('has infinite charge', () {
        // given
        final charge = LuminosityMeasurement.infinite();

        // when
        final result = charge.as(candela);

        // then
        expect(result, double.infinity);
      });
      test('has max precision', () {
        // given
        final charge = LuminosityMeasurement.infinite();

        // when
        final result = charge.precision;

        // then
        expect(result, Precision.max);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = LuminosityMeasurement.infinite(hefnerkerze);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity HK');
      });
    });
    group('negativeInfinity', () {
      test('has infinite negative charge', () {
        // given
        final charge = LuminosityMeasurement.negativeInfinite();

        // when
        final result = charge.as(candela);

        // then
        expect(result, double.negativeInfinity);
      });
      test('has max precision', () {
        // given
        final charge = LuminosityMeasurement.negativeInfinite();

        // when
        final result = charge.precision;

        // then
        expect(result, Precision.max);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = LuminosityMeasurement.negativeInfinite(hefnerkerze);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity HK');
      });
    });

    group('sum', () {
      test('adds parts', () {
        // given
        final charge = LuminosityMeasurement.sum([
          candela(2.1),
          candela(5.0),
          candlepower(3.0),
          hefnerkerze(1.2),
        ], precision: SignificantDigits(8));

        // when
        final result = charge.as(candela);

        // then
        expect(result, closeTo(11.147, 0.0005));
      });
    });

    group('as', () {
      test('converts to unit', () {
        // given
        final charge = candela(1.234, precision: SignificantDigits(8));

        // when
        final result = charge.as(candlepower);

        // then
        expect(result, closeTo(1.2579, 0.00005));
      });
    });

    group('candela', () {
      test('converts to base', () {
        // given
        final charge = candela(1.234, precision: DigitsAfterDecimal(4));

        // when
        final result = charge.as(candela);

        // then
        expect(result, 1.234);
      });
      test('applies prefixes', () {
        // given
        final charge = milli.candela(1.234e3, precision: DigitsAfterDecimal(4));

        // when
        final result = charge.as(candela);

        // then
        expect(result, 1.234);
      });
    });
    group('candlepower', () {
      test('converts to base', () {
        // given
        final charge = candlepower(1.234, precision: DigitsAfterDecimal(4));

        // when
        final result = charge.as(candela);

        // then
        expect(result, 1.2106);
      });
      test('applies prefixes', () {
        // given
        final charge =
            milli.candlepower(1.234e3, precision: DigitsAfterDecimal(4));

        // when
        final result = charge.as(candela);

        // then
        expect(result, 1.2106);
      });
    });
    group('hefnerkerze', () {
      test('converts to base', () {
        // given
        final charge = hefnerkerze(1.234, precision: DigitsAfterDecimal(4));

        // when
        final result = charge.as(candela);

        // then
        expect(result, 1.1353);
      });
      test('applies prefixes', () {
        // given
        final charge =
            milli.hefnerkerze(1.234e3, precision: DigitsAfterDecimal(4));

        // when
        final result = charge.as(candela);

        // then
        expect(result, 1.1353);
      });
    });

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = hefnerkerze;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'HK');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.hefnerkerze;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mHK');
      });
      test('maintains units', () {
        // given
        final measurement =
            candlepower(3.4).withPrecision(DigitsAfterDecimal(2));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 cp');
      });
      test('maintains prefix', () {
        // given
        final measurement =
            milli.candlepower(3.4).withPrecision(DigitsAfterDecimal(2));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mcp');
      });
      test('extension maintains prefix', () {
        // given
        final measurement =
            3.4.milli.candlepower.withPrecision(DigitsAfterDecimal(2));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mcp');
      });
      test('modified precision', () {
        // given
        final measurement =
            deci.candlepower(23.45).withPrecision(DigitsAfterDecimal(2));

        // when
        final result =
            measurement.withPrecision(DigitsAfterDecimal(0)).toString();

        // then
        expect(result, '23.0 dcp');
      });
      test('modified units', () {
        // given
        final measurement =
            deci.candlepower(23.45).withPrecision(SignificantDigits(2));

        // when
        final result = measurement.butAs(milli.hefnerkerze).toString();

        // then
        expect(result, '2500.0 mHK');
      });
    });
  });
}
