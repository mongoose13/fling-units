import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../builders/base.dart';
import '../generator.dart';

Builder prefixUnitBuilder(BuilderOptions options) {
  return SharedPartBuilder([PrefixedUnitGenerator(options)], 'prefixUnit');
}

class PrefixedUnitGenerator extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  PrefixedUnitGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingMeasurementBuilder(element, annotation);

    if (builder.dimension.isDerived) {
      return;
    }

    // PrefixGenerator
    builder.add(
      Extension(
        (prefixExt) => prefixExt
          ..docs.add(
              "/// Allows ${builder.dimension.name} units to appear after prefixes.")
          ..name = "${builder.dimension.name}UnitPrefix"
          ..on = Reference("f.UnitPrefix")
          ..methods.addAll(
            builder.units.map((unit) => Method(
                  (accessor) => accessor
                    ..docs.add("/// A ${builder.dimension.name} unit.")
                    ..lambda = true
                    ..type = MethodType.getter
                    ..returns = Reference("${builder.dimension.name}Unit")
                    ..name = unit.name
                    ..body = Code("f.${unit.name}.withPrefix(this)"),
                )),
          ),
      ),
    );

    final int maxDimensions = FlingBuilderBase.maxDimensions(builderOptions);

    for (int dimensionCount = 2;
        dimensionCount <= maxDimensions;
        ++dimensionCount) {
      for (final type in ["Dot", "Per"]) {
        final isDot = type == "Dot";
        builder.add(
          Extension(
            (extension) => extension
              ..name = "PrefixedUnit$type$dimensionCount${builder.unitName}"
              ..types.addAll([
                for (int i = 1; i < dimensionCount; ++i)
                  [
                    Reference("D$i extends f.Dimension"),
                    Reference("I$i extends f.Dimension"),
                  ],
              ].expand((item) => item))
              ..on = Reference("f.PrefixedUnit$type$dimensionCount<${[
                "D",
                "I"
              ].map((e) => [
                    for (int i = 1; i < dimensionCount; ++i) "$e$i"
                  ]).expand((item) => item).join(", ")}>")
              ..methods.addAll(
                builder.units.map(
                  (unit) => Method(
                    (getter) => getter
                      ..name = isDot ? unit.name : unit.singularName
                      ..type = MethodType.getter
                      ..lambda = true
                      ..returns = Reference("f.DerivedUnit$dimensionCount<${[
                        for (int i = 1; i < dimensionCount; ++i) "D$i"
                      ].join(", ")}, ${isDot ? "" : "Inverted"}${builder.dimension.name}, ${[
                        for (int i = 1; i < dimensionCount; ++i) "I$i"
                      ].join(", ")}, ${isDot ? "Inverted" : ""}${builder.dimension.name}>")
                      ..body = Code("f.DerivedUnit$dimensionCount(${[
                        for (int i = 1; i < dimensionCount; ++i) "unit$i"
                      ].join(", ")}, prefix.${unit.name}${isDot ? "" : ".inverted"}"
                          ")"),
                  ),
                ),
              ),
          ),
        );
      }
    }

    return builder.flush();
  }
}
