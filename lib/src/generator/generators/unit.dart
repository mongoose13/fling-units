import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

Builder interpreterBuilder(BuilderOptions options) {
  return SharedPartBuilder([UnitGenerator(options)], 'interpreter');
}

class UnitGenerator extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  UnitGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingMeasurementBuilder(element, annotation);

    if (builder.dimension.isDerived) {
      // skip generating unit and measurement classes for derived units
      return;
    }

    builder.addAll(
      [
        Class(
          (dimension) => dimension
            ..name = builder.dimension.name
            ..extend = Reference("f.Dimension")
            ..constructors.add(
              Constructor(
                (constructor) => constructor..constant = true,
              ),
            ),
        ),
        Class(
          (dimension) => dimension
            ..name = "Inverted${builder.dimension.name}"
            ..extend = Reference("f.Dimension")
            ..constructors.add(
              Constructor(
                (constructor) => constructor..constant = true,
              ),
            ),
        ),
      ],
    );

    for (final isInverted in [false, true]) {
      final dimensionName = isInverted
          ? "Inverted${builder.dimension.name}"
          : builder.dimension.name;
      final invertedDimensionName = isInverted
          ? builder.dimension.name
          : "Inverted${builder.dimension.name}";
      final unitName =
          isInverted ? "Inverted${builder.unitName}" : builder.unitName;
      final invertedUnitName =
          isInverted ? builder.unitName : "Inverted${builder.unitName}";
      final measurementName = isInverted
          ? "Inverted${builder.measurementName}"
          : builder.measurementName;

      builder.add(
        Class(
          (interpreter) {
            interpreter
              ..name = unitName
              ..extend = Reference(
                  "f.${isInverted ? "Inverted" : ""}Unit<$dimensionName, $invertedDimensionName>")
              ..implements.add(Reference(
                  "f.Prefixable<${isInverted ? "Inverted" : ""}${builder.dimension.name}Measurement>"))
              ..methods.addAll(
                [
                  Method(
                    (call) => call
                      ..name = "call"
                      ..annotations
                          .add(FlingMeasurementBuilder.overrideAnnotation)
                      ..returns = Reference(measurementName)
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
                          ..type = Reference("f.Precision")
                          ..defaultTo = Code("f.Precision.max"),
                      ))
                      ..lambda = true
                      ..body = Code(
                          "$measurementName(magnitude, this, precision: precision)"),
                  ),
                  Method(
                    (withPrefix) => withPrefix
                      ..lambda = true
                      ..annotations
                          .add(FlingMeasurementBuilder.overrideAnnotation)
                      ..name = "withPrefix"
                      ..returns = Reference(unitName)
                      ..requiredParameters.add(
                        Parameter(
                          (prefix) => prefix
                            ..name = "prefix"
                            ..type = Reference("f.UnitPrefix"),
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
                      ..body = Code("$unitName._("
                          " name: name,"
                          " unitMultiplier: unitMultiplier,"
                          " prefix: prefix,"
                          ")"),
                  ),
                  Method(
                    (equality) => equality
                      ..lambda = true
                      ..annotations
                          .add(FlingMeasurementBuilder.overrideAnnotation)
                      ..returns = Reference("bool")
                      ..name = "operator =="
                      ..requiredParameters.add(
                        Parameter(
                          (other) => other
                            ..name = "other"
                            ..type = Reference("Object"),
                        ),
                      )
                      ..body = Code("other is $unitName"
                          " && other.unitMultiplier == unitMultiplier"
                          " && other.name == name"),
                  ),
                  Method(
                    (hash) => hash
                      ..lambda = true
                      ..type = MethodType.getter
                      ..annotations
                          .add(FlingMeasurementBuilder.overrideAnnotation)
                      ..returns = Reference("int")
                      ..name = "hashCode"
                      ..body = Code("unitMultiplier.hashCode * name.hashCode"),
                  ),
                  Method(
                    (per) => per
                      ..lambda = true
                      ..type = MethodType.getter
                      ..returns = Reference(
                          "f.UnitPer2<$dimensionName, $invertedDimensionName>")
                      ..name = "per"
                      ..body = Code("f.UnitPer2(this)")
                      ..docs.add(
                          "/// Creates a derived unit builder with this as the numerator."),
                  ),
                  Method(
                    (dot) => dot
                      ..lambda = true
                      ..type = MethodType.getter
                      ..returns = Reference(
                          "f.UnitDot2<$dimensionName, $invertedDimensionName>")
                      ..name = "dot"
                      ..body = Code("f.UnitDot2(this)")
                      ..docs.add(
                          "/// Creates a derived unit builder with this as the first unit in a product."),
                  ),
                  Method(
                    (inverted) => inverted
                      ..annotations
                          .add(FlingMeasurementBuilder.overrideAnnotation)
                      ..lambda = true
                      ..type = MethodType.getter
                      ..name = "inverted"
                      ..returns = Reference(invertedUnitName)
                      ..body = Code("$invertedUnitName._(name: "
                          "${isInverted ? "name.substring(0, name.length - 2)" : "\"\$name⁻¹\""}, "
                          "unitMultiplier: unitMultiplier, "
                          "prefix: prefix,)"),
                  ),
                ],
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
                        ..defaultTo = Code("const f.UnitPrefix.unit()"),
                    ),
                  )),
              );
            for (final unit in builder.units) {
              interpreter.fields.add(
                Field(
                  (field) => field
                    ..static = true
                    ..modifier = FieldModifier.constant
                    ..name = unit.name
                    ..type = Reference(unitName)
                    ..assignment = Code("$unitName._("
                        "name: '${unit.shortName}', "
                        "unitMultiplier: ${unit.multiplier}, "
                        "prefix: f.UnitPrefix.unit(),"
                        ")"),
                ),
              );
            }
          },
        ),
      );
    }

    return builder.flush();
  }
}
