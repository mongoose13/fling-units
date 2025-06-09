part of "library.dart";

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

  /// Constructs a [Precision] with a particular style.
  static Precision having({
    int? digitsAfterDecimal,
    int? significantDigits,
  }) {
    if (digitsAfterDecimal != null) {
      return DigitsAfterDecimal(digitsAfterDecimal);
    }
    return SignificantDigits(
        significantDigits ?? SignificantDigits.maximumPrecision);
  }

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

/// Measurement precision in terms of digits after the decimal point.
class DigitsAfterDecimal extends Precision {
  const DigitsAfterDecimal(this.digits);

  static const none = DigitsAfterDecimal(0);

  final int digits;

  @override
  int significantDigits(double target) =>
      Precision.digitsBeforeDecimal(target) + math.max(0, digits);

  @override
  double apply(num value) => digits >= 0
      ? double.parse(value.toStringAsFixed(digits))
      : double.parse(value.toStringAsPrecision(
          digits + Precision.digitsBeforeDecimal(value.toDouble())));

  @override
  bool operator ==(Object other) =>
      other is DigitsAfterDecimal && other.digits == digits;

  @override
  int get hashCode => digits.hashCode;
}

///
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
