import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'base.dart';

import '../util/builder.dart';

Builder prefixedUnitPerBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "prefix_unit_per",
    PrefixedUnitPerGenerator(),
  );
}

class PrefixedUnitPerGenerator implements FlingGenerator {
  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;

    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));

    builder.add(
      Class(
        (measurement) => measurement
          ..name = "PrefixedUnitPer"
          ..types.addAll(
            [
              Reference("N extends f.Unit<D>"),
              Reference("D extends f.Dimension"),
            ],
          )
          ..fields.add(
            Field(
              (numerator) => numerator
                ..name = "numerator"
                ..type = Reference("N")
                ..modifier = FieldModifier.final$,
            ),
          )
          ..fields.add(
            Field(
              (prefix) => prefix
                ..name = "prefix"
                ..type = Reference("MeasurementPrefix")
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
                          "f.DerivedUnit2.build(f.UnitNumerator(numerator), f.UnitDenominator(prefix.${pair.unit.name}),)"),
                  ),
                ),
          ),
      ),
    );
    builder.add(
      Class(
        (measurement) => measurement
          ..name = "PrefixedUnitDot"
          ..types.addAll(
            [
              Reference("N extends f.Unit<D>"),
              Reference("D extends f.Dimension"),
            ],
          )
          ..fields.add(
            Field(
              (first) => first
                ..name = "first"
                ..type = Reference("N")
                ..modifier = FieldModifier.final$,
            ),
          )
          ..fields.add(
            Field(
              (prefix) => prefix
                ..name = "prefix"
                ..type = Reference("MeasurementPrefix")
                ..modifier = FieldModifier.final$,
            ),
          )
          ..constructors.add(
            Constructor(
              (constructor) => constructor
                ..requiredParameters.add(
                  Parameter(
                    (first) => first
                      ..name = "first"
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
                .map(
                  (pair) => Method(
                    (method) => method
                      ..docs.add(
                          "/// Creates a derived unit with [${pair.unit.name}] as the second unit in a product.")
                      ..lambda = true
                      ..type = MethodType.getter
                      ..name = pair.unit.name
                      ..returns = Reference(
                          "f.DerivedUnit2<f.UnitNumerator<D>, f.UnitNumerator<f.${pair.measurement.name}>, D, f.${pair.measurement.name}>")
                      ..body = Code(
                          "f.DerivedUnit2.build(f.UnitNumerator(first), f.UnitNumerator(prefix.${pair.unit.name}),)"),
                  ),
                ),
          ),
      ),
    );
  }
}
