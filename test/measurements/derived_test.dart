import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Derived', () {
    group('single', () {
      group('toString', () {
        test('inverts', () {
          // given
          final unit = inverse(seconds);

          // when
          final result = unit.toString();

          // then
          expect(result, "s⁻¹");
        });
        test('inverts with prefix', () {
          // given
          final unit = inverse(centi.seconds);

          // when
          final result = unit.toString();

          // then
          expect(result, "cs⁻¹");
        });
      });
      group('call', () {
        test('keeps default units', () {
          // given
          final unit = inverse(centi.seconds);

          // when
          final measurement = unit(2.4, Precision(3));

          // then
          expect(measurement.defaultUnit, inverse(centi.seconds));
        });
        test('keeps default value', () {
          // given
          final unit = inverse(centi.seconds);

          // when
          final measurement = unit(2.4, Precision(3));

          // then
          expect(measurement.defaultValue, 2.4);
        });
        test('keeps precision', () {
          // given
          final unit = inverse(centi.seconds);

          // when
          final measurement = unit(2.4, Precision(3));

          // then
          expect(measurement.precision, 3);
        });
        test('converts to SI', () {
          // given
          final unit = inverse(centi.seconds);

          // when
          final measurement = unit(2.4, Precision(3));

          // then
          expect(measurement.as(inverse(seconds)), 240.0);
        });
        test('converts to other', () {
          // given
          final unit = inverse(minutes);

          // when
          final measurement = unit(2.4, Precision(3));

          // then
          expect(measurement.as(inverse(seconds)), 0.04);
        });
      });
    });

    group('double', () {
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
          final unit = product(meters, meters)(2, 3).withPrecisionOf(3);

          // when
          final result = unit.as(product(meters, deci.meters));

          // then
          expect(result, 60.0);
        });
        test('disparate units transposed', () {
          // given
          final unit = product(meters, meters)(2, 3).withPrecisionOf(3);

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
        test('same units merge', () {
          // given
          final unit = product(centi.meters, centi.meters);

          // when
          final result = unit.toString();

          // then
          expect(result, "cm²");
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
          final unit = square(feet)(2, 3).withPrecisionOf(3);

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
          expect(result, '236.0 ft⋅in');
        });
        test('withDefaultUnit full change and initial prefixes', () {
          // given
          final unit =
              product(centi.meters, deka.feet)(2, 3).withPrecisionOf(3);

          // when
          final result = unit.butAs(product(feet, inches)).toString();

          // then
          expect(result, '23.6 ft⋅in');
        });
        test('withDefaultUnit full change and full prefixes', () {
          // given
          final unit =
              product(centi.meters, deka.feet)(2, 3).withPrecisionOf(3);

          // when
          final result =
              unit.butAs(product(milli.feet, deci.inches)).toString();

          // then
          expect(result, '236000.0 mft⋅din');
        });
      });
    });
  });
}
