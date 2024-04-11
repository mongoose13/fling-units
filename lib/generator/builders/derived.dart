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
  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;

    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));
    builder.add(
      Class(
        (derivedUnitBy) => derivedUnitBy
          ..name = "DerivedUnitByBuilder"
          ..types.add(Reference("T extends Measurement<T>"))
          ..docs.addAll("""Blah blah""".split("\n").map((line) => "/// $line"))
          ..fields.add(
            Field(
              (first) => first
                ..docs.add("/// The first unit.")
                ..modifier = FieldModifier.final$
                ..name = "_first"
                ..type = Reference("Unit<T>"),
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
                      ..name = "_first",
                  ),
                ),
            ),
          )
          ..methods.addAll(measurements.expand(
            (measurement) => measurement.units.map(
              (unit) => Method(
                (method) => method
                  ..type = MethodType.getter
                  ..returns = Reference("DerivedUnitBy<T, ${measurement.name}>")
                  ..name = unit.singularName
                  ..lambda = true
                  ..body = Code("DerivedUnitBy(_first, f.$unit)"),
              ),
            ),
          )

/*
            measurements.expand((measurement) => measurement.units).map(
                  (unit) => Method(
                    (method) => method
                      ..type = MethodType.getter
                      ..returns = Reference("DerivedUnitBy<T, ${measurement}>")
                      ..name = unit
                      ..lambda = true
                      ..body = Code("DerivedUnitBy(_first, f.$unit)"),
                  ),
                ),
                */
              ),
      ),
    );
  }
}
