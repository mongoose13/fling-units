import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Quantity', () {
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
      test('with custom default interpreter', () {
        // given
        final interpreter = Quantity.zero(units);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 units');
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
      test('with custom default interpreter', () {
        // given
        final interpreter = Quantity.infinite(units);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity units');
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
      test('with custom default interpreter', () {
        // given
        final interpreter = Quantity.negativeInfinite(units);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity units');
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
      test('applies base prefix', () {
        // given
        final quantity =
            MeasurementPrefix.unit().units(1.234e23, precision: Precision(5));

        // when
        final result = quantity.as(moles);

        // then
        expect(result, 0.20491);
      });
      test('applies prefixes', () {
        // given
        final quantity = milli.units(1234, precision: Precision(5));

        // when
        final result = quantity.as(units);

        // then
        expect(result, 1);
      });
      test('applies prefixes to conversions', () {
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

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = moles;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mol');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.moles;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mmol');
      });
      test('maintains units', () {
        // given
        final measurement = moles(3.4).withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mol');
      });
      test('maintains prefix', () {
        // given
        final measurement = milli.moles(3.4).withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mmol');
      });
      test('extension maintains prefix', () {
        // given
        final measurement = 3.4.milli.moles.withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mmol');
      });
      test('modified precision', () {
        // given
        final measurement = deci.moles(23.45).withPrecisionOf(3);

        // when
        final result = measurement.withPrecisionOf(2).toString();

        // then
        expect(result, '23.0 dmol');
      });
      test('modified units', () {
        // given
        final measurement = deci.moles(23.45).withPrecisionOf(3);

        // when
        final result = measurement.withDefaultUnit(milli.units).toString();

        // then
        expect(result, '1.41e+27 munits');
      });
    });
  });
}
