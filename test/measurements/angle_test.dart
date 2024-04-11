import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

void main() {
  group('Angle', () {
    group('zero', () {
      test('has 0.0 value', () {
        // given
        final measurement = Angle.zero();

        // when
        final result = measurement.as(radians);

        // then
        expect(result, 0.0);
      });
      test('has max precision', () {
        // given
        final measurement = Angle.zero();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = Angle.zero(radians);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.0 rad');
      });
    });
    group('infinity', () {
      test('has infinite value', () {
        // given
        final measurement = Angle.infinite();

        // when
        final result = measurement.as(radians);

        // then
        expect(result, double.infinity);
      });
      test('has max precision', () {
        // given
        final measurement = Angle.infinite();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = Angle.infinite(radians);

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'Infinity rad');
      });
    });
    group('negativeInfinity', () {
      test('has infinite negative value', () {
        // given
        final measurement = Angle.negativeInfinite();

        // when
        final result = measurement.as(radians);

        // then
        expect(result, double.negativeInfinity);
      });
      test('has max precision', () {
        // given
        final measurement = Angle.negativeInfinite();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = Angle.negativeInfinite(radians);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '-Infinity rad');
      });
    });
    group('right', () {
      test('has right angle value', () {
        // given
        final measurement = AngleExtension.right();

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 0.25);
      });
      test('has max precision', () {
        // given
        final measurement = AngleExtension.right();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = AngleExtension.right().butAs(turns);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.25 turn');
      });
    });
    group('straight', () {
      test('has straight angle value', () {
        // given
        final measurement = AngleExtension.straight();

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 0.5);
      });
      test('has max precision', () {
        // given
        final measurement = AngleExtension.straight();

        // when
        final result = measurement.precision;

        // then
        expect(result, Precision.max.precision);
      });
      test('with custom default interpreter', () {
        // given
        final interpreter = AngleExtension.straight().butAs(turns);

        // when
        final result = interpreter.toString();

        // then
        expect(result, '0.5 turn');
      });
    });

    group('sum', () {
      test('adds parts', () {
        // given
        final measurement = Angle.sum([
          degrees(2.1),
          arcMinutes(5.0),
          arcSeconds(0.3),
        ], precision: Precision(5));

        // when
        final result = measurement.as(degrees);

        // then
        expect(result, 2.1834);
      });
    });

    group('as', () {
      test('converts to unit', () {
        // given
        final measurement = turns(1.234, precision: Precision(5));

        // when
        final result = measurement.as(radians);

        // then
        expect(result, 7.7535);
      });
    });

    group('turns', () {
      test('converts to base', () {
        // given
        final measurement = turns(1.234, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 1.234);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.turns(1.234e3, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 1.234);
      });
    });

    group('radians', () {
      test('converts to base', () {
        // given
        final measurement = radians(1.234, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 0.19640);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.radians(1.234e3, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 0.19640);
      });
    });

    group('gradians', () {
      test('converts to base', () {
        // given
        final measurement = gradians(1.234, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 3.0850e-3);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.gradians(1.234e3, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 3.0850e-3);
      });
    });

    group('degrees', () {
      test('converts to base', () {
        // given
        final measurement = degrees(123.4, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 0.34278);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.degrees(123.4e3, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 0.34278);
      });
    });

    group('arc minutes', () {
      test('converts to base', () {
        // given
        final measurement = arcMinutes(123.4, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 5.713e-3);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.arcMinutes(123.4e3, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 5.713e-3);
      });
    });

    group('arc seconds', () {
      test('converts to base', () {
        // given
        final measurement = arcSeconds(1234, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 9.5216e-4);
      });
      test('applies prefixes', () {
        // given
        final measurement = milli.arcSeconds(1234e3, precision: Precision(5));

        // when
        final result = measurement.as(turns);

        // then
        expect(result, 9.5216e-4);
      });
    });

    group('toString', () {
      test('interpreter name', () {
        // given
        final interpreter = degrees;

        // when
        final result = interpreter.toString();

        // then
        expect(result, '°');
      });
      test('interpreter name with prefix', () {
        // given
        final interpreter = milli.degrees;

        // when
        final result = interpreter.toString();

        // then
        expect(result, 'm°');
      });
      test('maintains units', () {
        // given
        final measurement = degrees(3.4).withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 °');
      });
      test('maintains prefix', () {
        // given
        final measurement = milli.degrees(3.4).withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 m°');
      });
      test('extension maintains prefix', () {
        // given
        final measurement = 3.4.milli.degrees.withPrecisionOf(3);

        // when
        final result = measurement.toString();

        // then
        expect(result, '3.4 m°');
      });
      test('modified precision', () {
        // given
        final measurement = deci.degrees(23.45).withPrecisionOf(3);

        // when
        final result = measurement.withPrecisionOf(2).toString();

        // then
        expect(result, '23.0 d°');
      });
    });

    group('isRight', () {
      test('right angle', () {
        // given
        final measurement = 0.25.turns;

        // when
        final result = measurement.isRight;

        // then
        expect(result, isTrue);
      });
      test('negative right angle', () {
        // given
        final measurement = -0.25.turns;

        // when
        final result = measurement.isRight;

        // then
        expect(result, isTrue);
      });
      test('not right angle', () {
        // given
        final measurement = 0.2.turns;

        // when
        final result = measurement.isRight;

        // then
        expect(result, isFalse);
      });
      test('negative not right angle', () {
        // given
        final measurement = -0.2.turns;

        // when
        final result = measurement.isRight;

        // then
        expect(result, isFalse);
      });
      test('zero angle', () {
        // given
        final measurement = Angle.zero();

        // when
        final result = measurement.isRight;

        // then
        expect(result, isFalse);
      });
      test('3/4 angle', () {
        // given
        final measurement = 0.75.turns;

        // when
        final result = measurement.isRight;

        // then
        expect(result, isFalse);
      });
      test('const constructor right angle', () {
        // given
        final measurement = AngleExtension.right();

        // when
        final result = measurement.isRight;

        // then
        expect(result, isTrue);
      });
    });

    group('isStraight', () {
      test('straight angle', () {
        // given
        final measurement = 0.5.turns;

        // when
        final result = measurement.isStraight;

        // then
        expect(result, isTrue);
      });
      test('negative straight angle', () {
        // given
        final measurement = -0.5.turns;

        // when
        final result = measurement.isStraight;

        // then
        expect(result, isTrue);
      });
      test('not straight angle', () {
        // given
        final measurement = 0.52.turns;

        // when
        final result = measurement.isStraight;

        // then
        expect(result, isFalse);
      });
      test('negative not straight angle', () {
        // given
        final measurement = -0.52.turns;

        // when
        final result = measurement.isStraight;

        // then
        expect(result, isFalse);
      });
      test('zero angle', () {
        // given
        final measurement = Angle.zero();

        // when
        final result = measurement.isStraight;

        // then
        expect(result, isFalse);
      });
      test('full turn angle', () {
        // given
        final measurement = 1.turns;

        // when
        final result = measurement.isStraight;

        // then
        expect(result, isFalse);
      });
      test('const constructor straight angle', () {
        // given
        final measurement = AngleExtension.straight();

        // when
        final result = measurement.isStraight;

        // then
        expect(result, isTrue);
      });
    });

    group('isAcute', () {
      test('acute angle', () {
        // given
        final measurement = 0.1.turns;

        // when
        final result = measurement.isAcute;

        // then
        expect(result, isTrue);
      });
      test('negative acute angle', () {
        // given
        final measurement = -0.1.turns;

        // when
        final result = measurement.isAcute;

        // then
        expect(result, isTrue);
      });
      test('not acute angle', () {
        // given
        final measurement = 0.3.turns;

        // when
        final result = measurement.isAcute;

        // then
        expect(result, isFalse);
      });
      test('negative not acute angle', () {
        // given
        final measurement = -0.3.turns;

        // when
        final result = measurement.isAcute;

        // then
        expect(result, isFalse);
      });
      test('zero angle', () {
        // given
        final measurement = Angle.zero();

        // when
        final result = measurement.isAcute;

        // then
        expect(result, isTrue);
      });
      test('right angle', () {
        // given
        final measurement = AngleExtension.right();

        // when
        final result = measurement.isAcute;

        // then
        expect(result, isFalse);
      });
    });

    group('isObtuse', () {
      test('obtuse angle', () {
        // given
        final measurement = 0.3.turns;

        // when
        final result = measurement.isObtuse;

        // then
        expect(result, isTrue);
      });
      test('negative obtuse angle', () {
        // given
        final measurement = -0.3.turns;

        // when
        final result = measurement.isObtuse;

        // then
        expect(result, isTrue);
      });
      test('acute angle', () {
        // given
        final measurement = 0.2.turns;

        // when
        final result = measurement.isObtuse;

        // then
        expect(result, isFalse);
      });
      test('negative acute angle', () {
        // given
        final measurement = -0.2.turns;

        // when
        final result = measurement.isObtuse;

        // then
        expect(result, isFalse);
      });
      test('zero angle', () {
        // given
        final measurement = Angle.zero();

        // when
        final result = measurement.isObtuse;

        // then
        expect(result, isFalse);
      });
      test('right angle', () {
        // given
        final measurement = AngleExtension.right();

        // when
        final result = measurement.isObtuse;

        // then
        expect(result, isFalse);
      });
      test('straight angle', () {
        // given
        final measurement = AngleExtension.straight();

        // when
        final result = measurement.isObtuse;

        // then
        expect(result, isFalse);
      });
    });
  });
}
