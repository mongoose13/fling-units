import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

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

    for (final isDot in [true, false]) {
      final type = isDot ? "Dot" : "Per";
      builder.add(
        Extension(
          (prefixedUnit) => prefixedUnit
            ..docs.add(
                "/// An extension that allows measurements of ${builder.dimension.name} to be created following calls to [${type.toLowerCase()}].")
            ..name = "PrefixedMeasurement$type${builder.dimension.name}"
            ..types.addAll([
              Reference("M extends f.Measurement<D, I>"),
              Reference("D extends f.Dimension"),
              Reference("I extends f.Dimension"),
            ])
            ..on = Reference("f.PrefixedMeasurement$type<M, D, I>")
            ..methods.addAll(
              unitBuilder.buildChildren(element).map(
                (unit) {
                  final name = isDot ? unit.name : unit.singularName;
                  final initial = isDot ? "initial" : "numerator";
                  return Method(
                    (method) => method
                      ..docs.add(
                          "/// Creates a derived measurement with [f.${unit.name}] as the ${isDot ? "second term" : "denominator"}.")
                      ..lambda = true
                      ..type = MethodType.getter
                      ..name = name
                      ..returns = Reference(
                          "f.DerivedMeasurement2<D, f.${isDot ? "" : "Inverted"}${builder.dimension.name}, I, f.${isDot ? "Inverted" : ""}${builder.dimension.name}>")
                      ..body = Code(
                          "f.DerivedUnit2.build($initial.defaultUnit, prefix.${unit.name}${isDot ? "" : ".inverted"},)($initial.defaultValue)"),
                  );
                },
              ),
            ),
        ),
      );
    }

    return builder.flush();
  }
}
