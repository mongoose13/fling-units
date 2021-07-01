import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 distance', () {
      // given
      final result = Area.zero();

      // then
      expect(result.asArea(Area.square(meters)), 0.0);
    });
    test('has max precision', () {
      // given
      final result = Area.zero();

      // then
      expect(result.precision, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite distance', () {
      // given
      final result = Area.infinite();

      // then
      expect(result.asArea(Area.square(meters)), double.infinity);
    });
    test('has max precision', () {
      // given
      final result = Area.infinite();

      // then
      expect(result.precision, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative distance', () {
      // given
      final result = Area.negativeInfinite();

      // then
      expect(result.asArea(Area.square(meters)), double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final result = Area.negativeInfinite();

      // then
      expect(result.precision, Precision.max.precision);
    });
  });

  group('of', () {
    test('multiplies component parts', () {
      // given
      final area = Area.of(
        meters(2, precision: Precision(5)),
        meters(3, precision: Precision(5)),
      );

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 6.0);
    });
    test('retains correct precision', () {
      // given
      final area = Area.of(
        meters(2, precision: Precision(3)),
        meters(3, precision: Precision(5)),
      );

      // when
      final result = area.precision;

      // then
      expect(result, 3);
    });
  });

  group('as', () {
    test('converts to base', () {
      // given
      final area = Area.square(meters)(1234.0, precision: Precision(5));

      // when
      final result = area.as(meters, meters);

      // then
      expect(result, 1234.0);
    });
    test('converts to different units', () {
      // given
      final area = Area.square(meters)(1234.0, precision: Precision(5));

      // when
      final result = area.as(kilo.meters, meters);

      // then
      expect(result, 1.234);
    });
  });

  group('asArea', () {
    test('converts to base', () {
      // given
      final area = Area.square(meters)(1234.0, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 1234.0);
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final area = Area.sum([
        Area.square(milli.meters)(1),
        Area.square(centi.meters)(2),
        Area.square(deci.meters)(3),
        Area.square(meters)(4),
      ], precision: Precision(10));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 4.030201);
    });
  });
}
