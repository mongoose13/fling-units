import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 charge', () {
      // given
      final charge = Luminosity.zero();

      // when
      final result = charge.as(candela);

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final charge = Luminosity.zero();

      // when
      final result = charge.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite charge', () {
      // given
      final charge = Luminosity.infinite();

      // when
      final result = charge.as(candela);

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final charge = Luminosity.infinite();

      // when
      final result = charge.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative charge', () {
      // given
      final charge = Luminosity.negativeInfinite();

      // when
      final result = charge.as(candela);

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final charge = Luminosity.negativeInfinite();

      // when
      final result = charge.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final charge = Luminosity.sum([
        candela(2.1),
        candela(5.0),
        candlepower(3.0),
        hefnerkerze(1.2),
      ], precision: Precision(8));

      // when
      final result = charge.as(candela);

      // then
      expect(result, 11.146863);
    });
  });

  group('as', () {
    test('converts to unit', () {
      // given
      final charge = candela(1.234, precision: Precision(8));

      // when
      final result = charge.as(candlepower);

      // then
      expect(result, 1.2579396);
    });
  });

  group('candela', () {
    test('converts to base', () {
      // given
      final charge = candela(1.234, precision: Precision(5));

      // when
      final result = charge.as(candela);

      // then
      expect(result, 1.234);
    });
    test('applies prefixes', () {
      // given
      final charge = milli.candela(1.234e3, precision: Precision(5));

      // when
      final result = charge.as(candela);

      // then
      expect(result, 1.234);
    });
  });
  group('candlepower', () {
    test('converts to base', () {
      // given
      final charge = candlepower(1.234, precision: Precision(5));

      // when
      final result = charge.as(candela);

      // then
      expect(result, 1.2105);
    });
    test('applies prefixes', () {
      // given
      final charge = milli.candlepower(1.234e3, precision: Precision(5));

      // when
      final result = charge.as(candela);

      // then
      expect(result, 1.2105);
    });
  });
  group('hefnerkerze', () {
    test('converts to base', () {
      // given
      final charge = hefnerkerze(1.234, precision: Precision(5));

      // when
      final result = charge.as(candela);

      // then
      expect(result, 1.1352);
    });
    test('applies prefixes', () {
      // given
      final charge = milli.hefnerkerze(1.234e3, precision: Precision(5));

      // when
      final result = charge.as(candela);

      // then
      expect(result, 1.1352);
    });
  });
}
