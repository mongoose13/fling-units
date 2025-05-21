import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

Builder prefixesBuilder(BuilderOptions options) {
  return SharedPartBuilder([PrefixesGenerator(options)], 'prefixes');
}

class PrefixesGenerator extends GeneratorForAnnotation<PrefixType> {
  final BuilderOptions builderOptions;

  PrefixesGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingPrefixBuilder(element, annotation);

    builder.add(Code("// GENERATED CODE - DO NOT MODIFY BY HAND\n"));
    for (final entry in builder.prefixes) {
      builder.add(
        Field(
          (field) => field
            ..modifier = FieldModifier.constant
            ..name = entry.name
            ..type = Reference("UnitPrefix")
            ..assignment = Code(
                "UnitPrefix(${entry.multiplier}, name: \"${entry.shortName}\")"),
        ),
      );
    }
    for (final entry in builder.prefixes) {
      builder.add(
        Field(
          (field) => field
            ..modifier = FieldModifier.constant
            ..name = "_${entry.name}"
            ..assignment = Code(entry.name),
        ),
      );
    }

    builder.add(
      Extension(
        (extension) => extension
          ..on = Reference("num")
          ..name = "NumExtensionPrefix${element.displayName}"
          ..methods.addAll(
            builder.prefixes.map(
              (prefix) => Method(
                (method) => method
                  ..type = MethodType.getter
                  ..lambda = true
                  ..name = prefix.name
                  ..returns = Reference("NumExtension")
                  ..body = Code("NumExtension(_${prefix.name}, this)"),
              ),
            ),
          ),
      ),
    );

    return builder.flush();
  }
}
