//part of "../library.dart";
import "precision.dart";

import "dart:math" as math;

/// A [Precision] that ensures only a certain number of significant digits are
/// maintained.
///
/// See here for an explanation: https://en.wikipedia.org/wiki/Significant_figures
class SignificantDigits extends Precision {
  /// The highest precision allowed.
  static const int maximumPrecision = 21;

  /// A single digit precision.
  static const SignificantDigits single = SignificantDigits(1);

  /// Maximum precision.
  static const SignificantDigits max = SignificantDigits(maximumPrecision);

  /// The maximum number of significant digits this precision allows.
  int get digits => math.min(21, math.max(1, _digits));

  /// Constructs a [SignificantDigits] of the specified number of digits.
  ///
  /// Due to Dart language limitations on doubles, the maximum precision is 21
  /// digits. Any attempt to use a higher number will fall back silently to 21.
  ///
  /// Precision below 1 digit is meaningless and will fall back to 1.
  const SignificantDigits([this._digits = maximumPrecision]);

  @override
  double apply(num value) => double.parse(value.toStringAsPrecision(digits));

  @override
  int significantDigits(double target) => digits;

  @override
  bool operator ==(Object other) =>
      other is SignificantDigits && other.digits == digits;

  @override
  int get hashCode => digits.hashCode;

  /// This precision (uncorrected), in number of digits.
  final int _digits;
}
