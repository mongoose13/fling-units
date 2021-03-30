import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 quantity', () {
      // given
      final quantity = Quantity.zero();

      // when
      final result = quantity.as(units);

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final quantity = Quantity.zero();

      // when
      final result = quantity.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite quantity', () {
      // given
      final quantity = Quantity.infinite();

      // when
      final result = quantity.as(units);

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final quantity = Quantity.infinite();

      // when
      final result = quantity.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative quantity', () {
      // given
      final quantity = Quantity.negativeInfinite();

      // when
      final result = quantity.as(units);

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final quantity = Quantity.negativeInfinite();

      // when
      final result = quantity.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final quantity = Quantity.sum([
        moles(2.1),
        units(5e23),
        moles(0.3),
      ], precision: Precision(5));

      // when
      final result = quantity.as(units);

      // then
      expect(result, 1.9453e24);
    });
  });

  group('as', () {
    test('converts to unit', () {
      // given
      final quantity = units(1.234e23, precision: Precision(8));

      // when
      final result = quantity.as(moles);

      // then
      expect(result, 0.20491052);
    });
  });

  group('units', () {
    test('converts to base', () {
      // given
      final quantity = units(1.234e23, precision: Precision(5));

      // when
      final result = quantity.as(moles);

      // then
      expect(result, 0.20491);
    });
    test('applies prefixes', () {
      // given
      final quantity = milli.units(1.234e27, precision: Precision(5));

      // when
      final result = quantity.as(moles);

      // then
      expect(result, 2.0491);
    });
    test('rounds up', () {
      // given
      final quantity = units(1.678, precision: Precision(5));

      // when
      final result = quantity.as(units);

      // then
      expect(result, 2);
    });
    test('rounds down', () {
      // given
      final quantity = units(1.456, precision: Precision(5));

      // when
      final result = quantity.as(units);

      // then
      expect(result, 1);
    });
    test('maintains whole numbers', () {
      // given
      final quantity = units(2, precision: Precision(5));

      // when
      final result = quantity.as(units);

      // then
      expect(result, 2);
    });
  });
  group('moles', () {
    test('converts to base', () {
      // given
      final quantity = moles(1.234, precision: Precision(5));

      // when
      final result = quantity.as(moles);

      // then
      expect(result, 1.234);
    });
    test('applies prefixes', () {
      // given
      final quantity = milli.moles(1.234e3, precision: Precision(5));

      // when
      final result = quantity.as(moles);

      // then
      expect(result, 1.234);
    });
  });
}
