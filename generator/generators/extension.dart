import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

Builder extensionBuilder(BuilderOptions options) {
  return SharedPartBuilder([ExtensionGenerator(options)], 'extension');
}

/// Measurement constructor extension for the [num] types.
///
/// This is syntactic sugar for creating measurements given a number, for
/// example:
/// ```dart
/// a = 5.miles;
/// b = (2.3).kilo.meters;
/// ```
class ExtensionGenerator extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  ExtensionGenerator(this.builderOptions);

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
        (measurement) => measurement
          ..name = "NumExtension${builder.dimension.name}"
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

    return builder.flush();
  }
}
