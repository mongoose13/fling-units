import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import 'package:fling_units/src/core/annotations.dart';
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
          ..extend = Reference("f.Measurement<${builder.dimensionName}>")
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
          )
          ..methods.add(
            Method(
              (per) => per
                ..docs.add(
                    "/// Creates a derived measurement of a derived unit consisting of this measurement's"
                    "unit in the numerator and the specified unit in the denominator, with this measurement's"
                    "default value as the default value of the resulting derived unit.")
                ..name = "per"
                ..lambda = true
                ..type = MethodType.getter
                ..returns = Reference(
                    "f.MeasurementPer<${builder.measurementName}, ${builder.dimensionName}>")
                ..body = Code("f.MeasurementPer(this)"),
            ),
          )
          ..methods.add(
            Method(
              (over) => over
                ..docs.add(
                    "/// Creates a derived measurement representing the ratio of this and another measurement.")
                ..name = "over"
                ..lambda = true
                ..types.add(Reference("D extends f.Dimension"))
                ..requiredParameters.add(
                  Parameter(
                    (denominator) => denominator
                      ..name = "denominator"
                      ..type = Reference("f.Measurement<D>"),
                  ),
                )
                ..returns = Reference(
                    "f.Measurement<f.Dimension2<f.UnitNumerator<${builder.dimensionName}>, f.UnitDenominator<D>>>")
                ..body = Code(
                    "f.ratio<${builder.dimensionName}, D>(defaultUnit, denominator.defaultUnit)"
                    "(defaultValue, denominator.defaultValue)"),
            ),
          )
          ..methods.add(
            Method(
              (by) => by
                ..docs.add(
                    "/// Creates a derived measurement representing the product of this and another measurement.")
                ..name = "by"
                ..lambda = true
                ..types.add(Reference("D extends f.Dimension"))
                ..requiredParameters.add(
                  Parameter(
                    (term) => term
                      ..name = "term"
                      ..type = Reference("f.Measurement<D>"),
                  ),
                )
                ..returns = Reference(
                    "f.Measurement<f.Dimension2<f.UnitNumerator<${builder.dimensionName}>, f.UnitNumerator<D>>>")
                ..body = Code(
                    "f.product2<${builder.dimensionName}, D>(defaultUnit, term.defaultUnit)"
                    "(defaultValue, term.defaultValue)"),
            ),
          ),
      ),
    );

    return builder.flush();
  }
}
