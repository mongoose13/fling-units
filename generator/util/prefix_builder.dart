import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';
import 'builder.dart';

class PrefixDetails {
  final String name;
  final String shortName;
  final double multiplier;

  PrefixDetails({
    required this.name,
    required this.shortName,
    required this.multiplier,
  });
}

class PrefixBuilder extends ElementBuilder<PrefixDetails> {
  const PrefixBuilder();

  @override
  final checker = const TypeChecker.fromRuntime(PrefixConfig);

  @override
  PrefixDetails build(Element element) => PrefixDetails(
        name: element.displayName,
        shortName: stringOf(element, "shortName"),
        multiplier: doubleOf(element, "multiplier"),
      );
}

class FlingPrefixBuilder extends FlingBuilder {
  FlingPrefixBuilder(
    Element element,
    ConstantReader annotation,
  ) : prefixes = const PrefixBuilder().buildChildren(element);

  final Iterable<PrefixDetails> prefixes;
}
