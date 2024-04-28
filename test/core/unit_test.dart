import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

void main() {
  group("Unit", () {
    test("of", () {
      // when
      final result = feet.of(3);

      // then
      expect(result, closeTo(9.84, 0.005));
    });
    test("from", () {
      // when
      final result = feet.from(3);

      // then
      expect(result, closeTo(0.914, 0.0005));
    });
  });
  group("DerivedUnit2", () {
    group("of", () {
      test("square", () {
        // when
        final result = square(feet).of(1.0);

        // then
        expect(result, closeTo(10.76, 0.005));
      });
    });
    group("from", () {
      test("square", () {
        // when
        final result = square(feet).from(10);

        // then
        expect(result, closeTo(0.929, 0.0005));
      });
    });
  });
}
