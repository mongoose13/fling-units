import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Derived', () {
    group('multiply', () {
      test('same units', () {
        // given
        final unit = product(meters, meters)(2, 3);

        // when
        final result = unit.as(product(meters, meters));

        // then
        expect(result, 6.0);
      });
      test('disparate units', () {
        // given
        final unit = product(meters, meters)(2, 3);

        // when
        final result = unit.as(product(meters, deci.meters));

        // then
        expect(result, 60.0);
      });
      test('disparate units transposed', () {
        // given
        final unit = product(meters, meters)(2, 3);

        // when
        final result = unit.as(product(deci.meters, meters));

        // then
        expect(result, 60.0);
      });
    });

    group('divide', () {
      test('same units', () {
        // given
        final unit = ratio(meters, meters)(6, 3);

        // when
        final result = unit.as(ratio(meters, meters));

        // then
        expect(result, 2.0);
      });
      test('disparate units', () {
        // given
        final unit = ratio(meters, meters)(6, 3);

        // when
        final result = unit.as(ratio(meters, deci.meters));

        // then
        expect(result, 0.2);
      });
      test('disparate units transposed', () {
        // given
        final unit = ratio(meters, meters)(6, 3);

        // when
        final result = unit.as(ratio(deci.meters, meters));

        // then
        expect(result, 20.0);
      });
      test('disparate non-si units', () {
        // given
        final unit = ratio(miles, hours)(6, 3).withPrecisionOf(3);

        // when
        final result = unit.as(ratio(meters, seconds));

        // then
        expect(result, 0.894);
      });
      test('disparate non-si units default interpreter division', () {
        // given
        final unit = ratio(miles, hours)(6, 3);

        // when
        final result = unit.toString();

        // then
        expect(result, '2.0 mi⋅h⁻¹');
      });
      test('disparate non-si units default interpreter multiplication', () {
        // given
        final unit = product(miles, hours)(6, 3);

        // when
        final result = unit.toString();

        // then
        expect(result, '18.0 mi⋅h');
      });
    });

    group('toString', () {
      test('product', () {
        // given
        final unit = product(meters, feet)(2, 3);

        // when
        final result = unit.toString();

        // then
        expect(result, '6.0 m⋅ft');
      });
      test('square', () {
        // given
        final unit = square(feet)(2, 3).withPrecisionOf(3);

        // when
        final result = unit.toString();

        // then
        expect(result, '6.0 ft²');
      });
      test('ratio', () {
        // given
        final unit = ratio(meters, seconds)(6, 3);

        // when
        final result = unit.toString();

        // then
        expect(result, '2.0 m⋅s⁻¹');
      });
      test('withDefaultUnit no change', () {
        // given
        final unit = square(feet)(2, 3).withPrecisionOf(3);

        // when
        final result = unit.butAs(square(feet)).toString();

        // then
        expect(result, '6.0 ft²');
      });
      test('withDefaultUnit partial change', () {
        // given
        final unit = product(feet, feet)(2, 3).withPrecisionOf(3);

        // when
        final result = unit.butAs(product(inches, feet)).toString();

        // then
        expect(result, '72.0 in⋅ft');
      });
      test('withDefaultUnit full change', () {
        // given
        final unit = product(meters, feet)(2, 3).withPrecisionOf(3);

        // when
        final result = unit.butAs(product(feet, inches)).toString();

        // then
        expect(result, '775.0 ft⋅in');
      });
    });
  });
}
