import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../../annotations.dart';
import '../../builders/builder_library.dart';

Builder numExtensionBuilder(BuilderOptions options) {
  return SharedPartBuilder([NumExtensionGenerator(options)], 'numExtension');
}

/// Measurement constructor extension for the [num] types.
///
/// This is syntactic sugar for creating measurements given a number, for
/// example:
/// ```dart
/// a = 5.miles;
/// b = (2.3).kilo.meters;
/// ```
class NumExtensionGenerator extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  NumExtensionGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingMeasurementBuilder(element, annotation);

    if (builder.dimension.isDerived) {
      return;
    }

    builder.add(
      Extension(
        (extension) => extension
          ..name = "Num${builder.dimension.name}"
          ..on = Reference("num")
          ..methods.addAll(
            builder.units.where((unit) => unit.isVisible).map(
              (unit) {
                return Method(
                  (field) => field
                    ..lambda = true
                    ..type = MethodType.getter
                    ..name = unit.name
                    ..returns = Reference(builder.measurementName)
                    ..body = Code("${builder.unitName}.${unit.name}(this)"),
                );
              },
            ),
          ),
      ),
    );

    builder.add(
      Extension(
        (extension) => extension
          ..name = "NumExtension${builder.dimension.name}"
          ..on = Reference("f.NumExtension")
          ..methods.addAll(
            builder.units.where((unit) => unit.isVisible).map(
              (unit) {
                return Method(
                  (field) => field
                    ..lambda = true
                    ..type = MethodType.getter
                    ..name = unit.name
                    ..returns = Reference(builder.measurementName)
                    ..body = Code("prefix.${unit.name}(value)"),
                );
              },
            ),
          ),
      ),
    );

    return builder.flush();
  }
}
