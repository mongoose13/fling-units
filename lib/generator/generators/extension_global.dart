import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import '../util/builder.dart';

Builder numExtensionBuilder(BuilderOptions options) {
  return GlobalExtensionBuilder(options);
}

class GlobalExtensionBuilder extends Builder {
  GlobalExtensionBuilder(BuilderOptions options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final builder = FlingLibraryBuilder(buildStep);
    final measurements = await builder.measurements;

    builder.add(
        Directive.import("package:fling_units/fling_units.dart"));
    builder.add(
      Class(
        (extensionClass) => extensionClass
          ..abstract = true
          ..name = "NumExtension"
          ..docs.addAll("""Wrapper class for extensions on [num] types.

The main purpose is to limit the legal syntax to things that make sense, in
particular for extensions that make use of an SI prefix. For example, if we
were to have the prefixes return another [num] instead, the following would
be possible, but not necessarily desirable:
```dart
a = 3.kilo.meters;       // Sensible.
b = 3.kilo.kilo.meters;  // Confusing! Prefixes should not be chained.
c = 3.kilo.floor();      // Confusing! Other methods on num should not be used.
d = 3.kilo;              // Confusing! Can be used anywhere a num is required.
```

Having the prefix extensions return instances of this class instead of [num]
prevents all but the first usage (the one we want) demonstrated above."""
              .split("\n")
              .map((line) => "/// $line"))
          ..fields.add(
            Field(
              (prefix) => prefix
                ..docs.add("/// The prefix being applied to the number.")
                ..modifier = FieldModifier.final$
                ..name = "_prefix"
                ..type = Reference("MeasurementPrefix"),
            ),
          )
          ..fields.add(
            Field(
              (value) => value
                ..docs.add("/// The number being extended.")
                ..modifier = FieldModifier.final$
                ..name = "_value"
                ..type = Reference("num"),
            ),
          )
          ..constructors.add(
            Constructor(
              (constructor) => constructor
                ..constant = true
                ..requiredParameters.add(
                  Parameter(
                    (prefix) => prefix
                      ..toThis = true
                      ..name = "_prefix",
                  ),
                )
                ..requiredParameters.add(
                  Parameter(
                    (value) => value
                      ..toThis = true
                      ..name = "_value",
                  ),
                ),
            ),
          )
          ..methods.addAll(
            measurements
                .expand((measurement) => [
                      for (final unit in measurement.units)
                        (measurement: measurement.name, unit: unit)
                    ])
                .map(
                  (pair) => Method(
                    (method) => method
                      ..docs.add("/// Creates a(n) ${pair.unit} measurement.")
                      ..lambda = true
                      ..type = MethodType.getter
                      ..name = pair.unit
                      ..returns = Reference(pair.measurement)
                      ..body = Code(
                          "${pair.measurement}Interpreter.${pair.unit}.withPrefix(_prefix)(_value)"),
                  ),
                ),
          ),
      ),
    );
    /*
  /// Creates an ampere measurement.
  Charge get amperes => ChargeInterpreter._amperes._withPrefix(_prefix)(_value);
    */

    buildStep.writeAsString(buildStep.allowedOutputs.first, builder.flush());
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': ["src/generated/extension.dart"]
      };
}
