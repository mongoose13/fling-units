import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Derived', () {
    group('single', () {
      group('toString', () {
        test('inverts', () {
          // given
          final unit = seconds.inverted;

          // when
          final result = unit.toString();

          // then
          expect(result, "s⁻¹");
        });
        test('inverts with prefix', () {
          // given
          final unit = centi.seconds.inverted;

          // when
          final result = unit.toString();

          // then
          expect(result, "cs⁻¹");
        });
      });

      group('call', () {
        test('keeps default units', () {
          // given
          final unit = centi.seconds.inverted;

          // when
          final measurement = unit(2.4).withPrecision(DigitsAfterDecimal(2));

          // then
          expect(measurement.defaultUnit, centi.seconds.inverted);
        });
        test('keeps default value', () {
          // given
          final unit = centi.seconds.inverted;

          // when
          final measurement = unit(2.4).withPrecision(DigitsAfterDecimal(2));

          // then
          expect(measurement.defaultValue, 2.4);
        });
        test('keeps precision', () {
          // given
          final unit = centi.seconds.inverted;

          // when
          final measurement = unit(2.4).withPrecision(DigitsAfterDecimal(2));

          // then
          expect(measurement.precision, DigitsAfterDecimal(2));
        });
        test('converts to SI', () {
          // given
          final unit = centi.seconds.inverted;

          // when
          final measurement = unit(2.4).withPrecision(DigitsAfterDecimal(2));

          // then
          expect(measurement.as(seconds.inverted), 240.0);
        });
        test('converts to other', () {
          // given
          final unit = minutes.inverted;

          // when
          final measurement = unit(2.4).withPrecision(DigitsAfterDecimal(2));

          // then
          expect(measurement.as(hours.inverted), 144.0);
        });
      });
    });

    group('double', () {
      group('call', () {
        test('keeps default units', () {
          // given
          final unit = DerivedUnit2.build(meters, meters);

          // when
          final result = unit(6).withPrecision(DigitsAfterDecimal(2));

          // then
          expect(result.defaultUnit, unit);
        });
        test('keeps default value', () {
          // given
          final unit = DerivedUnit2.build(meters, meters);

          // when
          final result = unit(6).withPrecision(DigitsAfterDecimal(2));

          // then
          expect(result.defaultValue, 6.0);
        });
        test('keeps precision', () {
          // given
          final unit = DerivedUnit2.build(meters, meters);

          // when
          final result = unit(6).withPrecision(DigitsAfterDecimal(2));

          // then
          expect(result.precision, DigitsAfterDecimal(2));
        });
      });

      group('as', () {
        group('product', () {
          test('same units', () {
            // given
            final unit = DerivedUnit2.build(meters, meters)(6);

            // when
            final result = unit.as(DerivedUnit2.build(meters, meters));

            // then
            expect(result, 6.0);
          });
          test('disparate units', () {
            // given
            final unit = DerivedUnit2.build(meters, meters)(6)
                .withPrecision(DigitsAfterDecimal(2));

            // when
            final result = unit.as(DerivedUnit2.build(meters, deci.meters));

            // then
            expect(result, 60.0);
          });
          test('disparate units transposed', () {
            // given
            final unit = DerivedUnit2.build(meters, meters)(6)
                .withPrecision(DigitsAfterDecimal(2));

            // when
            final result = unit.as(DerivedUnit2.build(deci.meters, meters));

            // then
            expect(result, 60.0);
          });
        });

        group('ratio', () {
          test('same units', () {
            // given
            final measurement = DerivedUnit2.build(meters, meters.inverted)(2);

            // when
            final result =
                measurement.as(DerivedUnit2.build(meters, meters.inverted));

            // then
            expect(result, 2.0);
          });
          test('disparate units', () {
            // given
            final unit = DerivedUnit2.build(meters, meters.inverted)(2);

            // when
            final result =
                unit.as(DerivedUnit2.build(meters, deci.meters.inverted));

            // then
            expect(result, 0.2);
          });
          test('disparate units transposed', () {
            // given
            final unit = DerivedUnit2.build(meters, meters.inverted)(2);

            // when
            final result =
                unit.as(DerivedUnit2.build(deci.meters, meters.inverted));

            // then
            expect(result, 20.0);
          });
          test('disparate non-si units', () {
            // given
            final unit = DerivedUnit2.build(miles, hours.inverted)(2)
                .withPrecision(DigitsAfterDecimal(3));

            // when
            final result =
                unit.as(DerivedUnit2.build(meters, seconds.inverted));

            // then
            expect(result, 0.894);
          });
          test('disparate non-si units default interpreter division', () {
            // given
            final unit = DerivedUnit2.build(miles, hours.inverted)(2);

            // when
            final result = unit.toString();

            // then
            expect(result, '2.0 mi⋅h⁻¹');
          });
          test('disparate non-si units default interpreter multiplication', () {
            // given
            final unit = DerivedUnit2.build(miles, hours)(18.0);

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
          final unit = DerivedUnit2.build(meters, feet)(6);

          // when
          final result = unit.toString();

          // then
          expect(result, '6.0 m⋅ft');
        });
        test('square', () {
          // given
          final unit = square(feet)(6).withPrecision(DigitsAfterDecimal(2));

          // when
          final result = unit.toString();

          // then
          expect(result, '6.0 ft²');
        });
        test('ratio', () {
          // given
          final unit = DerivedUnit2.build(meters, seconds.inverted)(2);

          // when
          final result = unit.toString();

          // then
          expect(result, '2.0 m⋅s⁻¹');
        });
        test('same units merge', () {
          // given
          final unit = DerivedUnit2.build(centi.meters, centi.meters);

          // when
          final result = unit.toString();

          // then
          expect(result, "cm²");
        });
        test('butAs no change', () {
          // given
          final unit = square(feet)(6).withPrecision(DigitsAfterDecimal(2));

          // when
          final result = unit.butAs(square(feet)).toString();

          // then
          expect(result, '6.0 ft²');
        });
        test('butAs partial change', () {
          // given
          final unit = square(feet)(6).withPrecision(DigitsAfterDecimal(2));

          // when
          final result =
              unit.butAs(DerivedUnit2.build(inches, feet)).toString();

          // then
          expect(result, '72.0 in⋅ft');
        });
        test('butAs full change', () {
          // given
          final unit = DerivedUnit2.build(meters, feet)(6)
              .withPrecision(DigitsAfterDecimal(0));

          // when
          final result =
              unit.butAs(DerivedUnit2.build(feet, inches)).toString();

          // then
          expect(result, '236.0 ft⋅in');
        });
        test('butAs full change and initial prefixes', () {
          // given
          final unit = DerivedUnit2.build(centi.meters, deka.feet)(6)
              .withPrecision(SignificantDigits(3));

          // when
          final result =
              unit.butAs(DerivedUnit2.build(feet, inches)).toString();

          // then
          expect(result, '23.6 ft⋅in');
        });
        test('butAs full change and full prefixes', () {
          // given
          final unit = DerivedUnit2.build(centi.meters, deka.feet)(6)
              .withPrecision(SignificantDigits(3));

          // when
          final result = unit
              .butAs(DerivedUnit2.build(milli.feet, deci.inches))
              .toString();

          // then
          expect(result, '236000.0 mft⋅din');
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
            final measurement =
                cubic(meters)(3).withPrecision(DigitsAfterDecimal(2));

            // when
            final result = measurement.as(cubic(meters));

            // then
            expect(result, 3.0);
          });
          test('from SI to other', () {
            // given
            final measurement = cubic(meters)(2);

            // when
            final result = measurement.as(cubic(feet));

            // then
            expect(result, closeTo(70.6, 0.05));
          });
          test('from other to SI', () {
            // given
            final measurement =
                cubic(inches)(144).withPrecision(SignificantDigits(3));

            // when
            final result = measurement.as(cubic(meters));

            // then
            expect(result, 0.00236);
          });
          test('from other to other', () {
            // given
            final measurement = cubic(inches)(144);

            // when
            final result = measurement.as(cubic(feet));

            // then
            expect(result, closeTo(0.0833, 5e-5));
          });
          test('from other to other with prefix', () {
            // given
            final measurement = cubic(deka.inches)(3);

            // when
            final result = measurement.as(cubic(centi.feet));

            // then
            expect(result, closeTo(1.74e6, 5e3));
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
          final result = unit
              .using(3.feet, 1.yards, 4.inches)
              .withPrecision(SignificantDigits(3));

          // then
          expect(result.defaultValue, 0.085);
        });
      });
    });
  });
}
