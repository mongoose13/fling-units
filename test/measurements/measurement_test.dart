import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Measurement', () {
    group('default interpreter', () {
      test('getter', () {
        // given
        final measurement = 3.feet;

        // when
        final result = measurement.defaultUnit;

        // then
        expect(result, feet);
      });
      test('value', () {
        // given
        final measurement = 3.feet;

        // when
        final result = measurement.defaultValue;

        // then
        expect(result, 3.0);
      });
    });

    group('isNegative', () {
      test('on a zero value', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = unit.isNegative;

        // then
        expect(result, false);
      });
      test('on a positive finite unit', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit.isNegative;

        // then
        expect(result, false);
      });
      test('on a negative finite unit', () {
        // given
        final unit = meters(-2, precision: 5);

        // when
        final result = unit.isNegative;

        // then
        expect(result, true);
      });
      test('on a positive infinite unit', () {
        // given
        final unit = DistanceMeasurement.infinite();

        // when
        final result = unit.isNegative;

        // then
        expect(result, false);
      });
      test('on a negative infinite unit', () {
        // given
        final unit = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit.isNegative;

        // then
        expect(result, true);
      });
      test('on a nonexistent unit', () {
        // given
        final unit = meters(double.nan, precision: 5);

        // when
        final result = unit.isNegative;

        // then
        expect(result, false);
      });
    });

    group('isFinite', () {
      test('on a zero unit', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = unit.isFinite;

        // then
        expect(result, true);
      });
      test('on a positive finite unit', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit.isFinite;

        // then
        expect(result, true);
      });
      test('on a negative finite unit', () {
        // given
        final unit = meters(-2, precision: 5);

        // when
        final result = unit.isFinite;

        // then
        expect(result, true);
      });
      test('on a positive infinite unit', () {
        // given
        final unit = DistanceMeasurement.infinite();

        // when
        final result = unit.isFinite;

        // then
        expect(result, false);
      });
      test('on a negative infinite unit', () {
        // given
        final unit = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit.isFinite;

        // then
        expect(result, false);
      });
      test('on a nonexistent unit', () {
        // given
        final unit = meters(double.nan, precision: 5);

        // when
        final result = unit.isFinite;

        // then
        expect(result, false);
      });
    });

    group('isInfinite', () {
      test('on a zero unit', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = unit.isInfinite;

        // then
        expect(result, false);
      });
      test('on a positive finite unit', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit.isInfinite;

        // then
        expect(result, false);
      });
      test('on a negative finite unit', () {
        // given
        final unit = meters(-2, precision: 5);

        // when
        final result = unit.isInfinite;

        // then
        expect(result, false);
      });
      test('on a positive infinite unit', () {
        // given
        final unit = DistanceMeasurement.infinite();

        // when
        final result = unit.isInfinite;

        // then
        expect(result, true);
      });
      test('on a negative infinite unit', () {
        // given
        final unit = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit.isInfinite;

        // then
        expect(result, true);
      });
      test('on a nonexistent unit', () {
        // given
        final unit = meters(double.nan, precision: 5);

        // when
        final result = unit.isInfinite;

        // then
        expect(result, false);
      });
    });

    group('isNaN', () {
      test('on a zero unit', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = unit.isNaN;

        // then
        expect(result, false);
      });
      test('on a positive finite unit', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit.isNaN;

        // then
        expect(result, false);
      });
      test('on a negative finite unit', () {
        // given
        final unit = meters(-2, precision: 5);

        // when
        final result = unit.isNaN;

        // then
        expect(result, false);
      });
      test('on a positive infinite unit', () {
        // given
        final unit = DistanceMeasurement.infinite();

        // when
        final result = unit.isNaN;

        // then
        expect(result, false);
      });
      test('on a negative infinite unit', () {
        // given
        final unit = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit.isNaN;

        // then
        expect(result, false);
      });
      test('on a nonexistent unit', () {
        // given
        final unit = meters(double.nan, precision: 5);

        // when
        final result = unit.isNaN;

        // then
        expect(result, true);
      });
    });

    group('hashCode', () {
      test('zero', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = unit.hashCode == DistanceMeasurement.zero().hashCode;

        // then
        expect(result, true);
      });
      test('infinite', () {
        // given
        final unit = DistanceMeasurement.infinite();

        // when
        final result = unit.hashCode == DistanceMeasurement.infinite().hashCode;

        // then
        expect(result, true);
      });
      test('negative infinite', () {
        // given
        final unit = DistanceMeasurement.negativeInfinite();

        // when
        final result =
            unit.hashCode == DistanceMeasurement.negativeInfinite().hashCode;

        // then
        expect(result, true);
      });
      test('not a number', () {
        // given
        final unit = DistanceMeasurement.nan();

        // when
        final result = unit.hashCode == DistanceMeasurement.nan().hashCode;

        // then
        expect(result, true);
      });
      test('same object', () {
        // given
        final unit = meters(3, precision: 5);

        // when
        final result = unit.hashCode == unit.hashCode;

        // then
        expect(result, true);
      });
      test('identical object', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1.hashCode == unit2.hashCode;

        // then
        expect(result, true);
      });
      test('equivalent object', () {
        // given
        final unit1 = meters(3000, precision: 5);
        final unit2 = kilo.meters(3, precision: 5);

        // when
        final result = unit1.hashCode == unit2.hashCode;

        // then
        expect(result, true);
      });
    });

    group('==', () {
      test('same constant', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = unit == unit;

        // then
        expect(result, true);
      });
      test('same object', () {
        // given
        final unit = meters(3, precision: 5);

        // when
        final result = unit == unit;

        // then
        expect(result, true);
      });
      test('identical object', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 == unit2;

        // then
        expect(result, true);
      });
      test('equivalent object', () {
        // given
        final unit1 = meters(3000, precision: 5);
        final unit2 = kilo.meters(3, precision: 5);

        // when
        final result = unit1 == unit2;

        // then
        expect(result, true);
      });
      test('different value', () {
        // given
        final unit1 = meters(4, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 == unit2;

        // then
        expect(result, false);
      });
      test('different precision', () {
        // given
        final unit1 = meters(3.14159, precision: 4);
        final unit2 = meters(3.14159, precision: 6);

        // when
        final result = unit1 == unit2;

        // then
        expect(result, false);
      });
      test('different precision and value', () {
        // given
        final unit1 = meters(3.14159, precision: 4);
        final unit2 = meters(3.1416, precision: 6);

        // when
        final result = unit1 == unit2;

        // then
        expect(result, false);
      });
      test('different value', () {
        // given
        final unit1 = meters(3.1416, precision: 6);
        final unit2 = meters(3.14159, precision: 6);

        // when
        final result = unit1 == unit2;

        // then
        expect(result, false);
      });
    });

    group('equals', () {
      test('same constant', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = unit.equals(unit);

        // then
        expect(result, true);
      });
      test('same object', () {
        // given
        final unit = meters(3, precision: 5);

        // when
        final result = unit.equals(unit);

        // then
        expect(result, true);
      });
      test('identical object', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1.equals(unit2);

        // then
        expect(result, true);
      });
      test('different value', () {
        // given
        final unit1 = meters(4, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1.equals(unit2);

        // then
        expect(result, false);
      });
      test('different precision, equal', () {
        // given
        final unit1 = meters(3.14159, precision: 4);
        final unit2 = meters(3.14159, precision: 6);

        // when
        final result = unit1.equals(unit2);

        // then
        expect(result, true);
      });
      test('different precision and value, equal', () {
        // given
        final unit1 = meters(3.14159, precision: 4);
        final unit2 = meters(3.1416, precision: 6);

        // when
        final result = unit1.equals(unit2);

        // then
        expect(result, true);
      });
      test('different precision and value, unequal', () {
        // given
        final unit1 = meters(3.14159, precision: 4);
        final unit2 = meters(3.14149, precision: 6);

        // when
        final result = unit1.equals(unit2);

        // then
        expect(result, false);
      });
      test('same precision, unequal', () {
        // given
        final unit1 = meters(3.1416, precision: 6);
        final unit2 = meters(3.14159, precision: 6);

        // when
        final result = unit1.equals(unit2);

        // then
        expect(result, false);
      });
    });

    group('>', () {
      test('same value', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 > unit2;

        // then
        expect(result, false);
      });
      test('smaller value', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 > unit2;

        // then
        expect(result, false);
      });
      test('larger value', () {
        // given
        final unit1 = meters(4, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 > unit2;

        // then
        expect(result, true);
      });
      test('precision smaller', () {
        // given
        final unit1 = meters(3.14159, precision: 2);
        final unit2 = meters(3.14159, precision: 5);

        // when
        final result = unit1 > unit2;

        // then
        expect(result, false);
      });
      test('precision bigger', () {
        // given
        final unit1 = meters(3.14159, precision: 5);
        final unit2 = meters(3.14159, precision: 2);

        // when
        final result = unit1 > unit2;

        // then
        expect(result, false);
      });
      test('from infinite', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 > unit2;

        // then
        expect(result, true);
      });
      test('to infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 > unit2;

        // then
        expect(result, false);
      });
      test('from negative infinite', () {
        // given
        final unit1 = DistanceMeasurement.negativeInfinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 > unit2;

        // then
        expect(result, false);
      });
      test('to negative infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit1 > unit2;

        // then
        expect(result, true);
      });
    });

    group('>=', () {
      test('same value', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 >= unit2;

        // then
        expect(result, true);
      });
      test('smaller value', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 >= unit2;

        // then
        expect(result, false);
      });
      test('larger value', () {
        // given
        final unit1 = meters(4, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 >= unit2;

        // then
        expect(result, true);
      });
      test('precision smaller', () {
        // given
        final unit1 = meters(3.14159, precision: 2);
        final unit2 = meters(3.14159, precision: 5);

        // when
        final result = unit1 >= unit2;

        // then
        expect(result, true);
      });
      test('precision bigger', () {
        // given
        final unit1 = meters(3.14159, precision: 5);
        final unit2 = meters(3.14159, precision: 2);

        // when
        final result = unit1 >= unit2;

        // then
        expect(result, true);
      });
      test('from infinite', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 >= unit2;

        // then
        expect(result, true);
      });
      test('to infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 >= unit2;

        // then
        expect(result, false);
      });
      test('from negative infinite', () {
        // given
        final unit1 = DistanceMeasurement.negativeInfinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 >= unit2;

        // then
        expect(result, false);
      });
      test('to negative infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit1 >= unit2;

        // then
        expect(result, true);
      });
    });

    group('<', () {
      test('same value', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 < unit2;

        // then
        expect(result, false);
      });
      test('smaller value', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 < unit2;

        // then
        expect(result, true);
      });
      test('larger value', () {
        // given
        final unit1 = meters(4, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 < unit2;

        // then
        expect(result, false);
      });
      test('precision smaller', () {
        // given
        final unit1 = meters(3.14159, precision: 2);
        final unit2 = meters(3.14159, precision: 5);

        // when
        final result = unit1 < unit2;

        // then
        expect(result, false);
      });
      test('precision bigger', () {
        // given
        final unit1 = meters(3.14159, precision: 5);
        final unit2 = meters(3.14159, precision: 2);

        // when
        final result = unit1 < unit2;

        // then
        expect(result, false);
      });
      test('from infinite', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 < unit2;

        // then
        expect(result, false);
      });
      test('to infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 < unit2;

        // then
        expect(result, true);
      });
      test('from negative infinite', () {
        // given
        final unit1 = DistanceMeasurement.negativeInfinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 < unit2;

        // then
        expect(result, true);
      });
      test('to negative infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit1 < unit2;

        // then
        expect(result, false);
      });
    });

    group('<=', () {
      test('same value', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 <= unit2;

        // then
        expect(result, true);
      });
      test('smaller value', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 <= unit2;

        // then
        expect(result, true);
      });
      test('larger value', () {
        // given
        final unit1 = meters(4, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 <= unit2;

        // then
        expect(result, false);
      });
      test('precision smaller', () {
        // given
        final unit1 = meters(3.14159, precision: 2);
        final unit2 = meters(3.14159, precision: 5);

        // when
        final result = unit1 <= unit2;

        // then
        expect(result, true);
      });
      test('precision bigger', () {
        // given
        final unit1 = meters(3.14159, precision: 5);
        final unit2 = meters(3.14159, precision: 2);

        // when
        final result = unit1 <= unit2;

        // then
        expect(result, true);
      });
      test('from infinite', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 <= unit2;

        // then
        expect(result, false);
      });
      test('to infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 <= unit2;

        // then
        expect(result, true);
      });
      test('from negative infinite', () {
        // given
        final unit1 = DistanceMeasurement.negativeInfinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 <= unit2;

        // then
        expect(result, true);
      });
      test('to negative infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit1 <= unit2;

        // then
        expect(result, false);
      });
    });

    group('compareTo', () {
      test('same value', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1.compareTo(unit2);

        // then
        expect(result, 0);
      });
      test('smaller value', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1.compareTo(unit2);

        // then
        expect(result < 0, true);
      });
      test('larger value', () {
        // given
        final unit1 = meters(4, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1.compareTo(unit2);

        // then
        expect(result > 0, true);
      });
      test('from infinite', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1.compareTo(unit2);

        // then
        expect(result > 0, true);
      });
      test('to infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1.compareTo(unit2);

        // then
        expect(result < 0, true);
      });
      test('from negative infinite', () {
        // given
        final unit1 = DistanceMeasurement.negativeInfinite();
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1.compareTo(unit2);

        // then
        expect(result < 0, true);
      });
      test('to negative infinite', () {
        // given
        final unit1 = meters(3, precision: 5);
        final unit2 = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit1.compareTo(unit2);

        // then
        expect(result > 0, true);
      });
    });

    group('unary -', () {
      test('positive finite changes sign', () {
        // given
        final unit = meters(3, precision: 5);

        // when
        final result = -unit;

        // then
        expect(result.si, -3);
      });
      test('positive finite keeps precision', () {
        // given
        final unit = meters(3, precision: 5);

        // when
        final result = -unit;

        // then
        expect(result.precision, unit.precision);
      });
      test('zero maintains value', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = -unit;

        // then
        expect(result.si, 0.0);
      });
      test('zero keeps precision', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = -unit;

        // then
        expect(result.precision, DistanceMeasurement.zero().precision);
      });
      test('infinite changes sign', () {
        // given
        final unit = DistanceMeasurement.infinite();

        // when
        final result = -unit;

        // then
        expect(result.si, double.negativeInfinity);
      });
      test('infinite keeps precision', () {
        // given
        final unit = DistanceMeasurement.infinite();

        // when
        final result = -unit;

        // then
        expect(result.precision, DistanceMeasurement.infinite().precision);
      });
      test('negative infinite changes sign', () {
        // given
        final unit = DistanceMeasurement.negativeInfinite();

        // when
        final result = -unit;

        // then
        expect(result.si, double.infinity);
      });
      test('negative infinite keeps precision', () {
        // given
        final unit = DistanceMeasurement.negativeInfinite();

        // when
        final result = -unit;

        // then
        expect(
            result.precision, DistanceMeasurement.negativeInfinite().precision);
      });
    });

    group('+', () {
      test('identity', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(0, precision: 5);

        // when
        final result = unit1 + unit2;

        // then
        expect(result.si, 2);
      });
      test('both positive increases value', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 + unit2;

        // then
        expect(result.si, 5);
      });
      test('one negative decreases value', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(-3, precision: 5);

        // when
        final result = unit1 + unit2;

        // then
        expect(result.si, -1);
      });
      test('infinite', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 + unit2;

        // then
        expect(result.si, double.infinity);
      });
      test('negative infinite', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit1 + unit2;

        // then
        expect(result.si, double.negativeInfinity);
      });
      test('precision is set correctly', () {
        // given
        final unit1 = meters(97.101, precision: 5);
        final unit2 = meters(3.456789, precision: 8);

        // when
        final result = unit1 + unit2;

        // then
        expect(result.precision, 6);
      });
    });

    group('binary -', () {
      test('identity', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(0, precision: 5);

        // when
        final result = unit1 - unit2;

        // then
        expect(result.si, 2);
      });
      test('both positive decreases value', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(3, precision: 5);

        // when
        final result = unit1 - unit2;

        // then
        expect(result.si, -1);
      });
      test('one negative increases value', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = meters(-3, precision: 5);

        // when
        final result = unit1 - unit2;

        // then
        expect(result.si, 5);
      });
      test('infinite', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 - unit2;

        // then
        expect(result.si, double.negativeInfinity);
      });
      test('negative infinite', () {
        // given
        final unit1 = meters(2, precision: 5);
        final unit2 = DistanceMeasurement.negativeInfinite();

        // when
        final result = unit1 - unit2;

        // then
        expect(result.si, double.infinity);
      });
      test('precision is set correctly', () {
        // given
        final unit1 = meters(3.45, precision: 3);
        final unit2 = meters(3.21, precision: 5);

        // when
        final result = unit1 - unit2;

        // then
        expect(result.precision, 2);
      });
    });

    group('*', () {
      test('identity', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit * 1;

        // then
        expect(result.si, 2.0);
      });
      test('zero multiplier', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit * 0;

        // then
        expect(result.si, 0.0);
      });
      test('zero value', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = unit * 3;

        // then
        expect(result.si, 0.0);
      });
      test('infinite multiplier', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit * double.infinity;

        // then
        expect(result.si, double.infinity);
      });
      test('infinite value', () {
        // given
        final unit = DistanceMeasurement.infinite();

        // when
        final result = unit * 3;

        // then
        expect(result.si, double.infinity);
      });
      test('positive multiplier', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit * 3;

        // then
        expect(result.si, 6.0);
      });
      test('negative multiplier', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit * -3;

        // then
        expect(result.si, -6.0);
      });
    });

    group('/', () {
      test('identity', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit / 1;

        // then
        expect(result.si, 2.0);
      });
      test('zero divisor', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit / 0;

        // then
        expect(result.si, double.infinity);
      });
      test('zero value', () {
        // given
        final unit = DistanceMeasurement.zero();

        // when
        final result = unit / 3;

        // then
        expect(result.si, 0.0);
      });
      test('infinite divisor', () {
        // given
        final unit = meters(2, precision: 5);

        // when
        final result = unit / double.infinity;

        // then
        expect(result.si, 0.0);
      });
      test('infinite value', () {
        // given
        final unit = DistanceMeasurement.infinite();

        // when
        final result = unit / 3;

        // then
        expect(result.si, double.infinity);
      });
      test('positive divisor', () {
        // given
        final unit = meters(6, precision: 5);

        // when
        final result = unit / 3;

        // then
        expect(result.si, 2.0);
      });
      test('negative divisor', () {
        // given
        final unit = meters(6, precision: 5);

        // when
        final result = unit / -3;

        // then
        expect(result.si, -2.0);
      });
    });

    group('~/', () {
      test('larger over smaller', () {
        // given
        final unit1 = meters(4.0);
        final unit2 = meters(2.0);

        // when
        final result = unit1 ~/ unit2;

        // then
        expect(result, 2);
      });
      test('smaller over larger', () {
        // given
        final unit1 = meters(2.0);
        final unit2 = meters(4.0);

        // when
        final result = unit1 ~/ unit2;

        // then
        expect(result, 0);
      });
      test('opposite signs', () {
        // given
        final unit1 = meters(4.0);
        final unit2 = meters(-2.0);

        // when
        final result = unit1 ~/ unit2;

        // then
        expect(result, -2);
      });
      test('compare to zero', () {
        // given
        final unit1 = meters(4.0);
        final unit2 = DistanceMeasurement.zero();

        // then
        expect(() => unit1 ~/ unit2, throwsUnsupportedError);
      });
      test('compare with zero', () {
        // given
        final unit1 = DistanceMeasurement.zero();
        final unit2 = meters(4.0);

        // when
        final result = unit1 ~/ unit2;

        // then
        expect(result, 0);
      });
      test('compare to infinity', () {
        // given
        final unit1 = meters(4.0);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 ~/ unit2;

        // then
        expect(result, 0);
      });
      test('compare with infinity', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = meters(4.0);

        // then
        expect(() => unit1 ~/ unit2, throwsUnsupportedError);
      });
    });

    group('%', () {
      test('larger over smaller', () {
        // given
        final unit1 = meters(8);
        final unit2 = meters(3);

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(meters(2)), true);
      });
      test('smaller over larger', () {
        // given
        final unit1 = meters(3);
        final unit2 = meters(8);

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(meters(3)), true);
      });
      test('different base units', () {
        // given
        final unit1 = meters(5);
        final unit2 = feet(5);

        // when
        final result = unit1 % unit2;

        // then
        expect(result.withPrecision(3).as(meters), 0.428);
      });
      test('different base units with decimals', () {
        // given
        final unit1 = meters(5.5);
        final unit2 = feet(4.3);

        // when
        final result = unit1 % unit2;

        // then
        expect(result.withPrecision(3).as(meters), 0.257);
      });
      test('negative dividend', () {
        // given
        final unit1 = meters(-8);
        final unit2 = meters(3);

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(meters(1)), true);
      });
      test('negative divisor', () {
        // given
        final unit1 = meters(8);
        final unit2 = meters(-3);

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(meters(2)), true);
      });
      test('both negative', () {
        // given
        final unit1 = meters(-8);
        final unit2 = meters(-3);

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(meters(1)), true);
      });
      test('infinite dividend', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = meters(2);

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(DistanceMeasurement.nan()), true);
      });
      test('infinite divisor', () {
        // given
        final unit1 = meters(5);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(meters(5)), true);
      });
      test('both infinite', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(DistanceMeasurement.nan()), true);
      });
      test('zero dividend', () {
        // given
        final unit1 = DistanceMeasurement.zero();
        final unit2 = meters(2);

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(DistanceMeasurement.zero()), true);
      });
      test('zero divisor', () {
        // given
        final unit1 = meters(5);
        final unit2 = DistanceMeasurement.zero();

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(DistanceMeasurement.nan()), true);
      });
      test('both zero', () {
        // given
        final unit1 = DistanceMeasurement.zero();
        final unit2 = DistanceMeasurement.zero();

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(DistanceMeasurement.nan()), true);
      });
      test('zero divisor, infinite dividend', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = DistanceMeasurement.zero();

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(DistanceMeasurement.nan()), true);
      });
      test('infinite divisor, zero dividend', () {
        // given
        final unit1 = DistanceMeasurement.zero();
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1 % unit2;

        // then
        expect(result.equals(DistanceMeasurement.zero()), true);
      });
    });

    group('compareMagnitude', () {
      test('no precision', () {
        // given
        final unit1 = meters(4.0);
        final unit2 = meters(2.0);

        // when
        final result = unit1.compareMagnitude(unit2);

        // then
        expect(result, 2.0);
      });
      test('opposite sign', () {
        // given
        final unit1 = meters(4.0);
        final unit2 = meters(-2.0);

        // when
        final result = unit1.compareMagnitude(unit2);

        // then
        expect(result, -2.0);
      });
      test('with precision', () {
        // given
        final unit1 = meters(4.0, precision: 3);
        final unit2 = meters(3.0, precision: 3);

        // when
        final result = unit1.compareMagnitude(unit2);

        // then
        expect(result, 1.3333333333333333);
      });
      test('truncating precision', () {
        // given
        final unit1 = meters(3.04999999, precision: 2);
        final unit2 = meters(1.49012345, precision: 2);

        // when
        final result = unit1.compareMagnitude(unit2);

        // then
        expect(result, 2.0);
      });
      test('compare to zero', () {
        // given
        final unit1 = meters(4.0);
        final unit2 = DistanceMeasurement.zero();

        // when
        final result = unit1.compareMagnitude(unit2);

        // then
        expect(result, double.infinity);
      });
      test('compare with zero', () {
        // given
        final unit1 = DistanceMeasurement.zero();
        final unit2 = meters(4.0);

        // when
        final result = unit1.compareMagnitude(unit2);

        // then
        expect(result, 0.0);
      });
      test('compare to infinity', () {
        // given
        final unit1 = meters(4.0);
        final unit2 = DistanceMeasurement.infinite();

        // when
        final result = unit1.compareMagnitude(unit2);

        // then
        expect(result, 0.0);
      });
      test('compare with infinity', () {
        // given
        final unit1 = DistanceMeasurement.infinite();
        final unit2 = meters(4.0);

        // when
        final result = unit1.compareMagnitude(unit2);

        // then
        expect(result, double.infinity);
      });
    });

    group('withPrecision', () {
      test('sets smaller precision', () {
        // given
        final unit = meters(3.14159, precision: 6);

        // when
        final result = unit.withPrecision(4);

        // then
        expect(result.as(meters), 3.142);
      });
      test('sets higher precision', () {
        // given
        final unit = meters(3.14159, precision: 2);

        // when
        final result = unit.withPrecision(6);

        // then
        expect(result.as(meters), 3.14159);
      });
    });
  });
}
