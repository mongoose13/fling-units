import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Derived', () {
    group('zero', () {
      test('with default interpreter', () {
        // given
        final interpreter = DerivedMeasurement<Distance, Time>.zero();

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 unknown');
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = DerivedMeasurement<Distance, Time>.zero(
            DerivedUnit(feet, minutes, true));

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 ft/min');
      });
    });
    group('infinity', () {
      test('with default interpreter', () {
        // given
        final interpreter = DerivedMeasurement<Distance, Time>.infinite();

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity unknown');
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = DerivedMeasurement<Distance, Time>.infinite(
            DerivedUnit(feet, minutes, true));

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity ft/min');
      });
    });
    group('negativeInfinity', () {
      test('with default interpreter', () {
        // given
        final interpreter =
            DerivedMeasurement<Distance, Time>.negativeInfinite();

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity unknown');
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = DerivedMeasurement<Distance, Time>.negativeInfinite(
            DerivedUnit(feet, minutes, true));

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity ft/min');
      });
    });

    group('multiply', () {
      test('same units', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.multiply(
          meters(2, precision: Precision(3)),
          meters(3, precision: Precision(3)),
        );

        // when
        final result = unit.asPair(meters, meters);

        // then
        expect(result, 6.0);
      });
      test('disparate units', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.multiply(
          meters(2, precision: Precision(3)),
          meters(3, precision: Precision(3)),
        );

        // when
        final result = unit.asPair(meters, deci.meters);

        // then
        expect(result, 60.0);
      });
      test('disparate units transposed', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.multiply(
          meters(2, precision: Precision(3)),
          meters(3, precision: Precision(3)),
        );

        // when
        final result = unit.asPair(deci.meters, meters);

        // then
        expect(result, 60.0);
      });
      test('precision maintained', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.multiply(
          meters(2, precision: Precision(6)),
          meters(3, precision: Precision(3)),
        );

        // when
        final result = unit.precision;

        // then
        expect(result, 3);
      });
    });

    group('divide', () {
      test('same units', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.divide(
          meters(6, precision: Precision(3)),
          meters(3, precision: Precision(3)),
        );

        // when
        final result = unit.asPair(meters, meters);

        // then
        expect(result, 2.0);
      });
      test('disparate units', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.divide(
          meters(6, precision: Precision(3)),
          meters(3, precision: Precision(3)),
        );

        // when
        final result = unit.asPair(meters, deci.meters);

        // then
        expect(result, 0.2);
      });
      test('disparate units transposed', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.divide(
          meters(6, precision: Precision(3)),
          meters(3, precision: Precision(3)),
        );

        // when
        final result = unit.asPair(deci.meters, meters);

        // then
        expect(result, 20.0);
      });
      test('disparate non-si units', () {
        // given
        final unit = DerivedMeasurement<Distance, Time>.divide(
          miles(6, precision: Precision(3)),
          hours(3, precision: Precision(3)),
        );

        // when
        final result = unit.asPair(meters, seconds);

        // then
        expect(result, 0.894);
      });
      test('disparate non-si units default interpreter division', () {
        // given
        final unit = DerivedMeasurement<Distance, Time>.divide(
          miles(6, precision: Precision(3)),
          hours(3, precision: Precision(3)),
        );

        // when
        final result = unit.toString();

        // then
        expect(result, '2.0 mi/h');
      });
      test('disparate non-si units default interpreter multiplication', () {
        // given
        final unit = DerivedMeasurement<Distance, Time>.multiply(
          miles(6, precision: Precision(3)),
          hours(3, precision: Precision(3)),
        );

        // when
        final result = unit.toString();

        // then
        expect(result, '18.0 mi⋅h');
      });
      test('precision maintained', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.divide(
          meters(6, precision: Precision(6)),
          meters(3, precision: Precision(3)),
        );

        // when
        final result = unit.precision;

        // then
        expect(result, 3);
      });
      test('disparate measurements', () {
        // given
        final unit = DerivedMeasurement<Distance, Volume>.divide(
            miles(100, precision: Precision(3)),
            gallons(5, precision: Precision(3)));

        // when
        final result = unit.asPair(miles, gallons);

        // then
        expect(result, 20.0);
      });
      test('disparate measurements converted', () {
        // given
        final unit = DerivedMeasurement<Distance, Volume>.divide(
            miles(100, precision: Precision(3)),
            gallons(5, precision: Precision(3)));

        // when
        final result = unit.asPair(kilo.meters, liters);

        // then
        expect(result, 7.08);
      });
    });

    group('toString', () {
      test('multiply', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.multiply(
          meters(2, precision: Precision(3)),
          feet(3, precision: Precision(3)),
        );

        // when
        final result = unit.toString();

        // then
        expect(result, '6.0 m⋅ft');
      });
      test('divide', () {
        // given
        final unit = DerivedMeasurement<Distance, Time>.divide(
          meters(6, precision: Precision(3)),
          seconds(3, precision: Precision(3)),
        );

        // when
        final result = unit.toString();

        // then
        expect(result, '2.0 m/s');
      });
      test('withDefaultUnit change', () {
        // given
        final unit = DerivedMeasurement<Distance, Distance>.multiply(
          meters(2, precision: Precision(3)),
          meters(3, precision: Precision(3)),
        );

        // when
        final result =
            unit.withDefaultUnit(DerivedUnit(feet, inches)).toString();

        // then
        expect(result, '775.0 ft⋅in');
      });
    });

    group('Unknown interpreter', () {
      group('as', () {
        test('zero', () {
          // given
          final unit = DerivedMeasurement<Distance, Time>.zero();

          // when
          final result = unit.asPair(miles, hours);

          // then
          expect(result, 0.0);
        });
        test('infinity', () {
          // given
          final unit = DerivedMeasurement<Distance, Time>.infinite();

          // when
          final result = unit.asPair(miles, hours);

          // then
          expect(result, double.infinity);
        });
        test('negative infinity', () {
          // given
          final unit = DerivedMeasurement<Distance, Time>.negativeInfinite();

          // when
          final result = unit.asPair(miles, hours);

          // then
          expect(result, -double.infinity);
        });
      });
      group('per', () {
        test('zero', () {
          // given
          final unit = DerivedMeasurement<Distance, Time>.zero();

          // when
          final result = unit.per(2.seconds).toString();

          // then
          expect(result, "0.0 unknown/s");
        });
      });
    });
  });
}
