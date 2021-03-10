import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('multiply', () {
    test('same units', () {
      // given
      final unit = DerivedMeasurement.multiply(
        Distance.meters(2),
        Distance.meters(3),
        precision: Precision(3),
      );

      // when
      final result = unit.as(Distance.asMeters, Distance.asMeters);

      // then
      expect(result, 6.0);
    });
    test('disparate units', () {
      // given
      final unit = DerivedMeasurement.multiply(
        Distance.meters(2),
        Distance.meters(3),
        precision: Precision(3),
      );

      // when
      final result = unit.as(Distance.asCentimeters, Distance.asMeters);

      // then
      expect(result, 600.0);
    });
    test('disparate units transposed', () {
      // given
      final unit = DerivedMeasurement.multiply(
        Distance.meters(2),
        Distance.meters(3),
        precision: Precision(3),
      );

      // when
      final result = unit.as(Distance.asMeters, Distance.asCentimeters);

      // then
      expect(result, 600.0);
    });
    test('different units', () {
      // given
      final unit = DerivedMeasurement.multiply(
        Distance.meters(2),
        Distance.meters(3),
        precision: Precision(3),
      );

      // when
      final result = unit.as(Distance.asCentimeters, Distance.asCentimeters);

      // then
      expect(result, 60000.0);
    });
  });

  group('divide', () {
    test('same units', () {
      // given
      final unit = DerivedMeasurement.divide(
        Distance.meters(6),
        Volume.liters(3),
        precision: Precision(3),
      );

      // when
      final result = unit.as(Distance.asMeters, Volume.asLiters);

      // then
      expect(result, 2.0);
    });
    test('disparate units', () {
      // given
      final unit = DerivedMeasurement.divide(
        Distance.meters(6000),
        Volume.liters(3),
        precision: Precision(3),
      );

      // when
      final result = unit.as(Distance.asKilometers, Volume.asLiters);

      // then
      expect(result, 2.0);
    });
    test('disparate units transposed', () {
      // given
      final unit = DerivedMeasurement.divide(
        Distance.meters(6),
        Volume.liters(3),
        precision: Precision(3),
      );

      // when
      final result = unit.as(Distance.asMeters, Volume.asDeciliters);

      // then
      expect(result, 0.2);
    });
  });

  group('arbitrary function', () {
    test('', () {
      // given
      final unit = DerivedMeasurement(
        Distance.meters(3),
        Distance.meters(5),
        (a, b) => a + b,
        precision: Precision(3),
      );

      // when
      final result = unit.as(Distance.asMeters, Distance.asMeters);

      // then
      expect(result, 8.0);
    });
  });
}
