import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

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
    final unitBuilder = const UnitBuilder();

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

    for (final isDot in [true, false]) {
      final type = isDot ? "Dot" : "Per";
      builder.add(
        Extension(
          (prefixedUnit) => prefixedUnit
            ..docs.add(
                "/// An extension that allows units of ${builder.dimension.name} to be created following calls to [${type.toLowerCase()}].")
            ..name = "PrefixedUnit$type${builder.dimension.name}"
            ..types.addAll([
              Reference("N extends f.Unit<D, I>"),
              Reference("D extends f.Dimension"),
              Reference("I extends f.Dimension"),
            ])
            ..on = Reference("f.PrefixedUnit$type<N, D, I>")
            ..methods.addAll(
              unitBuilder.buildChildren(element).map(
                (unit) {
                  final name = isDot ? unit.name : unit.singularName;
                  return Method(
                    (method) => method
                      ..docs.add(
                          "/// Creates a derived unit with [f.${unit.name}] as the ${isDot ? "second term" : "denominator"}.")
                      ..lambda = true
                      ..type = MethodType.getter
                      ..name = name
                      ..returns = Reference(
                          "f.DerivedUnit2<D, f.${isDot ? "" : "Inverted"}${builder.dimension.name}, I, f.${isDot ? "Inverted" : ""}${builder.dimension.name}>")
                      ..body = Code(
                          "f.DerivedUnit2.build(${isDot ? "initial" : "numerator"}, prefix.${unit.name}${isDot ? "" : ".inverted"},)"),
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
