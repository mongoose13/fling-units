import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

Builder prefixBuilder(BuilderOptions options) {
  return SharedPartBuilder([PrefixGenerator(options)], 'prefix');
}

class PrefixGenerator extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  PrefixGenerator(this.builderOptions);

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

    builder.add(
      Extension(
        (prefix) {
          prefix
            ..name = builder.prefixName
            ..on = Reference("f.MeasurementPrefix");
          final units = unitBuilder.buildChildren(element);
          for (final unit in units.where((unit) => unit.isVisible)) {
            prefix.methods.add(
              Method(
                (prefix) => prefix
                  ..lambda = true
                  ..name = unit.name
                  ..type = MethodType.getter
                  ..returns = Reference(builder.unitName)
                  ..body =
                      Code("${builder.unitName}.${unit.name}.withPrefix(this)"),
              ),
            );
          }
        },
      ),
    );

    return builder.flush();
  }
}
