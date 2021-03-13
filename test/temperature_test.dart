import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Temperature Constructors',
    () {
      test('zero', () {
        final result = Temperature.absoluteZero();

        expect(result.asKelvin, 0.0);
        expect(result.asCelcius, -273.15);
        expect(result.asFahrenheit, -459.66999999999996);
      });
      test('infinity', () {
        final result = Temperature.infinite();

        expect(result.asKelvin, double.infinity);
        expect(result.asCelcius, double.infinity);
        expect(result.asFahrenheit, double.infinity);
      });
      test('below absolute zero', () {
        expect(() => Temperature.ofKelvin(-1), throwsArgumentError);
      });
      test('kelvin', () {
        final result = Temperature.ofKelvin(290.0);

        expect(result.asKelvin, 290);
        expect(result.asCelcius, 16.850000000000023);
        expect(result.asFahrenheit, 62.33000000000004);
      });
      test('celcius', () {
        final result = Temperature.ofCelcius(20.0);

        expect(result.asKelvin, 293.15);
        expect(result.asCelcius, 20.0);
        expect(result.asFahrenheit, 68.0);
      });
      test('fahrenheit', () {
        final result = Temperature.ofFahrenheit(70.0, precision: Precision(5));

        expect(result.asKelvin, 294.26);
        expect(result.asCelcius, 21.111);
        expect(result.asFahrenheit, 70.0);
      });
    },
  );

  group('Temperature Checks', () {
    test('isFinite', () {
      expect(Temperature.ofKelvin(300).isFinite, true);
      expect(Temperature.absoluteZero().isFinite, true);
      expect(Temperature.infinite().isFinite, false);
    });
    test('isInfinite', () {
      expect(Temperature.ofKelvin(300).isInfinite, false);
      expect(Temperature.absoluteZero().isInfinite, false);
      expect(Temperature.infinite().isInfinite, true);
    });
  });

  group(
    'Temperature Equality',
    () {
      test('Same units', () {
        expect(Temperature.ofKelvin(123.4), Temperature.ofKelvin(123.4));
        expect(Temperature.ofKelvin(123.4).hashCode,
            Temperature.ofKelvin(123.4).hashCode);
        expect(
            Temperature.ofKelvin(123.4) == Temperature.ofKelvin(123.4), true);
        expect(
            Temperature.ofKelvin(123.4) != Temperature.ofKelvin(123.4), false);
        expect(
            Temperature.ofKelvin(123.4) == Temperature.ofKelvin(1234), false);
        expect(Temperature.ofKelvin(123.4) != Temperature.ofKelvin(1234), true);
      });
      test('Different units', () {
        expect(Temperature.ofKelvin(123.39999999999998),
            Temperature.ofCelcius(-149.75));
        expect(Temperature.ofKelvin(123.39999999999998).hashCode,
            Temperature.ofCelcius(-149.75).hashCode);
        expect(
            Temperature.ofKelvin(123.39999999999998) ==
                Temperature.ofCelcius(-149.75),
            true);
        expect(
            Temperature.ofKelvin(123.39999999999998) !=
                Temperature.ofCelcius(-149.75),
            false);
        expect(
            Temperature.ofKelvin(123.39999999999998) ==
                Temperature.ofCelcius(123.4),
            false);
        expect(
            Temperature.ofKelvin(123.39999999999998) !=
                Temperature.ofCelcius(123.4),
            true);
      });
    },
  );

  group('Temperature Comparison', () {
    test('>', () {
      expect(Temperature.ofKelvin(123.4) > Temperature.ofKelvin(123.4), false);
      expect(Temperature.ofKelvin(123.4) > Temperature.ofKelvin(123.5), false);
      expect(Temperature.ofKelvin(123.5) > Temperature.ofKelvin(123.4), true);

      expect(Temperature.absoluteZero() > Temperature.absoluteZero(), false);
      expect(Temperature.absoluteZero() > Temperature.infinite(), false);
      expect(Temperature.infinite() > Temperature.infinite(), false);
    });
    test('>=', () {
      expect(Temperature.ofKelvin(123.4) >= Temperature.ofKelvin(123.4), true);
      expect(Temperature.ofKelvin(123.4) >= Temperature.ofKelvin(123.5), false);
      expect(Temperature.ofKelvin(123.5) >= Temperature.ofKelvin(123.4), true);

      expect(Temperature.absoluteZero() >= Temperature.absoluteZero(), true);
      expect(Temperature.absoluteZero() >= Temperature.infinite(), false);
      expect(Temperature.infinite() >= Temperature.infinite(), true);
    });
    test('<', () {
      expect(Temperature.ofKelvin(123.4) < Temperature.ofKelvin(123.4), false);
      expect(Temperature.ofKelvin(123.4) < Temperature.ofKelvin(123.5), true);
      expect(Temperature.ofKelvin(123.5) < Temperature.ofKelvin(123.4), false);

      expect(Temperature.absoluteZero() < Temperature.absoluteZero(), false);
      expect(Temperature.absoluteZero() < Temperature.infinite(), true);
      expect(Temperature.infinite() < Temperature.infinite(), false);
    });
    test('<=', () {
      expect(Temperature.ofKelvin(123.4) <= Temperature.ofKelvin(123.4), true);
      expect(Temperature.ofKelvin(123.4) <= Temperature.ofKelvin(123.5), true);
      expect(Temperature.ofKelvin(123.5) <= Temperature.ofKelvin(123.4), false);

      expect(Temperature.absoluteZero() <= Temperature.absoluteZero(), true);
      expect(Temperature.absoluteZero() <= Temperature.infinite(), true);
      expect(Temperature.infinite() <= Temperature.infinite(), true);
    });
    test('compareTo', () {
      final result = <Temperature>[
        Temperature.ofKelvin(1),
        Temperature.infinite(),
        Temperature.ofFahrenheit(300),
        Temperature.ofCelcius(3),
        Temperature.absoluteZero(),
        Temperature.ofFahrenheit(3),
        Temperature.ofCelcius(-2),
      ];
      result.sort();

      expect(result, <Temperature>[
        Temperature.absoluteZero(),
        Temperature.ofKelvin(1),
        Temperature.ofFahrenheit(3),
        Temperature.ofCelcius(-2),
        Temperature.ofCelcius(3),
        Temperature.ofFahrenheit(300),
        Temperature.infinite(),
      ]);
    });
  });

  group(
    'Temperature Addition',
    () {
      test('Same units', () {
        expect(Temperature.ofKelvin(123) + TemperatureChange.ofKelvin(32),
            Temperature.ofKelvin(155));
        expect(Temperature.ofKelvin(123) + TemperatureChange.ofKelvin(-32),
            Temperature.ofKelvin(91));
      });
      test('Different units', () {
        expect(Temperature.ofKelvin(123) + TemperatureChange.ofFahrenheit(32),
            Temperature.ofKelvin(140.77777777777777));
        expect(Temperature.ofKelvin(123) + TemperatureChange.ofFahrenheit(-32),
            Temperature.ofKelvin(105.22222222222223));
      });
      test('Invalid', () {
        expect(
            () => Temperature.ofKelvin(123) + TemperatureChange.ofKelvin(-124),
            throwsArgumentError);
        expect(
            () =>
                Temperature.ofKelvin(123) +
                TemperatureChange.negativeInfinite(),
            throwsArgumentError);
      });
      test('Infinity', () {
        expect(Temperature.ofKelvin(123) + TemperatureChange.infinite(),
            Temperature.infinite());
        expect(Temperature.infinite() + TemperatureChange.ofKelvin(123),
            Temperature.infinite());
        expect(Temperature.infinite() + TemperatureChange.ofKelvin(-123),
            Temperature.infinite());
      });
      test('Identity', () {
        expect(Temperature.ofKelvin(123) + TemperatureChange.zero(),
            Temperature.ofKelvin(123));
        expect(Temperature.absoluteZero() + TemperatureChange.ofKelvin(123),
            Temperature.ofKelvin(123));
      });
    },
  );

  group(
    'Temperature Subtraction',
    () {
      test('Same units', () {
        expect(Temperature.ofKelvin(123) - TemperatureChange.ofKelvin(32),
            Temperature.ofKelvin(91));
        expect(Temperature.ofKelvin(123) - TemperatureChange.ofKelvin(-32),
            Temperature.ofKelvin(155));
      });
      test('Different units', () {
        expect(Temperature.ofKelvin(123) - TemperatureChange.ofFahrenheit(32),
            Temperature.ofKelvin(105.22222222222223));
        expect(Temperature.ofKelvin(123) - TemperatureChange.ofFahrenheit(-32),
            Temperature.ofKelvin(140.77777777777777));
      });
      test('Invalid', () {
        expect(
            () => Temperature.ofKelvin(123) - TemperatureChange.ofKelvin(124),
            throwsArgumentError);
        expect(() => Temperature.ofKelvin(123) - TemperatureChange.infinite(),
            throwsArgumentError);
      });
      test('Infinity', () {
        expect(Temperature.ofKelvin(123) - TemperatureChange.negativeInfinite(),
            Temperature.infinite());
        expect(Temperature.infinite() - TemperatureChange.ofKelvin(123),
            Temperature.infinite());
        expect(Temperature.infinite() - TemperatureChange.ofKelvin(-123),
            Temperature.infinite());
      });
      test('Identity', () {
        expect(Temperature.ofKelvin(123) - TemperatureChange.zero(),
            Temperature.ofKelvin(123));
        expect(Temperature.absoluteZero() - TemperatureChange.ofKelvin(-123),
            Temperature.ofKelvin(123));
      });
    },
  );

  group('TemperatureChange Constructors', () {
    test('zero', () {
      final result = TemperatureChange.zero();

      expect(result.asKelvin, 0.0);
      expect(result.asCelcius, 0.0);
      expect(result.asFahrenheit, 0.0);
    });
    test('infinity', () {
      final result = TemperatureChange.infinite();

      expect(result.asKelvin, double.infinity);
      expect(result.asCelcius, double.infinity);
      expect(result.asFahrenheit, double.infinity);
    });
    test('negative infinity', () {
      final result = TemperatureChange.negativeInfinite();

      expect(result.asKelvin, double.negativeInfinity);
      expect(result.asCelcius, double.negativeInfinity);
      expect(result.asFahrenheit, double.negativeInfinity);
    });
    test('kelvin', () {
      final result = TemperatureChange.ofKelvin(123.4, precision: Precision(5));

      expect(result.asKelvin, 123.4);
      expect(result.asCelcius, 123.4);
      expect(result.asFahrenheit, 222.12);
    });
    test('celcius', () {
      final result =
          TemperatureChange.ofCelcius(123.4, precision: Precision(5));

      expect(result.asKelvin, 123.4);
      expect(result.asCelcius, 123.4);
      expect(result.asFahrenheit, 222.12);
    });
    test('fahrenheit', () {
      final result =
          TemperatureChange.ofFahrenheit(123.4, precision: Precision(5));

      expect(result.asKelvin, 68.556);
      expect(result.asCelcius, 68.556);
      expect(result.asFahrenheit, 123.4);
    });
  });
}