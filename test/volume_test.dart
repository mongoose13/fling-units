import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 distance', () {
      // given
      final result = Volume.zero();

      // then
      expect(result.asCubicMeters, 0.0);
    });
    test('has max precision', () {
      // given
      final result = Volume.zero();

      // then
      expect(result.precision, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite distance', () {
      // given
      final result = Volume.infinite();

      // then
      expect(result.asCubicMeters, double.infinity);
    });
    test('has max precision', () {
      // given
      final result = Volume.infinite();

      // then
      expect(result.precision, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative distance', () {
      // given
      final result = Volume.negativeInfinite();

      // then
      expect(result.asCubicMeters, double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final result = Volume.negativeInfinite();

      // then
      expect(result.precision, Precision.max.precision);
    });
  });

  group('metric', () {
    test('kiloliters parameter', () {
      // given
      final volume = Volume.ofMetric(
        kiloliters: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asLiters;

      // then
      expect(result, 1000.0);
    });
    test('hectoliters parameter', () {
      // given
      final volume = Volume.ofMetric(
        hectoliters: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asLiters;

      // then
      expect(result, 100.0);
    });
    test('dekaliters parameter', () {
      // given
      final volume = Volume.ofMetric(
        dekaliters: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asLiters;

      // then
      expect(result, 10.0);
    });
    test('liters parameter', () {
      // given
      final volume = Volume.ofMetric(
        liters: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asLiters;

      // then
      expect(result, 1.0);
    });
    test('deciliters parameter', () {
      // given
      final volume = Volume.ofMetric(
        deciliters: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asLiters;

      // then
      expect(result, 0.1);
    });
    test('centiliters parameter', () {
      // given
      final volume = Volume.ofMetric(
        centiliters: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asLiters;

      // then
      expect(result, 0.01);
    });
    test('milliliters parameter', () {
      // given
      final volume = Volume.ofMetric(
        milliliters: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asLiters;

      // then
      expect(result, 0.001);
    });
    test('sums parts', () {
      // given
      final volume = Volume.ofMetric(
        kiloliters: 1,
        hectoliters: 2,
        dekaliters: 3,
        liters: 4,
        deciliters: 5,
        centiliters: 6,
        milliliters: 7,
        precision: Precision(10),
      );

      // when
      final result = volume.asLiters;

      // then
      expect(result, 1234.567);
    });
  });

  group('imperial', () {
    test('gallons parameter', () {
      // given
      final volume = Volume.ofImperial(
        gallons: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asGallons;

      // then
      expect(result, 1.0);
    });
    test('quarts parameter', () {
      // given
      final volume = Volume.ofImperial(
        quarts: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asQuarts;

      // then
      expect(result, 1.0);
    });
    test('pints parameter', () {
      // given
      final volume = Volume.ofImperial(
        pints: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asPints;

      // then
      expect(result, 1.0);
    });
    test('cups parameter', () {
      // given
      final volume = Volume.ofImperial(
        cups: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asCups;

      // then
      expect(result, 1.0);
    });
    test('fluidOunces parameter', () {
      // given
      final volume = Volume.ofImperial(
        fluidOunces: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asFluidOunces;

      // then
      expect(result, 1.0);
    });
    test('tablespoons parameter', () {
      // given
      final volume = Volume.ofImperial(
        tablespoons: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asTablespoons;

      // then
      expect(result, 1.0);
    });
    test('teaspoons parameter', () {
      // given
      final volume = Volume.ofImperial(
        teaspoons: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asTeaspoons;

      // then
      expect(result, 1.0);
    });
    test('sums parts', () {
      // when
      final result = Volume.ofImperial(
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
      expect(result.asTeaspoons, 1681.0);
    });
  });

  group('us', () {
    test('usGallons parameter', () {
      // given
      final volume = Volume.ofUs(
        usGallons: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asUsGallons;

      // then
      expect(result, 1.0);
    });
    test('usQuarts parameter', () {
      // given
      final volume = Volume.ofUs(
        usQuarts: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asUsQuarts;

      // then
      expect(result, 1.0);
    });
    test('usPints parameter', () {
      // given
      final volume = Volume.ofUs(
        usPints: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asUsPints;

      // then
      expect(result, 1.0);
    });
    test('usCups parameter', () {
      // given
      final volume = Volume.ofUs(
        usCups: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asUsCups;

      // then
      expect(result, 1.0);
    });
    test('usFluidOunces parameter', () {
      // given
      final volume = Volume.ofUs(
        usFluidOunces: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asUsFluidOunces;

      // then
      expect(result, 1.0);
    });
    test('usTablespoons parameter', () {
      // given
      final volume = Volume.ofUs(
        usTablespoons: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asUsTablespoons;

      // then
      expect(result, 1.0);
    });
    test('usTeaspoons parameter', () {
      // given
      final volume = Volume.ofUs(
        usTeaspoons: 1,
        precision: Precision(5),
      );

      // when
      final result = volume.asUsTeaspoons;

      // then
      expect(result, 1.0);
    });
    test('sums parts', () {
      // when
      final result = Volume.ofUs(
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
      expect(result.asTeaspoons, 1404.7);
    });
  });

  group('of', () {
    test('multiplies component parts', () {
      // given
      final volume = Volume.of(
        Distance.ofMeters(2, precision: Precision(5)),
        Distance.ofMeters(3, precision: Precision(5)),
        Distance.ofMeters(4, precision: Precision(5)),
      );

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 24.0);
    });
    test('retains correct precision', () {
      // given
      final volume = Volume.of(
        Distance.ofMeters(2, precision: Precision(5)),
        Distance.ofMeters(3, precision: Precision(3)),
        Distance.ofMeters(4, precision: Precision(6)),
      );

      // when
      final result = volume.precision;

      // then
      expect(result, 3);
    });
  });

  group('ofMilliliters', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofMilliliters(1234.0, precision: Precision(5));

      // when
      final result = volume.asLiters;

      // then
      expect(result, 1.234);
    });
  });
  group('ofCentiliters', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofCentiliters(1234.0, precision: Precision(5));

      // when
      final result = volume.asLiters;

      // then
      expect(result, 12.34);
    });
  });
  group('ofDeciliters', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofDeciliters(1234.0, precision: Precision(5));

      // when
      final result = volume.asLiters;

      // then
      expect(result, 123.4);
    });
  });
  group('ofLiters', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofLiters(1234.0, precision: Precision(5));

      // when
      final result = volume.asLiters;

      // then
      expect(result, 1234.0);
    });
  });
  group('ofDekaliters', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofDekaliters(1234.0, precision: Precision(5));

      // when
      final result = volume.asLiters;

      // then
      expect(result, 12340.0);
    });
  });
  group('ofHectoliters', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofHectoliters(1234.0, precision: Precision(5));

      // when
      final result = volume.asLiters;

      // then
      expect(result, 123400.0);
    });
  });
  group('ofKiloliters', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofKiloliters(1234.0, precision: Precision(5));

      // when
      final result = volume.asLiters;

      // then
      expect(result, 1234000.0);
    });
  });
  group('ofCubicMeters', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofCubicMeters(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 1234.0);
    });
  });

  group('ofTeaspoons', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofTeaspoons(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.0073045);
    });
  });
  group('ofTablespoons', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofTablespoons(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.021914);
    });
  });
  group('ofFluidOunces', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofFluidOunces(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.035062);
    });
  });
  group('ofCups', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofCups(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.35062);
    });
  });
  group('ofPints', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofPints(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.70124);
    });
  });
  group('ofQuarts', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofQuarts(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 1.4025);
    });
  });
  group('ofGallons', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofGallons(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 5.6099);
    });
  });

  group('ofCubicInches', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofCubicInches(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.020222);
    });
  });
  group('ofCubicFeet', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofCubicFeet(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 34.943);
    });
  });

  group('ofUsTeaspoons', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofUsTeaspoons(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.0060823);
    });
  });
  group('ofUsTablespoons', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofUsTablespoons(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.018247);
    });
  });
  group('ofUsFluidOunces', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofUsFluidOunces(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.036494);
    });
  });
  group('ofUsCups', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofUsCups(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.29195);
    });
  });
  group('ofUsPints', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofUsPints(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.5839);
    });
  });
  group('ofUsQuarts', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofUsQuarts(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 1.1678);
    });
  });
  group('ofUsGallons', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofUsGallons(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 4.6712);
    });
  });

  group('ofUsLegalCups', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofUsLegalCups(1234.0, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 0.29616);
    });
  });

  group('as', () {
    test('converts to base', () {
      // given
      final volume = Volume.ofCubicMeters(1234.0, precision: Precision(5));

      // when
      final result =
          volume.as(Distance.meters, Distance.meters, Distance.meters);

      // then
      expect(result, 1234.0);
    });
    test('converts to different units', () {
      // given
      final volume = Volume.ofCubicMeters(12345.6, precision: Precision(5));

      // when
      final result =
          volume.as(Distance.kilometers, Distance.meters, Distance.dekameters);

      // then
      expect(result, 1.2346);
    });
  });

  group('asMilliliters', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asMilliliters;

      // then
      expect(result, 1234000.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asMilliliters;

      // then
      expect(result, 1230000.0);
    });
  });
  group('asCentiliters', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asCentiliters;

      // then
      expect(result, 123400.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asCentiliters;

      // then
      expect(result, 123000.0);
    });
  });
  group('asDeciliters', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asDeciliters;

      // then
      expect(result, 12340.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asDeciliters;

      // then
      expect(result, 12300.0);
    });
  });
  group('asLiters', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asLiters;

      // then
      expect(result, 1234.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asLiters;

      // then
      expect(result, 1230.0);
    });
  });
  group('asDekaliters', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asDekaliters;

      // then
      expect(result, 123.4);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asDekaliters;

      // then
      expect(result, 123.0);
    });
  });
  group('asHectoliters', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asHectoliters;

      // then
      expect(result, 12.34);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asHectoliters;

      // then
      expect(result, 12.3);
    });
  });
  group('asKiloliters', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asKiloliters;

      // then
      expect(result, 1.234);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asKiloliters;

      // then
      expect(result, 1.23);
    });
  });

  group('asCubicMeters', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 1.234);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asCubicMeters;

      // then
      expect(result, 1.23);
    });
  });

  group('asTeaspoons', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asTeaspoons;

      // then
      expect(result, 208470.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asTeaspoons;

      // then
      expect(result, 208000.0);
    });
  });
  group('asTablespoons', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asTablespoons;

      // then
      expect(result, 69489.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asTablespoons;

      // then
      expect(result, 69500.0);
    });
  });
  group('asFluidOunces', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asFluidOunces;

      // then
      expect(result, 43431.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asFluidOunces;

      // then
      expect(result, 43400.0);
    });
  });
  group('asCups', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asCups;

      // then
      expect(result, 4343.1);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asCups;

      // then
      expect(result, 4340.0);
    });
  });
  group('asPints', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asPints;

      // then
      expect(result, 2171.5);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asPints;

      // then
      expect(result, 2170.0);
    });
  });
  group('asQuarts', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asQuarts;

      // then
      expect(result, 1085.8);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asQuarts;

      // then
      expect(result, 1090.0);
    });
  });
  group('asGallons', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asGallons;

      // then
      expect(result, 271.44);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asGallons;

      // then
      expect(result, 271.0);
    });
  });

  group('asCubicInches', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asCubicInches;

      // then
      expect(result, 75303.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asCubicInches;

      // then
      expect(result, 75300.0);
    });
  });
  group('asCubicFeet', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asCubicFeet;

      // then
      expect(result, 43.578);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asCubicFeet;

      // then
      expect(result, 43.6);
    });
  });

  group('asUsTeaspoons', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asUsTeaspoons;

      // then
      expect(result, 250360.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asUsTeaspoons;

      // then
      expect(result, 250000.0);
    });
  });
  group('asUsTablespoons', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asUsTablespoons;

      // then
      expect(result, 83453.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asUsTablespoons;

      // then
      expect(result, 83500.0);
    });
  });
  group('asUsFluidOunces', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asUsFluidOunces;

      // then
      expect(result, 41726.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asUsFluidOunces;

      // then
      expect(result, 41700.0);
    });
  });
  group('asUsCups', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asUsCups;

      // then
      expect(result, 5215.8);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asUsCups;

      // then
      expect(result, 5220.0);
    });
  });
  group('asUsPints', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asUsPints;

      // then
      expect(result, 2607.9);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asUsPints;

      // then
      expect(result, 2610.0);
    });
  });
  group('asUsQuarts', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asUsQuarts;

      // then
      expect(result, 1304.0);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asUsQuarts;

      // then
      expect(result, 1300.0);
    });
  });
  group('asUsGallons', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asUsGallons;

      // then
      expect(result, 325.99);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asUsGallons;

      // then
      expect(result, 326.0);
    });
  });
  group('asUsLegalCups', () {
    test('converts', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(5));

      // when
      final result = volume.asUsLegalCups;

      // then
      expect(result, 5141.7);
    });
    test('applies precision', () {
      // given
      final volume = Volume.ofCubicMeters(1.234, precision: Precision(3));

      // when
      final result = volume.asUsLegalCups;

      // then
      expect(result, 5140.0);
    });
  });
}
