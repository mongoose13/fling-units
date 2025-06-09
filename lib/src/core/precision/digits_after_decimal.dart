import "dart:math" as math;

import "precision.dart";

/// Measurement precision in terms of digits after the decimal point.
class DigitsAfterDecimal extends Precision {
  /// Constructs a [Precision] that represents significance for only a certain
  /// number of digits after the decimal point in a measurement.
  ///
  /// A zero indicates that whole numbers are significant while any decimal
  /// portions are not.
  ///
  /// A negative value indicates that the early powers of ten are not
  /// significant. For example, a -3 here means that the ones, tens, and
  /// hundreds place are not significant. If the value is negative and this
  /// precision is applied to a number that is too small to support the required
  /// magnitude, 0 is produced. For example:
  /// ```dart
  /// DigitsAfterDecimal(0).apply(31.4159); // 31
  /// DigitsAfterDecimal(2).apply(31.4159); // 31.42
  /// DigitsAfterDecimal(-1).apply(31.4159); // 30
  /// DigitsAfterDecimal(-2).apply(31.4159); // 0
  /// ```
  const DigitsAfterDecimal(this.digits);

  /// A [Precision] representing exactly zero significant digits after the
  /// decimal.
  ///
  /// Only whole numbers will be considered significant, and any number of
  /// digits before the decimal are significant.
  static const none = DigitsAfterDecimal(0);

  /// The number of digits after the decimal that should be considered
  /// significant.
  final int digits;

  @override
  int significantDigits(double target) {
    final dbd = Precision.digitsBeforeDecimal(target);
    return switch (dbd + digits) {
      int result when result > digits => result,
      int result when result >= 0 =>
        digits - _positionOfFirstNonzeroDecimal(target),
      _ => 0,
    };
  }

  /// Finds the zero-based position of the first non-zero digit in a [double]
  /// value whose absolute value is less than one.
  ///
  /// Throws an [ArgumentError] if the absolute value is not less than one.
  ///
  /// Examples:
  /// * 0.0 => 0
  /// * 0.1 => 0
  /// * 0.01 => 1
  /// * 0.0001 => 3
  int _positionOfFirstNonzeroDecimal(double value) {
    return switch (value.abs()) {
      >= 1.0 => throw ArgumentError.value(
          value, "value", "not a number with magnitude less than 1"),
      double abs => abs.toStringAsPrecision(1).length - 3,
    };
  }

  @override
  double apply(num value) => switch (significantDigits(value.toDouble())) {
        int sigDig when sigDig > 0 =>
          double.parse(value.toStringAsPrecision(math.min(21, sigDig))),
        _ => 0.0,
      };

  @override
  bool operator ==(Object other) =>
      other is DigitsAfterDecimal && other.digits == digits;

  @override
  int get hashCode => digits.hashCode;
}
