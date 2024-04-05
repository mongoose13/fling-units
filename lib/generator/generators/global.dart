import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../util/annotations.dart';
import '../util/builder.dart';

Builder unitBuilder(BuilderOptions options) {
  return SharedPartBuilder([GlobalGenerator(options)], 'unit');
}

class GlobalGenerator extends GeneratorForAnnotation<MeasurementConfig> {
  final BuilderOptions builderOptions;

  GlobalGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingMeasurementBuilder(element, annotation);

    for (final unit in builder.units) {
      builder.add(
        Field(
          (unitField) => unitField
            ..modifier = FieldModifier.constant
            ..name = unit.displayName
            ..assignment = Code("${builder.unitClassName}.${unit.displayName}"),
        ),
      );
    }

    return builder.flush();
  }
}
