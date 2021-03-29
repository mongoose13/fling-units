import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('multiply', () {
    test('same units', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.multiply(
        meters(2, precision: Precision(3)),
        meters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(meters, meters);

      // then
      expect(result, 6.0);
    });
    test('disparate units', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.multiply(
        meters(2, precision: Precision(3)),
        meters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(meters, deci.meters);

      // then
      expect(result, 60.0);
    });
    test('disparate units transposed', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.multiply(
        meters(2, precision: Precision(3)),
        meters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(deci.meters, meters);

      // then
      expect(result, 60.0);
    });
    test('precision maintained', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.multiply(
        meters(2, precision: Precision(6)),
        meters(3, precision: Precision(3)),
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
        meters(6, precision: Precision(3)),
        meters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(meters, meters);

      // then
      expect(result, 2.0);
    });
    test('disparate units', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.divide(
        meters(6, precision: Precision(3)),
        meters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(meters, deci.meters);

      // then
      expect(result, 0.2);
    });
    test('disparate units transposed', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.divide(
        meters(6, precision: Precision(3)),
        meters(3, precision: Precision(3)),
      );

      // when
      final result = unit.as(deci.meters, meters);

      // then
      expect(result, 20.0);
    });
    test('precision maintained', () {
      // given
      final unit = DerivedMeasurement<Distance, Distance>.divide(
        meters(6, precision: Precision(6)),
        meters(3, precision: Precision(3)),
      );

      // when
      final result = unit.precision;

      // then
      expect(result, 3);
    });
    test('disparate measurements', () {
      // given
      final unit = DerivedMeasurement<Distance, Volume>.divide(
          miles(100, precision: Precision(3)),
          gallons(5, precision: Precision(3)));

      // when
      final result = unit.as(miles, gallons);

      // then
      expect(result, 20.0);
    });
    test('disparate measurements converted', () {
      // given
      final unit = DerivedMeasurement<Distance, Volume>.divide(
          miles(100, precision: Precision(3)),
          gallons(5, precision: Precision(3)));

      // when
      final result = unit.as(kilo.meters, liters);

      // then
      expect(result, 7.08);
    });
  });
}
