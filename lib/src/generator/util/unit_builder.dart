import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';
import 'builder.dart';

class UnitDetails {
  final String name;
  final String shortName;
  final String singularName;
  final double multiplier;
  final bool isVisible;
  final bool isSI;

  UnitDetails({
    required this.name,
    required this.shortName,
    required this.singularName,
    required this.multiplier,
    required this.isVisible,
    required this.isSI,
  });
}

class UnitBuilder extends ElementBuilder<UnitDetails> {
  const UnitBuilder();

  @override
  final checker = const TypeChecker.fromRuntime(UnitConfig);

  @override
  UnitDetails build(Element element) => UnitDetails(
        name: element.displayName,
        shortName: stringOf(element, "shortName"),
        singularName: stringOf(element, "singularName"),
        multiplier: doubleOf(element, "multiplier"),
        isVisible: boolOf(element, "isVisible", true),
        isSI: boolOf(element, "isSI", false),
      );
}
