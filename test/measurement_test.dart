import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('isNegative', () {
    test('on a zero value', () {
      // given
      final unit = Distance.zero();

      // when
      final result = unit.isNegative;

      // then
      expect(result, false);
    });
    test('on a positive finite unit', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit.isNegative;

      // then
      expect(result, false);
    });
    test('on a negative finite unit', () {
      // given
      final unit = Distance.ofMeters(-2, precision: Precision(5));

      // when
      final result = unit.isNegative;

      // then
      expect(result, true);
    });
    test('on a positive infinite unit', () {
      // given
      final unit = Distance.infinite();

      // when
      final result = unit.isNegative;

      // then
      expect(result, false);
    });
    test('on a negative infinite unit', () {
      // given
      final unit = Distance.negativeInfinite();

      // when
      final result = unit.isNegative;

      // then
      expect(result, true);
    });
    test('on a nonexistent unit', () {
      // given
      final unit = Distance.ofMeters(double.nan, precision: Precision(5));

      // when
      final result = unit.isNegative;

      // then
      expect(result, false);
    });
  });

  group('isFinite', () {
    test('on a zero unit', () {
      // given
      final unit = Distance.zero();

      // when
      final result = unit.isFinite;

      // then
      expect(result, true);
    });
    test('on a positive finite unit', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit.isFinite;

      // then
      expect(result, true);
    });
    test('on a negative finite unit', () {
      // given
      final unit = Distance.ofMeters(-2, precision: Precision(5));

      // when
      final result = unit.isFinite;

      // then
      expect(result, true);
    });
    test('on a positive infinite unit', () {
      // given
      final unit = Distance.infinite();

      // when
      final result = unit.isFinite;

      // then
      expect(result, false);
    });
    test('on a negative infinite unit', () {
      // given
      final unit = Distance.negativeInfinite();

      // when
      final result = unit.isFinite;

      // then
      expect(result, false);
    });
    test('on a nonexistent unit', () {
      // given
      final unit = Distance.ofMeters(double.nan, precision: Precision(5));

      // when
      final result = unit.isFinite;

      // then
      expect(result, false);
    });
  });

  group('isInfinite', () {
    test('on a zero unit', () {
      // given
      final unit = Distance.zero();

      // when
      final result = unit.isInfinite;

      // then
      expect(result, false);
    });
    test('on a positive finite unit', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit.isInfinite;

      // then
      expect(result, false);
    });
    test('on a negative finite unit', () {
      // given
      final unit = Distance.ofMeters(-2, precision: Precision(5));

      // when
      final result = unit.isInfinite;

      // then
      expect(result, false);
    });
    test('on a positive infinite unit', () {
      // given
      final unit = Distance.infinite();

      // when
      final result = unit.isInfinite;

      // then
      expect(result, true);
    });
    test('on a negative infinite unit', () {
      // given
      final unit = Distance.negativeInfinite();

      // when
      final result = unit.isInfinite;

      // then
      expect(result, true);
    });
    test('on a nonexistent unit', () {
      // given
      final unit = Distance.ofMeters(double.nan, precision: Precision(5));

      // when
      final result = unit.isInfinite;

      // then
      expect(result, false);
    });
  });

  group('isNaN', () {
    test('on a zero unit', () {
      // given
      final unit = Distance.zero();

      // when
      final result = unit.isNaN;

      // then
      expect(result, false);
    });
    test('on a positive finite unit', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit.isNaN;

      // then
      expect(result, false);
    });
    test('on a negative finite unit', () {
      // given
      final unit = Distance.ofMeters(-2, precision: Precision(5));

      // when
      final result = unit.isNaN;

      // then
      expect(result, false);
    });
    test('on a positive infinite unit', () {
      // given
      final unit = Distance.infinite();

      // when
      final result = unit.isNaN;

      // then
      expect(result, false);
    });
    test('on a negative infinite unit', () {
      // given
      final unit = Distance.negativeInfinite();

      // when
      final result = unit.isNaN;

      // then
      expect(result, false);
    });
    test('on a nonexistent unit', () {
      // given
      final unit = Distance.ofMeters(double.nan, precision: Precision(5));

      // when
      final result = unit.isNaN;

      // then
      expect(result, true);
    });
  });

  group('hashCode', () {
    test('same constant', () {
      // given
      final unit = Distance.zero();

      // when
      final result = unit.hashCode == unit.hashCode;

      // then
      expect(result, true);
    });
    test('same object', () {
      // given
      final unit = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit.hashCode == unit.hashCode;

      // then
      expect(result, true);
    });
    test('identical object', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1.hashCode == unit2.hashCode;

      // then
      expect(result, true);
    });
  });

  group('==', () {
    test('same constant', () {
      // given
      final unit = Distance.zero();

      // when
      final result = unit == unit;

      // then
      expect(result, true);
    });
    test('same object', () {
      // given
      final unit = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit == unit;

      // then
      expect(result, true);
    });
    test('identical object', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 == unit2;

      // then
      expect(result, true);
    });
    test('different value', () {
      // given
      final unit1 = Distance.ofMeters(4, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 == unit2;

      // then
      expect(result, false);
    });
    test('different precision', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(4));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 == unit2;

      // then
      expect(result, false);
    });
  });

  group('>', () {
    test('same value', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 > unit2;

      // then
      expect(result, false);
    });
    test('smaller value', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 > unit2;

      // then
      expect(result, false);
    });
    test('larger value', () {
      // given
      final unit1 = Distance.ofMeters(4, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 > unit2;

      // then
      expect(result, true);
    });
    test('from infinite', () {
      // given
      final unit1 = Distance.infinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 > unit2;

      // then
      expect(result, true);
    });
    test('to infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.infinite();

      // when
      final result = unit1 > unit2;

      // then
      expect(result, false);
    });
    test('from negative infinite', () {
      // given
      final unit1 = Distance.negativeInfinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 > unit2;

      // then
      expect(result, false);
    });
    test('to negative infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.negativeInfinite();

      // when
      final result = unit1 > unit2;

      // then
      expect(result, true);
    });
  });

  group('>=', () {
    test('same value', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 >= unit2;

      // then
      expect(result, true);
    });
    test('smaller value', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 >= unit2;

      // then
      expect(result, false);
    });
    test('larger value', () {
      // given
      final unit1 = Distance.ofMeters(4, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 >= unit2;

      // then
      expect(result, true);
    });
    test('from infinite', () {
      // given
      final unit1 = Distance.infinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 >= unit2;

      // then
      expect(result, true);
    });
    test('to infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.infinite();

      // when
      final result = unit1 >= unit2;

      // then
      expect(result, false);
    });
    test('from negative infinite', () {
      // given
      final unit1 = Distance.negativeInfinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 >= unit2;

      // then
      expect(result, false);
    });
    test('to negative infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.negativeInfinite();

      // when
      final result = unit1 >= unit2;

      // then
      expect(result, true);
    });
  });

  group('<', () {
    test('same value', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 < unit2;

      // then
      expect(result, false);
    });
    test('smaller value', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 < unit2;

      // then
      expect(result, true);
    });
    test('larger value', () {
      // given
      final unit1 = Distance.ofMeters(4, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 < unit2;

      // then
      expect(result, false);
    });
    test('from infinite', () {
      // given
      final unit1 = Distance.infinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 < unit2;

      // then
      expect(result, false);
    });
    test('to infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.infinite();

      // when
      final result = unit1 < unit2;

      // then
      expect(result, true);
    });
    test('from negative infinite', () {
      // given
      final unit1 = Distance.negativeInfinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 < unit2;

      // then
      expect(result, true);
    });
    test('to negative infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.negativeInfinite();

      // when
      final result = unit1 < unit2;

      // then
      expect(result, false);
    });
  });

  group('<=', () {
    test('same value', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 <= unit2;

      // then
      expect(result, true);
    });
    test('smaller value', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 <= unit2;

      // then
      expect(result, true);
    });
    test('larger value', () {
      // given
      final unit1 = Distance.ofMeters(4, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 <= unit2;

      // then
      expect(result, false);
    });
    test('from infinite', () {
      // given
      final unit1 = Distance.infinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 <= unit2;

      // then
      expect(result, false);
    });
    test('to infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.infinite();

      // when
      final result = unit1 <= unit2;

      // then
      expect(result, true);
    });
    test('from negative infinite', () {
      // given
      final unit1 = Distance.negativeInfinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 <= unit2;

      // then
      expect(result, true);
    });
    test('to negative infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.negativeInfinite();

      // when
      final result = unit1 <= unit2;

      // then
      expect(result, false);
    });
  });

  group('compareTo', () {
    test('same value', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1.compareTo(unit2);

      // then
      expect(result, 0);
    });
    test('smaller value', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1.compareTo(unit2);

      // then
      expect(result < 0, true);
    });
    test('larger value', () {
      // given
      final unit1 = Distance.ofMeters(4, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1.compareTo(unit2);

      // then
      expect(result > 0, true);
    });
    test('from infinite', () {
      // given
      final unit1 = Distance.infinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1.compareTo(unit2);

      // then
      expect(result > 0, true);
    });
    test('to infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.infinite();

      // when
      final result = unit1.compareTo(unit2);

      // then
      expect(result < 0, true);
    });
    test('from negative infinite', () {
      // given
      final unit1 = Distance.negativeInfinite();
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1.compareTo(unit2);

      // then
      expect(result < 0, true);
    });
    test('to negative infinite', () {
      // given
      final unit1 = Distance.ofMeters(3, precision: Precision(5));
      final unit2 = Distance.negativeInfinite();

      // when
      final result = unit1.compareTo(unit2);

      // then
      expect(result > 0, true);
    });
  });

  group('unary -', () {
    test('positive finite changes sign', () {
      // given
      final unit = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = -unit;

      // then
      expect(result.si, -3);
    });
    test('positive finite keeps precision', () {
      // given
      final unit = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = -unit;

      // then
      expect(result.precision, unit.precision);
    });
    test('zero maintains value', () {
      // given
      final unit = Distance.zero();

      // when
      final result = -unit;

      // then
      expect(result.si, 0.0);
    });
    test('zero keeps precision', () {
      // given
      final unit = Distance.zero();

      // when
      final result = -unit;

      // then
      expect(result.precision, Distance.zero().precision);
    });
    test('infinite changes sign', () {
      // given
      final unit = Distance.infinite();

      // when
      final result = -unit;

      // then
      expect(result.si, double.negativeInfinity);
    });
    test('infinite keeps precision', () {
      // given
      final unit = Distance.infinite();

      // when
      final result = -unit;

      // then
      expect(result.precision, Distance.infinite().precision);
    });
    test('negative infinite changes sign', () {
      // given
      final unit = Distance.negativeInfinite();

      // when
      final result = -unit;

      // then
      expect(result.si, double.infinity);
    });
    test('negative infinite keeps precision', () {
      // given
      final unit = Distance.negativeInfinite();

      // when
      final result = -unit;

      // then
      expect(result.precision, Distance.negativeInfinite().precision);
    });
  });

  group('+', () {
    test('identity', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(0, precision: Precision(5));

      // when
      final result = unit1 + unit2;

      // then
      expect(result.si, 2);
    });
    test('both positive increases value', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 + unit2;

      // then
      expect(result.si, 5);
    });
    test('one negative decreases value', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(-3, precision: Precision(5));

      // when
      final result = unit1 + unit2;

      // then
      expect(result.si, -1);
    });
    test('infinite', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.infinite();

      // when
      final result = unit1 + unit2;

      // then
      expect(result.si, double.infinity);
    });
    test('negative infinite', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.negativeInfinite();

      // when
      final result = unit1 + unit2;

      // then
      expect(result.si, double.negativeInfinity);
    });
    test('precision is maxed', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 + unit2;

      // then
      expect(result.precision, Precision.max.precision);
    });
  });

  group('binary -', () {
    test('identity', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(0, precision: Precision(5));

      // when
      final result = unit1 - unit2;

      // then
      expect(result.si, 2);
    });
    test('both positive decreases value', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 - unit2;

      // then
      expect(result.si, -1);
    });
    test('one negative increases value', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(-3, precision: Precision(5));

      // when
      final result = unit1 - unit2;

      // then
      expect(result.si, 5);
    });
    test('infinite', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.infinite();

      // when
      final result = unit1 - unit2;

      // then
      expect(result.si, double.negativeInfinity);
    });
    test('negative infinite', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.negativeInfinite();

      // when
      final result = unit1 - unit2;

      // then
      expect(result.si, double.infinity);
    });
    test('precision is maxed', () {
      // given
      final unit1 = Distance.ofMeters(2, precision: Precision(5));
      final unit2 = Distance.ofMeters(3, precision: Precision(5));

      // when
      final result = unit1 - unit2;

      // then
      expect(result.precision, Precision.max.precision);
    });
  });

  group('*', () {
    test('identity', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit * 1;

      // then
      expect(result.si, 2.0);
    });
    test('zero multiplier', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit * 0;

      // then
      expect(result.si, 0.0);
    });
    test('zero value', () {
      // given
      final unit = Distance.zero();

      // when
      final result = unit * 3;

      // then
      expect(result.si, 0.0);
    });
    test('infinite multiplier', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit * double.infinity;

      // then
      expect(result.si, double.infinity);
    });
    test('infinite value', () {
      // given
      final unit = Distance.infinite();

      // when
      final result = unit * 3;

      // then
      expect(result.si, double.infinity);
    });
    test('positive multiplier', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit * 3;

      // then
      expect(result.si, 6.0);
    });
    test('negative multiplier', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit * -3;

      // then
      expect(result.si, -6.0);
    });
  });

  group('/', () {
    test('identity', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit / 1;

      // then
      expect(result.si, 2.0);
    });
    test('zero divisor', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit / 0;

      // then
      expect(result.si, double.infinity);
    });
    test('zero value', () {
      // given
      final unit = Distance.zero();

      // when
      final result = unit / 3;

      // then
      expect(result.si, 0.0);
    });
    test('infinite divisor', () {
      // given
      final unit = Distance.ofMeters(2, precision: Precision(5));

      // when
      final result = unit / double.infinity;

      // then
      expect(result.si, 0.0);
    });
    test('infinite value', () {
      // given
      final unit = Distance.infinite();

      // when
      final result = unit / 3;

      // then
      expect(result.si, double.infinity);
    });
    test('positive divisor', () {
      // given
      final unit = Distance.ofMeters(6, precision: Precision(5));

      // when
      final result = unit / 3;

      // then
      expect(result.si, 2.0);
    });
    test('negative divisor', () {
      // given
      final unit = Distance.ofMeters(6, precision: Precision(5));

      // when
      final result = unit / -3;

      // then
      expect(result.si, -2.0);
    });
  });

  group('withPrecision', () {
    test('sets precision', () {
      // given
      final unit = Distance.ofMeters(3.14159);

      // when
      final result = unit.withPrecision(Precision(4));

      // then
      expect(result.precision, 4);
    });
  });
}