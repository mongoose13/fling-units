import 'package:fling/fling.dart';

import 'package:test/test.dart';

void main() {
  group(
    'Unit',
    () {
      test('toString', () {
        final result = Fling.g.toString();

        expect(result, 'grams');
      });

      test('fromShort', () {
        final result = Fling.fromShort('g').toString();

        expect(result, 'grams');
      });
      test('fromShort invalid', () {
        expect(
            () => Fling.fromShort('invalid').toString(), throwsArgumentError);
      });

      test('convert within the same dimension and measurement system to root',
          () {
        final result = Fling.kg.convertTo(Fling.g, 2.0);

        expect(result, 2000.0);
      });

      test('convert from root within the same dimension and measurement system',
          () {
        final result = Fling.g.convertTo(Fling.kg, 2.0);

        expect(result, 0.002);
      });

      test('convert within the same dimension and measurement system', () {
        final result = Fling.kg.convertTo(Fling.mg, 2.0);

        expect(result, 2000000.0);
      });

      test('convert within the same dimension but different measurement system',
          () {
        final result = Fling.kg.convertTo(Fling.lb, 2.0);

        expect(result, 4.409248840367555);
      });

      test('convert incompatible dimensions', () {
        expect(() => Fling.kg.convertTo(Fling.tbsp, 2.0), throwsArgumentError);
      });

      test('sizeComparator', () {
        final list = [Fling.g, Fling.kg, Fling.mg, Fling.lb];
        list.sort(Fling.sizeComparator);

        expect(list, [Fling.mg, Fling.g, Fling.lb, Fling.kg]);
      });

      test('all units', () {
        final results =
            Fling.allUnits().where((unit) => unit.dimension == Fling.volume);

        expect(results.contains(Fling.L), true);
        expect(results.contains(Fling.g), false);
      });
    },
  );
}