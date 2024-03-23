import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../util/annotations.dart';
import '../util/builder.dart';

Builder interpreterBuilder(BuilderOptions options) {
  return SharedPartBuilder([InterpreterGenerator(options)], 'interpreter');
}

class InterpreterGenerator extends GeneratorForAnnotation<MeasurementTemplate> {
  final BuilderOptions builderOptions;

  InterpreterGenerator(this.builderOptions);

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
            ..name = builder.interpreterClassName
            ..extend = Reference(
              builder.interpreterType,
            )
            ..methods.add(Method(
              (call) => call
                ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                ..name = "call"
                ..returns = Reference(builder.measurementClassName)
                ..requiredParameters.add(
                  Parameter(
                    (value) => value
                      ..name = "value"
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
                    "${builder.measurementClassName}(value, this, precision)"),
            ))
            ..methods.add(
              Method(
                (withPrefix) => withPrefix
                  ..lambda = true
                  ..name = "withPrefix"
                  ..returns = Reference(builder.interpreterClassName)
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
                      "${builder.interpreterClassName}._(name, unitMultiplier, prefix)"),
              ),
            )
            ..constructors.add(
              Constructor(
                (constructor) => constructor
                  ..constant = true
                  ..name = "_"
                  ..requiredParameters.add(
                    Parameter(
                      (name) => name
                        ..toSuper = true
                        ..name = "name",
                    ),
                  )
                  ..requiredParameters.add(
                    Parameter(
                      (multiplier) => multiplier
                        ..toSuper = true
                        ..name = "multiplier",
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (prefix) => prefix
                        ..toSuper = true
                        ..name = "prefix"
                        ..defaultTo = Code("const MeasurementPrefix.unit()"),
                    ),
                  )
                  ..initializers.add(
                    Code("super()"),
                  ),
              ),
            );
          for (final unit in builder.units) {
            interpreter.fields.add(
              Field(
                (field) => field
                  ..static = true
                  ..modifier = FieldModifier.constant
                  ..name = unit.displayName
                  ..assignment = Code(
                      "${builder.interpreterClassName}._('${builder.shortNameOf(unit)}', ${builder.multiplierOf(unit)})"),
              ),
            );
          }
        },
      ),
    );

    return builder.flush();
  }
}
