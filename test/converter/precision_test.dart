import 'package:fling_units/src/precision.dart';
import 'package:test/test.dart';

void main() {
  group('Constructors', () {
    test('zero precision', () {
      expect(() => Precision(0), throwsArgumentError);
    });
    test('negative precision', () {
      expect(() => Precision(-2), throwsArgumentError);
    });
    test('high precision', () {
      expect(() => Precision(22), throwsArgumentError);
    });
  });

  group('withPrecision', () {
    test('partial whole number precision', () {
      //given
      final precision = Precision(2);

      // when
      final result = precision.withPrecision(123.4321);

      // then
      expect(result, 120.0);
    });
    test('whole number precision', () {
      //given
      final precision = Precision(3);

      // when
      final result = precision.withPrecision(123.4321);

      // then
      expect(result, 123.0);
    });
    test('whole and decimal number precision', () {
      //given
      final precision = Precision(4);

      // when
      final result = precision.withPrecision(123.4321);

      // then
      expect(result, 123.4);
    });
    test('rounding at .5', () {
      //given
      final precision = Precision(4);

      // when
      final result = precision.withPrecision(123.45);

      // then
      expect(result, 123.5);
    });
    test('additional precision', () {
      //given
      final precision = Precision(5);

      // when
      final result = precision.withPrecision(1.23);

      // then
      expect(result, 1.23);
    });
  });

  group('combine', () {
    test('chooses smaller value', () {
      // given
      final precision1 = Precision(3);
      final precision2 = Precision(2);

      // when
      final result = Precision.combine(precision1, precision2);

      // then
      expect(result.precision, 2);
    });
  });

  group('add', () {
    test('always gives max value', () {
      // given
      final precision1 = Precision(3);
      final precision2 = Precision(2);

      // when
      final result = Precision.add(precision1, precision2);

      // then
      expect(result, Precision.max);
    });
  });
}
