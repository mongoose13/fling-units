import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Volume', () {
    group('zero', () {
      test('has 0.0 distance', () {
        // given
        final result = Volume.zero();

        // then
        expect(result.asVolume(Volume.cubic(meters)), 0.0);
      });
      test('has max precision', () {
        // given
        final result = Volume.zero();

        // then
        expect(result.precision, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = Volume.zero(fluidOunces);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 fl oz');
      });
    });
    group('infinity', () {
      test('has infinite distance', () {
        // given
        final result = Volume.infinite();

        // then
        expect(result.asVolume(Volume.cubic(meters)), double.infinity);
      });
      test('has max precision', () {
        // given
        final result = Volume.infinite();

        // then
        expect(result.precision, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = Volume.infinite(fluidOunces);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity fl oz');
      });
    });
    group('negativeInfinity', () {
      test('has infinite negative distance', () {
        // given
        final result = Volume.negativeInfinite();

        // then
        expect(result.asVolume(Volume.cubic(meters)), double.negativeInfinity);
      });
      test('has max precision', () {
        // given
        final result = Volume.negativeInfinite();

        // then
        expect(result.precision, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = Volume.negativeInfinite(fluidOunces);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity fl oz');
      });
    });

    group('of', () {
      test('multiplies component parts', () {
        // given
        final volume = Volume.of(
          meters(2, precision: Precision(5)),
          meters(3, precision: Precision(5)),
          meters(4, precision: Precision(5)),
        );

        // when
        final result = volume.asVolume(Volume.cubic(meters));

        // then
        expect(result, 24.0);
      });
      test('multiplies decimals', () {
        // given
        final volume = Volume.of(
          meters(2.345, precision: Precision(5)),
          meters(3.456, precision: Precision(5)),
          meters(4.567, precision: Precision(5)),
        );

        // when
        final result = volume.asVolume(Volume.cubic(meters));

        // then
        expect(result, 37.012);
      });
      test('retains correct precision', () {
        // given
        final volume = Volume.of(
          meters(2, precision: Precision(5)),
          meters(3, precision: Precision(3)),
          meters(4, precision: Precision(4)),
        );

        // when
        final result = volume.precision;

        // then
        expect(result, 3);
      });
      test('automatically named', () {
        // given
        final volume = Volume.of(
          meters(2, precision: Precision(5)),
          inches(3, precision: Precision(3)),
          feet(4, precision: Precision(4)),
        );

        // when
        final result = volume.toString();

        // then
        expect(result, '24.0 m⋅in⋅ft');
      });
    });

    group('as', () {
      test('converts to unit', () {
        // given
        final mass = grams(123.456, precision: Precision(8));

        // when
        final result = mass.as(pounds);

        // then
        expect(result, 0.27217389);
      });
    });

    group('sum', () {
      test('adds parts', () {
        // given
        final volume = Volume.sum([
          Volume.cubic(milli.meters)(1000),
          Volume.cubic(centi.meters)(200),
          Volume.cubic(deci.meters)(30),
          Volume.cubic(meters)(4),
        ], precision: Precision(10));

        // when
        final result = volume.asVolume(Volume.cubic(meters));

        // then
        expect(result, 4.030201);
      });
    });

    group('as', () {
      test('converts to unit', () {
        // given
        final mass = grams(123.456, precision: Precision(8));

        // when
        final result = mass.as(pounds);

        // then
        expect(result, 0.27217389);
      });
    });

    group('liters', () {
      test('converts to base', () {
        // given
        final volume = liters(1234.0, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 1234.0);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.liters(1234.0, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 1.234);
      });
    });
    group('teaspoons', () {
      test('converts to base', () {
        // given
        final volume = teaspoons(1234.0, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 7.3045);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.teaspoons(1.234e6, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 7.3045);
      });
    });
    group('tablespoons', () {
      test('converts to base', () {
        // given
        final volume = tablespoons(1234.0, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 21.914);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.tablespoons(1.234e6, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 21.914);
      });
    });
    group('fluidOunces', () {
      test('converts to base', () {
        // given
        final volume = fluidOunces(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 35.062);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.fluidOunces(1.234e6, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 35.062);
      });
    });
    group('cups', () {
      test('converts to base', () {
        // given
        final volume = cups(1.234e2, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 35.062);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.cups(1.234e5, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 35.062);
      });
    });
    group('pints', () {
      test('converts to base', () {
        // given
        final volume = pints(1.234, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 0.70124);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.pints(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 0.70124);
      });
    });
    group('quarts', () {
      test('converts to base', () {
        // given
        final volume = quarts(1.234, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 1.4025);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.quarts(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 1.4025);
      });
    });
    group('gallons', () {
      test('converts to base', () {
        // given
        final volume = gallons(1.234, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 5.6099);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.gallons(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 5.6099);
      });
    });
    group('usTeaspoons', () {
      test('converts to base', () {
        // given
        final volume = usTeaspoons(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 6.0823);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.usTeaspoons(1.234e6, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 6.0823);
      });
    });
    group('usTablespoons', () {
      test('converts to base', () {
        // given
        final volume = usTablespoons(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 18.247);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.usTablespoons(1.234e6, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 18.247);
      });
    });
    group('usFluidOunces', () {
      test('converts to base', () {
        // given
        final volume = usFluidOunces(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 36.494);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.usFluidOunces(1.234e6, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 36.494);
      });
    });
    group('usCups', () {
      test('converts to base', () {
        // given
        final volume = usCups(1.234, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 0.29195);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.usCups(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 0.29195);
      });
    });
    group('usPints', () {
      test('converts to base', () {
        // given
        final volume = usPints(1.234, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 0.5839);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.usPints(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 0.5839);
      });
    });
    group('usQuarts', () {
      test('converts to base', () {
        // given
        final volume = usQuarts(1.234, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 1.1678);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.usQuarts(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 1.1678);
      });
    });
    group('usGallons', () {
      test('converts to base', () {
        // given
        final volume = usGallons(1.234, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 4.6712);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.usGallons(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 4.6712);
      });
    });
    group('usLegalCups', () {
      test('converts to base', () {
        // given
        final volume = usLegalCups(1.234, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 0.29616);
      });
      test('applies prefixes', () {
        // given
        final volume = milli.usLegalCups(1.234e3, precision: Precision(5));

        // when
        final result = volume.asVolume(liters);

        // then
        expect(result, 0.29616);
      });
    });

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = cups;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'cup');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.cups;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'mcup');
      });
      test('maintains units', () {
        // given
        final measurement = cups(3.4).withPrecision(Precision(3));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 cup');
      });
      test('maintains prefix', () {
        // given
        final measurement = milli.cups(3.4).withPrecision(Precision(3));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mcup');
      });
      test('extension maintains prefix', () {
        // given
        final measurement = 3.4.milli.cups.withPrecision(Precision(3));

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 mcup');
      });
      test('modified precision', () {
        // given
        final measurement = deci.cups(23.45).withPrecision(Precision(3));

        // when
        final result = measurement.withPrecision(Precision(2)).toString();

        // then
        expect(result, '23.0 dcup');
      });
      test('modified units', () {
        // given
        final measurement = deci.cups(23.45).withPrecision(Precision(3));

        // when
        final result = measurement.withDefaultUnit(milli.liters).toString();

        // then
        expect(result, '666.0 mL');
      });
      test('cubic interpreter', () {
        // given
        final interpreter = Volume.cubic(feet);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'ft³');
      });
      test('cubic measurement', () {
        // given
        final measurement = Volume.cubic(feet)(2.3).withPrecision(Precision(2));

        // when
        final result = measurement.toString();

        // then
        expect(result, '2.3 ft³');
      });
    });
  });
}
