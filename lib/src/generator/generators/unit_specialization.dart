import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

Builder unitSpecializationBuilder(BuilderOptions options) {
  return SharedPartBuilder(
      [UnitSpecializationGenerator(options)], 'unitSpecialization');
}

class UnitSpecializationGenerator
    extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  UnitSpecializationGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingSpecializationBuilder(element, annotation);

    if (!builder.dimension.isDerived) {
      return;
    }
    final types = builder.dimension.types!;
    builder.addAll(
      [
        TypeDef(
          (dimension) => dimension
            ..docs.add("/// Defines the ${builder.dimension.name} dimension.")
            ..name = builder.dimension.name
            ..definition = CodeExpression(Code(
                "f.Dimension${builder.dimension.order}<${types.map((type) => "f.${type.name}").join(", ")}>")),
        ),
        TypeDef(
          (dimension) => dimension
            ..docs.add(
                "/// Defines the ${builder.dimension.name} dimension's inverse.")
            ..name = "Inverted${builder.dimension.name}"
            ..definition = CodeExpression(Code(
                "f.Dimension${builder.dimension.order}<${types.map((type) => "f.${type.invertedName}").join(", ")}>")),
        ),
        TypeDef(
          (unit) => unit
            ..docs.add("/// Defines the ${builder.dimension.name} unit type.")
            ..name = "${builder.dimension.name}Unit"
            ..definition = CodeExpression(
              Code("f.DerivedUnit${builder.dimension.order}<"
                  "${types.map((type) => "f.${type.name}").join(", ")}"
                  ", "
                  "${types.map((type) => "f.${type.invertedName}").join(", ")}"
                  ">"),
            ),
        ),
        TypeDef(
          (unit) => unit
            ..docs.add(
                "/// Defines the ${builder.dimension.name} unit's inverted type.")
            ..name = "Inverted${builder.dimension.name}Unit"
            ..definition = CodeExpression(
              Code("f.DerivedUnit${builder.dimension.order}<"
                  "${types.map((type) => "f.${type.invertedName}").join(", ")}"
                  ", "
                  "${types.map((type) => "f.${type.name}").join(", ")}"
                  ">"),
            ),
        ),
      ],
    );

    for (final unit in builder.standardUnits) {
      builder.add(
        Field(
          (def) => def
            ..docs.add("/// A derived unit for ${builder.dimension.name}.")
            ..modifier = FieldModifier.constant
            ..name = unit.name
            ..assignment = Code("f.DerivedUnit${builder.dimension.order}<"
                "${types.map((type) => "f.${type.name}").join(", ")}"
                ", "
                "${types.map((type) => "f.${type.invertedName}").join(", ")}"
                ">("
                "name: \"${unit.shortName}\","
                "unitMultiplier: ${unit.multiplier},"
                "prefix: f.UnitPrefix.unit(),"
                ")"),
        ),
      );
    }

    for (final unit in builder.specializedUnits) {
      builder.add(
        Field(
          (def) => def
            ..docs.add("/// One of the ${builder.dimension.name} units.")
            ..modifier = FieldModifier.final$
            ..name = unit.displayName
            ..assignment =
                Code("f.${unit.equivalent}.withName(\"${unit.shortName}\")"),
        ),
      );
      // PrefixGenerator
      builder.add(
        Extension(
          (prefixExt) => prefixExt
            ..docs.add(
                "/// Allows ${builder.dimension.name} units to appear after prefixes.")
            ..name = "${builder.dimension.name}Prefix"
            ..on = Reference("f.UnitPrefix")
            ..methods.add(
              Method(
                (accessor) => accessor
                  ..docs.add("/// A ${builder.dimension.name} unit.")
                  ..lambda = true
                  ..type = MethodType.getter
                  ..returns = Reference("${builder.dimension.name}Unit")
                  ..name = unit.displayName
                  ..body = Code("f.${unit.displayName}.withPrefix(this)"),
              ),
            ),
        ),
      );
      // ExtensionGenerator
      builder.add(
        Extension(
          (prefixExt) => prefixExt
            ..docs.add(
                "/// Allows ${builder.dimension.name} units to appear as extensions on [num].")
            ..name = "NumExtension${builder.dimension.name}"
            ..on = Reference("num")
            ..methods.add(
              Method(
                (accessor) => accessor
                  ..docs.add("/// A ${builder.dimension.name} unit.")
                  ..lambda = true
                  ..type = MethodType.getter
                  ..returns = Reference(
                      "f.DerivedMeasurement${builder.dimension.order}<"
                      "${types.map((type) => "f.${type.name}").join(", ")}"
                      ", "
                      "${types.map((type) => "f.${type.invertedName}").join(", ")}"
                      ">")
                  ..name = unit.displayName
                  ..body = Code("f.${unit.displayName}(this)"),
              ),
            ),
        ),
      );

      // ExtensionGenerator
      builder.add(
        Extension(
          (prefixExt) => prefixExt
            ..docs.add(
                "/// Allows ${builder.dimension.name} measurements to be created from prefixed extensions.")
            ..name = "${builder.dimension.name}NumExtension"
            ..on = Reference("f.NumExtension")
            ..methods.add(
              Method(
                (accessor) => accessor
                  ..docs.add("/// A ${builder.dimension.name} measurement.")
                  ..lambda = true
                  ..type = MethodType.getter
                  ..returns = Reference(
                      "f.DerivedMeasurement${builder.dimension.order}<"
                      "${types.map((type) => "f.${type.name}").join(", ")}"
                      ", "
                      "${types.map((type) => "f.${type.invertedName}").join(", ")}"
                      ">")
                  ..name = unit.displayName
                  ..body = Code("build(f.${unit.displayName})"),
              ),
            ),
        ),
      );
    }

    for (final constant in builder.constants) {
      builder.add(
        Field(
          (field) => field
            ..docs.add("/// A ${builder.dimension.name} constant.")
            ..modifier = FieldModifier.constant
            ..name = constant.name
            ..assignment =
                Code("f.DerivedMeasurement${builder.dimension.order}("
                    "defaultUnit: ${constant.unit},"
                    "magnitude: ${constant.magnitude},"
                    "precision: f.Precision(${constant.precision}),"
                    ")"),
        ),
      );
    }

    return builder.flush();
  }
}
