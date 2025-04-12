import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'base.dart';

import '../generator.dart';

Builder prefixedMeasurementPerBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "prefix_measurement_per",
    PrefixedMeasurementPerGenerator(),
  );
}

typedef _GeneratorConfig = ({
  String name,
  String method,
  String firstParameter,
  String secondParameter,
  bool secondInverted,
  bool usePlural,
});

class PrefixedMeasurementPerGenerator implements FlingGenerator {
  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;

    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));

    for (final config in <_GeneratorConfig>[
      (
        name: "Per",
        method: "per",
        firstParameter: "numerator",
        secondParameter: "denominator",
        secondInverted: true,
        usePlural: false,
      ),
      (
        name: "Dot",
        method: "dot",
        firstParameter: "first",
        secondParameter: "second",
        secondInverted: false,
        usePlural: true,
      )
    ]) {
      builder.add(
        Class(
          (measurement) => measurement
            ..docs.add(
                """/// A builder for ${config.name}-type derived units that has already been configured with a prefix for
                 /// the possible ${config.secondParameter} units.
                 ///
                 /// These objects create [f.DerivedMeasurement2]s with a preconfigured ${config.firstParameter} measurement
                 /// and any ${config.secondParameter} unit. The resulting measurement acts as if the ${config.secondParameter}'s default
                 /// value is 1. For example:
                 /// ```dart
                 /// // 3 meters ${config.method} 1 second
                 /// 3.meters.${config.method}.second;
                 /// ```
                 /// 
                 /// The preconfigured prefix here will eventually apply to the ${config.secondParameter} unit chosen. For
                 /// example:
                 /// ```dart
                 /// // Here, the prefix is MeasurementPrefix.unit() (the default):
                 /// 3.meters.${config.method};
                 /// 
                 /// // Here, the prefix is milli:
                 /// 3.meters.${config.method}.milli;
                 /// 
                 /// // That prefix is applied to the ${config.secondParameter}, so this is "3 meters ${config.method} millisecond":
                 /// 3.meters.${config.method}.milli.second;
                 /// ```""")
            ..name = "PrefixedMeasurement${config.name}"
            ..types.addAll(
              [
                Reference("N extends f.Measurement<D, I>"),
                Reference("D extends f.Dimension"),
                Reference("I extends f.Dimension"),
              ],
            )
            ..fields.add(
              Field(
                (numerator) => numerator
                  ..docs.add(
                      "/// The ${config.firstParameter} measurement, which also defines the magnitude of the finished measurement.")
                  ..name = config.firstParameter
                  ..type = Reference("N")
                  ..modifier = FieldModifier.final$,
              ),
            )
            ..fields.add(
              Field(
                (prefix) => prefix
                  ..docs.add(
                      "/// The prefix for the ${config.secondParameter} unit.")
                  ..name = "prefix"
                  ..type = Reference("MeasurementPrefix")
                  ..modifier = FieldModifier.final$,
              ),
            )
            ..constructors.add(
              Constructor(
                (constructor) => constructor
                  ..docs.add(
                      "/// Creates a measurement builder preconfigured with a ${config.firstParameter} measurement and a prefix for the ${config.secondParameter}.")
                  ..requiredParameters.add(
                    Parameter(
                      (first) => first
                        ..name = config.firstParameter
                        ..toThis = true,
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (prefix) => prefix
                        ..name = "prefix"
                        ..named = true
                        ..defaultTo = Code("const MeasurementPrefix.unit()")
                        ..toThis = true,
                    ),
                  ),
              ),
            )
            ..methods.addAll(
              measurements
                  .expand((measurement) => [
                        for (final unit in measurement.units)
                          (measurement: measurement, unit: unit)
                      ])
                  .where((pair) => pair.unit.isVisible)
                  .map(
                (pair) {
                  return Method(
                    (method) => method
                      ..docs.add(
                          "/// Creates a derived measurement with [f.${pair.unit.name}] as the ${config.secondParameter}.")
                      ..lambda = true
                      ..type = MethodType.getter
                      ..name = config.usePlural
                          ? pair.unit.name
                          : pair.unit.singularName
                      ..returns = Reference(
                          "f.DerivedMeasurement2<D, f.${config.secondInverted ? "Inverted" : ""}${pair.measurement.name},"
                          "I, f.${config.secondInverted ? "" : "Inverted"}${pair.measurement.name}>")
                      ..body = Code(
                          "DerivedUnit2.build(${config.firstParameter}.defaultUnit, f.${pair.unit.name}.withPrefix(prefix)${config.secondInverted ? ".inverted" : ""})(${config.firstParameter}.defaultValue)"),
                  );
                },
              ),
            ),
        ),
      );
    }
  }
}
