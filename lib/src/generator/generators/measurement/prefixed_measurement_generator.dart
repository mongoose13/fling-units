import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:fling_units/src/generator/builders/builder.dart';
import 'package:source_gen/source_gen.dart';

import '../../annotations.dart';
import '../../builders/bulder_base.dart';
import '../../builders/builder_library.dart';

Builder prefixMeasurementBuilder(BuilderOptions options) {
  return SharedPartBuilder(
      [PrefixedMeasurementGenerator(options)], 'prefixMeasurement');
}

class PrefixedMeasurementGenerator
    extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  PrefixedMeasurementGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingMeasurementBuilder(element, annotation);
    final unitBuilder = const UnitBuilder();

    if (builder.dimension.isDerived) {
      return;
    }

    final maxDimensions = FlingBuilderBase.maxDimensions(builderOptions);

    for (int dimensionCount = 2;
        dimensionCount <= maxDimensions;
        ++dimensionCount) {
      final dimensions =
          increments(max: dimensionCount - 1).map((i) => "D$i").join(", ");
      final invertedDimensions = dimensions.replaceAll("D", "I");

      for (final isDot in [true, false]) {
        final type = isDot ? "Dot" : "Per";
        builder.add(
          Extension(
            (prefixedUnit) => prefixedUnit
              ..docs.add(
                  "/// An extension that allows measurements of ${builder.dimension.name} to be created following calls to [${type.toLowerCase()}].")
              ..name =
                  "PrefixedMeasurement$type$dimensionCount${builder.dimension.name}"
              ..types.addAll(
                "$dimensions, $invertedDimensions".split(", ").map(
                      (d) => Reference("$d extends f.Dimension"),
                    ),
              )
              ..on = Reference(
                  "f.PrefixedMeasurement$type$dimensionCount<$dimensions, $invertedDimensions>")
              ..methods.addAll(
                unitBuilder.buildChildren(element).map(
                  (unit) {
                    final name = isDot ? unit.name : unit.singularName;
                    return Method(
                      (method) => method
                        ..docs.add(
                            "/// Creates a derived measurement with [f.${unit.name}] as the last term.")
                        ..lambda = true
                        ..type = MethodType.getter
                        ..name = name
                        ..returns = Reference(
                            "f.DerivedMeasurement$dimensionCount<$dimensions, f.${isDot ? "" : "Inverted"}${builder.dimension.name}, $invertedDimensions, f.${isDot ? "Inverted" : ""}${builder.dimension.name}>")
                        ..body = Code("build(f.${unit.name})"),
                    );
                  },
                ),
              ),
          ),
        );
      }
    }

    return builder.flush();
  }
}
