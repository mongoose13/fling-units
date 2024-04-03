import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import '../util/builder.dart';

Builder measurementPrefixBuilder(BuilderOptions options) {
  return MeasurementPrefixBuilder(options);
}

class MeasurementPrefixBuilder extends Builder {
  MeasurementPrefixBuilder(BuilderOptions options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final builder = FlingLibraryBuilder(buildStep);
    final measurements = await builder.measurements;

    builder.add(Code("// GENERATED CODE - DO NOT MODIFY BY HAND\n"));
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

    buildStep.writeAsString(buildStep.allowedOutputs.first, builder.flush());
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': ['src/generated/prefix.dart']
      };
}
