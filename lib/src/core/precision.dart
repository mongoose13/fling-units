part of "library.dart";

/// Represents the amount of precision for a measurement.
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
/// Distance.meters(3.14159, precision: 3) ==
///   Distance.meters(3.14159, precision: 5); // evaluates to false
/// ```
class Precision {
  /// The highest precision allowed.
  static const int maximumPrecision = 21;

  /// A single digit precision.
  static const Precision single = Precision(1);

  /// Maximum precision.
  static const Precision max = Precision(maximumPrecision);

  /// This precision, in number of digits.
  int get precision => math.min(21, math.max(1, _precision));

  /// Constructs a [Precision] of the specified number of digits.
  ///
  /// Due to Dart language limitations on doubles, the maximum precision is 21
  /// digits. Any attempt to use a higher number will fall back silently to 21.
  ///
  /// Precision below 1 digit is meaningless and will fall back to 1.
  const Precision(this._precision);

  /// Combines two [Precision]s per the "multiplication rule".
  ///
  /// Use this when multiplying or dividing two numbers to determine the correct
  /// output precision. See [Wikipedia on Precision Arithmetic](
  /// https://en.wikipedia.org/wiki/Significant_figures#Arithmetic)
  /// for details.
  Precision.combine(Iterable<int> precisions)
      : this(precisions
            .reduce((current, element) => math.min(current, element)));

  /// Combines two [Precision]s per the "addition rule".
  ///
  /// Use this when adding or subtracting two numbers to determine the correct
  /// output precision. See [Wikipedia on Precision Arithmetic](
  /// https://en.wikipedia.org/wiki/Significant_figures#Arithmetic)
  /// for details.
  static int addition(Measurement a, Measurement b) {
    if (a.isInfinite || b.isInfinite) {
      return Precision.maximumPrecision;
    }
    final precisionA = digitsAfterDecimal(a);
    final precisionB = digitsAfterDecimal(b);
    final beforeDecimal =
        digitsBeforeDecimal(a.preciseDefaultValue + b.preciseDefaultValue);
    int afterPrecision = math.min(
        beforeDecimal + math.min(precisionA, precisionB), maximumPrecision);
    return afterPrecision;
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
        measurement.precision -
            int.parse(string.substring(locationOfE + 1)) -
            1,
        0);
  }

  /// Calculates the number of digits (significant or not) before the decimal.
  static int digitsBeforeDecimal(double number) {
    if (number.isInfinite || number.isNaN) {
      return Precision.max.precision;
    }
    final string = number.toStringAsExponential();
    return math.max(
        int.parse(string.substring(string.indexOf('e') + 1)) + 1, 0);
  }

  /// Interprets the specified number according to this Precision.
  double apply(num value) => double.parse(value.toStringAsPrecision(precision));

  @override
  bool operator ==(Object other) =>
      other is Precision && other.precision == precision;

  @override
  int get hashCode => precision.hashCode;

  /// This precision (uncorrected), in number of digits.
  final int _precision;
}
