import 'package:fling_units/src/distance.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Constructors',
    () {
      test('zero', () {
        final result = Distance.zero();

        expect(result.meters, 0.0);
        expect(result.millimeters, 0.0);
        expect(result.kilometers, 0.0);
      });
      test('infinity', () {
        final result = Distance.infinity();

        expect(result.meters, double.infinity);
        expect(result.millimeters, double.infinity);
        expect(result.kilometers, double.infinity);
      });
      test('negativeInfinity', () {
        final result = Distance.negativeInfinity();

        expect(result.meters, double.negativeInfinity);
        expect(result.millimeters, double.negativeInfinity);
        expect(result.kilometers, double.negativeInfinity);
      });

      test('metric', () {
        final result = Distance.metric(
          kilometers: 1,
          hectometers: 2,
          dekameters: 3,
          meters: 4,
          decimeters: 5,
          centimeters: 6,
          millimeters: 7,
        );

        expect(result.meters, 1234.567);
      });
      test('imperial', () {
        final result = Distance.imperial(
          miles: 1,
          yards: 2,
          feet: 3,
          inches: 4,
        );

        expect(result.inches, 63472.05409080078);
      });

      test('millimeters', () {
        final result = Distance.millimeters(1234.0);

        expect(result.meters, 1.234);
        expect(result.millimeters, 1234.0);
      });
      test('centimeters', () {
        final result = Distance.centimeters(1234.0);

        expect(result.meters, 12.34);
        expect(result.centimeters, 1234.0);
      });
      test('decimeters', () {
        final result = Distance.decimeters(1234.0);

        expect(result.meters, 123.4);
        expect(result.decimeters, 1234.0);
      });
      test('meters', () {
        final result = Distance.meters(1234.0);

        expect(result.meters, 1234.0);
      });
      test('decameters', () {
        final result = Distance.dekameters(1234.0);

        expect(result.meters, 12340.0);
        expect(result.dekameters, 1234.0);
      });
      test('hectameters', () {
        final result = Distance.hectometers(1234.0);

        expect(result.meters, 123400.0);
        expect(result.hectometers, 1234.0);
      });
      test('kilometers', () {
        final result = Distance.kilometers(1234.0);

        expect(result.meters, 1234000.0);
        expect(result.kilometers, 1234.0);
      });

      test('miles', () {
        final result = Distance.miles(1234.0);

        expect(result.meters, 1985931.1103994232);
        expect(result.miles, 1234.0);
      });
      test('yards', () {
        final result = Distance.yards(1234.0);

        expect(result.meters, 1128.3730031729776);
        expect(result.yards, 1234.0);
      });
      test('feet', () {
        final result = Distance.feet(1234.0);

        expect(result.meters, 376.123187964058);
        expect(result.feet, 1234.0);
      });
      test('inches', () {
        final result = Distance.inches(1234.0);

        expect(result.meters, 31.34358307446514);
        expect(result.inches, 1234.0);
      });
      test('nauticalMiles', () {
        final result = Distance.nauticalMiles(1234.0);

        expect(result.meters, 2285367.1681263507);
        expect(result.nauticalMiles, 1234.0);
      });
    },
  );

  group('Checks', () {
    test('isNegative', () {
      expect(Distance.meters(2).isNegative, false);
      expect(Distance.meters(-2).isNegative, true);
      expect(Distance.zero().isNegative, false);
      expect(Distance.infinity().isNegative, false);
      expect(Distance.negativeInfinity().isNegative, true);
    });
    test('isFinite', () {
      expect(Distance.meters(2).isFinite, true);
      expect(Distance.meters(-2).isFinite, true);
      expect(Distance.zero().isFinite, true);
      expect(Distance.infinity().isFinite, false);
      expect(Distance.negativeInfinity().isFinite, false);
    });
    test('isInfinite', () {
      expect(Distance.meters(2).isInfinite, false);
      expect(Distance.meters(-2).isInfinite, false);
      expect(Distance.zero().isInfinite, false);
      expect(Distance.infinity().isInfinite, true);
      expect(Distance.negativeInfinity().isInfinite, true);
    });
    test('isNaN', () {
      expect(Distance.meters(2).isNaN, false);
      expect(Distance.meters(-2).isNaN, false);
      expect(Distance.zero().isNaN, false);
      expect(Distance.infinity().isNaN, false);
      expect(Distance.negativeInfinity().isNaN, false);
    });
  });

  group(
    'Equality',
    () {
      test('Same units', () {
        expect(Distance.decimeters(123.4), Distance.decimeters(123.4));
        expect(Distance.decimeters(123.4).hashCode,
            Distance.decimeters(123.4).hashCode);
        expect(Distance.decimeters(123.4) == Distance.decimeters(123.4), true);
        expect(Distance.decimeters(123.4) != Distance.decimeters(123.4), false);
        expect(Distance.decimeters(123.4) == Distance.decimeters(1234), false);
        expect(Distance.decimeters(123.4) != Distance.decimeters(1234), true);
      });
      test('Different units', () {
        expect(Distance.decimeters(123.4), Distance.dekameters(1.234));
        expect(Distance.decimeters(123.4).hashCode,
            Distance.dekameters(1.234).hashCode);
        expect(Distance.decimeters(123.4) == Distance.dekameters(1.234), true);
        expect(Distance.decimeters(123.4) != Distance.dekameters(1.234), false);
        expect(Distance.decimeters(123.4) == Distance.dekameters(1234), false);
        expect(Distance.decimeters(123.4) != Distance.dekameters(1234), true);
      });
    },
  );

  group('Comparison', () {
    test('GreaterThan', () {
      expect(Distance.decimeters(123.4) > Distance.decimeters(123.4), false);
      expect(Distance.decimeters(123.4) > Distance.decimeters(123.5), false);
      expect(Distance.decimeters(123.5) > Distance.decimeters(123.4), true);

      expect(Distance.zero() > Distance.zero(), false);
      expect(Distance.zero() > Distance.infinity(), false);
      expect(Distance.zero() > Distance.negativeInfinity(), true);
      expect(Distance.infinity() > Distance.infinity(), false);
      expect(Distance.negativeInfinity() > Distance.infinity(), false);
      expect(Distance.infinity() > Distance.negativeInfinity(), true);
    });
    test('GreaterThanEqualTo', () {
      expect(Distance.decimeters(123.4) >= Distance.decimeters(123.4), true);
      expect(Distance.decimeters(123.4) >= Distance.decimeters(123.5), false);
      expect(Distance.decimeters(123.5) >= Distance.decimeters(123.4), true);

      expect(Distance.zero() >= Distance.zero(), true);
      expect(Distance.zero() >= Distance.infinity(), false);
      expect(Distance.zero() >= Distance.negativeInfinity(), true);
      expect(Distance.infinity() >= Distance.infinity(), true);
      expect(Distance.negativeInfinity() >= Distance.infinity(), false);
      expect(Distance.infinity() >= Distance.negativeInfinity(), true);
    });
    test('LessThan', () {
      expect(Distance.decimeters(123.4) < Distance.decimeters(123.4), false);
      expect(Distance.decimeters(123.4) < Distance.decimeters(123.5), true);
      expect(Distance.decimeters(123.5) < Distance.decimeters(123.4), false);

      expect(Distance.zero() < Distance.zero(), false);
      expect(Distance.zero() < Distance.infinity(), true);
      expect(Distance.zero() < Distance.negativeInfinity(), false);
      expect(Distance.infinity() < Distance.infinity(), false);
      expect(Distance.negativeInfinity() < Distance.infinity(), true);
      expect(Distance.infinity() < Distance.negativeInfinity(), false);
    });
    test('LessThanEqualTo', () {
      expect(Distance.decimeters(123.4) <= Distance.decimeters(123.4), true);
      expect(Distance.decimeters(123.4) <= Distance.decimeters(123.5), true);
      expect(Distance.decimeters(123.5) <= Distance.decimeters(123.4), false);

      expect(Distance.zero() <= Distance.zero(), true);
      expect(Distance.zero() <= Distance.infinity(), true);
      expect(Distance.zero() <= Distance.negativeInfinity(), false);
      expect(Distance.infinity() <= Distance.infinity(), true);
      expect(Distance.negativeInfinity() <= Distance.infinity(), true);
      expect(Distance.infinity() <= Distance.negativeInfinity(), false);
    });
    test('compareTo', () {
      final result = <Distance>[
        Distance.zero(),
        Distance.yards(1),
        Distance.infinity(),
        Distance.meters(3),
        Distance.feet(3),
        Distance.meters(-2),
      ];
      result.sort();

      expect(result, <Distance>[
        Distance.meters(-2),
        Distance.zero(),
        Distance.feet(3),
        Distance.yards(1),
        Distance.meters(3),
        Distance.infinity(),
      ]);
    });
  });

  group(
    'Addition',
    () {
      test('Same units', () {
        expect(Distance.decimeters(123.4) + Distance.decimeters(123.4),
            Distance.decimeters(123.4 + 123.4));
      });
      test('Different units', () {
        expect(Distance.decimeters(123.4) + Distance.dekameters(1.234),
            Distance.meters(12.34 + 12.34));
      });
      test('Infinity', () {
        expect(Distance.decimeters(123.4) + Distance.infinity(),
            Distance.infinity());
        expect(Distance.decimeters(123.4) + Distance.negativeInfinity(),
            Distance.negativeInfinity());
        expect(Distance.infinity() + Distance.dekameters(123.4),
            Distance.infinity());
      });
      test('Identity', () {
        expect(Distance.decimeters(123.4) + Distance.zero(),
            Distance.meters(12.34));
      });
    },
  );

  group(
    'Subtraction',
    () {
      test('Same units', () {
        expect(Distance.decimeters(123.4) - Distance.decimeters(234.5),
            Distance.decimeters(123.4 - 234.5));
      });
      test('Different units', () {
        expect(Distance.decimeters(123.4) - Distance.dekameters(1.234),
            Distance.meters(12.34 - 12.34));
      });
      test('Infinity', () {
        expect(Distance.decimeters(123.4) - Distance.infinity(),
            Distance.negativeInfinity());
        expect(Distance.decimeters(123.4) - Distance.negativeInfinity(),
            Distance.infinity());
        expect(Distance.infinity() - Distance.dekameters(123.4),
            Distance.infinity());
      });
      test('Identity', () {
        expect(Distance.decimeters(123.4) - Distance.zero(),
            Distance.meters(12.34));
      });
      test('Negate', () {
        expect(Distance.decimeters(123.4) - Distance.centimeters(-123.4),
            Distance.meters(13.574));
      });
    },
  );

  group(
    'Multiplication',
    () {
      test('Identity', () {
        expect(Distance.decimeters(123.4) * 1.0, Distance.decimeters(123.4));
      });
      test('Zero', () {
        expect(Distance.decimeters(123.4) * 0.0, Distance.decimeters(0.0));
      });
      test('Infinity', () {
        expect(Distance.infinity() * 3.0, Distance.infinity());
        expect(Distance.negativeInfinity() * 3.0, Distance.negativeInfinity());
        expect(Distance.infinity() * -3.0, Distance.negativeInfinity());
        expect(Distance.negativeInfinity() * -3.0, Distance.infinity());
      });
      test('Basic', () {
        expect(
            Distance.decimeters(123.4) * 1.3, Distance.decimeters(123.4 * 1.3));
      });
      test('Negative', () {
        expect(Distance.dekameters(123.4) * -2.4,
            Distance.dekameters(123.4 * -2.4));
      });
      test('NaN', () {
        expect((Distance.infinity() * 0).isNaN, true);
        expect((Distance.negativeInfinity() * 0).isNaN, true);
      });
    },
  );

  group(
    'Division',
    () {
      test('Identity', () {
        expect(Distance.decimeters(123.4) / 1.0, Distance.decimeters(123.4));
      });
      test('Zero', () {
        expect(Distance.decimeters(123.4) / 0.0, Distance.infinity());
      });
      test('Infinity', () {
        expect(Distance.infinity() / 3.0, Distance.infinity());
        expect(Distance.negativeInfinity() / 3.0, Distance.negativeInfinity());
        expect(Distance.infinity() / -3.0, Distance.negativeInfinity());
        expect(Distance.negativeInfinity() / -3.0, Distance.infinity());
      });
      test('Basic', () {
        expect(
            Distance.decimeters(123.4) / 1.3, Distance.decimeters(123.4 / 1.3));
      });
      test('Negative', () {
        expect(Distance.centimeters(123.4) / -2.4,
            Distance.centimeters(123.4 / -2.4));
      });
      test('NaN', () {
        expect((Distance.infinity() / double.infinity).isNaN, true);
        expect((Distance.negativeInfinity() / double.infinity).isNaN, true);
      });
    },
  );
}
