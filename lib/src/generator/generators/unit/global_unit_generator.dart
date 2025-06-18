import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../../annotations.dart';
import '../../builders/builder_library.dart';

Builder globalUnitBuilder(BuilderOptions options) {
  return SharedPartBuilder([GlobalUnitGenerator(options)], 'unit');
}

class GlobalUnitGenerator extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  GlobalUnitGenerator(this.builderOptions);

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

    for (final unit in builder.units) {
      builder.add(
        Field(
          (unitField) => unitField
            ..modifier = FieldModifier.constant
            ..type = Reference(builder.unitName)
            ..name = unit.name
            ..assignment = Code("${builder.unitName}.${unit.name}"),
        ),
      );
    }

    return builder.flush();
  }
}
