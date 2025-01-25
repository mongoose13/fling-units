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
          final measurement = unit(2.4).withPrecision(3);

          // then
          expect(measurement.defaultUnit, inverse(centi.seconds));
        });
        test('keeps default value', () {
          // given
          final unit = inverse(centi.seconds);

          // when
          final measurement = unit(2.4).withPrecision(3);

          // then
          expect(measurement.defaultValue, 2.4);
        });
        test('keeps precision', () {
          // given
          final unit = inverse(centi.seconds);

          // when
          final measurement = unit(2.4).withPrecision(3);

          // then
          expect(measurement.precision, 3);
        });
        test('converts to SI', () {
          // given
          final unit = inverse(centi.seconds);

          // when
          final measurement = unit(2.4).withPrecision(3);

          // then
          expect(measurement.as(inverse(seconds)), 240.0);
        });
        test('converts to other', () {
          // given
          final unit = inverse(minutes);

          // when
          final measurement = unit(2.4).withPrecision(3);

          // then
          expect(measurement.as(inverse(hours)), 144.0);
        });
      });

      group('using', () {
        test('keeps the same default unit', () {
          // given
          final unit = inverse(seconds);

          // when
          final result = unit.using(2.minutes);

          // then
          expect(result.defaultUnit, unit);
        });
        test('sets correct default value', () {
          // given
          final unit = inverse(seconds);

          // when
          final result = unit.using(2.deci.minutes).withPrecision(3);

          // then
          expect(result.defaultValue, 0.0833);
        });
      });
    });

    group('double', () {
      group('call', () {
        test('keeps default units', () {
          // given
          final unit = product2(meters, meters);

          // when
          final result = unit(2, 3).withPrecision(3);

          // then
          expect(result.defaultUnit, unit);
        });
        test('keeps default value', () {
          // given
          final unit = product2(meters, meters);

          // when
          final result = unit(2, 3).withPrecision(3);

          // then
          expect(result.defaultValue, 6.0);
        });
        test('keeps precision', () {
          // given
          final unit = product2(meters, meters);

          // when
          final result = unit(2, 3).withPrecision(3);

          // then
          expect(result.precision, 3);
        });
      });

      group('as', () {
        group('product', () {
          test('same units', () {
            // given
            final unit = product2(meters, meters)(2, 3);

            // when
            final result = unit.as(product2(meters, meters));

            // then
            expect(result, 6.0);
          });
          test('disparate units', () {
            // given
            final unit = product2(meters, meters)(2, 3).withPrecision(3);

            // when
            final result = unit.as(product2(meters, deci.meters));

            // then
            expect(result, 60.0);
          });
          test('disparate units transposed', () {
            // given
            final unit = product2(meters, meters)(2, 3).withPrecision(3);

            // when
            final result = unit.as(product2(deci.meters, meters));

            // then
            expect(result, 60.0);
          });
        });

        group('ratio', () {
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
            final unit = ratio(miles, hours)(6, 3).withPrecision(3);

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
            final unit = product2(miles, hours)(6, 3);

            // when
            final result = unit.toString();

            // then
            expect(result, '18.0 mi⋅h');
          });
        });
      });

      group('toString', () {
        test('product', () {
          // given
          final unit = product2(meters, feet)(2, 3);

          // when
          final result = unit.toString();

          // then
          expect(result, '6.0 m⋅ft');
        });
        test('square', () {
          // given
          final unit = square(feet)(2, 3).withPrecision(3);

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
          final unit = product2(centi.meters, centi.meters);

          // when
          final result = unit.toString();

          // then
          expect(result, "cm²");
        });
        test('butAs no change', () {
          // given
          final unit = square(feet)(2, 3).withPrecision(3);

          // when
          final result = unit.butAs(square(feet)).toString();

          // then
          expect(result, '6.0 ft²');
        });
        test('butAs partial change', () {
          // given
          final unit = square(feet)(2, 3).withPrecision(3);

          // when
          final result = unit.butAs(product2(inches, feet)).toString();

          // then
          expect(result, '72.0 in⋅ft');
        });
        test('butAs full change', () {
          // given
          final unit = product2(meters, feet)(2, 3).withPrecision(3);

          // when
          final result = unit.butAs(product2(feet, inches)).toString();

          // then
          expect(result, '236.0 ft⋅in');
        });
        test('butAs full change and initial prefixes', () {
          // given
          final unit = product2(centi.meters, deka.feet)(2, 3).withPrecision(3);

          // when
          final result = unit.butAs(product2(feet, inches)).toString();

          // then
          expect(result, '23.6 ft⋅in');
        });
        test('butAs full change and full prefixes', () {
          // given
          final unit = product2(centi.meters, deka.feet)(2, 3).withPrecision(3);

          // when
          final result =
              unit.butAs(product2(milli.feet, deci.inches)).toString();

          // then
          expect(result, '236000.0 mft⋅din');
        });
      });

      group('using', () {
        test('keeps the same default unit', () {
          // given
          final unit = ratio(meters, seconds);

          // when
          final result = unit.using(3.feet, 1.minutes);

          // then
          expect(result.defaultUnit, unit);
        });
        test('sets correct default value', () {
          // given
          final unit = ratio(meters, seconds);

          // when
          final result = unit.using(3.feet, 2.deci.minutes).withPrecision(3);

          // then
          expect(result.defaultValue, 0.0762);
        });
      });
    });

    group('triple', () {
      group('cubic', () {
        group('toString', () {
          test('symbol', () {
            // given
            final unit = cubic(inches);

            // when
            final result = unit.toString();

            // then
            expect(result, "in³");
          });
        });

        group('as', () {
          test('from SI to SI', () {
            // given
            final measurement = cubic(meters)(3).withPrecision(3);

            // when
            final result = measurement.as(cubic(meters));

            // then
            expect(result, 3.0);
          });
          test('from SI to other', () {
            // given
            final measurement = cubic(meters)(2).withPrecision(3);

            // when
            final result = measurement.as(cubic(feet));

            // then
            expect(result, 70.6);
          });
          test('from other to SI', () {
            // given
            final measurement = cubic(inches)(144).withPrecision(3);

            // when
            final result = measurement.as(cubic(meters));

            // then
            expect(result, 0.00236);
          });
          test('from other to other', () {
            // given
            final measurement = cubic(inches)(144).withPrecision(3);

            // when
            final result = measurement.as(cubic(feet));

            // then
            expect(result, 0.0833);
          });
          test('from other to other with prefix', () {
            // given
            final measurement = cubic(deka.inches)(3).withPrecision(3);

            // when
            final result = measurement.as(cubic(centi.feet));

            // then
            expect(result, 1.74e6);
          });
        });
      });

      group('using', () {
        test('keeps the same default unit', () {
          // given
          final unit = cubic(meters);

          // when
          final result = unit.using(3.feet, 1.yards, 4.inches);

          // then
          expect(result.defaultUnit, unit);
        });
        test('sets correct default value', () {
          // given
          final unit = cubic(meters);

          // when
          final result = unit.using(3.feet, 1.yards, 4.inches).withPrecision(3);

          // then
          expect(result.defaultValue, 0.085);
        });
      });
    });
  });
}
