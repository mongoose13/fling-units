import 'dart:async';

import 'package:build/build.dart';
import 'package:fling_units/generator/util/annotations.dart';
import 'package:source_gen/source_gen.dart';

Builder prefixIdentifierBuilder(BuilderOptions options) {
  return PrefixIdentifierBuilder(options);
}

class PrefixIdentifierBuilder extends Builder {
  PrefixIdentifierBuilder(BuilderOptions options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;
    final library = LibraryReader(await buildStep.inputLibrary);
    final prefixes =
        library.annotatedWithExact(TypeChecker.fromRuntime(PrefixType));
    if (prefixes.isNotEmpty) {
      final prefixChecker = TypeChecker.fromRuntime(PrefixConfig);
      buildStep.writeAsString(
          buildStep.inputId.changeExtension(".prefixes"),
          prefixes
              .map((prefix) => prefix.element.children
                  .where((child) => prefixChecker.hasAnnotationOfExact(child))
                  .map((element) => prefixChecker
                      .annotationsOfExact(element)
                      .map((anno) =>
                          "${element.name},${anno.getField("shortName")?.toStringValue()},${anno.getField("multiplier")?.toDoubleValue()?.toStringAsExponential()}")
                      .join("\n"))
                  .join("\n"))
              .join("\n"));
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        '.dart': ['.prefixes']
      };
}
