import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../util/annotations.dart';
import '../util/builder.dart';

Builder prefixBuilder(BuilderOptions options) {
  return SharedPartBuilder([PrefixGenerator(options)], 'prefix');
}

class PrefixGenerator extends GeneratorForAnnotation<MeasurementTemplate> {
  final BuilderOptions builderOptions;

  PrefixGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingMeasurementBuilder(element, annotation);

    builder.add(
      Mixin(
        (prefix) {
          prefix
            ..name = builder.prefixClassName
            ..methods.add(
              Method(
                (prefix) => prefix
                  ..name = "prefix"
                  ..type = MethodType.getter
                  ..returns = Reference("MeasurementPrefix"),
              ),
            )
            ..fields.add(
              Field(
                (siUnitField) => siUnitField
                  ..name = 'siUnit'
                  ..static = true
                  ..type = Reference(builder.interpreterClassName)
                  ..assignment = Code(
                      "${builder.interpreterClassName}._${builder.siUnit.displayName}"),
              ),
            );
          final units = element.children
              .where((Element element) => element.metadata.isNotEmpty);
          for (final unit in units) {
            final name = unit.displayName;
            prefix.methods.add(
              Method(
                (prefix) => prefix
                  ..lambda = true
                  ..name = name
                  ..type = MethodType.getter
                  ..returns = Reference(builder.interpreterClassName)
                  ..body = Code(
                      "${builder.interpreterClassName}._$name._withPrefix(prefix)"),
              ),
            );
          }
        },
      ),
    );

    return builder.flush();
  }
}
