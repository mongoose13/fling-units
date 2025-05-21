import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

Builder prefixBuilder(BuilderOptions options) {
  return SharedPartBuilder([PrefixedUnitPerGenerator(options)], 'prefix');
}

class PrefixedUnitPerGenerator extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  PrefixedUnitPerGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
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
                "/// An extension that allows units of ${builder.dimension.name} to be created following calls to [${type.toLowerCase()}].")
            ..name = "PrefixedUnit$type${builder.dimension.name}"
            ..types.addAll([
              Reference("N extends Unit<D, I>"),
              Reference("D extends Dimension"),
              Reference("I extends Dimension"),
            ])
            ..on = Reference("PrefixedUnit$type<N, D, I>")
            ..methods.addAll(
              unitBuilder.buildChildren(element).map(
                    (unit) => Method(
                      (method) => method
                        ..docs.add(
                            "/// Creates a derived unit with [f.${unit.name}] as the ${isDot ? "second term" : "denominator"}.")
                        ..lambda = true
                        ..type = MethodType.getter
                        ..name = isDot ? unit.name : unit.singularName
                        ..returns = Reference(
                            "f.DerivedUnit2<D, f.${isDot ? "" : "Inverted"}${builder.dimension.name}, I, f.${isDot ? "Inverted" : ""}${builder.dimension.name}>")
                        ..body = Code(
                            "f.DerivedUnit2.build(first, prefix.${unit.name}${isDot ? "" : ".inverted"},)"),
                    ),
                  ),
            ),
        ),
      );
      builder.add(
        Extension(
          (prefixedUnit) => prefixedUnit
            ..docs.add(
                "/// An extension that allows ${builder.dimension.name} measurements to be created following calls to [${type.toLowerCase()}].")
            ..name = "PrefixedUnit$type${builder.dimension.name}"
            ..types.addAll([
              Reference("N extends Measurement<D, I>"),
              Reference("D extends Dimension"),
              Reference("I extends Dimension"),
            ])
            ..on = Reference("PrefixedMeasurement$type<N, D, I>")
            ..methods.addAll(
              unitBuilder.buildChildren(element).map(
                    (unit) => Method(
                      (method) => method
                        ..docs.add(
                            "/// Creates a derived measurement with [f.${unit.name}] as the ${isDot ? "second term" : "denominator"}.")
                        ..lambda = true
                        ..type = MethodType.getter
                        ..name = isDot ? unit.name : unit.singularName
                        ..returns = Reference(
                            "f.DerivedMeasurement2<D, f.${isDot ? "" : "Inverted"}${builder.dimension.name}, I, f.${isDot ? "Inverted" : ""}${builder.dimension.name}>")
                        ..body = Code(
                            "f.DerivedMeasurement2.build(first, prefix.${unit.name}${isDot ? "" : ".inverted"},)"),
                    ),
                  ),
            ),
        ),
      );
    }
  }
}
