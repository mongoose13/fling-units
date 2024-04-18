import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import 'package:fling_units/generator/builders/base.dart';
import 'package:fling_units/generator/util/builder.dart';

Builder derivedCubicBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "cubic",
    DerivedCubicGenerator(),
  );
}

class DerivedCubicGenerator implements FlingGenerator {
  static final opTypes = <String, String>{"By": "multiply", "Per": "divide"};

  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;
    final prefixes = await builder.prefixes;

    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));

    builder.add(
      Class(
        (cubicUnit) => cubicUnit
          ..name = "CubicUnitBuilder"
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
                  ..returns = Reference("CubicUnitBuilder")
                  ..body = Code("CubicUnitBuilder(f.${prefix.name})"),
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
                          "DerivedUnitBy<DerivedMeasurementBy<${pair.measurement.name},${pair.measurement.name}>, ${pair.measurement.name}>")
                      ..body = Code(
                          "DerivedUnitBy(DerivedUnitBy(_prefix.${pair.unit.name}, _prefix.${pair.unit.name}), _prefix.${pair.unit.name}, name: \"\${_prefix.${pair.unit.name}.toString()}³\")"),
                  ),
                ),
          ),
      ),
    );
    builder.add(
      Field(
        (square) => square
          ..type = Reference("CubicUnitBuilder")
          ..name = "cubic"
          ..assignment = Code("CubicUnitBuilder()"),
      ),
    );
  }
}
