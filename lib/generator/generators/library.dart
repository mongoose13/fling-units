import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import '../util/builder.dart';

Builder libraryBuilder(BuilderOptions options) {
  return LibraryBuilder(options);
}

class LibraryBuilder extends Builder {
  LibraryBuilder(BuilderOptions options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final builder = FlingLibraryBuilder(buildStep);
    final measurements = await builder.measurements;

    builder.add(
      Library(
        (library) => library.name = "fling_units",
      ),
    );
    for (var measurement in measurements) {
      builder.add(Directive.export(measurement.asset
          .changeExtension(".dart")
          .path
          .replaceFirst("lib/src", "..")));
    }

    buildStep.writeAsString(buildStep.allowedOutputs.first, builder.flush());
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': ['src/generated/fling_units.dart']
      };
}
