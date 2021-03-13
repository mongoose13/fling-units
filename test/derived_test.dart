import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('multiply', () {
    test('same units', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.multiply(
        Distance.ofMeters(2, precision: Precision(3)),
        Distance.ofMeters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(Distance.meters, Distance.meters);

      // then
      expect(result, 6.0);
    });
    test('disparate units', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.multiply(
        Distance.ofMeters(2, precision: Precision(3)),
        Distance.ofMeters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(Distance.meters, Distance.decimeters);

      // then
      expect(result, 60.0);
    });
    test('disparate units transposed', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.multiply(
        Distance.ofMeters(2, precision: Precision(3)),
        Distance.ofMeters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(Distance.decimeters, Distance.meters);

      // then
      expect(result, 60.0);
    });
    test('precision maintained', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.multiply(
        Distance.ofMeters(2, precision: Precision(6)),
        Distance.ofMeters(3, precision: Precision(3)),
      );

      // when
      final result = unit.precision;

      // then
      expect(result, 3);
    });
  });

  group('divide', () {
    test('same units', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.divide(
        Distance.ofMeters(6, precision: Precision(3)),
        Distance.ofMeters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(Distance.meters, Distance.meters);

      // then
      expect(result, 2.0);
    });
    test('disparate units', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.divide(
        Distance.ofMeters(6, precision: Precision(3)),
        Distance.ofMeters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(Distance.meters, Distance.decimeters);

      // then
      expect(result, 0.2);
    });
    test('disparate units transposed', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.divide(
        Distance.ofMeters(6, precision: Precision(3)),
        Distance.ofMeters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(Distance.decimeters, Distance.meters);

      // then
      expect(result, 20.0);
    });
    test('precision maintained', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.divide(
        Distance.ofMeters(6, precision: Precision(6)),
        Distance.ofMeters(3, precision: Precision(3)),
      );

      // when
      final result = unit.precision;

      // then
      expect(result, 3);
    });
    test('disparate measurements', () {
      // given
      final unit = DerivedMeasurement<Distance, Volume>.divide(
          Distance.ofMiles(100, precision: Precision(3)),
          Volume.ofGallons(5, precision: Precision(3)));

      // when
      final result = unit.as(Distance.miles, Volume.gallons);

      // then
      expect(result, 20.0);
    });
    test('disparate measurements converted', () {
      // given
      final unit = DerivedMeasurement<Distance, Volume>.divide(
          Distance.ofMiles(100, precision: Precision(3)),
          Volume.ofGallons(5, precision: Precision(3)));

      // when
      final result = unit.as(Distance.kilometers, Volume.liters);

      // then
      expect(result, 7.08);
    });
  });
}