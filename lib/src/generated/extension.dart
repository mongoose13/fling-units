part of 'package:fling_units/src/core/library.dart';

/// Wrapper class for extensions on [num] types.
///
/// The main purpose is to limit the legal syntax to things that make sense, in
/// particular for extensions that make use of an SI prefix. For example, if we
/// were to have the prefixes return another [num] instead, the following would
/// be possible, but not necessarily desirable:
/// ```dart
/// a = 3.kilo.meters;       // Sensible.
/// b = 3.kilo.kilo.meters;  // Confusing! Prefixes should not be chained.
/// c = 3.kilo.floor();      // Confusing! Other methods on num should not be used.
/// d = 3.kilo;              // Confusing! Can be used anywhere a num is required.
/// ```
///
/// Having the prefix extensions return instances of this class instead of [num]
/// prevents all but the first usage (the one we want) demonstrated above.
class NumExtension {
  const NumExtension(
    this._prefix,
    this._value,
  );

  /// The prefix being applied to the number.
  final MeasurementPrefix _prefix;

  /// The number being extended.
  final num _value;

  /// Creates a(n) amperes measurement.
  Charge get amperes => ChargeInterpreter.amperes.withPrefix(_prefix)(_value);

  /// Creates a(n) fat measurement.
  Pony get fat => PonyInterpreter.fat.withPrefix(_prefix)(_value);

  /// Creates a(n) ugly measurement.
  Pony get ugly => PonyInterpreter.ugly.withPrefix(_prefix)(_value);

  /// Creates a(n) lazy measurement.
  Pony get lazy => PonyInterpreter.lazy.withPrefix(_prefix)(_value);
}
