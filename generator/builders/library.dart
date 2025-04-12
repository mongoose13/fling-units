import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'base.dart';

import '../generator.dart';

Builder libraryBuilder(BuilderOptions options) {
  return FlingBuilderBase("library", LibraryGenerator());
}

class LibraryGenerator implements FlingGenerator {
  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    final measurements = await builder.measurements;
    for (var measurement in measurements) {
      builder.add(Directive.export(measurement.asset
          .changeExtension(".dart")
          .path
          .replaceFirst("lib/src/", "../")));
    }
  }
}
