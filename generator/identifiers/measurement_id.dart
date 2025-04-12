import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';
import '../util/dimension_builder.dart';

Builder measurementIdentifierBuilder(BuilderOptions options) {
  return MeasurementIdentifierBuilder(options);
}

/// Writes a summary file containing details for each measurement.
///
/// This will create one file per dimension.
///
/// Read at: [FlingStandaloneBuilder]
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
      final unitBuilder = const UnitBuilder();
      buildStep.writeAsString(
          buildStep.inputId.changeExtension(".measurements"),
          measurements.map((measurement) {
            final builder = DimensionBuilder(measurement.annotation);
            final units = unitBuilder.buildChildren(measurement.element);
            return "${builder.name}|${builder.types?.map((type) => type.name).join(".")},"
                "${units.map((unit) => [
                      unit.name,
                      unit.shortName,
                      unit.singularName,
                      unit.multiplier,
                      unit.isVisible,
                      unit.isSI,
                    ].join(";")).join(",")}";
          }).join("\n"));
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        '.dart': ['.measurements']
      };
}
