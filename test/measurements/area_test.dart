import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Area', () {
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
      test('with custom default interpreter', () {
        // given
        final interpreter = Area.zero(AreaUnit.squared(feet));

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 ft²');
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
      test('with custom default interpreter', () {
        // given
        final interpreter = Area.infinite(AreaUnit.squared(feet));

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity ft²');
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
      test('with custom default interpreter', () {
        // given
        final interpreter = Area.negativeInfinite(AreaUnit.squared(feet));

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity ft²');
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
        final result = area.asPair(meters, meters);

        // then
        expect(result, 1234.0);
      });
      test('converts to different units', () {
        // given
        final area = Area.square(meters)(1234.0, precision: Precision(5));

        // when
        final result = area.asPair(kilo.meters, meters);

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

    group('squared', () {
      test('converts to SI', () {
        // given
        final interpreter = AreaUnit.squared(feet);

        // when
        final result = interpreter(5).withPrecisionOf(6).asPair(meters, meters);

        // then
        expect(result, 0.464515);
      });
      test('converts to SI with prefix', () {
        // given
        final interpreter = AreaUnit.squared(deci.feet);

        // when
        final result = interpreter(5).withPrecisionOf(6).asPair(meters, meters);

        // then
        expect(result, 0.00464515);
      });
    });

    group('toString', () {
      test('named custom interpreter', () {
        // given
        final interpreter = AreaUnit(meters, feet, name: 'mf');

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mf');
      });
      test('unnamed custom interpreter', () {
        // given
        final interpreter = AreaUnit(meters, feet);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'm⋅ft');
      });
      test('squared units', () {
        // given
        final area = AreaUnit.squared(feet);

        // when
        final result = area.toString();

        // then
        expect(result, 'ft²');
      });
      test('squared units with prefix', () {
        // given
        final area = AreaUnit.squared(deka.feet);

        // when
        final result = area.toString();

        // then
        expect(result, 'daft²');
      });
      test('squared measurement', () {
        // given
        final area = AreaUnit.squared(feet)(5);

        // when
        final result = area.toString();

        // then
        expect(result, '5.0 ft²');
      });
      test('squared measurement with prefix', () {
        // given
        final area = AreaUnit.squared(deka.feet)(5);

        // when
        final result = area.toString();

        // then
        expect(result, '5.0 daft²');
      });
    });
  });
}
