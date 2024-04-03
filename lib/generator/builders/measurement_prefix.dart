import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:fling_units/generator/builders/base.dart';

import '../util/builder.dart';

Builder measurementPrefixBuilder(BuilderOptions options) {
  return FlingBuilderBase("prefix", MeasurementPrefixGenerator());
}

class MeasurementPrefixGenerator implements FlingGenerator {
  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;

    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));
    builder.add(
      Class(
        (prefixClass) => prefixClass
          ..mixins.addAll(
            measurements.map(
              (measurement) => Reference("${measurement.name}Prefix"),
            ),
          )
          ..name = "MeasurementPrefix"
          ..fields.add(
            Field(
              (name) => name
                ..name = "unitMultiplier"
                ..type = Reference("final double"),
            ),
          )
          ..fields.add(
            Field(
              (name) => name
                ..name = "name"
                ..type = Reference("final String"),
            ),
          )
          ..constructors.add(
            Constructor(
              (constructor) => constructor
                ..constant = true
                ..requiredParameters.add(
                  Parameter(
                    (multiplier) => multiplier
                      ..name = "unitMultiplier"
                      ..toThis = true,
                  ),
                )
                ..optionalParameters.add(
                  Parameter(
                    (name) => name
                      ..named = true
                      ..name = "name"
                      ..toThis = true
                      ..defaultTo = Code("\"\""),
                  ),
                ),
            ),
          )
          ..constructors.add(
            Constructor(
              (unit) => unit
                ..constant = true
                ..name = "unit"
                ..initializers.add(Code("unitMultiplier = 1.0"))
                ..initializers.add(Code("name = \"\"")),
            ),
          )
          ..methods.add(
            Method(
              (prefix) => prefix
                ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                ..lambda = true
                ..name = "prefix"
                ..type = MethodType.getter
                ..returns = Reference("MeasurementPrefix")
                ..body = Code("this"),
            ),
          )
          ..methods.add(
            Method(
              (toString) => toString
                ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                ..lambda = true
                ..name = "toString"
                ..body = Code("name"),
            ),
          ),
      ),
    );
  }
}
