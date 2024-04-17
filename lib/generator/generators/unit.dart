import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../util/annotations.dart';
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
        (interpreter) {
          interpreter
            ..name = builder.unitClassName
            ..extend = Reference(
              builder.unitType,
            )
            ..methods.add(Method(
              (call) => call
                ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                ..name = "call"
                ..returns = Reference(builder.measurementClassName)
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
                    ..type = Reference("Precision")
                    ..defaultTo = Code("Precision.max"),
                ))
                ..lambda = true
                ..body = Code(
                    "${builder.measurementClassName}(magnitude, this, precision)"),
            ))
            ..methods.add(
              Method(
                (withPrefix) => withPrefix
                  ..lambda = true
                  ..name = "withPrefix"
                  ..returns = Reference(builder.unitClassName)
                  ..requiredParameters.add(
                    Parameter(
                      (prefix) => prefix
                        ..name = "prefix"
                        ..type = Reference("MeasurementPrefix"),
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (precision) => precision
                        ..named = true
                        ..name = "precision"
                        ..type = Reference("Precision")
                        ..defaultTo = Code("Precision.max"),
                    ),
                  )
                  ..body = Code(
                      "${builder.unitClassName}._(name: name, unitMultiplier: unitMultiplier, prefix: prefix)"),
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
                  ..body = Code(
                      "other is ${builder.unitClassName} && other.unitMultiplier == unitMultiplier && other.name == name"),
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
                      ..defaultTo = Code("const MeasurementPrefix.unit()"),
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
                  ..assignment = Code(
                      "${builder.unitClassName}._(name: '${builder.shortNameOf(unit)}', unitMultiplier: ${builder.multiplierOf(unit)})"),
              ),
            );
          }
        },
      ),
    );

    return builder.flush();
  }
}
