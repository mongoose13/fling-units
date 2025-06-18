import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:fling_units/src/generator/builders/builder.dart';
import 'package:source_gen/source_gen.dart';

import '../../annotations.dart';
import '../../builders/bulder_base.dart';
import '../../builders/builder_library.dart';

Builder perDotExtensionBuilder(BuilderOptions options) {
  return SharedPartBuilder(
      [PerDotExtensionGenerator(options)], 'prefixedExtension');
}

class PerDotExtensionGenerator extends GeneratorForAnnotation<PrefixType> {
  final BuilderOptions builderOptions;

  PerDotExtensionGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingPrefixBuilder(element, annotation);
    final maxDimensions = FlingBuilderBase.maxDimensions(builderOptions);

    for (final dimensionCount in increments(min: 2, max: maxDimensions)) {
      for (final level in ["Unit", "Measurement"]) {
        for (final type in ["Per", "Dot"]) {
          builder.add(
            Extension(
              (extension) => extension
                ..name = "$level$type${dimensionCount}Prefixes"
                ..types.addAll(increments(max: dimensionCount - 1)
                    .map((i) => [
                          Reference("D$i extends Dimension"),
                          Reference("I$i extends Dimension"),
                        ])
                    .expand((item) => item))
                ..on = Reference("$level$type$dimensionCount<${[
                  "D",
                  "I"
                ].map((e) => increments(max: dimensionCount - 1).map((i) => "$e$i")).expand((item) => item).join(", ")}>")
                ..methods.addAll(
                  builder.prefixes.map(
                    (prefix) => Method(
                      (meth) => meth
                        ..docs.add(
                            "/// Establishes a prefix for the derived $level being constructed.")
                        ..name = prefix.name
                        ..returns = Reference(
                            "Prefixed$level$type$dimensionCount<${[
                          "D",
                          "I"
                        ].map((e) => increments(max: dimensionCount - 1).map((i) => "$e$i")).expand((item) => item).join(", ")}>")
                        ..type = MethodType.getter
                        ..lambda = true
                        ..body = Code(
                            "Prefixed$level$type$dimensionCount(${level == "Unit" ? "" : "magnitude, "}${increments(max: dimensionCount - 1).map((i) => "unit$i").join(", ")}, prefix: _${prefix.name})"),
                    ),
                  ),
                ),
            ),
          );
        }
      }
    }

    return builder.flush();
  }
}
