import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 distance', () {
      // given
      final distance = Distance.zero();

      // when
      final result = distance.asMeters;

      // then
      expect(result, 0.0);
    });
    test('has max precision', () {
      // given
      final distance = Distance.zero();

      // when
      final result = distance.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite distance', () {
      // given
      final distance = Distance.infinite();

      // when
      final result = distance.asMeters;

      // then
      expect(result, double.infinity);
    });
    test('has max precision', () {
      // given
      final distance = Distance.infinite();

      // when
      final result = distance.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative distance', () {
      // given
      final distance = Distance.negativeInfinite();

      // when
      final result = distance.asMeters;

      // then
      expect(result, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final distance = Distance.negativeInfinite();

      // when
      final result = distance.precision;

      // then
      expect(result, Precision.max.precision);
    });
  });

  group('metric', () {
    test('kilometers parameter', () {
      // given
      final distance = Distance.ofMetric(
        kilometers: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1000.0);
    });
    test('hectometers parameter', () {
      // given
      final distance = Distance.ofMetric(
        hectometers: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 100.0);
    });
    test('dekameters parameter', () {
      // given
      final distance = Distance.ofMetric(
        dekameters: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 10.0);
    });
    test('meters parameter', () {
      // given
      final distance = Distance.ofMetric(
        meters: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1.0);
    });
    test('decimeters parameter', () {
      // given
      final distance = Distance.ofMetric(
        decimeters: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1e-1);
    });
    test('centimeters parameter', () {
      // given
      final distance = Distance.ofMetric(
        centimeters: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1e-2);
    });
    test('millimeters parameter', () {
      // given
      final distance = Distance.ofMetric(
        millimeters: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1e-3);
    });
    test('micrometers parameter', () {
      // given
      final distance = Distance.ofMetric(
        micrometers: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1e-6);
    });
    test('nanometers parameter', () {
      // given
      final distance = Distance.ofMetric(
        nanometers: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1e-9);
    });
    test('picometers parameter', () {
      // given
      final distance = Distance.ofMetric(
        picometers: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1e-12);
    });
    test('sums parts', () {
      // given
      final distance = Distance.ofMetric(
        kilometers: 1,
        hectometers: 2,
        dekameters: 3,
        meters: 4,
        decimeters: 5,
        centimeters: 6,
        millimeters: 7,
        micrometers: 890,
        nanometers: 123,
        picometers: 456,
        precision: Precision(16),
      );

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1234.567890123456);
    });
  });

  group('imperial', () {
    test('miles parameter', () {
      // given
      final distance = Distance.ofImperial(
        miles: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asMiles;

      // then
      expect(result, 1.0);
    });
    test('yards parameter', () {
      // given
      final distance = Distance.ofImperial(
        yards: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asYards;

      // then
      expect(result, 1.0);
    });
    test('feet parameter', () {
      // given
      final distance = Distance.ofImperial(
        feet: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asFeet;

      // then
      expect(result, 1.0);
    });
    test('inches parameter', () {
      // given
      final distance = Distance.ofImperial(
        inches: 1,
        precision: Precision(5),
      );

      // when
      final result = distance.asInches;

      // then
      expect(result, 1.0);
    });
    test('sums parts', () {
      // given
      final distance = Distance.ofImperial(
        miles: 1,
        yards: 2,
        feet: 3,
        inches: 4,
        precision: Precision(5),
      );

      // when
      final result = distance.asInches;

      // then
      expect(result, 63472.0);
    });
  });

  group('ofPicometers', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofPicometers(1.234e12, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1.234);
    });
  });
  group('ofNanometers', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofNanometers(1.234e9, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1.234);
    });
  });
  group('ofMicrometers', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofMicrometers(1.234e6, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1.234);
    });
  });
  group('ofMillimeters', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofMillimeters(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1.234);
    });
  });
  group('ofCentimeters', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofCentimeters(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 12.34);
    });
  });
  group('ofDecimeters', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofDecimeters(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 123.4);
    });
  });
  group('ofMeters', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofMeters(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1234.0);
    });
  });
  group('ofDekameters', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofDekameters(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 12340.0);
    });
  });
  group('ofHectometers', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofHectometers(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 123400.0);
    });
  });
  group('ofKilometers', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofKilometers(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1234000.0);
    });
  });
  group('ofMiles', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofMiles(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1985900.0);
    });
  });
  group('ofYards', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofYards(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 1128.4);
    });
  });
  group('ofFeet', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofFeet(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 376.12);
    });
  });
  group('ofInches', () {
    test('converts to base', () {
      // given
      final distance = Distance.ofInches(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 31.344);
    });
  });
  group('ofNauticalMiles', () {
    test('converts to base', () {
      // given
      final distance =
          Distance.ofNauticalMiles(1234.0, precision: Precision(5));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 2285400.0);
    });
  });

  group('asPicometers', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(1.23456, precision: Precision(8));

      // when
      final result = distance.asPicometers;

      // then
      expect(result, 1.23456e12);
    });
  });
  group('asNanometers', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(1.23456, precision: Precision(8));

      // when
      final result = distance.asNanometers;

      // then
      expect(result, 1.23456e9);
    });
  });
  group('asMicrometers', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(1.23456, precision: Precision(8));

      // when
      final result = distance.asMicrometers;

      // then
      expect(result, 1.23456e6);
    });
  });
  group('asMillimeters', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asMillimeters;

      // then
      expect(result, 123456.0);
    });
  });
  group('asCentimeters', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asCentimeters;

      // then
      expect(result, 12345.6);
    });
  });
  group('asDecimeters', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asDecimeters;

      // then
      expect(result, 1234.56);
    });
  });
  group('asMeters', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asMeters;

      // then
      expect(result, 123.456);
    });
  });
  group('asDekameters', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asDekameters;

      // then
      expect(result, 12.3456);
    });
  });
  group('asHectometers', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asHectometers;

      // then
      expect(result, 1.23456);
    });
  });
  group('asKilometers', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asKilometers;

      // then
      expect(result, 0.123456);
    });
  });

  group('asInches', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asInches;

      // then
      expect(result, 4860.4726);
    });
  });
  group('asFeet', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asFeet;

      // then
      expect(result, 405.03938);
    });
  });
  group('asYards', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asYards;

      // then
      expect(result, 135.01309);
    });
  });
  group('asMiles', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asMiles;

      // then
      expect(result, 0.076712003);
    });
  });

  group('asNauticalMiles', () {
    test('converts to unit', () {
      // given
      final distance = Distance.ofMeters(123.456, precision: Precision(8));

      // when
      final result = distance.asNauticalMiles;

      // then
      expect(result, 0.066660907);
    });
  });
}
