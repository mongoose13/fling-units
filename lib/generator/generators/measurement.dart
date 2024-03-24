import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../util/annotations.dart';
import '../util/builder.dart';

Builder measurementBuilder(BuilderOptions options) {
  return SharedPartBuilder([MeasurementGenerator(options)], 'measurement');
}

class MeasurementGenerator extends GeneratorForAnnotation<MeasurementConfig> {
  final BuilderOptions builderOptions;

  MeasurementGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingMeasurementBuilder(element, annotation);

    builder.add(
      Class(
        (measurement) => measurement
          ..name = builder.measurementClassName
          ..extend = Reference("Measurement<${builder.measurementClassName}>")
          ..fields.add(
            Field(
              (siUnit) => siUnit
                ..static = true
                ..modifier = FieldModifier.constant
                ..name = 'siUnit'
                ..type = Reference(builder.interpreterClassName)
                ..assignment = Code(builder.siUnit.displayName),
            ),
          )
          ..constructors.add(Constructor(
            (constructor) => constructor
              ..requiredParameters.add(
                Parameter(
                  (units) => units
                    ..name = "units"
                    ..type = Reference("num"),
                ),
              )
              ..requiredParameters.add(
                Parameter(
                  (interpreter) => interpreter
                    ..name = "interpreter"
                    ..type = Reference(builder.interpreterType),
                ),
              )
              ..optionalParameters.add(
                Parameter(
                  (precision) => precision
                    ..name = "precision"
                    ..type = Reference("Precision")
                    ..defaultTo = Code("Precision.max"),
                ),
              )
              ..initializers.add(Code(
                  "super(amount: units, precision: precision, interpreter: interpreter)")),
          ))
          ..constructors.add(
            Constructor(
              (zero) => zero
                ..constant = true
                ..name = "zero"
                ..optionalParameters.add(
                  Parameter(
                    (interpreter) => interpreter
                      ..name = "interpreter"
                      ..toSuper = true
                      ..defaultTo = Code("siUnit"),
                  ),
                )
                ..initializers.add(Code("super.zero()")),
            ),
          )
          ..constructors.add(
            Constructor(
              (infinite) => infinite
                ..constant = true
                ..name = "infinite"
                ..optionalParameters.add(
                  Parameter(
                    (interpreter) => interpreter
                      ..name = "interpreter"
                      ..toSuper = true
                      ..defaultTo = Code("siUnit"),
                  ),
                )
                ..initializers.add(Code("super.infinite()")),
            ),
          )
          ..constructors.add(
            Constructor(
              (negativeInfinite) => negativeInfinite
                ..constant = true
                ..name = "negativeInfinite"
                ..optionalParameters.add(
                  Parameter(
                    (interpreter) => interpreter
                      ..name = "interpreter"
                      ..toSuper = true
                      ..defaultTo = Code("siUnit"),
                  ),
                )
                ..initializers.add(Code("super.negativeInfinite()")),
            ),
          )
          ..constructors.add(
            Constructor(
              (nan) => nan
                ..constant = true
                ..name = "nan"
                ..optionalParameters.add(
                  Parameter(
                    (interpreter) => interpreter
                      ..name = "interpreter"
                      ..toSuper = true
                      ..defaultTo = Code("siUnit"),
                  ),
                )
                ..initializers.add(Code("super.nan()")),
            ),
          )
          ..constructors.add(
            Constructor(
              (sum) => sum
                ..name = "sum"
                ..requiredParameters.add(
                  Parameter((parts) => parts
                    ..name = "parts"
                    ..toSuper = true),
                )
                ..optionalParameters.add(
                  Parameter(
                    (precision) => precision
                      ..named = true
                      ..name = "precision"
                      ..toSuper = true,
                  ),
                )
                ..initializers.add(Code("super.sum()")),
            ),
          )
          ..methods.add(
            Method(
              (acceptVisitor) => acceptVisitor
                ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                ..lambda = true
                ..name = "acceptVisitor"
                ..requiredParameters.add(
                  Parameter(
                    (visitor) => visitor
                      ..name = "visitor"
                      ..type = Reference("MeasurementVisitor"),
                  ),
                )
                ..body =
                    Code("visitor.visit${builder.measurementClassName}(this)"),
            ),
          )
          ..methods.add(
            Method(
              (construct) => construct
                ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                ..lambda = true
                ..name = "construct"
                ..requiredParameters.add(
                  Parameter(
                    (amount) => amount
                      ..name = "amount"
                      ..type = Reference("double"),
                  ),
                )
                ..requiredParameters.add(
                  Parameter(
                    (interpreter) => interpreter
                      ..name = "interpreter"
                      ..type = Reference("${builder.interpreterType}?"),
                  ),
                )
                ..requiredParameters.add(
                  Parameter(
                    (precision) => precision
                      ..name = "precision"
                      ..type = Reference("Precision"),
                  ),
                )
                ..body = Code(
                    "${builder.measurementClassName}(amount, interpreter ?? siUnit, precision)"),
            ),
          ),
      ),
    );

    return builder.flush();
  }
}
