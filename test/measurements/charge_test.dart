import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 charge', () {
      // given
      final charge = Charge.zero();

      // when
      final result = charge.as(amperes);

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final charge = Charge.zero();

      // when
      final result = charge.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite charge', () {
      // given
      final charge = Charge.infinite();

      // when
      final result = charge.as(amperes);

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final charge = Charge.infinite();

      // when
      final result = charge.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative charge', () {
      // given
      final charge = Charge.negativeInfinite();

      // when
      final result = charge.as(amperes);

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final charge = Charge.negativeInfinite();

      // when
      final result = charge.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final charge = Charge.sum([
        amperes(2.1),
        amperes(5.0),
        amperes(0.3),
      ], precision: Precision(5));

      // when
      final result = charge.as(amperes);

      // then
      expect(result, 7.4);
    });
  });

  group('as', () {
    test('converts to unit', () {
      // given
      final charge = amperes(1.234, precision: Precision(8));

      // when
      final result = charge.as(amperes);

      // then
      expect(result, 1.234);
    });
  });

  group('amperes', () {
    test('converts to base', () {
      // given
      final charge = amperes(1.234, precision: Precision(5));

      // when
      final result = charge.as(amperes);

      // then
      expect(result, 1.234);
    });
    test('applies prefixes', () {
      // given
      final charge = milli.amperes(1.234e3, precision: Precision(5));

      // when
      final result = charge.as(amperes);

      // then
      expect(result, 1.234);
    });
  });
}
