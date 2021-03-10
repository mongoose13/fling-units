import 'package:fling_units/src/precision.dart';
import 'package:fling_units/src/volume.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Constructors',
    () {
      test('zero', () {
        final result = Volume.zero();

        expect(result.liters, 0.0);
        expect(result.milliliters, 0.0);
        expect(result.kiloliters, 0.0);
      });
      test('infinity', () {
        final result = Volume.infinity();

        expect(result.liters, double.infinity);
        expect(result.milliliters, double.infinity);
        expect(result.kiloliters, double.infinity);
      });
      test('negativeInfinity', () {
        final result = Volume.negativeInfinity();

        expect(result.liters, double.negativeInfinity);
        expect(result.milliliters, double.negativeInfinity);
        expect(result.kiloliters, double.negativeInfinity);
      });

      test('metric', () {
        // when
        final result = Volume.metric(
          kiloliters: 1,
          hectoliters: 2,
          dekaliters: 3,
          liters: 4,
          deciliters: 5,
          centiliters: 6,
          milliliters: 7,
          precision: Precision(8),
        );

        // then
        expect(result.liters, 1234.567);
      });
      test('imperial gallons', () {
        // when
        final result = Volume.imperial(
          gallons: 1,
          precision: Precision(5),
        );

        // then
        expect(result.gallons, 1);
      });
      test('imperial quarts', () {
        // when
        final result = Volume.imperial(
          quarts: 1,
          precision: Precision(5),
        );

        // then
        expect(result.quarts, 1);
      });
      test('imperial pints', () {
        // when
        final result = Volume.imperial(
          pints: 1,
          precision: Precision(5),
        );

        // then
        expect(result.pints, 1);
      });
      test('imperial cups', () {
        // when
        final result = Volume.imperial(
          cups: 1,
          precision: Precision(5),
        );

        // then
        expect(result.cups, 1);
      });
      test('imperial fluid ounces', () {
        // when
        final result = Volume.imperial(
          fluidOunces: 1,
          precision: Precision(5),
        );

        // then
        expect(result.fluidOunces, 1);
      });
      test('imperial tablespoons', () {
        // when
        final result = Volume.imperial(
          tablespoons: 1,
          precision: Precision(5),
        );

        // then
        expect(result.tablespoons, 1);
      });
      test('imperial teaspoons', () {
        // when
        final result = Volume.imperial(
          teaspoons: 1,
          precision: Precision(5),
        );

        // then
        expect(result.teaspoons, 1);
      });
      test('imperial', () {
        // when
        final result = Volume.imperial(
          gallons: 1,
          quarts: 2,
          pints: 3,
          cups: 4,
          fluidOunces: 5,
          tablespoons: 6,
          teaspoons: 7,
          precision: Precision(5),
        );

        // then
        expect(result.teaspoons, 1681.0);
      });

      test('US gallons', () {
        // when
        final result = Volume.us(
          usGallons: 1,
          precision: Precision(5),
        );

        // then
        expect(result.usGallons, 1);
      });
      test('US quarts', () {
        // when
        final result = Volume.us(
          usQuarts: 1,
          precision: Precision(5),
        );

        // then
        expect(result.usQuarts, 1);
      });
      test('US pints', () {
        // when
        final result = Volume.us(
          usPints: 1,
          precision: Precision(5),
        );

        // then
        expect(result.usPints, 1);
      });
      test('US cups', () {
        // when
        final result = Volume.us(
          usCups: 1,
          precision: Precision(5),
        );

        // then
        expect(result.usCups, 1);
      });
      test('US fluid ounces', () {
        // when
        final result = Volume.us(
          usFluidOunces: 1,
          precision: Precision(5),
        );

        // then
        expect(result.usFluidOunces, 1);
      });
      test('US tablespoons', () {
        // when
        final result = Volume.us(
          usTablespoons: 1,
          precision: Precision(5),
        );

        // then
        expect(result.usTablespoons, 1);
      });
      test('US teaspoons', () {
        // when
        final result = Volume.us(
          usTeaspoons: 1,
          precision: Precision(5),
        );

        // then
        expect(result.usTeaspoons, 1);
      });
      test('US', () {
        // when
        final result = Volume.us(
          usGallons: 1,
          usQuarts: 2,
          usPints: 3,
          usCups: 4,
          usFluidOunces: 5,
          usTablespoons: 6,
          usTeaspoons: 7,
          precision: Precision(5),
        );

        // then
        expect(result.usTeaspoons, 1687.0);
      });

      test('milliliters', () {
        final result = Volume.milliliters(1234.0);

        expect(result.liters, 1.234);
        expect(result.milliliters, 1234.0);
      });
      test('centiliters', () {
        final result = Volume.centiliters(1234.0);

        expect(result.liters, 12.34);
        expect(result.centiliters, 1234.0);
      });
      test('deciliters', () {
        final result = Volume.deciliters(1234.0);

        expect(result.liters, 123.4);
        expect(result.deciliters, 1234.0);
      });
      test('liters', () {
        final result = Volume.liters(1234.0);

        expect(result.liters, 1234.0);
      });
      test('decaliters', () {
        final result = Volume.dekaliters(1234.0);

        expect(result.liters, 12340.0);
        expect(result.dekaliters, 1234.0);
      });
      test('hectaliters', () {
        final result = Volume.hectoliters(1234.0);

        expect(result.liters, 123400.0);
        expect(result.hectoliters, 1234.0);
      });
      test('kiloliters', () {
        final result = Volume.kiloliters(1234.0);

        expect(result.liters, 1234000.0);
        expect(result.kiloliters, 1234.0);
      });
      test('cubic meters', () {
        final result = Volume.cubicMeters(1234.0);

        expect(result.liters, 1234000.0);
        expect(result.cubicMeters, 1234.0);
      });

      test('teaspoons', () {
        final result = Volume.teaspoons(123.0, precision: Precision(5));

        expect(result.liters, 0.72809);
        expect(result.teaspoons, 123.0);
      });
      test('tablespoons', () {
        final result = Volume.tablespoons(1234.0, precision: Precision(5));

        expect(result.liters, 21.914);
        expect(result.tablespoons, 1234.0);
      });
      test('fluid ounces', () {
        final result = Volume.fluidOunces(1234.0, precision: Precision(5));

        expect(result.liters, 35.062);
        expect(result.fluidOunces, 1234.0);
      });
      test('cups', () {
        final result = Volume.cups(1234.0, precision: Precision(5));

        expect(result.liters, 350.62);
        expect(result.cups, 1234.0);
      });
      test('pints', () {
        final result = Volume.pints(1234.0, precision: Precision(5));

        expect(result.liters, 701.24);
        expect(result.pints, 1234.0);
      });
      test('quarts', () {
        final result = Volume.quarts(1234.0, precision: Precision(5));

        expect(result.liters, 1402.5);
        expect(result.quarts, 1234.0);
      });
      test('gallons', () {
        final result = Volume.gallons(1234.0, precision: Precision(5));

        expect(result.liters, 5609.9);
        expect(result.gallons, 1234.0);
      });
      test('cubic feet', () {
        final result = Volume.cubicFeet(1234.0, precision: Precision(5));

        expect(result.liters, 34943.0);
        expect(result.cubicFeet, 1234.0);
      });
      test('cubic inches', () {
        final result = Volume.cubicInches(1234.0, precision: Precision(5));

        expect(result.liters, 20.222);
        expect(result.cubicInches, 1234.0);
      });

      test('US teaspoons', () {
        final result = Volume.usTeaspoons(123.0, precision: Precision(5));

        expect(result.liters, 0.60626);
        expect(result.usTeaspoons, 123.0);
      });
      test('US tablespoons', () {
        final result = Volume.usTablespoons(1234.0, precision: Precision(5));

        expect(result.liters, 18.247);
        expect(result.usTablespoons, 1234.0);
      });
      test('US fluid ounces', () {
        final result = Volume.usFluidOunces(1234.0, precision: Precision(5));

        expect(result.liters, 36.494);
        expect(result.usFluidOunces, 1234.0);
      });
      test('US cups', () {
        final result = Volume.usCups(1234.0, precision: Precision(5));

        expect(result.liters, 291.95);
        expect(result.usCups, 1234.0);
      });
      test('US pints', () {
        final result = Volume.usPints(1234.0, precision: Precision(5));

        expect(result.liters, 583.90);
        expect(result.usPints, 1234.0);
      });
      test('US quarts', () {
        final result = Volume.usQuarts(1234.0, precision: Precision(5));

        expect(result.liters, 1167.8);
        expect(result.usQuarts, 1234.0);
      });
      test('US gallons', () {
        final result = Volume.usGallons(1234.0, precision: Precision(5));

        expect(result.liters, 4671.2);
        expect(result.usGallons, 1234.0);
      });
      test('US legal cups', () {
        final result = Volume.usLegalCups(1234.0, precision: Precision(5));

        expect(result.liters, 296.16);
        expect(result.usLegalCups, 1234.0);
      });
    },
  );

  group('Static Converters', () {
    test('asKiloliters', () {
      // given
      final measurement = Volume.liters(12.34);

      // then
      expect(Volume.asKiloliters(measurement), 0.01234);
    });
    test('asHectoliters', () {
      // given
      final measurement = Volume.liters(12.34);

      // then
      expect(Volume.asHectoliters(measurement), 0.1234);
    });
    test('asDekaliters', () {
      // given
      final measurement = Volume.liters(12.34);

      // then
      expect(Volume.asDekaliters(measurement), 1.234);
    });
    test('asLiters', () {
      // given
      final measurement = Volume.liters(12.34);

      // then
      expect(Volume.asLiters(measurement), 12.34);
    });
    test('asDeciliters', () {
      // given
      final measurement = Volume.liters(12.34);

      // then
      expect(Volume.asDeciliters(measurement), 123.4);
    });
    test('asCentiliters', () {
      // given
      final measurement = Volume.liters(12.34);

      // then
      expect(Volume.asCentiliters(measurement), 1234.0);
    });
    test('asMilliliters', () {
      // given
      final measurement = Volume.liters(12.34);

      // then
      expect(Volume.asMilliliters(measurement), 12340.0);
    });

    test('asGallons', () {
      final measurement = Volume.gallons(1);

      expect(Volume.asGallons(measurement), 1.0);
    });
    test('asQuarts', () {
      // given
      final measurement = Volume.gallons(1, precision: Precision(5));

      // then
      expect(Volume.asQuarts(measurement), 4.0);
    });
    test('asPints', () {
      // given
      final measurement = Volume.gallons(1, precision: Precision(5));

      // then
      expect(Volume.asPints(measurement), 8.0);
    });
    test('asCups', () {
      // given
      final measurement = Volume.gallons(1, precision: Precision(5));

      // then
      expect(Volume.asCups(measurement), 16.0);
    });
    test('asFluidOunces', () {
      // given
      final measurement = Volume.gallons(1, precision: Precision(5));

      // then
      expect(Volume.asFluidOunces(measurement), 160.0);
    });
    test('asTablespoons', () {
      // given
      final measurement = Volume.gallons(1, precision: Precision(5));

      // then
      expect(Volume.asTablespoons(measurement), 256.0);
    });
    test('asTeaspoons', () {
      // given
      final measurement = Volume.gallons(1, precision: Precision(5));

      // then
      expect(Volume.asTeaspoons(measurement), 768.0);
    });

    test('asUsGallons', () {
      final measurement = Volume.usGallons(1, precision: Precision(5));

      expect(Volume.asUsGallons(measurement), 1.0);
    });
    test('asQuarts', () {
      // given
      final measurement = Volume.usGallons(1, precision: Precision(5));

      // then
      expect(Volume.asUsQuarts(measurement), 4.0);
    });
    test('asPints', () {
      // given
      final measurement = Volume.usGallons(1, precision: Precision(5));

      // then
      expect(Volume.asUsPints(measurement), 8.0);
    });
    test('asCups', () {
      // given
      final measurement = Volume.usGallons(1, precision: Precision(5));

      // then
      expect(Volume.asUsCups(measurement), 16.0);
    });
    test('asFluidOunces', () {
      // given
      final measurement = Volume.usGallons(1, precision: Precision(5));

      // then
      expect(Volume.asUsFluidOunces(measurement), 128.0);
    });
    test('asTablespoons', () {
      // given
      final measurement = Volume.usGallons(1, precision: Precision(5));

      // then
      expect(Volume.asUsTablespoons(measurement), 256.0);
    });
    test('asTeaspoons', () {
      // given
      final measurement = Volume.usGallons(1, precision: Precision(5));

      // then
      expect(Volume.asUsTeaspoons(measurement), 768.0);
    });
  });

  group('Checks', () {
    test('isNegative', () {
      expect(Volume.liters(2).isNegative, false);
      expect(Volume.liters(-2).isNegative, true);
      expect(Volume.zero().isNegative, false);
      expect(Volume.infinity().isNegative, false);
      expect(Volume.negativeInfinity().isNegative, true);
    });
    test('isFinite', () {
      expect(Volume.liters(2).isFinite, true);
      expect(Volume.liters(-2).isFinite, true);
      expect(Volume.zero().isFinite, true);
      expect(Volume.infinity().isFinite, false);
      expect(Volume.negativeInfinity().isFinite, false);
    });
    test('isInfinite', () {
      expect(Volume.liters(2).isInfinite, false);
      expect(Volume.liters(-2).isInfinite, false);
      expect(Volume.zero().isInfinite, false);
      expect(Volume.infinity().isInfinite, true);
      expect(Volume.negativeInfinity().isInfinite, true);
    });
    test('isNaN', () {
      expect(Volume.liters(2).isNaN, false);
      expect(Volume.liters(-2).isNaN, false);
      expect(Volume.zero().isNaN, false);
      expect(Volume.infinity().isNaN, false);
      expect(Volume.negativeInfinity().isNaN, false);
    });
  });

  group(
    'Equality',
    () {
      test('Same units', () {
        expect(Volume.deciliters(123.4), Volume.deciliters(123.4));
        expect(Volume.deciliters(123.4).hashCode,
            Volume.deciliters(123.4).hashCode);
        expect(Volume.deciliters(123.4) == Volume.deciliters(123.4), true);
        expect(Volume.deciliters(123.4) != Volume.deciliters(123.4), false);
        expect(Volume.deciliters(123.4) == Volume.deciliters(1234), false);
        expect(Volume.deciliters(123.4) != Volume.deciliters(1234), true);
      });
      test('same precision', () {
        // given
        final volume1 = Volume.liters(123.45, precision: Precision(3));
        final volume2 = Volume.liters(123.45, precision: Precision(3));

        // then
        expect(volume1 == volume2, true);
      });
      test('different precision', () {
        // given
        final volume1 = Volume.liters(123.45, precision: Precision(4));
        final volume2 = Volume.liters(123.45, precision: Precision(3));

        // then
        expect(volume1 == volume2, false);
      });
      test('different high precision', () {
        // given
        final volume1 = Volume.liters(123.45, precision: Precision(10));
        final volume2 = Volume.liters(123.45, precision: Precision(11));

        // then
        expect(volume1 == volume2, false);
      });
      test('Different units', () {
        expect(Volume.deciliters(123.4), Volume.dekaliters(1.234));
        expect(Volume.deciliters(123.4).hashCode,
            Volume.dekaliters(1.234).hashCode);
        expect(Volume.deciliters(123.4) == Volume.dekaliters(1.234), true);
        expect(Volume.deciliters(123.4) != Volume.dekaliters(1.234), false);
        expect(Volume.deciliters(123.4) == Volume.dekaliters(1234), false);
        expect(Volume.deciliters(123.4) != Volume.dekaliters(1234), true);
      });
    },
  );

  group('Comparison', () {
    test('GreaterThan', () {
      expect(Volume.deciliters(123.4) > Volume.deciliters(123.4), false);
      expect(Volume.deciliters(123.4) > Volume.deciliters(123.5), false);
      expect(Volume.deciliters(123.5) > Volume.deciliters(123.4), true);

      expect(Volume.zero() > Volume.zero(), false);
      expect(Volume.zero() > Volume.infinity(), false);
      expect(Volume.zero() > Volume.negativeInfinity(), true);
      expect(Volume.infinity() > Volume.infinity(), false);
      expect(Volume.negativeInfinity() > Volume.infinity(), false);
      expect(Volume.infinity() > Volume.negativeInfinity(), true);
    });
    test('GreaterThanEqualTo', () {
      expect(Volume.deciliters(123.4) >= Volume.deciliters(123.4), true);
      expect(Volume.deciliters(123.4) >= Volume.deciliters(123.5), false);
      expect(Volume.deciliters(123.5) >= Volume.deciliters(123.4), true);

      expect(Volume.zero() >= Volume.zero(), true);
      expect(Volume.zero() >= Volume.infinity(), false);
      expect(Volume.zero() >= Volume.negativeInfinity(), true);
      expect(Volume.infinity() >= Volume.infinity(), true);
      expect(Volume.negativeInfinity() >= Volume.infinity(), false);
      expect(Volume.infinity() >= Volume.negativeInfinity(), true);
    });
    test('LessThan', () {
      expect(Volume.deciliters(123.4) < Volume.deciliters(123.4), false);
      expect(Volume.deciliters(123.4) < Volume.deciliters(123.5), true);
      expect(Volume.deciliters(123.5) < Volume.deciliters(123.4), false);

      expect(Volume.zero() < Volume.zero(), false);
      expect(Volume.zero() < Volume.infinity(), true);
      expect(Volume.zero() < Volume.negativeInfinity(), false);
      expect(Volume.infinity() < Volume.infinity(), false);
      expect(Volume.negativeInfinity() < Volume.infinity(), true);
      expect(Volume.infinity() < Volume.negativeInfinity(), false);
    });
    test('LessThanEqualTo', () {
      expect(Volume.deciliters(123.4) <= Volume.deciliters(123.4), true);
      expect(Volume.deciliters(123.4) <= Volume.deciliters(123.5), true);
      expect(Volume.deciliters(123.5) <= Volume.deciliters(123.4), false);

      expect(Volume.zero() <= Volume.zero(), true);
      expect(Volume.zero() <= Volume.infinity(), true);
      expect(Volume.zero() <= Volume.negativeInfinity(), false);
      expect(Volume.infinity() <= Volume.infinity(), true);
      expect(Volume.negativeInfinity() <= Volume.infinity(), true);
      expect(Volume.infinity() <= Volume.negativeInfinity(), false);
    });
    test('compareTo', () {
      final result = <Volume>[
        Volume.zero(),
        Volume.infinity(),
        Volume.liters(3),
        Volume.quarts(3),
        Volume.liters(-2),
        Volume.teaspoons(3),
      ];
      result.sort();

      expect(result, <Volume>[
        Volume.liters(-2),
        Volume.zero(),
        Volume.teaspoons(3),
        Volume.liters(3),
        Volume.quarts(3),
        Volume.infinity(),
      ]);
    });
  });

  group('Negation', () {
    test('Positive', () {
      expect(Volume.liters(-3), -Volume.liters(3));
    });
    test('Negative', () {
      expect(Volume.liters(3), -Volume.liters(-3));
    });
    test('Zero', () {
      expect(Volume.zero(), -Volume.zero());
    });
    test('Infinity', () {
      expect(Volume.negativeInfinity(), -Volume.infinity());
      expect(Volume.infinity(), -Volume.negativeInfinity());
    });
  });

  group(
    'Addition',
    () {
      test('Same units', () {
        expect(Volume.deciliters(123.4) + Volume.deciliters(123.4),
            Volume.deciliters(123.4 + 123.4));
      });
      test('Different units', () {
        expect(Volume.deciliters(123.4) + Volume.dekaliters(1.234),
            Volume.liters(12.34 + 12.34));
      });
      test('Infinity', () {
        expect(Volume.deciliters(123.4) + Volume.infinity(), Volume.infinity());
        expect(Volume.deciliters(123.4) + Volume.negativeInfinity(),
            Volume.negativeInfinity());
        expect(Volume.infinity() + Volume.dekaliters(123.4), Volume.infinity());
      });
      test('Identity', () {
        expect(Volume.deciliters(123.4) + Volume.zero(), Volume.liters(12.34));
      });
    },
  );

  group(
    'Subtraction',
    () {
      test('Same units', () {
        expect(Volume.deciliters(123.4) - Volume.deciliters(234.5),
            Volume.deciliters(123.4 - 234.5));
      });
      test('Different units', () {
        expect(Volume.deciliters(123.4) - Volume.dekaliters(1.234),
            Volume.liters(12.34 - 12.34));
      });
      test('Infinity', () {
        expect(Volume.deciliters(123.4) - Volume.infinity(),
            Volume.negativeInfinity());
        expect(Volume.deciliters(123.4) - Volume.negativeInfinity(),
            Volume.infinity());
        expect(Volume.infinity() - Volume.dekaliters(123.4), Volume.infinity());
      });
      test('Identity', () {
        expect(Volume.deciliters(123.4) - Volume.zero(), Volume.liters(12.34));
      });
      test('Negate', () {
        expect(Volume.deciliters(123.4) - Volume.centiliters(-123.4),
            Volume.liters(13.574));
      });
    },
  );

  group(
    'Multiplication',
    () {
      test('Identity', () {
        expect(Volume.deciliters(123.4) * 1.0, Volume.deciliters(123.4));
      });
      test('Zero', () {
        expect(Volume.deciliters(123.4) * 0.0, Volume.deciliters(0.0));
      });
      test('Infinity', () {
        expect(Volume.infinity() * 3.0, Volume.infinity());
        expect(Volume.negativeInfinity() * 3.0, Volume.negativeInfinity());
        expect(Volume.infinity() * -3.0, Volume.negativeInfinity());
        expect(Volume.negativeInfinity() * -3.0, Volume.infinity());
      });
      test('Basic', () {
        expect(Volume.deciliters(123.4) * 1.3, Volume.deciliters(123.4 * 1.3));
      });
      test('Negative', () {
        expect(
            Volume.dekaliters(123.4) * -2.4, Volume.dekaliters(123.4 * -2.4));
      });
      test('NaN', () {
        expect((Volume.infinity() * 0).isNaN, true);
        expect((Volume.negativeInfinity() * 0).isNaN, true);
      });
    },
  );

  group(
    'Division',
    () {
      test('Identity', () {
        expect(Volume.deciliters(123.4) / 1.0, Volume.deciliters(123.4));
      });
      test('Zero', () {
        expect(Volume.deciliters(123.4) / 0.0, Volume.infinity());
      });
      test('Infinity', () {
        expect(Volume.infinity() / 3.0, Volume.infinity());
        expect(Volume.negativeInfinity() / 3.0, Volume.negativeInfinity());
        expect(Volume.infinity() / -3.0, Volume.negativeInfinity());
        expect(Volume.negativeInfinity() / -3.0, Volume.infinity());
      });
      test('Basic', () {
        expect(Volume.deciliters(123.4) / 1.3, Volume.deciliters(123.4 / 1.3));
      });
      test('Negative', () {
        expect(
            Volume.centiliters(123.4) / -2.4, Volume.centiliters(123.4 / -2.4));
      });
      test('NaN', () {
        expect((Volume.infinity() / double.infinity).isNaN, true);
        expect((Volume.negativeInfinity() / double.infinity).isNaN, true);
      });
    },
  );
}
