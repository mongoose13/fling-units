import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import 'package:fling_units/generator/builders/base.dart';
import 'package:fling_units/generator/util/builder.dart';

Builder derivedSquareBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "square",
    DerivedSquareGenerator(),
  );
}

class DerivedSquareGenerator implements FlingGenerator {
  static final opTypes = <String, String>{"By": "multiply", "Per": "divide"};

  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;
    final prefixes = await builder.prefixes;

    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));

    builder.add(
      Class(
        (squareUnit) => squareUnit
          ..name = "SquareUnitBuilder"
          ..fields.add(
            Field(
              (prefix) => prefix
                ..modifier = FieldModifier.final$
                ..type = Reference("MeasurementPrefix")
                ..name = "_prefix",
            ),
          )
          ..constructors.add(
            Constructor(
              (constructor) => constructor
                ..constant = true
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
                  ..returns = Reference("SquareUnitBuilder")
                  ..body = Code("SquareUnitBuilder(f.${prefix.name})"),
              ),
            ),
          )
          ..methods.addAll(
            measurements
                .expand((measurement) => measurement.units.map((unit) => (
                      measurement: measurement,
                      unit: unit,
                    )))
                .map(
                  (pair) => Method(
                    (unitMethod) => unitMethod
                      ..lambda = true
                      ..type = MethodType.getter
                      ..name = pair.unit.name
                      ..returns = Reference(
                          "DerivedUnitBy<${pair.measurement.name},${pair.measurement.name}>")
                      ..body = Code(
                          "DerivedUnitBy(_prefix.${pair.unit.name}, _prefix.${pair.unit.name})"),
                  ),
                ),
          ),
      ),
    );
    builder.add(
      Field(
        (square) => square
          ..type = Reference("SquareUnitBuilder")
          ..name = "square"
          ..assignment = Code("SquareUnitBuilder()"),
      ),
    );
    builder.addAll(
      opTypes.keys.map(
        (opType) => Class(
          (squareUnit) => squareUnit
            ..name = "SquareDerivedUnit${opType}Builder"
            ..types.add(Reference("T extends Measurement<T>"))
            ..fields.add(
              Field(
                (first) => first
                  ..docs.add("/// The first unit.")
                  ..modifier = FieldModifier.final$
                  ..type = Reference("Unit<T>")
                  ..name = "_first",
              ),
            )
            ..fields.add(
              Field(
                (prefix) => prefix
                  ..docs.add("/// The squared unit's prefix.")
                  ..modifier = FieldModifier.final$
                  ..type = Reference("MeasurementPrefix")
                  ..name = "_prefix",
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
            ..methods.addAll(
              prefixes.map(
                (prefix) => Method(
                  (prefixMethod) => prefixMethod
                    ..lambda = true
                    ..type = MethodType.getter
                    ..name = prefix.name
                    ..returns =
                        Reference("SquareDerivedUnit${opType}Builder<T>")
                    ..body = Code(
                        "SquareDerivedUnit${opType}Builder(_first, f.${prefix.name})"),
                ),
              ),
            )
            ..methods.addAll(
              measurements
                  .expand((measurement) => measurement.units.map((unit) => (
                        measurement: measurement,
                        unit: unit,
                      )))
                  .map(
                    (pair) => Method(
                      (unitMethod) => unitMethod
                        ..lambda = true
                        ..type = MethodType.getter
                        ..name = pair.unit.name
                        ..returns = Reference(
                            "DerivedUnit$opType<T, DerivedMeasurement$opType<${pair.measurement.name},${pair.measurement.name}>>")
                        ..body = Code(
                            "DerivedUnit$opType(_first, DerivedUnit$opType(_prefix.${pair.unit.name}, _prefix.${pair.unit.name}))"),
                    ),
                  ),
            ),
        ),
      ),
    );
  }
}
