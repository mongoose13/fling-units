import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import '../generator.dart';

class FlingBuilderBase extends Builder {
  final String output;
  final FlingGenerator generator;

  FlingBuilderBase(
    this.output,
    this.generator,
  );

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final builder = FlingStandaloneBuilder(buildStep);
    builder.add(Code("// GENERATED CODE - DO NOT MODIFY BY HAND\n"));
    await generator.generate(builder);
    buildStep.writeAsString(buildStep.allowedOutputs.first, builder.flush());
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$lib$': ["src/generated/$output.dart"]
      };
}

abstract class FlingGenerator {
  Future<void> generate(FlingStandaloneBuilder builder);
}
