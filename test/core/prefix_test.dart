import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('custom multiplier', () {
    test('applies correct multiplier', () {
      // given
      final measurement = MeasurementPrefix(0.5).meters(1234.5);

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 617.25);
    });
    test('applies correct precision', () {
      // given
      final measurement =
          MeasurementPrefix(0.5).meters(1234.5, precision: Precision(3));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 617.0);
    });
  });

  group('meters', () {
    test('creates the correct measurement', () {
      // given
      final measurement =
          MeasurementPrefix(3).meters(5.5, precision: Precision(2));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 17.0);
    });
  });
  group('grams', () {
    test('creates the correct measurement', () {
      // given
      final measurement =
          MeasurementPrefix(3).grams(5.5, precision: Precision(2));

      // when
      final result = measurement.as(grams);

      // then
      expect(result, 17.0);
    });
  });
  group('kelvin', () {
    test('creates the correct measurement', () {
      // given
      final measurement =
          MeasurementPrefix(3).kelvin(5.5, precision: Precision(2));

      // when
      final result = measurement.as(kelvin);

      // then
      expect(result, 17.0);
    });
  });
  group('seconds', () {
    test('creates the correct measurement', () {
      // given
      final measurement =
          MeasurementPrefix(3).seconds(5.5, precision: Precision(2));

      // when
      final result = measurement.as(seconds);

      // then
      expect(result, 17.0);
    });
  });
  group('liters', () {
    test('creates the correct measurement', () {
      // given
      final measurement =
          MeasurementPrefix(3).liters(5.5, precision: Precision(2));

      // when
      final result = measurement.asVolume(liters);

      // then
      expect(result, 17.0);
    });
  });

  group('standard prefixes', () {
    test('yotta', () {
      // given
      final measurement = yotta.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e24);
    });
    test('zetta', () {
      // given
      final measurement = zetta.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e21);
    });
    test('exa', () {
      // given
      final measurement = exa.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e18);
    });
    test('peta', () {
      // given
      final measurement = peta.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e15);
    });
    test('tera', () {
      // given
      final measurement = tera.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e12);
    });
    test('giga', () {
      // given
      final measurement = giga.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e9);
    });
    test('mega', () {
      // given
      final measurement = mega.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e6);
    });
    test('kilo', () {
      // given
      final measurement = kilo.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e3);
    });
    test('hecto', () {
      // given
      final measurement = hecto.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e2);
    });
    test('deka', () {
      // given
      final measurement = deka.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e1);
    });
    test('deci', () {
      // given
      final measurement = deci.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-1);
    });
    test('centi', () {
      // given
      final measurement = centi.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-2);
    });
    test('milli', () {
      // given
      final measurement = milli.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-3);
    });
    test('micro', () {
      // given
      final measurement = micro.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-6);
    });
    test('nano', () {
      // given
      final measurement = nano.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-9);
    });
    test('pico', () {
      // given
      final measurement = pico.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-12);
    });
    test('femto', () {
      // given
      final measurement = femto.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-15);
    });
    test('atto', () {
      // given
      final measurement = atto.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-18);
    });
    test('zepto', () {
      // given
      final measurement = zepto.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-21);
    });
    test('yocto', () {
      // given
      final measurement = yocto.meters(1.234, precision: Precision(8));

      // when
      final result = measurement.as(meters);

      // then
      expect(result, 1.234e-24);
    });
  });
}
