import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'base.dart';

import '../util/builder.dart';

Builder perGlobalBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "per",
    GlobalPerGenerator(),
  );
}

class GlobalPerGenerator implements FlingGenerator {
  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;

    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));
    builder.add(
      Class(
        (measurement) => measurement
          ..name = "UnitPer"
          ..types.addAll([
            Reference("N extends f.Unit<D>"),
            Reference("D extends f.Dimension")
          ])
          ..fields.add(
            Field(
              (numerator) => numerator
                ..name = "numerator"
                ..type = Reference("N")
                ..modifier = FieldModifier.final$,
            ),
          )
          ..constructors.add(
            Constructor(
              (constructor) => constructor
                ..requiredParameters.add(
                  Parameter(
                    (numerator) => numerator
                      ..name = "numerator"
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
                .map(
                  (pair) => Method(
                    (method) => method
                      ..docs.add(
                          "/// Creates a derived unit with [${pair.unit.name}] as the denominator.")
                      ..lambda = true
                      ..type = MethodType.getter
                      ..name = pair.unit.singularName
                      ..returns = Reference(
                          "f.DerivedUnit2<f.UnitNumerator<D>, f.UnitDenominator<f.${pair.measurement.name}>, D, f.${pair.measurement.name}>")
                      ..body = Code(
                          "f.DerivedUnit2.build(f.UnitNumerator(numerator), f.UnitDenominator(f.${pair.unit.name}),)"),
                  ),
                ),
          ),
      ),
    );
  }
}
