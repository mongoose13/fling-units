import 'dart:async';

import 'package:build/build.dart';
import 'package:fling_units/src/core/annotations.dart';
import 'package:source_gen/source_gen.dart';

Builder measurementIdentifierBuilder(BuilderOptions options) {
  return MeasurementIdentifierBuilder(options);
}

class MeasurementIdentifierBuilder extends Builder {
  MeasurementIdentifierBuilder(BuilderOptions options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;
    final library = LibraryReader(await buildStep.inputLibrary);
    final measurements =
        library.annotatedWithExact(TypeChecker.fromRuntime(DimensionConfig));
    if (measurements.isNotEmpty) {
      final unitChecker = TypeChecker.fromRuntime(UnitConfig);
      buildStep.writeAsString(
          buildStep.inputId.changeExtension(".measurements"),
          measurements.map((measurement) {
            final measurementName =
                measurement.annotation.read("shortName").stringValue;
            final unitElements = measurement.element.children
                .where((child) => unitChecker.hasAnnotationOfExact(child));
            final annotations = unitElements.map((element) => (
                  element: element,
                  annotation: unitChecker.firstAnnotationOfExact(element)
                ));
            return "$measurementName,${annotations.map((pair) => "${pair.element.name};${pair.annotation?.getField("singularName")?.toStringValue()}").join(",")}";
          }).join("\n"));
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        '.dart': ['.measurements']
      };
}
