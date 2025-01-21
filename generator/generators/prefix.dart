import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import 'package:fling_units/src/core/annotations.dart';
import '../util/builder.dart';

Builder prefixBuilder(BuilderOptions options) {
  return SharedPartBuilder([PrefixGenerator(options)], 'prefix');
}

class PrefixGenerator extends GeneratorForAnnotation<MeasurementConfig> {
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
            ..name = builder.prefixName
            ..methods.add(
              Method(
                (prefix) => prefix
                  ..name = "prefix"
                  ..type = MethodType.getter
                  ..returns = Reference("f.MeasurementPrefix"),
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
                  ..returns = Reference(builder.unitName)
                  ..body = Code("${builder.unitName}.$name.withPrefix(prefix)"),
              ),
            );
          }
        },
      ),
    );

    return builder.flush();
  }
}
