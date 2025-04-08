import 'package:test/test.dart';

import 'package:fling_units/fling_units.dart';

void main() {
  group("frequency", () {
    group("as", () {
      test("base converts to prefixed", () {
        // given
        final measurement = 3.hertz.withPrecision(3);

        // when
        final result = measurement.as(deka.hertz);

        // then
        expect(result, 0.3);
      });
      test("prefixed converts to base", () {
        // given
        final measurement = 3.deci.hertz.withPrecision(3);

        // when
        final result = measurement.as(hertz);

        // then
        expect(result, 0.3);
      });
      test("prefixed converts to prefixed", () {
        // given
        final measurement = 3.deci.hertz.withPrecision(3);

        // when
        final result = measurement.as(centi.hertz);

        // then
        expect(result, 30.0);
      });
      test("base converts to similar unit", () {
        // given
        final measurement = 3.hertz.withPrecision(3);

        // when
        final result = measurement.as(rpm);

        // then
        expect(result, 180.0);
      });
    });
  });
}
