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
          ..name = builder.measurementName
          ..extend = builder.measurementType
          ..fields.add(
            Field(
              (siUnit) => siUnit
                ..static = true
                ..modifier = FieldModifier.constant
                ..name = 'siUnit'
                ..type = builder.unitType
                ..assignment = Code(builder.siUnit.displayName),
            ),
          )
          ..constructors.add(
            Constructor(
              (constructor) => constructor
                ..constant = true
                ..requiredParameters.add(
                  Parameter(
                    (magnitude) => magnitude
                      ..name = "magnitude"
                      ..type = Reference("num"),
                  ),
                )
                ..requiredParameters.add(
                  Parameter(
                    (defaultUnit) => defaultUnit
                      ..name = "defaultUnit"
                      ..type = builder.unitType,
                  ),
                )
                ..optionalParameters.add(
                  Parameter(
                    (precision) => precision
                      ..name = "precision"
                      ..type = Reference("f.Precision")
                      ..defaultTo = Code("f.Precision.max"),
                  ),
                )
                ..initializers.add(Code(
                    "super(magnitude: magnitude, precision: precision, defaultUnit: defaultUnit,)")),
            ),
          )
          ..constructors.add(
            Constructor(
              (zero) => zero
                ..constant = true
                ..name = "zero"
                ..optionalParameters.add(
                  Parameter(
                    (unit) => unit
                      ..name = "unit"
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
                    (unit) => unit
                      ..name = "unit"
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
                    (unit) => unit
                      ..name = "unit"
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
                    (unit) => unit
                      ..name = "unit"
                      ..toSuper = true
                      ..defaultTo = Code("siUnit"),
                  ),
                )
                ..initializers.add(Code("super.nan()")),
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
                    (magnitude) => magnitude
                      ..name = "magnitude"
                      ..type = Reference("num"),
                  ),
                )
                ..requiredParameters.add(
                  Parameter(
                    (defaultUnit) => defaultUnit
                      ..name = "defaultUnit"
                      ..type = builder.unitType,
                  ),
                )
                ..requiredParameters.add(
                  Parameter(
                    (precision) => precision
                      ..name = "precision"
                      ..type = Reference("f.Precision"),
                  ),
                )
                ..body = Code(
                    "${builder.measurementName}(magnitude, defaultUnit, precision)"),
            ),
          ),
      ),
    );

    return builder.flush();
  }
}
