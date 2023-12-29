import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Pressure', () {
    group('zero', () {
      test('has zero pressure', () {
        // given
        final measurement = Pressure.zero();

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 0.0);
      });
      test('has max precision', () {
        // given
        final measurement = Pressure.zero();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final measurement = Pressure.zero(psi);

        // when
        final result = measurement.toString();

        // then
        expect(result, '0.0 psi');
      });
    });
    group('infinity', () {
      test('has infinite measurement', () {
        // given
        final measurement = Pressure.infinite();

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, double.infinity);
      });
      test('has max precision', () {
        // given
        final measurement = Pressure.infinite();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final measurement = Pressure.infinite(psi);

        // when
        final result = measurement.toString();

        // then
        expect(result, 'Infinity psi');
      });
    });
    group('infinity', () {
      test('has negative infinite measurement', () {
        // given
        final measurement = Pressure.negativeInfinite();

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, double.negativeInfinity);
      });
      test('has max precision', () {
        // given
        final measurement = Pressure.negativeInfinite();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final measurement = Pressure.negativeInfinite(psi);

        // when
        final result = measurement.toString();

        // then
        expect(result, '-Infinity psi');
      });
    });

    group('sum', () {
      test('adds up component parts', () {
        // given
        final measurement = Pressure.sum([
          pascals(2),
          bars(1),
          standardAtmospheres(0.5),
        ]);

        // when
        final result = measurement.withPrecisionOf(3).as(pascals);

        // then
        expect(result, 151000);
      });
    });

    group('as', () {
      test('converts to unit', () {
        // given
        final measurement = pascals(101325, precision: Precision(8));

        // when
        final result = measurement.as(standardAtmospheres);

        // then
        expect(result, 1.0);
      });
    });

    group('pascals', () {
      test('converts to base', () {
        // given
        final measurement = pascals(1234.0, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1234.0);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.pascals(1234.0, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.234);
      });
    });

    group('bars', () {
      test('converts to base', () {
        // given
        final measurement = bars(1234.0, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.234e8);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.bars(1234.0, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.234e5);
      });
    });

    group('baryes', () {
      test('converts to base', () {
        // given
        final measurement = baryes(1234.0, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.234e4);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.baryes(1234.0, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 12.34);
      });
    });

    group('standard atmospheres', () {
      test('converts to base', () {
        // given
        final measurement = standardAtmospheres(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.2504e5);
      });
      test('applies prefixes', () {
        // given
        final measurement =
            milli.standardAtmospheres(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.2504e2);
      });
    });

    group('technical atmospheres', () {
      test('converts to base', () {
        // given
        final measurement =
            technicalAtmospheres(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.2583e-2);
      });
      test('applies prefixes', () {
        // given
        final measurement =
            milli.technicalAtmospheres(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.2583e-5);
      });
    });

    group('mmHg', () {
      test('converts to base', () {
        // given
        final measurement = mmHg(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 164.52);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.mmHg(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 0.16452);
      });
    });

    group('inHg', () {
      test('converts to base', () {
        // given
        final measurement = inHg(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 3.644e-4);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.inHg(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 3.644e-7);
      });
    });

    group('Torr', () {
      test('converts to base', () {
        // given
        final measurement = torr(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 9.2558e-3);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.torr(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 9.2558e-6);
      });
    });

    group('psi', () {
      test('converts to base', () {
        // given
        final measurement = psi(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.7898e-4);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.psi(1.234, precision: Precision(5));

        // when
        final result = measurement.as(pascals);

        // then
        expect(result, 1.7898e-7);
      });
    });

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = pascals;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Pa');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.pascals;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mPa');
      });
      test('maintains units', () {
        // given
        final measurement = psi(3.4).withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 psi');
      });
      test('maintains prefix', () {
        // given
        final measurement = milli.pascals(3.4).withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mPa');
      });
      test('extension maintains prefix', () {
        // given
        final measurement = 3.4.milli.pascals.withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mPa');
      });
      test('modified precision', () {
        // given
        final measurement = deci.pascals(23.45).withPrecisionOf(3);

        // when
        final result = measurement.withPrecisionOf(2).toString();

        // then
        expect(result, '23.0 dPa');
      });
      test('modified units', () {
        // given
        final measurement = deci.pascals(23.45).withPrecisionOf(3);

        // when
        final result = measurement.withDefaultUnit(milli.bars).toString();

        // then
        expect(result, '0.0235 mbar');
      });
    });
  });
}
