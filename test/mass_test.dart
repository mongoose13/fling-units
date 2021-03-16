import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 mass', () {
      // given
      final mass = Mass.zero();

      // when
      final result = mass.asGrams;

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final mass = Mass.zero();

      // when
      final result = mass.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite mass', () {
      // given
      final mass = Mass.infinite();

      // when
      final result = mass.asGrams;

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final mass = Mass.infinite();

      // when
      final result = mass.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative mass', () {
      // given
      final mass = Mass.negativeInfinite();

      // when
      final result = mass.asGrams;

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final mass = Mass.negativeInfinite();

      // when
      final result = mass.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });

  group('metric', () {
    test('kilograms parameter', () {
      // given
      final mass = Mass.ofMetric(
        kilograms: 1,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1000.0);
    });
    test('hectograms parameter', () {
      // given
      final mass = Mass.ofMetric(
        hectograms: 1,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 100.0);
    });
    test('dekagrams parameter', () {
      // given
      final mass = Mass.ofMetric(
        dekagrams: 1,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 10.0);
    });
    test('grams parameter', () {
      // given
      final mass = Mass.ofMetric(
        grams: 1,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1.0);
    });
    test('decigrams parameter', () {
      // given
      final mass = Mass.ofMetric(
        decigrams: 1,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 0.1);
    });
    test('centigrams parameter', () {
      // given
      final mass = Mass.ofMetric(
        centigrams: 1,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 0.01);
    });
    test('milligrams parameter', () {
      // given
      final mass = Mass.ofMetric(
        milligrams: 1,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 0.001);
    });
    test('sums parts', () {
      // given
      final mass = Mass.ofMetric(
        kilograms: 1,
        hectograms: 2,
        dekagrams: 3,
        grams: 4,
        decigrams: 5,
        centigrams: 6,
        milligrams: 7,
        precision: Precision(9),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1234.567);
    });
  });

  group('ofImperial', () {
    test('pounds parameter', () {
      // given
      final mass = Mass.ofImperial(
        pounds: 1,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 453.59);
    });
    test('ounces parameter', () {
      // given
      final mass = Mass.ofImperial(
        ounces: 1,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 28.350);
    });
    test('sums parts', () {
      // given
      final mass = Mass.ofImperial(
        pounds: 1,
        ounces: 2,
        precision: Precision(5),
      );

      // when
      final result = mass.asGrams;

      // then
      expect(result, 510.29);
    });
  });

  group('ofMilligrams', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofMilligrams(1234.5, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1.2345);
    });
  });
  group('ofCentigrams', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofCentigrams(1234.5, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 12.345);
    });
  });
  group('ofDecigrams', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofDecigrams(1234.5, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 123.45);
    });
  });
  group('ofGrams', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofGrams(1234.5, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1234.5);
    });
  });
  group('ofDekagrams', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofDekagrams(1.2345, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 12.345);
    });
  });
  group('ofHectograms', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofHectograms(1.2345, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 123.45);
    });
  });
  group('ofKilograms', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofKilograms(1.2345, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1234.5);
    });
  });
  group('ofTonnes', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofTonnes(1.2345, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1234500.0);
    });
  });

  group('ofPounds', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofPounds(1.2345, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 559.96);
    });
  });
  group('ofOunces', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofOunces(1.2345, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 34.997);
    });
  });
  group('ofShortTons', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofShortTons(1.2345, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1119900.0);
    });
  });
  group('ofLongTons', () {
    test('converts to base', () {
      // given
      final mass = Mass.ofLongTons(1.2345, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1254300.0);
    });
  });

  group('asMilligrams', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1.2345, precision: Precision(5));

      // when
      final result = mass.asMilligrams;

      // then
      expect(result, 1234.5);
    });
  });
  group('asCentigrams', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1.2345, precision: Precision(5));

      // when
      final result = mass.asCentigrams;

      // then
      expect(result, 123.45);
    });
  });
  group('asDecigrams', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1.2345, precision: Precision(5));

      // when
      final result = mass.asDecigrams;

      // then
      expect(result, 12.345);
    });
  });
  group('asGrams', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1.2345, precision: Precision(5));

      // when
      final result = mass.asGrams;

      // then
      expect(result, 1.2345);
    });
  });
  group('asDekagrams', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1234.5, precision: Precision(5));

      // when
      final result = mass.asDekagrams;

      // then
      expect(result, 123.45);
    });
  });
  group('asHectograms', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1234.5, precision: Precision(5));

      // when
      final result = mass.asHectograms;

      // then
      expect(result, 12.345);
    });
  });
  group('asKilograms', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1234.5, precision: Precision(5));

      // when
      final result = mass.asKilograms;

      // then
      expect(result, 1.2345);
    });
  });
  group('asTonnes', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1234.5, precision: Precision(5));

      // when
      final result = mass.asTonnes;

      // then
      expect(result, 0.0012345);
    });
  });

  group('asOunces', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(12.345, precision: Precision(5));

      // when
      final result = mass.asOunces;

      // then
      expect(result, 0.43546);
    });
  });
  group('asPounds', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1234.5, precision: Precision(5));

      // when
      final result = mass.asPounds;

      // then
      expect(result, 2.7216);
    });
  });
  group('asShortTons', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1.2345e6, precision: Precision(5));

      // when
      final result = mass.asShortTons;

      // then
      expect(result, 1.3608);
    });
  });
  group('asLongTons', () {
    test('converts to unit', () {
      // given
      final mass = Mass.ofGrams(1.2345e6, precision: Precision(5));

      // when
      final result = mass.asLongTons;

      // then
      expect(result, 1.2150);
    });
  });
}
