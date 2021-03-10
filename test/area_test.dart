import 'package:fling_units/src/area.dart';
import 'package:fling_units/src/distance.dart';
import 'package:fling_units/src/precision.dart';
import 'package:test/test.dart';

void main() {
  group('Constructors', () {
    test('zero', () {
      // given
      final area = Area.zero();

      // then
      expect(area.squareMeters, 0.0);
    });
    test('infinity', () {
      // given
      final area = Area.infinity();

      // then
      expect(area.squareMeters, double.infinity);
    });
    test('negativeInfinity', () {
      // given
      final area = Area.negativeInfinity();

      // then
      expect(area.squareMeters, double.negativeInfinity);
    });

    test('squareKilometers', () {
      // given
      final area = Area.squareKilometers(12.34, precision: Precision(4));

      // then
      expect(area.squareKilometers, 12.34);
    });
    test('squareMeters', () {
      // given
      final area = Area.squareMeters(12.34, precision: Precision(4));

      // then
      expect(area.squareMeters, 12.34);
    });
    test('squareCentimeters', () {
      // given
      final area = Area.squareCentimeters(12.34, precision: Precision(4));

      // then
      expect(area.squareCentimeters, 12.34);
    });
    test('squareMillimeters', () {
      // given
      final area = Area.squareMillimeters(12.34, precision: Precision(4));

      // then
      expect(area.squareMillimeters, 12.34);
    });

    test('squareMiles', () {
      // given
      final area = Area.squareMiles(12.34, precision: Precision(4));

      // then
      expect(area.squareMiles, 12.34);
    });
    test('squareYards', () {
      // given
      final area = Area.squareYards(12.34, precision: Precision(4));

      // then
      expect(area.squareYards, 12.34);
    });
    test('squareFeet', () {
      // given
      final area = Area.squareFeet(12.34, precision: Precision(4));

      // then
      expect(area.squareFeet, 12.34);
    });
    test('squareInches', () {
      // given
      final area = Area.squareInches(12.34, precision: Precision(4));

      // then
      expect(area.squareInches, 12.34);
    });

    test('component', () {
      // given
      final area = Area(Distance.meters(2), Distance.meters(3));

      // then
      expect(area.squareMeters, 6.0);
    });

    test('component precision', () {
      // given
      final area = Area(Distance.meters(2, precision: Precision(2)),
          Distance.meters(3, precision: Precision(5)));

      // then
      expect(area.precision.precision, 2);
    });
  });

  group('>', () {
    test('smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(3);

      // then
      expect(area1 > area2, false);
    });
    test('larger', () {
      // given
      final area1 = Area.squareMeters(3);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 > area2, true);
    });
    test('larger than negative', () {
      // given
      final area1 = Area.squareMeters(3);
      final area2 = Area.squareMeters(-2);

      // then
      expect(area1 > area2, true);
    });
    test('negative is larger', () {
      // given
      final area1 = Area.squareMeters(-3);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 > area2, false);
    });
    test('equal', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 > area2, false);
    });
    test('equal infinity', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.infinity();

      // then
      expect(area1 > area2, false);
    });
    test('equal negative infinity', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.negativeInfinity();

      // then
      expect(area1 > area2, false);
    });
    test('infinity smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.infinity();

      // then
      expect(area1 > area2, false);
    });
    test('infinity larger', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 > area2, true);
    });
    test('negative infinity smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.negativeInfinity();

      // then
      expect(area1 > area2, true);
    });
    test('negative infinity larger', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 > area2, false);
    });
  });

  group('>=', () {
    test('smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(3);

      // then
      expect(area1 >= area2, false);
    });
    test('larger', () {
      // given
      final area1 = Area.squareMeters(3);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 >= area2, true);
    });
    test('larger than negative', () {
      // given
      final area1 = Area.squareMeters(3);
      final area2 = Area.squareMeters(-2);

      // then
      expect(area1 >= area2, true);
    });
    test('negative is larger', () {
      // given
      final area1 = Area.squareMeters(-3);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 >= area2, false);
    });
    test('equal', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 >= area2, true);
    });
    test('equal infinity', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.infinity();

      // then
      expect(area1 >= area2, true);
    });
    test('equal negative infinity', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.negativeInfinity();

      // then
      expect(area1 >= area2, true);
    });
    test('infinity smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.infinity();

      // then
      expect(area1 >= area2, false);
    });
    test('infinity larger', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 >= area2, true);
    });
    test('negative infinity smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.negativeInfinity();

      // then
      expect(area1 >= area2, true);
    });
    test('negative infinity larger', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 >= area2, false);
    });
  });

  group('<', () {
    test('smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(3);

      // then
      expect(area1 < area2, true);
    });
    test('larger', () {
      // given
      final area1 = Area.squareMeters(3);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 < area2, false);
    });
    test('larger than negative', () {
      // given
      final area1 = Area.squareMeters(3);
      final area2 = Area.squareMeters(-2);

      // then
      expect(area1 < area2, false);
    });
    test('negative is larger', () {
      // given
      final area1 = Area.squareMeters(-3);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 < area2, true);
    });
    test('equal', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 < area2, false);
    });
    test('equal infinity', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.infinity();

      // then
      expect(area1 < area2, false);
    });
    test('equal negative infinity', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.negativeInfinity();

      // then
      expect(area1 < area2, false);
    });
    test('infinity smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.infinity();

      // then
      expect(area1 < area2, true);
    });
    test('infinity larger', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 < area2, false);
    });
    test('negative infinity smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.negativeInfinity();

      // then
      expect(area1 < area2, false);
    });
    test('negative infinity larger', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 < area2, true);
    });
  });

  group('<=', () {
    test('smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(3);

      // then
      expect(area1 <= area2, true);
    });
    test('larger', () {
      // given
      final area1 = Area.squareMeters(3);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 <= area2, false);
    });
    test('larger than negative', () {
      // given
      final area1 = Area.squareMeters(3);
      final area2 = Area.squareMeters(-2);

      // then
      expect(area1 <= area2, false);
    });
    test('negative is larger', () {
      // given
      final area1 = Area.squareMeters(-3);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 <= area2, true);
    });
    test('equal', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 <= area2, true);
    });
    test('equal infinity', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.infinity();

      // then
      expect(area1 <= area2, true);
    });
    test('equal negative infinity', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.negativeInfinity();

      // then
      expect(area1 <= area2, true);
    });
    test('infinity smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.infinity();

      // then
      expect(area1 <= area2, true);
    });
    test('infinity larger', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 <= area2, false);
    });
    test('negative infinity smaller', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.negativeInfinity();

      // then
      expect(area1 <= area2, false);
    });
    test('negative infinity larger', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 <= area2, true);
    });
  });

  group('==', () {
    test('different values', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(3);

      // then
      expect(area1 == area2, false);
    });
    test('same values', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1 == area2, true);
    });
    test('same object', () {
      // given
      final area = Area.squareMeters(2);

      // then
      expect(area == area, true);
    });
    test('same precision', () {
      // given
      final area1 = Area.squareMeters(2, precision: Precision(4));
      final area2 = Area.squareMeters(2, precision: Precision(4));

      // then
      expect(area1 == area2, true);
    });
    test('different precision', () {
      // given
      final area1 = Area.squareMeters(2, precision: Precision(5));
      final area2 = Area.squareMeters(2, precision: Precision(4));

      // then
      expect(area1 == area2, false);
    });
  });

  group('hashCode', () {
    test('same values', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(2);

      // then
      expect(area1.hashCode, area2.hashCode);
    });
    test('consistency', () {
      // given
      final area = Area.squareMeters(2);

      // then
      expect(area.hashCode, area.hashCode);
    });
  });

  group('compareTo', () {
    test('sort', () {
      // given
      final areas = [
        Area.squareMeters(2),
        Area.zero(),
        Area.squareInches(3),
        Area.infinity(),
        Area.negativeInfinity(),
        Area.squareYards(-4),
      ];

      // when
      areas.sort();

      // then
      expect(areas, [
        Area.negativeInfinity(),
        Area.squareYards(-4),
        Area.zero(),
        Area.squareInches(3),
        Area.squareMeters(2),
        Area.infinity(),
      ]);
    });
  });

  group('unary -', () {
    test('finite positive', () {
      // given
      final area = Area.squareMeters(3);

      // when
      final result = -area;

      // then
      expect(result.squareMeters, -3);
    });
    test('finite negative', () {
      // given
      final area = Area.squareMeters(-3);

      // when
      final result = -area;

      // then
      expect(result.squareMeters, 3);
    });
    test('zero', () {
      // given
      final area = Area.zero();

      // when
      final result = -area;

      // then
      expect(result, Area.zero());
    });
    test('infinity', () {
      // given
      final area = Area.infinity();

      // when
      final result = -area;

      // then
      expect(result, Area.negativeInfinity());
    });
    test('negative infinity', () {
      // given
      final area = Area.negativeInfinity();

      // when
      final result = -area;

      // then
      expect(result, Area.infinity());
    });
  });

  group('+', () {
    test('finite both positive', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(3);

      // when
      final result = area1 + area2;

      // then
      expect(result, Area.squareMeters(5));
    });
    test('finite both negative', () {
      // given
      final area1 = Area.squareMeters(-2);
      final area2 = Area.squareMeters(-3);

      // when
      final result = area1 + area2;

      // then
      expect(result, Area.squareMeters(-5));
    });
    test('finite second negative', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(-3);

      // when
      final result = area1 + area2;

      // then
      expect(result, Area.squareMeters(-1));
    });
    test('finite first negative', () {
      // given
      final area1 = Area.squareMeters(-2);
      final area2 = Area.squareMeters(3);

      // when
      final result = area1 + area2;

      // then
      expect(result, Area.squareMeters(1));
    });
    test('first infinite positive', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.squareMeters(3);

      // when
      final result = area1 + area2;

      // then
      expect(result, Area.infinity());
    });
    test('second infinite positive', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.infinity();

      // when
      final result = area1 + area2;

      // then
      expect(result, Area.infinity());
    });
    test('first infinite negative', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.squareMeters(3);

      // when
      final result = area1 + area2;

      // then
      expect(result, Area.negativeInfinity());
    });
    test('second infinite negative', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.negativeInfinity();

      // when
      final result = area1 + area2;

      // then
      expect(result, Area.negativeInfinity());
    });
  });

  group('-', () {
    test('finite both positive', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(3);

      // when
      final result = area1 - area2;

      // then
      expect(result, Area.squareMeters(-1));
    });
    test('finite both negative', () {
      // given
      final area1 = Area.squareMeters(-2);
      final area2 = Area.squareMeters(-3);

      // when
      final result = area1 - area2;

      // then
      expect(result, Area.squareMeters(1));
    });
    test('finite second negative', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.squareMeters(-3);

      // when
      final result = area1 - area2;

      // then
      expect(result, Area.squareMeters(5));
    });
    test('finite first negative', () {
      // given
      final area1 = Area.squareMeters(-2);
      final area2 = Area.squareMeters(3);

      // when
      final result = area1 - area2;

      // then
      expect(result, Area.squareMeters(-5));
    });
    test('first infinite positive', () {
      // given
      final area1 = Area.infinity();
      final area2 = Area.squareMeters(3);

      // when
      final result = area1 - area2;

      // then
      expect(result, Area.infinity());
    });
    test('second infinite positive', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.infinity();

      // when
      final result = area1 - area2;

      // then
      expect(result, Area.negativeInfinity());
    });
    test('first infinite negative', () {
      // given
      final area1 = Area.negativeInfinity();
      final area2 = Area.squareMeters(3);

      // when
      final result = area1 - area2;

      // then
      expect(result, Area.negativeInfinity());
    });
    test('second infinite negative', () {
      // given
      final area1 = Area.squareMeters(2);
      final area2 = Area.negativeInfinity();

      // when
      final result = area1 - area2;

      // then
      expect(result, Area.infinity());
    });
  });

  group('*', () {
    test('zero times finite scalar', () {
      // given
      final area = Area.zero();

      // when
      final result = area * 2;

      // then
      expect(result, Area.zero());
    });
    test('finite area times zero', () {
      // given
      final area = Area.squareMeters(-3);

      // when
      final result = area * 0;

      // then
      expect(result, Area.zero());
    });
    test('finite area times one', () {
      // given
      final area = Area.squareMeters(-3);

      // when
      final result = area * 1;

      // then
      expect(result, Area.squareMeters(-3));
    });
    test('finite both positive', () {
      // given
      final area = Area.squareMeters(3);

      // when
      final result = area * 2;

      // then
      expect(result, Area.squareMeters(6));
    });
    test('finite negative scalar', () {
      // given
      final area = Area.squareMeters(3);

      // when
      final result = area * -2;

      // then
      expect(result, Area.squareMeters(-6));
    });
    test('finite negative area', () {
      // given
      final area = Area.squareMeters(-3);

      // when
      final result = area * 2;

      // then
      expect(result, Area.squareMeters(-6));
    });
    test('finite negative both', () {
      // given
      final area = Area.squareMeters(-3);

      // when
      final result = area * -2;

      // then
      expect(result, Area.squareMeters(6));
    });
    test('infinite with positive scalar', () {
      // given
      final area = Area.infinity();

      // when
      final result = area * 2;

      // then
      expect(result, Area.infinity());
    });
    test('infinite with negative scalar', () {
      // given
      final area = Area.infinity();

      // when
      final result = area * -2;

      // then
      expect(result, Area.negativeInfinity());
    });
    test('negative infinite with positive scalar', () {
      // given
      final area = Area.negativeInfinity();

      // when
      final result = area * 2;

      // then
      expect(result, Area.negativeInfinity());
    });
    test('negative infinite with negative scalar', () {
      // given
      final area = Area.negativeInfinity();

      // when
      final result = area * -2;

      // then
      expect(result, Area.infinity());
    });
  });

  group('squareKilometers', () {
    test('one km^2', () {
      // given
      final area = Area.squareMeters(1000000);

      // when
      final result = area.squareKilometers;

      // then
      expect(result, 1.0);
    });
    test('one m^2', () {
      // given
      final area = Area.squareMeters(1);

      // when
      final result = area.squareKilometers;

      // then
      expect(result, 0.000001);
    });
  });

  group('squareMeters', () {
    test('one m^2', () {
      // given
      final area = Area.squareMeters(1);

      // when
      final result = area.squareMeters;

      // then
      expect(result, 1.0);
    });
  });

  group('squareKilometers', () {
    test('one cm^2', () {
      // given
      final area = Area.squareMeters(0.0001, precision: Precision(4));

      // when
      final result = area.squareCentimeters;

      // then
      expect(result, 1.0);
    });
    test('one m^2', () {
      // given
      final area = Area.squareMeters(1, precision: Precision(4));

      // when
      final result = area.squareCentimeters;

      // then
      expect(result, 10000.0);
    });
  });

  group('squareMillimeters', () {
    test('one mm^2', () {
      // given
      final area = Area.squareMeters(0.000001, precision: Precision(4));

      // when
      final result = area.squareMillimeters;

      // then
      expect(result, 1.0);
    });
    test('one m^2', () {
      // given
      final area = Area.squareMeters(1, precision: Precision(4));

      // when
      final result = area.squareMillimeters;

      // then
      expect(result, 1000000.0);
    });
  });

  group('squareMiles', () {
    test('one mile^2', () {
      // given
      final area = Area.squareMeters(2590000.0, precision: Precision(4));

      // when
      final result = area.squareMiles;

      // then
      expect(result, 1);
    });
    test('one m^2', () {
      // given
      final area = Area.squareMeters(1, precision: Precision(4));

      // when
      final result = area.squareMiles;

      // then
      expect(result, 3.861e-7);
    });
  });

  group('squareYards', () {
    test('one yard^2', () {
      // given
      final area = Area.squareMeters(0.8361, precision: Precision(4));

      // when
      final result = area.squareYards;

      // then
      expect(result, 1);
    });
    test('one m^2', () {
      // given
      final area = Area.squareMeters(1, precision: Precision(4));

      // when
      final result = area.squareYards;

      // then
      expect(result, 1.1960);
    });
  });
}
