import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Mass', () {
    group('zero', () {
      test('has 0.0 mass', () {
        // given
        final mass = MassMeasurement.zero();

        // when
        final result = mass.as(grams);

        // then
        expect(result, 0.0);
      });
      test('has max precision', () {
        // given
        final mass = MassMeasurement.zero();

        // when
        final result = mass.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = MassMeasurement.zero(pounds);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 lb');
      });
    });
    group('infinity', () {
      test('has infinite mass', () {
        // given
        final mass = MassMeasurement.infinite();

        // when
        final result = mass.as(grams);

        // then
        expect(result, double.infinity);
      });
      test('has max precision', () {
        // given
        final mass = MassMeasurement.infinite();

        // when
        final result = mass.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = MassMeasurement.infinite(pounds);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity lb');
      });
    });
    group('negativeInfinity', () {
      test('has infinite negative mass', () {
        // given
        final mass = MassMeasurement.negativeInfinite();

        // when
        final result = mass.as(grams);

        // then
        expect(result, double.negativeInfinity);
      });
      test('has max precision', () {
        // given
        final mass = MassMeasurement.negativeInfinite();

        // when
        final result = mass.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = MassMeasurement.negativeInfinite(pounds);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity lb');
      });
    });

    group('sum', () {
      test('adds up component parts', () {
        // given
        final mass = sum([
          grams(1),
          kilo.grams(2),
          centi.grams(3),
          deci.grams(4),
        ], precision: 8);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 2001.43);
      });
    });

    group('as', () {
      test('converts to unit', () {
        // given
        final mass = grams(123.456, precision: 8);

        // when
        final result = mass.as(pounds);

        // then
        expect(result, 0.27217389);
      });
    });

    group('grams', () {
      test('converts to base', () {
        // given
        final mass = grams(1234.0, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1234.0);
      });
      test('applies prefixes', () {
        // given
        final mass = milli.grams(1234.0, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1.234);
      });
    });
    group('atomicMassUnits', () {
      test('converts to base', () {
        // given
        final mass = atomicMassUnits(1.234e24, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 2.0491);
      });
      test('applies prefixes', () {
        // given
        final mass = milli.atomicMassUnits(1.234e27, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 2.0491);
      });
    });
    group('daltons', () {
      test('converts to base', () {
        // given
        final mass = daltons(1.0, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1.6605e-24);
      });
      test('applies prefixes', () {
        // given
        final mass = milli.daltons(1.0, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1.6605e-27);
      });
    });
    group('electronRestMass', () {
      test('converts to base', () {
        // given
        final mass = electronRestMass(1.0, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 9.1094e-28);
      });
      test('applies prefixes', () {
        // given
        final mass = milli.electronRestMass(1.0, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 9.1094e-31);
      });
    });
    group('tonnes', () {
      test('converts to base', () {
        // given
        final mass = tonnes(1.234e-6, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1.234);
      });
      test('applies prefixes', () {
        // given
        final mass = milli.tonnes(1.234e-3, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1.234);
      });
    });
    group('short tons', () {
      test('converts to base', () {
        // given
        final mass = shortTons(1.234e-6, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1.1195);
      });
      test('applies prefixes', () {
        // given
        final mass = milli.shortTons(1.234e-3, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1.1195);
      });
    });
    group('long tons', () {
      test('converts to base', () {
        // given
        final mass = longTons(1.234e-6, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1.2538);
      });
      test('applies prefixes', () {
        // given
        final mass = milli.longTons(1.234e-3, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 1.2538);
      });
    });
    group('pounds', () {
      test('converts to base', () {
        // given
        final mass = pounds(1.234, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 559.73);
      });
      test('applies prefixes', () {
        // given
        final mass = milli.pounds(1.234e3, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 559.73);
      });
    });
    group('ounces', () {
      test('converts to base', () {
        // given
        final mass = ounces(1.234, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 34.983);
      });
      test('applies prefixes', () {
        // given
        final mass = milli.ounces(1.234e3, precision: 5);

        // when
        final result = mass.as(grams);

        // then
        expect(result, 34.983);
      });
    });

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = pounds;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'lb');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.pounds;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mlb');
      });
      test('maintains units', () {
        // given
        final measurement = pounds(3.4).withPrecision(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 lb');
      });
      test('maintains prefix', () {
        // given
        final measurement = milli.pounds(3.4).withPrecision(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mlb');
      });
      test('extension maintains prefix', () {
        // given
        final measurement = 3.4.milli.pounds.withPrecision(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mlb');
      });
      test('modified precision', () {
        // given
        final measurement = deci.pounds(23.45).withPrecision(3);

        // when
        final result = measurement.withPrecision(2).toString();

        // then
        expect(result, '23.0 dlb');
      });
      test('modified units', () {
        // given
        final measurement = deci.pounds(23.45).withPrecision(3);

        // when
        final result = measurement.butAs(milli.tonnes).toString();

        // then
        expect(result, '1.06 mt');
      });
    });
  });
}
