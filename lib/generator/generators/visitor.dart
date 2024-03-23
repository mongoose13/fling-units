import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import '../util/builder.dart';

Builder visitorBuilder(BuilderOptions options) {
  return VisitorBuilder(options);
}

class VisitorBuilder extends Builder {
  VisitorBuilder(BuilderOptions options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final builder = FlingLibraryBuilder(buildStep);
    final measurements = await builder.measurements;

    builder.add(
        Directive.partOf("package:fling_units/src/core/visitor_base.dart"));
    builder.add(
      Class(
        (visitorClass) => visitorClass
          ..abstract = true
          ..name = "MeasurementVisitor"
          ..docs.addAll("""Base class for measurement visitors.

The [Visitor Pattern](https://en.wikipedia.org/wiki/Visitor_pattern) allows
for double-dispatch on an object structure so that a Visitor can operate on
any subset of [Measurement] types and treat each type differently without
needing control statements or type checks (e.g. `if`, `switch`, or `is`)."""
              .split("\n")
              .map((line) => "/// $line"))
          ..methods.addAll(
            measurements.map(
              (measurement) => Method(
                (method) => method
                  ..name = "visit${measurement.name}"
                  ..requiredParameters.add(
                    Parameter(
                      (parameter) => parameter
                        ..name = "measurement"
                        ..type = Reference(measurement.name),
                    ),
                  ),
              ),
            ),
          ),
      ),
    );

    buildStep.writeAsString(buildStep.allowedOutputs.first, builder.flush());
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': ["src/generated/visitor.dart"]
      };
}
