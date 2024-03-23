import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import '../util/builder.dart';

Builder measurementPrefixBuilder(BuilderOptions options) {
  return MeasurementPrefixBuilder(options);
}

class MeasurementPrefixBuilder extends Builder {
  MeasurementPrefixBuilder(BuilderOptions options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final builder = FlingLibraryBuilder(buildStep);
    final measurements = await builder.measurements;

    builder.add(
      Class(
        (prefixClass) => prefixClass
          ..mixins.addAll(
            measurements.map(
              (measurement) => Reference("${measurement.name}Prefix"),
            ),
          )
          ..name = "MeasurementPrefix",
      ),
    );

    buildStep.writeAsString(buildStep.allowedOutputs.first, builder.flush());
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': ['src/generated/prefix.dart']
      };
}
