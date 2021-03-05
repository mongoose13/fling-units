import 'package:fling/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group(
    'Unit',
    () {
      test('toString', () {
        final result = FlingUnits.g.toString();

        expect(result, 'grams');
      });

      test('fromShort', () {
        final result = FlingUnits.fromShort('g').toString();

        expect(result, 'grams');
      });
      test('fromShort invalid', () {
        expect(
            () => FlingUnits.fromShort('invalid').toString(), throwsArgumentError);
      });

      test('convert within the same dimension and measurement system to root',
          () {
        final result = FlingUnits.kg.convertTo(FlingUnits.g, 2.0);

        expect(result, 2000.0);
      });

      test('convert from root within the same dimension and measurement system',
          () {
        final result = FlingUnits.g.convertTo(FlingUnits.kg, 2.0);

        expect(result, 0.002);
      });

      test('convert within the same dimension and measurement system', () {
        final result = FlingUnits.kg.convertTo(FlingUnits.mg, 2.0);

        expect(result, 2000000.0);
      });

      test('convert within the same dimension but different measurement system',
          () {
        final result = FlingUnits.kg.convertTo(FlingUnits.lb, 2.0);

        expect(result, 4.409248840367555);
      });

      test('convert incompatible dimensions', () {
        expect(() => FlingUnits.kg.convertTo(FlingUnits.tbsp, 2.0), throwsArgumentError);
      });

      test('sizeComparator', () {
        final list = [FlingUnits.g, FlingUnits.kg, FlingUnits.mg, FlingUnits.lb];
        list.sort(FlingUnits.sizeComparator);

        expect(list, [FlingUnits.mg, FlingUnits.g, FlingUnits.lb, FlingUnits.kg]);
      });

      test('all units', () {
        final results =
            FlingUnits.allUnits().where((unit) => unit.dimension == FlingUnits.volume);

        expect(results.contains(FlingUnits.L), true);
        expect(results.contains(FlingUnits.g), false);
      });
    },
  );
}