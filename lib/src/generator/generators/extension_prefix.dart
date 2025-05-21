import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

Builder prefixedExtensionBuilder(BuilderOptions options) {
  return SharedPartBuilder(
      [PrefixedExtensionGenerator(options)], 'prefixedExtension');
}

class PrefixedExtensionGenerator extends GeneratorForAnnotation<PrefixType> {
  final BuilderOptions builderOptions;

  PrefixedExtensionGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingPrefixBuilder(element, annotation);

    for (final level in ["Unit", "Measurement"]) {
      for (final config in [
        (type: "Per", preconfigured: "numerator"),
        (type: "Dot", preconfigured: "initial"),
      ]) {
        builder.add(
          Extension(
            (extension) => extension
              ..name = "$level${config.type}Prefixes"
              ..types.addAll([
                Reference("N extends $level<D, I>"),
                Reference("D extends Dimension"),
                Reference("I extends Dimension"),
              ])
              ..on = Reference("$level${config.type}<N, D, I>")
              ..methods.addAll(
                builder.prefixes.map(
                  (prefix) => Method(
                    (meth) => meth
                      ..docs.add(
                          "/// Establishes a prefix for the derived $level being constructed.")
                      ..name = prefix.name
                      ..returns =
                          Reference("Prefixed$level${config.type}<N, D, I>")
                      ..type = MethodType.getter
                      ..lambda = true
                      ..body = Code(
                          "Prefixed$level${config.type}(${config.preconfigured}, prefix: _${prefix.name})"),
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
