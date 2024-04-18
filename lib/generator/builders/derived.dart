import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:fling_units/generator/builders/base.dart';

import '../util/builder.dart';

Builder derivedBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "derived",
    DerivedGenerator(),
  );
}

class DerivedGenerator implements FlingGenerator {
  static final opTypes = <String, String>{"By": "multiply", "Per": "divide"};

  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;
    final prefixes = await builder.prefixes;

    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));
    final genericType = Reference("T extends Measurement<T>");

    for (final opType in opTypes.keys) {
      final unitClassName = "DerivedUnit$opType";
      final measurementClassName = "DerivedMeasurement$opType";
      final operator = opTypes[opType];
      builder.add(
        Class(
          (unitBuilder) => unitBuilder
            ..name = "${unitClassName}Builder"
            ..types.add(genericType)
            ..docs
                .addAll("""Blah blah""".split("\n").map((line) => "/// $line"))
            ..fields.add(
              Field(
                (first) => first
                  ..docs.add("/// The first unit.")
                  ..modifier = FieldModifier.final$
                  ..name = "_first"
                  ..type = Reference("Unit<T>"),
              ),
            )
            ..fields.add(
              Field(
                (prefix) => prefix
                  ..docs.add("/// The second unit's prefix.")
                  ..modifier = FieldModifier.final$
                  ..name = "_prefix"
                  ..type = Reference("MeasurementPrefix"),
              ),
            )
            ..constructors.add(
              Constructor(
                (constructor) => constructor
                  ..constant = true
                  ..requiredParameters.add(
                    Parameter(
                      (first) => first
                        ..toThis = true
                        ..name = "_first",
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (prefix) => prefix
                        ..toThis = true
                        ..name = "_prefix"
                        ..defaultTo = Code("const MeasurementPrefix.unit()"),
                    ),
                  ),
              ),
            )
            ..methods.add(
              Method(
                (square) => square
                  ..lambda = true
                  ..type = MethodType.getter
                  ..name = "square"
                  ..returns = Reference("Square${unitClassName}Builder<T>")
                  ..body =
                      Code("Square${unitClassName}Builder(_first, _prefix)"),
              ),
            )
            ..methods.addAll(
              prefixes.map(
                (prefix) => Method(
                  (prefixMethod) => prefixMethod
                    ..lambda = true
                    ..type = MethodType.getter
                    ..name = prefix.name
                    ..returns = Reference("DerivedUnit${opType}Builder<T>")
                    ..body = Code(
                        "DerivedUnit${opType}Builder(_first, f.${prefix.name},)"),
                ),
              ),
            )
            ..methods.addAll(
              measurements.expand(
                (measurement) => measurement.units.map(
                  (unit) => Method(
                    (method) => method
                      ..type = MethodType.getter
                      ..returns =
                          Reference("$unitClassName<T, ${measurement.name}>")
                      ..name = unit.singularName
                      ..lambda = true
                      ..body = Code(
                          "$unitClassName(_first, _prefix.${unit.singularName},)"),
                  ),
                ),
              ),
            ),
        ),
      );
      builder.add(
        Class(
          (measurementBuilder) => measurementBuilder
            ..name = "${measurementClassName}Builder"
            ..types.add(genericType)
            ..fields.add(
              Field(
                (measurement) => measurement
                  ..docs.add("/// The first measurement.")
                  ..name = "_measurement"
                  ..modifier = FieldModifier.final$
                  ..type = Reference("Measurement<T>"),
              ),
            )
            ..fields.add(
              Field(
                (prefix) => prefix
                  ..docs.add("/// The second unit's prefix.")
                  ..modifier = FieldModifier.final$
                  ..name = "_prefix"
                  ..type = Reference("MeasurementPrefix"),
              ),
            )
            ..constructors.add(
              Constructor(
                (constructor) => constructor
                  ..requiredParameters.add(
                    Parameter((measurement) => measurement
                      ..toThis = true
                      ..name = "_measurement"),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (prefix) => prefix
                        ..toThis = true
                        ..name = "_prefix"
                        ..defaultTo = Code("const MeasurementPrefix.unit()"),
                    ),
                  ),
              ),
            )
            ..methods.addAll(
              prefixes.map(
                (prefix) => Method(
                  (prefixMethod) => prefixMethod
                    ..lambda = true
                    ..type = MethodType.getter
                    ..name = prefix.name
                    ..returns = Reference("${measurementClassName}Builder<T>")
                    ..body = Code(
                        "${measurementClassName}Builder(_measurement, f.${prefix.name},)"),
                ),
              ),
            )
            ..methods.addAll(
              measurements.expand(
                (measurement) => measurement.units.map(
                  (unit) => Method(
                    (method) => method
                      ..type = MethodType.getter
                      ..returns = Reference(
                          "$measurementClassName<T, ${measurement.name}>")
                      ..name = unit.singularName
                      ..lambda = true
                      ..body = Code(
                          "$measurementClassName(magnitude: _measurement._magnitude, defaultUnit: _measurement.defaultUnit.$operator(_prefix.${unit.name},),)"),
                  ),
                ),
              ),
            ),
        ),
      );
    }
  }
}
