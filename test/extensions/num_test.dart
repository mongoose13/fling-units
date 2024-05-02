import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('NumExtension usage', () {
    group('meters', () {
      test('creates the appropriate measurement with an int', () {
        // given
        final measurement = 3.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 3.0);
      });
      test('creates the appropriate measurement with a double', () {
        // given
        final measurement = 3.1.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 3.1);
      });
    });

    group('mmHg', () {
      test('creates the appropriate measurement with an int', () {
        // given
        final measurement = 3.mmHg;

        // when
        final result = measurement.as(mmHg);

        // then
        expect(result, 3.0);
      });
      test('creates the appropriate measurement with a double', () {
        // given
        final measurement = 3.1.mmHg;

        // when
        final result = measurement.as(mmHg);

        // then
        expect(result, 3.1);
      });
      test('creates the appropriate measurement with a prefix', () {
        // given
        final measurement = 3.1.milli.mmHg;

        // when
        final result = measurement.withPrecisionOf(3).as(mmHg);

        // then
        expect(result, 3.1e-3);
      });
    });

    group('prefixes', () {
      test('yocto', () {
        // given
        final measurement = 2.yocto.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-24);
      });
      test('zepto', () {
        // given
        final measurement = 2.zepto.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-21);
      });
      test('atto', () {
        // given
        final measurement = 2.atto.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-18);
      });
      test('femto', () {
        // given
        final measurement = 2.femto.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-15);
      });
      test('pico', () {
        // given
        final measurement = 2.pico.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-12);
      });
      test('nano', () {
        // given
        final measurement = 2.nano.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-9);
      });
      test('micro', () {
        // given
        final measurement = 2.micro.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-6);
      });
      test('milli', () {
        // given
        final measurement = 2.milli.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-3);
      });
      test('centi', () {
        // given
        final measurement = 2.centi.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-2);
      });
      test('deci', () {
        // given
        final measurement = 2.deci.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e-1);
      });
      test('deka', () {
        // given
        final measurement = 2.deka.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e1);
      });
      test('hecto', () {
        // given
        final measurement = 2.hecto.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e2);
      });
      test('kilo', () {
        // given
        final measurement = 2.kilo.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e3);
      });
      test('mega', () {
        // given
        final measurement = 2.mega.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e6);
      });
      test('giga', () {
        // given
        final measurement = 2.giga.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e9);
      });
      test('tera', () {
        // given
        final measurement = 2.tera.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e12);
      });
      test('peta', () {
        // given
        final measurement = 2.peta.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e15);
      });
      test('exa', () {
        // given
        final measurement = 2.exa.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e18);
      });
      test('zetta', () {
        // given
        final measurement = 2.zetta.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e21);
      });
      test('yotta', () {
        // given
        final measurement = 2.yotta.meters;

        // when
        final result = measurement.as(meters);

        // then
        expect(result, 2e24);
      });
    });

    group('modifiers', () {
      group('square', () {
        test('produces the correct units', () {
          // given
          final measurement = 3.square(feet);

          // then
          expect(measurement.defaultUnit, square(feet));
        });
        test('produces the correct units with prefixes', () {
          // given
          final measurement = 3.square(kilo.feet);

          // then
          expect(measurement.defaultUnit, square(kilo.feet));
        });
        test('produces the correct default value', () {
          // given
          final measurement = 3.square(kilo.feet);

          // then
          expect(measurement.defaultValue, 3.0);
        });
      });
      group('cubic', () {
        test('produces the correct units', () {
          // given
          final measurement = 3.cubic(feet);

          // then
          expect(measurement.defaultUnit, cubic(feet));
        });
        test('produces the correct units with prefixes', () {
          // given
          final measurement = 3.cubic(kilo.feet);

          // then
          expect(measurement.defaultUnit, cubic(kilo.feet));
        });
        test('produces the correct default value', () {
          // given
          final measurement = 3.cubic(kilo.feet);

          // then
          expect(measurement.defaultValue, 3.0);
        });
      });
    });
  });
}
