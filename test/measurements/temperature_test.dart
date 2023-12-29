import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Temperature', () {
    group(
      'constructors',
      () {
        test('zero', () {
          final result = Temperature.absoluteZero();

          expect(result.asKelvin, 0.0);
        });
        test('zero with custom default interpreter', () {
          // given
          final interpreter =
              Temperature.absoluteZero(fahrenheit).withPrecisionOf(5);

          // when
          final result = interpreter.toString();

          // then
          expect(result, '-459.67 °F');
        });
        test('infinity', () {
          final result = Temperature.infinite();

          expect(result.asKelvin, double.infinity);
        });
        test('infinity with custom default interpreter', () {
          // given
          final interpreter = Temperature.infinite(fahrenheit);

          // when
          final result = interpreter.toString();

          // then
          expect(result, 'Infinity °F');
        });
        test('below absolute zero', () {
          expect(() => Temperature.ofKelvin(-1), throwsArgumentError);
        });
        test('kelvin', () {
          final result = Temperature.ofKelvin(290.0);

          expect(result.asKelvin, 290);
        });
        test('celcius', () {
          final result = Temperature.ofCelcius(20.0);

          expect(result.asKelvin, 293.15);
        });
        test('fahrenheit', () {
          final result =
              Temperature.ofFahrenheit(70.0, precision: Precision(5));

          expect(result.asKelvin, 294.26);
        });
      },
    );

    group('isFinite', () {
      test('finite number', () {
        // given
        final temperature = Temperature.ofKelvin(300);

        // when
        final result = temperature.isFinite;

        // then
        expect(result, true);
      });
      test('absolute zero', () {
        // given
        final temperature = Temperature.absoluteZero();

        // when
        final result = temperature.isFinite;

        // then
        expect(result, true);
      });
      test('infinite', () {
        // given
        final temperature = Temperature.infinite();

        // when
        final result = temperature.isFinite;

        // then
        expect(result, false);
      });
    });

    group('isInfinite', () {
      test('finite number', () {
        // given
        final temperature = Temperature.ofKelvin(300);

        // when
        final result = temperature.isInfinite;

        // then
        expect(result, false);
      });
      test('absolute zero', () {
        // given
        final temperature = Temperature.absoluteZero();

        // when
        final result = temperature.isInfinite;

        // then
        expect(result, false);
      });
      test('infinite', () {
        // given
        final temperature = Temperature.infinite();

        // when
        final result = temperature.isInfinite;

        // then
        expect(result, true);
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
          expect(Temperature.ofKelvin(123.4) != Temperature.ofKelvin(123.4),
              false);
          expect(
              Temperature.ofKelvin(123.4) == Temperature.ofKelvin(1234), false);
          expect(
              Temperature.ofKelvin(123.4) != Temperature.ofKelvin(1234), true);
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
        expect(
            Temperature.ofKelvin(123.4) > Temperature.ofKelvin(123.4), false);
        expect(
            Temperature.ofKelvin(123.4) > Temperature.ofKelvin(123.5), false);
        expect(Temperature.ofKelvin(123.5) > Temperature.ofKelvin(123.4), true);

        expect(Temperature.absoluteZero() > Temperature.absoluteZero(), false);
        expect(Temperature.absoluteZero() > Temperature.infinite(), false);
        expect(Temperature.infinite() > Temperature.infinite(), false);
      });
      test('>=', () {
        expect(
            Temperature.ofKelvin(123.4) >= Temperature.ofKelvin(123.4), true);
        expect(
            Temperature.ofKelvin(123.4) >= Temperature.ofKelvin(123.5), false);
        expect(
            Temperature.ofKelvin(123.5) >= Temperature.ofKelvin(123.4), true);

        expect(Temperature.absoluteZero() >= Temperature.absoluteZero(), true);
        expect(Temperature.absoluteZero() >= Temperature.infinite(), false);
        expect(Temperature.infinite() >= Temperature.infinite(), true);
      });
      test('<', () {
        expect(
            Temperature.ofKelvin(123.4) < Temperature.ofKelvin(123.4), false);
        expect(Temperature.ofKelvin(123.4) < Temperature.ofKelvin(123.5), true);
        expect(
            Temperature.ofKelvin(123.5) < Temperature.ofKelvin(123.4), false);

        expect(Temperature.absoluteZero() < Temperature.absoluteZero(), false);
        expect(Temperature.absoluteZero() < Temperature.infinite(), true);
        expect(Temperature.infinite() < Temperature.infinite(), false);
      });
      test('<=', () {
        expect(
            Temperature.ofKelvin(123.4) <= Temperature.ofKelvin(123.4), true);
        expect(
            Temperature.ofKelvin(123.4) <= Temperature.ofKelvin(123.5), true);
        expect(
            Temperature.ofKelvin(123.5) <= Temperature.ofKelvin(123.4), false);

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

    group('+', () {
      test('base values are summed', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = kelvin(32);

        // when
        final result = temperature + change;

        // then
        expect(result.asKelvin, 155);
      });
      test('negative base values are summed', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = kelvin(-32);

        // when
        final result = temperature + change;

        // then
        expect(result.asKelvin, 91);
      });
      test('precision is maintained', () {
        // given
        final temperature = Temperature.ofKelvin(123, precision: Precision(3));
        final change = kelvin(32, precision: Precision(2));

        // when
        final result = temperature + change;

        // then
        expect(result.precision, 3);
      });
      test('precision is recalculated below the decimal', () {
        // given
        final temperature =
            Temperature.ofKelvin(123.45, precision: Precision(5));
        final change = kelvin(987.65, precision: Precision(5));

        // when
        final result = temperature + change;

        // then
        expect(result.precision, 6);
      });
      test('invalid', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = kelvin(-124);

        // then
        expect(() => temperature + change, throwsArgumentError);
      });
      test('infinity', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = TemperatureChange.infinite();

        // when
        final result = temperature + change;

        // then
        expect(result, Temperature.infinite());
      });
      test('negative infinity', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = TemperatureChange.negativeInfinite();

        // then
        expect(() => temperature + change, throwsArgumentError);
      });
    });

    group('-', () {
      test('base values are subtracted', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = kelvin(32);

        // when
        final result = temperature - change;

        // then
        expect(result.asKelvin, 91);
      });
      test('negative base values are summed', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = kelvin(-32);

        // when
        final result = temperature - change;

        // then
        expect(result.asKelvin, 155);
      });
      test('precision is maintained', () {
        // given
        final temperature = Temperature.ofKelvin(123, precision: Precision(3));
        final change = kelvin(32, precision: Precision(2));

        // when
        final result = temperature - change;

        // then
        expect(result.precision, 2);
      });
      test('precision is recalculated below the decimal', () {
        // given
        final temperature =
            Temperature.ofKelvin(123.45, precision: Precision(5));
        final change = kelvin(24.65, precision: Precision(4));

        // when
        final result = temperature - change;

        // then
        expect(result.precision, 4);
      });
      test('invalid', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = kelvin(124);

        // then
        expect(() => temperature - change, throwsArgumentError);
      });
      test('infinity', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = TemperatureChange.infinite();

        // then
        expect(() => temperature - change, throwsArgumentError);
      });
      test('negative infinity', () {
        // given
        final temperature = Temperature.ofKelvin(123);
        final change = TemperatureChange.negativeInfinite();

        // when
        final result = temperature - change;

        // then
        expect(result, Temperature.infinite());
      });
    });

    group('toString', () {
      test('maintains units', () {
        // given
        final measurement = Temperature.ofFahrenheit(3.4).withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 °F');
      });
      test('extension maintains units', () {
        // given
        final measurement = 3.4.ofFahrenheit.withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 °F');
      });
      test('modified units', () {
        // given
        final measurement = 3.4.ofFahrenheit.withPrecisionOf(3);

        // when
        final result = measurement.withDefaultUnit(celcius).toString();

        // then
        expect(result, '-15.9 °C');
      });
    });
  });
}
