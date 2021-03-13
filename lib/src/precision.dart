part of fling_units;

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
/// Distance.meters(3.14159, precision: Precision(3)) ==
///   Distance.meters(3.14159, precision: Precision(5)); // evaluates to false
/// ```
class Precision {
  /// A single digit precision.
  static const Precision single = Precision._single();

  /// Maximum precision.
  static const Precision max = Precision._max();

  /// This precision, in number of digits.
  final int precision;

  /// Constructs a [Precision] of the specified number of digits.
  ///
  /// Due to Dart language limitations on doubles, the maximum precision is 21
  /// digits. Any attempt to use a higher number will fail with an
  /// [ArgumentError]. Precision below 1 digit is meaningless and will also
  /// result in an [ArgumentError].
  Precision(final this.precision) {
    if (precision < 1 || precision > 21) {
      throw ArgumentError(
          'Precision must be a positive integer between 1 and 21');
    }
  }

  /// Combines two [Precision]s per the "multiplication rule".
  ///
  /// Use this when multiplying or dividing two numbers to determine the correct
  /// output precision. See [Wikipedia on Precision Arithmetic](
  /// https://en.wikipedia.org/wiki/Significant_figures#Arithmetic)
  /// for details.
  Precision.combine(final Precision a, final Precision b)
      : this(math.min(a.precision, b.precision));

  /// Combines two [Precision]s per the "addition rule".
  ///
  /// Use this when adding or subtracting two numbers to determine the correct
  /// output precision. See [Wikipedia on Precision Arithmetic](
  /// https://en.wikipedia.org/wiki/Significant_figures#Arithmetic)
  /// for details.
  ///
  /// Note that currently the result will always have maximum precision (for the
  /// time being - future versions will fix this).
  Precision.add(final Precision a, final Precision b) : this._max();

  /// Interprets the specified number according to this Precision.
  double withPrecision(final double value) =>
      double.parse(value.toStringAsPrecision(precision));

  @override
  bool operator ==(final dynamic other) =>
      other is Precision && other.precision == precision;

  @override
  int get hashCode => precision.hashCode;

  /// Single digit precision.
  const Precision._single() : precision = 1;

  /// Maximum precision.
  const Precision._max() : precision = 21;
}