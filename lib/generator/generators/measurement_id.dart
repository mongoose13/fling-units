import 'dart:async';

import 'package:build/build.dart';
import 'package:fling_units/generator/util/annotations.dart';
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
        library.annotatedWithExact(TypeChecker.fromRuntime(MeasurementConfig));
    if (measurements.isNotEmpty) {
      final unitChecker = TypeChecker.fromRuntime(UnitConfig);
      buildStep.writeAsString(
          buildStep.inputId.changeExtension(".measurements"),
          measurements
              .map((measurement) =>
                  "${measurement.annotation.read("shortName").stringValue},${measurement.element.children.where((child) => unitChecker.hasAnnotationOfExact(child)).map((element) => element.name).join(",")}")
              .join("\n"));
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['.measurements']
      };
}
