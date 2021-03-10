import 'package:fling_units/src/precision.dart';
import 'package:fling_units/src/temperature.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Temperature Constructors',
    () {
      test('zero', () {
        final result = Temperature.absoluteZero();

        expect(result.kelvin, 0.0);
        expect(result.celcius, -273.15);
        expect(result.fahrenheit, -459.66999999999996);
      });
      test('infinity', () {
        final result = Temperature.infinity();

        expect(result.kelvin, double.infinity);
        expect(result.celcius, double.infinity);
        expect(result.fahrenheit, double.infinity);
      });
      test('below absolute zero', () {
        expect(() => Temperature.kelvin(-1), throwsArgumentError);
      });
      test('kelvin', () {
        final result = Temperature.kelvin(290.0);

        expect(result.kelvin, 290);
        expect(result.celcius, 16.850000000000023);
        expect(result.fahrenheit, 62.33000000000004);
      });
      test('celcius', () {
        final result = Temperature.celcius(20.0);

        expect(result.kelvin, 293.15);
        expect(result.celcius, 20.0);
        expect(result.fahrenheit, 68.0);
      });
      test('fahrenheit', () {
        final result = Temperature.fahrenheit(70.0, precision: Precision(5));

        expect(result.kelvin, 294.26);
        expect(result.celcius, 21.111);
        expect(result.fahrenheit, 70.0);
      });
    },
  );

  group('Temperature Checks', () {
    test('isFinite', () {
      expect(Temperature.kelvin(300).isFinite, true);
      expect(Temperature.absoluteZero().isFinite, true);
      expect(Temperature.infinity().isFinite, false);
    });
    test('isInfinite', () {
      expect(Temperature.kelvin(300).isInfinite, false);
      expect(Temperature.absoluteZero().isInfinite, false);
      expect(Temperature.infinity().isInfinite, true);
    });
  });

  group(
    'Temperature Equality',
    () {
      test('Same units', () {
        expect(Temperature.kelvin(123.4), Temperature.kelvin(123.4));
        expect(Temperature.kelvin(123.4).hashCode,
            Temperature.kelvin(123.4).hashCode);
        expect(Temperature.kelvin(123.4) == Temperature.kelvin(123.4), true);
        expect(Temperature.kelvin(123.4) != Temperature.kelvin(123.4), false);
        expect(Temperature.kelvin(123.4) == Temperature.kelvin(1234), false);
        expect(Temperature.kelvin(123.4) != Temperature.kelvin(1234), true);
      });
      test('Different units', () {
        expect(Temperature.kelvin(123.39999999999998),
            Temperature.celcius(-149.75));
        expect(Temperature.kelvin(123.39999999999998).hashCode,
            Temperature.celcius(-149.75).hashCode);
        expect(
            Temperature.kelvin(123.39999999999998) ==
                Temperature.celcius(-149.75),
            true);
        expect(
            Temperature.kelvin(123.39999999999998) !=
                Temperature.celcius(-149.75),
            false);
        expect(
            Temperature.kelvin(123.39999999999998) ==
                Temperature.celcius(123.4),
            false);
        expect(
            Temperature.kelvin(123.39999999999998) !=
                Temperature.celcius(123.4),
            true);
      });
    },
  );

  group('Temperature Comparison', () {
    test('>', () {
      expect(Temperature.kelvin(123.4) > Temperature.kelvin(123.4), false);
      expect(Temperature.kelvin(123.4) > Temperature.kelvin(123.5), false);
      expect(Temperature.kelvin(123.5) > Temperature.kelvin(123.4), true);

      expect(Temperature.absoluteZero() > Temperature.absoluteZero(), false);
      expect(Temperature.absoluteZero() > Temperature.infinity(), false);
      expect(Temperature.infinity() > Temperature.infinity(), false);
    });
    test('>=', () {
      expect(Temperature.kelvin(123.4) >= Temperature.kelvin(123.4), true);
      expect(Temperature.kelvin(123.4) >= Temperature.kelvin(123.5), false);
      expect(Temperature.kelvin(123.5) >= Temperature.kelvin(123.4), true);

      expect(Temperature.absoluteZero() >= Temperature.absoluteZero(), true);
      expect(Temperature.absoluteZero() >= Temperature.infinity(), false);
      expect(Temperature.infinity() >= Temperature.infinity(), true);
    });
    test('<', () {
      expect(Temperature.kelvin(123.4) < Temperature.kelvin(123.4), false);
      expect(Temperature.kelvin(123.4) < Temperature.kelvin(123.5), true);
      expect(Temperature.kelvin(123.5) < Temperature.kelvin(123.4), false);

      expect(Temperature.absoluteZero() < Temperature.absoluteZero(), false);
      expect(Temperature.absoluteZero() < Temperature.infinity(), true);
      expect(Temperature.infinity() < Temperature.infinity(), false);
    });
    test('<=', () {
      expect(Temperature.kelvin(123.4) <= Temperature.kelvin(123.4), true);
      expect(Temperature.kelvin(123.4) <= Temperature.kelvin(123.5), true);
      expect(Temperature.kelvin(123.5) <= Temperature.kelvin(123.4), false);

      expect(Temperature.absoluteZero() <= Temperature.absoluteZero(), true);
      expect(Temperature.absoluteZero() <= Temperature.infinity(), true);
      expect(Temperature.infinity() <= Temperature.infinity(), true);
    });
    test('compareTo', () {
      final result = <Temperature>[
        Temperature.kelvin(1),
        Temperature.infinity(),
        Temperature.fahrenheit(300),
        Temperature.celcius(3),
        Temperature.absoluteZero(),
        Temperature.fahrenheit(3),
        Temperature.celcius(-2),
      ];
      result.sort();

      expect(result, <Temperature>[
        Temperature.absoluteZero(),
        Temperature.kelvin(1),
        Temperature.fahrenheit(3),
        Temperature.celcius(-2),
        Temperature.celcius(3),
        Temperature.fahrenheit(300),
        Temperature.infinity(),
      ]);
    });
  });

  group(
    'Temperature Addition',
    () {
      test('Same units', () {
        expect(Temperature.kelvin(123) + TemperatureChange.kelvin(32),
            Temperature.kelvin(155));
        expect(Temperature.kelvin(123) + TemperatureChange.kelvin(-32),
            Temperature.kelvin(91));
      });
      test('Different units', () {
        expect(Temperature.kelvin(123) + TemperatureChange.fahrenheit(32),
            Temperature.kelvin(140.77777777777777));
        expect(Temperature.kelvin(123) + TemperatureChange.fahrenheit(-32),
            Temperature.kelvin(105.22222222222223));
      });
      test('Invalid', () {
        expect(() => Temperature.kelvin(123) + TemperatureChange.kelvin(-124),
            throwsArgumentError);
        expect(
            () =>
                Temperature.kelvin(123) + TemperatureChange.negativeInfinity(),
            throwsArgumentError);
      });
      test('Infinity', () {
        expect(Temperature.kelvin(123) + TemperatureChange.infinity(),
            Temperature.infinity());
        expect(Temperature.infinity() + TemperatureChange.kelvin(123),
            Temperature.infinity());
        expect(Temperature.infinity() + TemperatureChange.kelvin(-123),
            Temperature.infinity());
      });
      test('Identity', () {
        expect(Temperature.kelvin(123) + TemperatureChange.zero(),
            Temperature.kelvin(123));
        expect(Temperature.absoluteZero() + TemperatureChange.kelvin(123),
            Temperature.kelvin(123));
      });
    },
  );

  group(
    'Temperature Subtraction',
    () {
      test('Same units', () {
        expect(Temperature.kelvin(123) - TemperatureChange.kelvin(32),
            Temperature.kelvin(91));
        expect(Temperature.kelvin(123) - TemperatureChange.kelvin(-32),
            Temperature.kelvin(155));
      });
      test('Different units', () {
        expect(Temperature.kelvin(123) - TemperatureChange.fahrenheit(32),
            Temperature.kelvin(105.22222222222223));
        expect(Temperature.kelvin(123) - TemperatureChange.fahrenheit(-32),
            Temperature.kelvin(140.77777777777777));
      });
      test('Invalid', () {
        expect(() => Temperature.kelvin(123) - TemperatureChange.kelvin(124),
            throwsArgumentError);
        expect(() => Temperature.kelvin(123) - TemperatureChange.infinity(),
            throwsArgumentError);
      });
      test('Infinity', () {
        expect(Temperature.kelvin(123) - TemperatureChange.negativeInfinity(),
            Temperature.infinity());
        expect(Temperature.infinity() - TemperatureChange.kelvin(123),
            Temperature.infinity());
        expect(Temperature.infinity() - TemperatureChange.kelvin(-123),
            Temperature.infinity());
      });
      test('Identity', () {
        expect(Temperature.kelvin(123) - TemperatureChange.zero(),
            Temperature.kelvin(123));
        expect(Temperature.absoluteZero() - TemperatureChange.kelvin(-123),
            Temperature.kelvin(123));
      });
    },
  );

  group('TemperatureChange Constructors', () {
    test('zero', () {
      final result = TemperatureChange.zero();

      expect(result.kelvin, 0.0);
      expect(result.celcius, 0.0);
      expect(result.fahrenheit, 0.0);
    });
    test('infinity', () {
      final result = TemperatureChange.infinity();

      expect(result.kelvin, double.infinity);
      expect(result.celcius, double.infinity);
      expect(result.fahrenheit, double.infinity);
    });
    test('negative infinity', () {
      final result = TemperatureChange.negativeInfinity();

      expect(result.kelvin, double.negativeInfinity);
      expect(result.celcius, double.negativeInfinity);
      expect(result.fahrenheit, double.negativeInfinity);
    });
    test('kelvin', () {
      final result = TemperatureChange.kelvin(123.4, precision: Precision(5));

      expect(result.kelvin, 123.4);
      expect(result.celcius, 123.4);
      expect(result.fahrenheit, 222.12);
    });
    test('celcius', () {
      final result = TemperatureChange.celcius(123.4, precision: Precision(5));

      expect(result.kelvin, 123.4);
      expect(result.celcius, 123.4);
      expect(result.fahrenheit, 222.12);
    });
    test('fahrenheit', () {
      final result =
          TemperatureChange.fahrenheit(123.4, precision: Precision(5));

      expect(result.kelvin, 68.556);
      expect(result.celcius, 68.556);
      expect(result.fahrenheit, 123.4);
    });
  });

  group('TemperatureChange Checks', () {
    test('isNegative', () {
      expect(TemperatureChange.kelvin(300).isNegative, false);
      expect(TemperatureChange.kelvin(-300).isNegative, true);
      expect(TemperatureChange.zero().isNegative, false);
      expect(TemperatureChange.infinity().isNegative, false);
      expect(TemperatureChange.negativeInfinity().isNegative, true);
    });
    test('isFinite', () {
      expect(TemperatureChange.kelvin(300).isFinite, true);
      expect(TemperatureChange.kelvin(-300).isFinite, true);
      expect(TemperatureChange.zero().isFinite, true);
      expect(TemperatureChange.infinity().isFinite, false);
      expect(TemperatureChange.negativeInfinity().isFinite, false);
    });
    test('isInfinite', () {
      expect(TemperatureChange.kelvin(300).isInfinite, false);
      expect(TemperatureChange.kelvin(-300).isInfinite, false);
      expect(TemperatureChange.zero().isInfinite, false);
      expect(TemperatureChange.infinity().isInfinite, true);
      expect(TemperatureChange.negativeInfinity().isInfinite, true);
    });
    test('isNaN', () {
      expect(TemperatureChange.kelvin(300).isNaN, false);
      expect(TemperatureChange.kelvin(-300).isNaN, false);
      expect(TemperatureChange.zero().isNaN, false);
      expect(TemperatureChange.infinity().isNaN, false);
      expect(TemperatureChange.negativeInfinity().isNaN, false);
    });
  });

  group('TemperatureChange Equality', () {
    test('same units', () {
      expect(TemperatureChange.kelvin(123.4), TemperatureChange.kelvin(123.4));
      expect(TemperatureChange.kelvin(123.4).hashCode,
          TemperatureChange.kelvin(123.4).hashCode);

      expect(TemperatureChange.kelvin(123.4) == TemperatureChange.kelvin(123.4),
          true);
      expect(TemperatureChange.kelvin(123.4) != TemperatureChange.kelvin(123.4),
          false);
      expect(TemperatureChange.kelvin(123.4) == TemperatureChange.kelvin(12.34),
          false);
      expect(TemperatureChange.kelvin(123.4) != TemperatureChange.kelvin(12.34),
          true);
    });
    test('different precision', () {
      // given
      final temperatureChange1 =
          TemperatureChange.kelvin(123.4, precision: Precision(5));
      final temperatureChange2 =
          TemperatureChange.kelvin(123.4, precision: Precision(6));

      // when
      final result = temperatureChange1 == temperatureChange2;

      // then
      expect(result, false);
    });
    test('default precision vs different set precision', () {
      // given
      final temperatureChange1 = TemperatureChange.kelvin(123.4);
      final temperatureChange2 =
          TemperatureChange.kelvin(123.4, precision: Precision(6));

      // when
      final result = temperatureChange1 == temperatureChange2;

      // then
      expect(result, false);
    });
    test('different units', () {
      expect(TemperatureChange.kelvin(123.4), TemperatureChange.celcius(123.4));
      expect(TemperatureChange.kelvin(123.4).hashCode,
          TemperatureChange.celcius(123.4).hashCode);
      expect(TemperatureChange.kelvin(68.556, precision: Precision(5)),
          TemperatureChange.fahrenheit(123.4, precision: Precision(5)));
      expect(
          TemperatureChange.kelvin(68.556, precision: Precision(5)).hashCode,
          TemperatureChange.fahrenheit(123.4, precision: Precision(5))
              .hashCode);

      expect(
          TemperatureChange.kelvin(123.4) == TemperatureChange.celcius(123.4),
          true);
      expect(
          TemperatureChange.kelvin(123.4) != TemperatureChange.celcius(123.4),
          false);
      expect(
          TemperatureChange.kelvin(123.4) == TemperatureChange.celcius(12.34),
          false);
      expect(
          TemperatureChange.kelvin(123.4) != TemperatureChange.celcius(12.34),
          true);
      expect(
          TemperatureChange.kelvin(68.556, precision: Precision(5)) ==
              TemperatureChange.fahrenheit(123.4, precision: Precision(5)),
          true);
      expect(
          TemperatureChange.kelvin(68.556, precision: Precision(5)) !=
              TemperatureChange.fahrenheit(123.4, precision: Precision(5)),
          false);
      expect(
          TemperatureChange.kelvin(68.556, precision: Precision(5)) ==
              TemperatureChange.fahrenheit(12.34, precision: Precision(5)),
          false);
      expect(
          TemperatureChange.kelvin(68.556, precision: Precision(5)) !=
              TemperatureChange.fahrenheit(12.34, precision: Precision(5)),
          true);
    });
  });

  group('TemperatureChange Comparison', () {
    test('>', () {
      expect(TemperatureChange.kelvin(123.4) > TemperatureChange.kelvin(123.4),
          false);
      expect(TemperatureChange.kelvin(123.4) > TemperatureChange.kelvin(123.5),
          false);
      expect(TemperatureChange.kelvin(123.5) > TemperatureChange.kelvin(123.4),
          true);
      expect(TemperatureChange.kelvin(123.4) > TemperatureChange.kelvin(-123.4),
          true);
      expect(TemperatureChange.kelvin(-123.4) > TemperatureChange.kelvin(123.4),
          false);

      expect(TemperatureChange.zero() > TemperatureChange.zero(), false);
      expect(TemperatureChange.zero() > TemperatureChange.infinity(), false);
      expect(TemperatureChange.zero() > TemperatureChange.negativeInfinity(),
          true);
      expect(
          TemperatureChange.infinity() > TemperatureChange.infinity(), false);
      expect(TemperatureChange.infinity() > TemperatureChange.zero(), true);
      expect(
          TemperatureChange.infinity() > TemperatureChange.negativeInfinity(),
          true);
      expect(
          TemperatureChange.negativeInfinity() > TemperatureChange.infinity(),
          false);
      expect(TemperatureChange.negativeInfinity() > TemperatureChange.zero(),
          false);
      expect(
          TemperatureChange.negativeInfinity() >
              TemperatureChange.negativeInfinity(),
          false);
    });
    test('>=', () {
      expect(TemperatureChange.kelvin(123.4) >= TemperatureChange.kelvin(123.4),
          true);
      expect(TemperatureChange.kelvin(123.4) >= TemperatureChange.kelvin(123.5),
          false);
      expect(TemperatureChange.kelvin(123.5) >= TemperatureChange.kelvin(123.4),
          true);
      expect(
          TemperatureChange.kelvin(123.4) >= TemperatureChange.kelvin(-123.4),
          true);
      expect(
          TemperatureChange.kelvin(-123.4) >= TemperatureChange.kelvin(123.4),
          false);

      expect(TemperatureChange.zero() >= TemperatureChange.zero(), true);
      expect(TemperatureChange.zero() >= TemperatureChange.infinity(), false);
      expect(TemperatureChange.zero() >= TemperatureChange.negativeInfinity(),
          true);
      expect(
          TemperatureChange.infinity() >= TemperatureChange.infinity(), true);
      expect(TemperatureChange.infinity() >= TemperatureChange.zero(), true);
      expect(
          TemperatureChange.infinity() >= TemperatureChange.negativeInfinity(),
          true);
      expect(
          TemperatureChange.negativeInfinity() >= TemperatureChange.infinity(),
          false);
      expect(TemperatureChange.negativeInfinity() >= TemperatureChange.zero(),
          false);
      expect(
          TemperatureChange.negativeInfinity() >=
              TemperatureChange.negativeInfinity(),
          true);
    });
    test('<', () {
      expect(TemperatureChange.kelvin(123.4) < TemperatureChange.kelvin(123.4),
          false);
      expect(TemperatureChange.kelvin(123.4) < TemperatureChange.kelvin(123.5),
          true);
      expect(TemperatureChange.kelvin(123.5) < TemperatureChange.kelvin(123.4),
          false);
      expect(TemperatureChange.kelvin(123.4) < TemperatureChange.kelvin(-123.4),
          false);
      expect(TemperatureChange.kelvin(-123.4) < TemperatureChange.kelvin(123.4),
          true);

      expect(TemperatureChange.zero() < TemperatureChange.zero(), false);
      expect(TemperatureChange.zero() < TemperatureChange.infinity(), true);
      expect(TemperatureChange.zero() < TemperatureChange.negativeInfinity(),
          false);
      expect(
          TemperatureChange.infinity() < TemperatureChange.infinity(), false);
      expect(TemperatureChange.infinity() < TemperatureChange.zero(), false);
      expect(
          TemperatureChange.infinity() < TemperatureChange.negativeInfinity(),
          false);
      expect(
          TemperatureChange.negativeInfinity() < TemperatureChange.infinity(),
          true);
      expect(TemperatureChange.negativeInfinity() < TemperatureChange.zero(),
          true);
      expect(
          TemperatureChange.negativeInfinity() <
              TemperatureChange.negativeInfinity(),
          false);
    });
    test('<=', () {
      expect(TemperatureChange.kelvin(123.4) <= TemperatureChange.kelvin(123.4),
          true);
      expect(TemperatureChange.kelvin(123.4) <= TemperatureChange.kelvin(123.5),
          true);
      expect(TemperatureChange.kelvin(123.5) <= TemperatureChange.kelvin(123.4),
          false);
      expect(
          TemperatureChange.kelvin(123.4) <= TemperatureChange.kelvin(-123.4),
          false);
      expect(
          TemperatureChange.kelvin(-123.4) <= TemperatureChange.kelvin(123.4),
          true);

      expect(TemperatureChange.zero() <= TemperatureChange.zero(), true);
      expect(TemperatureChange.zero() <= TemperatureChange.infinity(), true);
      expect(TemperatureChange.zero() <= TemperatureChange.negativeInfinity(),
          false);
      expect(
          TemperatureChange.infinity() <= TemperatureChange.infinity(), true);
      expect(TemperatureChange.infinity() <= TemperatureChange.zero(), false);
      expect(
          TemperatureChange.infinity() <= TemperatureChange.negativeInfinity(),
          false);
      expect(
          TemperatureChange.negativeInfinity() <= TemperatureChange.infinity(),
          true);
      expect(TemperatureChange.negativeInfinity() <= TemperatureChange.zero(),
          true);
      expect(
          TemperatureChange.negativeInfinity() <=
              TemperatureChange.negativeInfinity(),
          true);
    });
    test('compareTo', () {
      final result = <TemperatureChange>[
        TemperatureChange.kelvin(1),
        TemperatureChange.infinity(),
        TemperatureChange.fahrenheit(300),
        TemperatureChange.celcius(3),
        TemperatureChange.zero(),
        TemperatureChange.fahrenheit(3),
        TemperatureChange.celcius(-2),
      ];
      result.sort();

      expect(result, <TemperatureChange>[
        TemperatureChange.celcius(-2),
        TemperatureChange.zero(),
        TemperatureChange.kelvin(1),
        TemperatureChange.fahrenheit(3),
        TemperatureChange.celcius(3),
        TemperatureChange.fahrenheit(300),
        TemperatureChange.infinity(),
      ]);
    });
  });

  group('Negation', () {
    test('Positive', () {
      expect(TemperatureChange.kelvin(-3), -TemperatureChange.kelvin(3));
    });
    test('Negative', () {
      expect(TemperatureChange.kelvin(3), -TemperatureChange.kelvin(-3));
    });
    test('Zero', () {
      expect(TemperatureChange.zero(), -TemperatureChange.zero());
    });
    test('Infinity', () {
      expect(
          TemperatureChange.negativeInfinity(), -TemperatureChange.infinity());
      expect(
          TemperatureChange.infinity(), -TemperatureChange.negativeInfinity());
    });
  });

  group('Addition', () {
    test('same units', () {
      expect(TemperatureChange.kelvin(12.3) + TemperatureChange.kelvin(12.3),
          TemperatureChange.kelvin(24.6));
      expect(TemperatureChange.kelvin(12.3) + TemperatureChange.kelvin(-12.3),
          TemperatureChange.zero());
    });
    test('different units', () {
      expect(TemperatureChange.kelvin(12.3) + TemperatureChange.celcius(12.3),
          TemperatureChange.kelvin(24.6));
      expect(
          TemperatureChange.kelvin(12.3) + TemperatureChange.fahrenheit(12.3),
          TemperatureChange.kelvin(19.133333333333333));
      expect(TemperatureChange.celcius(12.3) + TemperatureChange.kelvin(12.3),
          TemperatureChange.kelvin(24.6));
      expect(
          TemperatureChange.celcius(12.3) + TemperatureChange.fahrenheit(12.3),
          TemperatureChange.kelvin(19.133333333333333));
      expect(
          TemperatureChange.fahrenheit(12.3) + TemperatureChange.kelvin(12.3),
          TemperatureChange.kelvin(19.133333333333333));
      expect(
          TemperatureChange.fahrenheit(12.3) + TemperatureChange.celcius(12.3),
          TemperatureChange.kelvin(19.133333333333333));
    });
    test('Infinity', () {
      expect(TemperatureChange.infinity() + TemperatureChange.kelvin(12.3),
          TemperatureChange.infinity());
      expect(TemperatureChange.infinity() + TemperatureChange.kelvin(-12.3),
          TemperatureChange.infinity());
      expect(TemperatureChange.kelvin(12.3) + TemperatureChange.infinity(),
          TemperatureChange.infinity());
      expect(TemperatureChange.kelvin(-12.3) + TemperatureChange.infinity(),
          TemperatureChange.infinity());
    });
    test('Identity', () {
      expect(TemperatureChange.zero() + TemperatureChange.kelvin(12.3),
          TemperatureChange.kelvin(12.3));
      expect(TemperatureChange.kelvin(12.3) + TemperatureChange.zero(),
          TemperatureChange.kelvin(12.3));
    });
  });

  group('Subtraction', () {
    test('same units', () {
      expect(TemperatureChange.kelvin(12.3) - TemperatureChange.kelvin(12.3),
          TemperatureChange.zero());
      expect(TemperatureChange.kelvin(12.3) - TemperatureChange.kelvin(-12.3),
          TemperatureChange.kelvin(24.6));
    });
    test('different units', () {
      expect(TemperatureChange.kelvin(12.3) - TemperatureChange.celcius(12.3),
          TemperatureChange.zero());
      expect(
          TemperatureChange.kelvin(12.3, precision: Precision(5)) -
              TemperatureChange.fahrenheit(12.3, precision: Precision(5)),
          TemperatureChange.kelvin(5.4667));
      expect(TemperatureChange.celcius(12.3) - TemperatureChange.kelvin(12.3),
          TemperatureChange.zero());
      expect(
          TemperatureChange.celcius(12.3, precision: Precision(5)) -
              TemperatureChange.fahrenheit(12.3, precision: Precision(5)),
          TemperatureChange.kelvin(5.4667));
      expect(
          TemperatureChange.fahrenheit(12.3, precision: Precision(5)) -
              TemperatureChange.kelvin(12.3, precision: Precision(5)),
          TemperatureChange.kelvin(-5.4667));
      expect(
          TemperatureChange.fahrenheit(12.3, precision: Precision(5)) -
              TemperatureChange.celcius(12.3, precision: Precision(5)),
          TemperatureChange.kelvin(-5.4667));
    });
    test('Infinity', () {
      expect(TemperatureChange.infinity() - TemperatureChange.kelvin(12.3),
          TemperatureChange.infinity());
      expect(TemperatureChange.infinity() - TemperatureChange.kelvin(-12.3),
          TemperatureChange.infinity());
      expect(TemperatureChange.kelvin(12.3) - TemperatureChange.infinity(),
          TemperatureChange.negativeInfinity());
      expect(TemperatureChange.kelvin(-12.3) - TemperatureChange.infinity(),
          TemperatureChange.negativeInfinity());
    });
    test('Identity', () {
      expect(TemperatureChange.zero() - TemperatureChange.kelvin(12.3),
          TemperatureChange.kelvin(-12.3));
      expect(TemperatureChange.kelvin(12.3) - TemperatureChange.zero(),
          TemperatureChange.kelvin(12.3));
    });
  });

  group('Multiplication', () {
    test('Zero', () {
      expect(TemperatureChange.kelvin(12.3) * 0, TemperatureChange.zero());
    });
    test('Identity', () {
      expect(
          TemperatureChange.kelvin(12.3) * 1, TemperatureChange.kelvin(12.3));
    });
    test('Positive', () {
      expect(
          TemperatureChange.kelvin(12.3) * 2, TemperatureChange.kelvin(24.6));
    });
    test('Negative', () {
      expect(
          TemperatureChange.kelvin(12.3) * -2, TemperatureChange.kelvin(-24.6));
    });
    test('Infinity', () {
      expect(TemperatureChange.infinity() * 2, TemperatureChange.infinity());
      expect(TemperatureChange.infinity() * -2,
          TemperatureChange.negativeInfinity());
    });
    test('NaN', () {
      expect((TemperatureChange.infinity() * 0).isNaN, true);
      expect((TemperatureChange.negativeInfinity() * 0).isNaN, true);
    });
  });

  group('Division', () {
    test('Zero', () {
      expect(TemperatureChange.kelvin(12.3) / 0, TemperatureChange.infinity());
    });
    test('Identity', () {
      expect(
          TemperatureChange.kelvin(12.3) / 1, TemperatureChange.kelvin(12.3));
    });
    test('Positive', () {
      expect(
          TemperatureChange.kelvin(12.3) / 2, TemperatureChange.kelvin(6.15));
    });
    test('Negative', () {
      expect(
          TemperatureChange.kelvin(12.3) / -2, TemperatureChange.kelvin(-6.15));
    });
    test('Infinity', () {
      expect(TemperatureChange.infinity() / 2, TemperatureChange.infinity());
      expect(TemperatureChange.infinity() / -2,
          TemperatureChange.negativeInfinity());
    });
    test('NaN', () {
      expect((TemperatureChange.infinity() / double.infinity).isNaN, true);
      expect(
          (TemperatureChange.negativeInfinity() / double.negativeInfinity)
              .isNaN,
          true);
    });
  });
}
