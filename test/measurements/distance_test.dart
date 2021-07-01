import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 distance', () {
      // given
      final distance = Distance.zero();

      // when
      final result = distance.as(meters);

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final distance = Distance.zero();

      // when
      final result = distance.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite distance', () {
      // given
      final distance = Distance.infinite();

      // when
      final result = distance.as(meters);

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final distance = Distance.infinite();

      // when
      final result = distance.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative distance', () {
      // given
      final distance = Distance.negativeInfinite();

      // when
      final result = distance.as(meters);

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final distance = Distance.negativeInfinite();

      // when
      final result = distance.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final distance = Distance.sum(
        [
          kilo.meters(1),
          hecto.meters(2),
          deka.meters(3),
          meters(4),
          deci.meters(5),
          centi.meters(6),
          milli.meters(7),
          micro.meters(890),
          nano.meters(123),
          pico.meters(456),
        ],
        precision: Precision(16),
      );

      // when
      final result = distance.as(meters);

      // then
      expect(result, 1234.567890123456);
    });
  });

  group('as', () {
    test('converts to unit', () {
      // given
      final distance = meters(123.456, precision: Precision(8));

      // when
      final result = distance.as(nauticalMiles);

      // then
      expect(result, 0.066660907);
    });
  });

  group('meters', () {
    test('converts to base', () {
      // given
      final distance = meters(1234.0, precision: Precision(5));

      // when
      final result = distance.as(meters);

      // then
      expect(result, 1234.0);
    });
    test('applies prefixes', () {
      // given
      final distance = milli.meters(1234.0, precision: Precision(5));

      // when
      final result = distance.as(meters);

      // then
      expect(result, 1.234);
    });
  });
  group('miles', () {
    test('converts to base', () {
      // given
      final distance = miles(1234.0, precision: Precision(5));

      // when
      final result = distance.as(meters);

      // then
      expect(result, 1985900.0);
    });
    test('applies prefixes', () {
      // given
      final distance = milli.miles(1234.0, precision: Precision(5));

      // when
      final result = distance.as(miles);

      // then
      expect(result, 1.234);
    });
  });
  group('yards', () {
    test('converts to base', () {
      // given
      final distance = yards(1234.0, precision: Precision(5));

      // when
      final result = distance.as(meters);

      // then
      expect(result, 1128.4);
    });
    test('applies prefixes', () {
      // given
      final distance = milli.yards(1234.0, precision: Precision(5));

      // when
      final result = distance.as(yards);

      // then
      expect(result, 1.234);
    });
  });
  group('feet', () {
    test('converts to base', () {
      // given
      final distance = feet(1234.0, precision: Precision(5));

      // when
      final result = distance.as(meters);

      // then
      expect(result, 376.12);
    });
    test('applies prefixes', () {
      // given
      final distance = milli.feet(1234.0, precision: Precision(5));

      // when
      final result = distance.as(feet);

      // then
      expect(result, 1.234);
    });
  });
  group('inches', () {
    test('converts to base', () {
      // given
      final distance = inches(1234.0, precision: Precision(5));

      // when
      final result = distance.as(meters);

      // then
      expect(result, 31.344);
    });
    test('applies prefixes', () {
      // given
      final distance = milli.inches(1234.0, precision: Precision(5));

      // when
      final result = distance.as(inches);

      // then
      expect(result, 1.234);
    });
  });
  group('nauticalMiles', () {
    test('converts to base', () {
      // given
      final distance = nauticalMiles(1234.0, precision: Precision(5));

      // when
      final result = distance.as(meters);

      // then
      expect(result, 2285400.0);
    });
    test('applies prefixes', () {
      // given
      final distance = milli.nauticalMiles(1234.0, precision: Precision(5));

      // when
      final result = distance.as(nauticalMiles);

      // then
      expect(result, 1.234);
    });
  });
}
