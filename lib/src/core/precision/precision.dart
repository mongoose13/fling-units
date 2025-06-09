import "dart:math" as math;

import "package:fling_units/fling_units.dart";

export "significant_digits.dart";
export "digits_after_decimal.dart";

/// A representation of the certainty in a measurement.
///
/// Because measurements are not perfectly precise, we do not want to imply that
/// we know more than what we actually know to be true. For details, see
/// [Significant Figures](https://en.wikipedia.org/wiki/Significant_figures)
///
/// Measurements such as [Distance] will make use of a [Precision] you provide
/// by giving answers within the bounds of the precision you specify when asked
/// for any measurement value.
///
/// In general, measurements will not be considered "equal" if they have
/// different precision, even if their measured values are the same.
///
/// ```dart
/// Distance.meters(3.14159, significantDigits: 3) ==
///   Distance.meters(3.14159, significantDigits: 5); // evaluates to false
/// ```
abstract class Precision {
  const Precision();

  /// A [Precision] implying the maximum possible precision on the platform.
  static const Precision max = SignificantDigits();

  /// Interprets the specified number according to this [Precision].
  double apply(num value);

  /// Returns the number of significant digits this precision would result in
  /// when applied to the given target number.
  ///
  /// For example, if a precision that ensured there were always two digits
  /// after the decimal point were given a target of 85.263, it would report 4
  /// significant digits (the 8, 5, 2, and 6). When given 0.056 instead, it
  /// would give 2 (the 0 right after the decimal and the 5).
  int significantDigits(double target);

  /// Combines two [SignificantDigits]s per the "multiplication rule".
  ///
  /// Use this when multiplying or dividing two numbers to determine the correct
  /// output precision. See [Wikipedia on Precision Arithmetic](
  /// https://en.wikipedia.org/wiki/Significant_figures#Arithmetic)
  /// for details.
  static Precision combine(Iterable<Precision> precisions, double target) =>
      SignificantDigits(precisions
          .map((precision) => precision.significantDigits(target))
          .reduce((current, element) => math.min(current, element)));

  /// Combines two [SignificantDigits]s per the "addition rule".
  ///
  /// Use this when adding or subtracting two numbers to determine the correct
  /// output precision. See [Wikipedia on Precision Arithmetic](
  /// https://en.wikipedia.org/wiki/Significant_figures#Arithmetic)
  /// for details.
  static Precision addition(Measurement a, Measurement b) {
    if (a.isInfinite || b.isInfinite) {
      return SignificantDigits.max;
    }
    final precisionA = Precision.digitsAfterDecimal(a);
    final precisionB = Precision.digitsAfterDecimal(b);
    final beforeDecimal = Precision.digitsBeforeDecimal(
        a.preciseDefaultValue + b.preciseDefaultValue);
    int afterPrecision = math.min(
        beforeDecimal + math.min(precisionA, precisionB),
        SignificantDigits.maximumPrecision);
    return SignificantDigits(afterPrecision);
  }

  /// Calculates the number of significant digits after the decimal point.
  ///
  /// This only considers digits that fall within the measurement's precision,
  /// e.g.:
  ///
  /// ```dart
  /// digitsAfterDecimal(meters(1.2345));                           // 4
  /// digitsAfterDecimal(meters(1.2345, precision: 3));  // 2
  /// ```
  static int digitsAfterDecimal(Measurement measurement) {
    if (measurement.isInfinite || measurement.isNaN) {
      return 0;
    }
    final string = measurement.preciseDefaultValue.toStringAsExponential();
    final locationOfE = string.indexOf('e');
    return math.max(
        measurement.precision.significantDigits(measurement.defaultValue) -
            int.parse(string.substring(locationOfE + 1)) -
            1,
        0);
  }

  /// Calculates the number of digits (significant or not) before the decimal.
  static int digitsBeforeDecimal(double target) {
    if (target.isInfinite || target.isNaN) {
      return max.significantDigits(target);
    }
    final string = target.toStringAsExponential();
    return math.max(
        int.parse(string.substring(string.indexOf('e') + 1)) + 1, 0);
  }
}
