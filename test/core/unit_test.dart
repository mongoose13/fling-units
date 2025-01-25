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
    test("toString", () {
      // when
      final result = milli.inches;

      // then
      expect(result.toString(), "min");
    });
  });
}
