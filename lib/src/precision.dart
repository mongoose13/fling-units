import 'dart:math';

/// Represents the amount of precision for a measurement.
///
/// Because measurements are not perfectly precise, we do not want to imply that
/// we know more than what we actually know to be true.
///
/// For example, if I measure a tree to be 4 meters high, I most likely mean
/// "about 4 meters high" rather than "exactly 4 meters high". I may be off by
/// a few centimeters, and that's OK by me. But if we want to use this
/// measurement to calculate its daily rate of growth, we may have a problem: my
/// measurement is not precise enough to capture the small changes that are
/// likely to occur. If I measure the tree again the next day and decide once
/// again that it is "about 4 meters high" I should not conclude that the tree
/// has grown precisely 0 millimeters - I just don't have the measurement
/// precision to make such a statement.
///
/// By setting a precision on each measurement, you are giving information about
/// how precise you know the measurement to be. If you pulled out a millimeter
/// ruler and determined that the tree is actually very close to 4000
/// millimeters then you could say that the tree is 4000 millimeters high, and
/// you have four digits of precision. This is more precise than my 4 meter high
/// measurement because I only have one digit of precision. Even though the
/// measurement values are the same, your measurement carries a lot more
/// precision than mine does.
///
/// Measurements such as Distance will make use of a Precision you provide by
/// giving answers within the bounds of the precision you specify. For example,
/// if I converted my measurement to feet, I would get a result of 10 feet - I
/// simply do not have enough precision to keep a second digit. However, your
/// measurement (being more precise) would give closer to 13.12 feet - we know
/// we can give additional digits and remain accurate.
///
/// In general, measurements will not be considered "equal" if they have
/// different precision, even if their values are the same. For example, my
/// measurement of the tree (4m, precision 1) is not equal to your measurement
/// of the tree (4m, precision 4).
class Precision {
  /// A single digit precision.
  static const Precision single = Precision._single();

  /// Maximum precision.
  static const Precision max = Precision._max();

  /// The precision, in number of digits.
  final int precision;

  /// Constructs a Precision of the specified number of digits.
  ///
  /// Due to Dart language limitations on doubles, the maximum precision is 21
  /// digits. Any attempt to use a higher number will fail with an
  /// ArgumentError.
  Precision(final this.precision) {
    if (precision < 1 || precision > 21) {
      throw ArgumentError(
          'Precision must be a positive integer between 1 and 21');
    }
  }

  /// Combines two Precisions per the "multiplication rule". Use this when
  /// multiplying two numbers to determine the correct output precision.
  Precision.combine(final Precision a, final Precision b)
      : this(min(a.precision, b.precision));

  /// Combines two Precisions per the "addition rule". Use this when adding two
  /// numbers to determine the correct output precision.
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

  const Precision._single() : precision = 1;

  const Precision._max() : precision = 21;
}
