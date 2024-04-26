import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:fling_units/generator/builders/base.dart';

import '../util/builder.dart';

Builder visitorBuilder(BuilderOptions options) {
  return FlingBuilderBase("visitor", VisitorGenerator());
}

class VisitorGenerator implements FlingGenerator {
  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;

    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));
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
          ..mixins.addAll(
            [
              Reference("f.TemperatureVisitorMixin"),
            ],
          )
          ..methods.addAll(
            measurements.map(
              (measurement) => Method(
                (method) => method
                  ..name = "visit${measurement.name}"
                  ..requiredParameters.add(
                    Parameter(
                      (parameter) => parameter
                        ..name = "measurement"
                        ..type =
                            Reference("Measurement<f.${measurement.name}>"),
                    ),
                  )
                  ..body = Code(""),
              ),
            ),
          ),
      ),
    );
  }
}
