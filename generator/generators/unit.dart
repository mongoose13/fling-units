import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import 'package:fling_units/src/core/annotations.dart';
import '../util/builder.dart';

Builder interpreterBuilder(BuilderOptions options) {
  return SharedPartBuilder([UnitGenerator(options)], 'interpreter');
}

class UnitGenerator extends GeneratorForAnnotation<MeasurementConfig> {
  final BuilderOptions builderOptions;

  UnitGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingMeasurementBuilder(element, annotation);

    builder.add(
      Class(
        (dimension) => dimension
          ..name = builder.dimensionName
          ..extend = builder.dimensionType,
      ),
    );
    builder.add(
      Class(
        (interpreter) {
          interpreter
            ..name = builder.unitName
            ..extend = builder.unitExtends
            ..methods.add(Method(
              (call) => call
                ..name = "call"
                ..returns = builder.measurementType
                ..requiredParameters.add(
                  Parameter(
                    (magnitude) => magnitude
                      ..name = "magnitude"
                      ..type = Reference("num"),
                  ),
                )
                ..optionalParameters.add(Parameter(
                  (precision) => precision
                    ..named = true
                    ..name = "precision"
                    ..type = Reference("int")
                    ..defaultTo = Code("f.Precision.maximumPrecision"),
                ))
                ..lambda = true
                ..body = Code(
                    "${builder.measurementName}(magnitude, this, f.Precision(precision))"),
            ))
            ..methods.add(
              Method(
                (withPrefix) => withPrefix
                  ..lambda = true
                  ..name = "withPrefix"
                  ..returns = Reference(builder.unitName)
                  ..requiredParameters.add(
                    Parameter(
                      (prefix) => prefix
                        ..name = "prefix"
                        ..type = Reference("f.MeasurementPrefix"),
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (precision) => precision
                        ..named = true
                        ..name = "precision"
                        ..type = Reference("f.Precision")
                        ..defaultTo = Code("f.Precision.max"),
                    ),
                  )
                  ..body = Code("${builder.unitName}._("
                      " name: name,"
                      " unitMultiplier: unitMultiplier,"
                      " prefix: prefix,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (equality) => equality
                  ..lambda = true
                  ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                  ..returns = Reference("bool")
                  ..name = "operator =="
                  ..requiredParameters.add(
                    Parameter(
                      (other) => other
                        ..name = "other"
                        ..type = Reference("Object"),
                    ),
                  )
                  ..body = Code("other is ${builder.unitName}"
                      " && other.unitMultiplier == unitMultiplier"
                      " && other.name == name"),
              ),
            )
            ..methods.add(
              Method(
                (hash) => hash
                  ..lambda = true
                  ..type = MethodType.getter
                  ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                  ..returns = Reference("int")
                  ..name = "hashCode"
                  ..body = Code("unitMultiplier.hashCode * name.hashCode"),
              ),
            )
            ..constructors.add(
              Constructor((constructor) => constructor
                ..constant = true
                ..name = "_"
                ..optionalParameters.add(
                  Parameter(
                    (name) => name
                      ..toSuper = true
                      ..name = "name"
                      ..required = true
                      ..named = true,
                  ),
                )
                ..optionalParameters.add(
                  Parameter(
                    (unitMultiplier) => unitMultiplier
                      ..toSuper = true
                      ..name = "unitMultiplier"
                      ..required = true
                      ..named = true,
                  ),
                )
                ..optionalParameters.add(
                  Parameter(
                    (prefix) => prefix
                      ..toSuper = true
                      ..name = "prefix"
                      ..named = true
                      ..defaultTo = Code("const f.MeasurementPrefix.unit()"),
                  ),
                )),
            );
          for (final unit in builder.units) {
            interpreter.fields.add(
              Field(
                (field) => field
                  ..static = true
                  ..modifier = FieldModifier.constant
                  ..name = unit.displayName
                  ..type = Reference(builder.unitName)
                  ..assignment = Code("${builder.unitName}._("
                      "name: '${builder.shortNameOf(unit)}', "
                      "unitMultiplier: ${1.0 / builder.multiplierOf(unit)}, "
                      "prefix: f.MeasurementPrefix.unit(),"
                      ")"),
              ),
            );
          }
        },
      ),
    );

    return builder.flush();
  }
}
