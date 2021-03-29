import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('zero', () {
    test('has 0.0 distance', () {
      // given
      final result = Area.zero();

      // then
      expect(result.asArea(Area.square(meters)), 0.0);
    });
    test('has max precision', () {
      // given
      final result = Area.zero();

      // then
      expect(result.precision, Precision.max.precision);
    });
  });
  group('infinity', () {
    test('has infinite distance', () {
      // given
      final result = Area.infinite();

      // then
      expect(result.asArea(Area.square(meters)), double.infinity);
    });
    test('has max precision', () {
      // given
      final result = Area.infinite();

      // then
      expect(result.precision, Precision.max.precision);
    });
  });
  group('negativeInfinity', () {
    test('has infinite negative distance', () {
      // given
      final result = Area.negativeInfinite();

      // then
      expect(result.asArea(Area.square(meters)), double.negativeInfinity);
    });
    test('has max precision', () {
      // given
      final result = Area.negativeInfinite();

      // then
      expect(result.precision, Precision.max.precision);
    });
  });

  group('of', () {
    test('multiplies component parts', () {
      // given
      final area = Area.of(
        meters(2, precision: Precision(5)),
        meters(3, precision: Precision(5)),
      );

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 6.0);
    });
    test('retains correct precision', () {
      // given
      final area = Area.of(
        meters(2, precision: Precision(3)),
        meters(3, precision: Precision(5)),
      );

      // when
      final result = area.precision;

      // then
      expect(result, 3);
    });
  });

  group('as', () {
    test('converts to base', () {
      // given
      final area = Area.square(meters)(1234.0, precision: Precision(5));

      // when
      final result = area.as(meters, meters);

      // then
      expect(result, 1234.0);
    });
    test('converts to different units', () {
      // given
      final area = Area.square(meters)(1234.0, precision: Precision(5));

      // when
      final result = area.as(kilo.meters, meters);

      // then
      expect(result, 1.234);
    });
  });

  group('asArea', () {
    test('converts to base', () {
      // given
      final area = Area.square(meters)(1234.0, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 1234.0);
    });
  });

  group('sum', () {
    test('adds parts', () {
      // given
      final area = Area.sum([
        Area.square(milli.meters)(1),
        Area.square(centi.meters)(2),
        Area.square(deci.meters)(3),
        Area.square(meters)(4),
      ], precision: Precision(10));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 4.030201);
    });
  });

  //-------------------- DEPRECATED --------------------//
  group('ofSquareMillimeters', () {
    test('converts to base', () {
      // given
      final area = Area.ofSquareMillimeters(1234.0, precision: Precision(5));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 0.001234);
    });
  });
  group('ofSquareMillimeters replacement', () {
    test('converts to base', () {
      // given
      final area = Area.square(milli.meters)(1234.0, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 0.001234);
    });
  });
  group('ofSquareCentimeters', () {
    test('converts to base', () {
      // given
      final area = Area.ofSquareCentimeters(1234.0, precision: Precision(5));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 0.1234);
    });
  });
  group('ofSquareCentimeters replacement', () {
    test('converts to base', () {
      // given
      final area = Area.square(centi.meters)(1234.0, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 0.1234);
    });
  });
  group('ofSquareMeters', () {
    test('converts to base', () {
      // given
      final area = Area.ofSquareMeters(1234.0, precision: Precision(5));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 1234.0);
    });
  });
  group('ofSquareMeters replacement', () {
    test('converts to base', () {
      // given
      final area = Area.square(meters)(1234.0, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 1234.0);
    });
  });
  group('ofSquareKilometers', () {
    test('converts to base', () {
      // given
      final area = Area.ofSquareKilometers(1.234, precision: Precision(5));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 1234000.0);
    });
  });
  group('ofSquareKilometers replacement', () {
    test('converts to base', () {
      // given
      final area = Area.square(kilo.meters)(1.234, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 1234000.0);
    });
  });
  group('ofSquareInches', () {
    test('converts to base', () {
      // given
      final area = Area.ofSquareInches(1234.0, precision: Precision(5));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 0.79613);
    });
  });
  group('ofSquareInches replacement', () {
    test('converts to base', () {
      // given
      final area = Area.square(inches)(1234.0, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 0.79613);
    });
  });
  group('ofSquareFeet', () {
    test('converts to base', () {
      // given
      final area = Area.ofSquareFeet(1234.0, precision: Precision(5));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 114.64);
    });
  });
  group('ofSquareFeet replacement', () {
    test('converts to base', () {
      // given
      final area = Area.square(feet)(1234.0, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 114.64);
    });
  });
  group('ofSquareYards', () {
    test('converts to base', () {
      // given
      final area = Area.ofSquareYards(1234.0, precision: Precision(5));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 1031.8);
    });
  });
  group('ofSquareYards replacement', () {
    test('converts to base', () {
      // given
      final area = Area.square(yards)(1234.0, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 1031.8);
    });
  });
  group('ofSquareMiles', () {
    test('converts to base', () {
      // given
      final area = Area.ofSquareMiles(1234.0, precision: Precision(5));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 3196000000.0);
    });
  });
  group('ofSquareMiles replacement', () {
    test('converts to base', () {
      // given
      final area = Area.square(miles)(1234.0, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 3196000000.0);
    });
  });

  group('asSquareMillimeters', () {
    test('converts', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(5));

      // when
      final result = area.asSquareMillimeters;

      // then
      expect(result, 1234000.0);
    });
    test('applies precision', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(3));

      // when
      final result = area.asSquareMillimeters;

      // then
      expect(result, 1230000.0);
    });
  });
  group('asSquareMillimeters replacement', () {
    test('converts', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(milli.meters));

      // then
      expect(result, 1234000.0);
    });
    test('applies precision', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(3));

      // when
      final result = area.asArea(Area.square(milli.meters));

      // then
      expect(result, 1230000.0);
    });
  });
  group('asSquareCentimeters', () {
    test('converts', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(5));

      // when
      final result = area.asSquareCentimeters;

      // then
      expect(result, 12340.0);
    });
    test('applies precision', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(3));

      // when
      final result = area.asSquareCentimeters;

      // then
      expect(result, 12300.0);
    });
  });
  group('asSquareCentimeters replacement', () {
    test('converts', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(centi.meters));

      // then
      expect(result, 12340.0);
    });
    test('applies precision', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(3));

      // when
      final result = area.asArea(Area.square(centi.meters));

      // then
      expect(result, 12300.0);
    });
  });
  group('asSquareMeters', () {
    test('converts', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(5));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 1.234);
    });
    test('applies precision', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(3));

      // when
      final result = area.asSquareMeters;

      // then
      expect(result, 1.23);
    });
  });
  group('asSquareMeters replacement', () {
    test('converts', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 1.234);
    });
    test('applies precision', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(3));

      // when
      final result = area.asArea(Area.square(meters));

      // then
      expect(result, 1.23);
    });
  });
  group('asSquareKilometers', () {
    test('converts', () {
      // given
      final area = Area.ofSquareMeters(1234567.8, precision: Precision(9));

      // when
      final result = area.asSquareKilometers;

      // then
      expect(result, 1.2345678);
    });
    test('applies precision', () {
      // given
      final area = Area.ofSquareMeters(1234567.8, precision: Precision(4));

      // when
      final result = area.asSquareKilometers;

      // then
      expect(result, 1.235);
    });
  });
  group('asSquareKilometers replacement', () {
    test('converts', () {
      // given
      final area = Area.square(meters)(1234567.8, precision: Precision(9));

      // when
      final result = area.asArea(Area.square(kilo.meters));

      // then
      expect(result, 1.2345678);
    });
    test('applies precision', () {
      // given
      final area = Area.square(meters)(1234567.8, precision: Precision(4));

      // when
      final result = area.asArea(Area.square(kilo.meters));

      // then
      expect(result, 1.235);
    });
  });
  group('asSquareInches', () {
    test('converts', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(5));

      // when
      final result = area.asSquareInches;

      // then
      expect(result, 1912.7);
    });
    test('applies precision', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(3));

      // when
      final result = area.asSquareInches;

      // then
      expect(result, 1910.0);
    });
  });
  group('asSquareInches replacement', () {
    test('converts', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(inches));

      // then
      expect(result, 1912.7);
    });
    test('applies precision', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(3));

      // when
      final result = area.asArea(Area.square(inches));

      // then
      expect(result, 1910.0);
    });
  });
  group('asSquareFeet', () {
    test('converts', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(5));

      // when
      final result = area.asSquareFeet;

      // then
      expect(result, 13.283);
    });
    test('applies precision', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(3));

      // when
      final result = area.asSquareFeet;

      // then
      expect(result, 13.3);
    });
  });
  group('asSquareFeet replacement', () {
    test('converts', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(feet));

      // then
      expect(result, 13.283);
    });
    test('applies precision', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(3));

      // when
      final result = area.asArea(Area.square(feet));

      // then
      expect(result, 13.3);
    });
  });
  group('asSquareYards', () {
    test('converts', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(5));

      // when
      final result = area.asSquareYards;

      // then
      expect(result, 1.4759);
    });
    test('applies precision', () {
      // given
      final area = Area.ofSquareMeters(1.234, precision: Precision(3));

      // when
      final result = area.asSquareYards;

      // then
      expect(result, 1.48);
    });
  });
  group('asSquareYards replacement', () {
    test('converts', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(5));

      // when
      final result = area.asArea(Area.square(yards));

      // then
      expect(result, 1.4759);
    });
    test('applies precision', () {
      // given
      final area = Area.square(meters)(1.234, precision: Precision(3));

      // when
      final result = area.asArea(Area.square(yards));

      // then
      expect(result, 1.48);
    });
  });
  group('asSquareMiles', () {
    test('converts', () {
      // given
      final area = Area.ofSquareMeters(1234567.8, precision: Precision(9));

      // when
      final result = area.asSquareMiles;

      // then
      expect(result, 0.476669304);
    });
    test('applies precision', () {
      // given
      final area = Area.ofSquareMeters(1234567.8, precision: Precision(4));

      // when
      final result = area.asSquareMiles;

      // then
      expect(result, 0.4767);
    });
  });
  group('asSquareMiles replacement', () {
    test('converts', () {
      // given
      final area = Area.square(meters)(1234567.8, precision: Precision(9));

      // when
      final result = area.asArea(Area.square(miles));

      // then
      expect(result, 0.476669304);
    });
    test('applies precision', () {
      // given
      final area = Area.square(meters)(1234567.8, precision: Precision(4));

      // when
      final result = area.asArea(Area.square(miles));

      // then
      expect(result, 0.4767);
    });
  });
}
