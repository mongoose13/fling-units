import 'package:analyzer/dart/element/element.dart';
import 'package:fling_units/src/core/annotations.dart';
import 'package:source_gen/source_gen.dart';

import 'builder.dart';
import 'dimension_builder.dart';
import 'library.dart';

class SpecializationUnit {
  final String displayName;
  final String shortName;
  final String equivalent;

  SpecializationUnit({
    required this.displayName,
    required this.shortName,
    required this.equivalent,
  });
}

class UnitSpecializationBuilder extends ElementBuilder<SpecializationUnit> {
  const UnitSpecializationBuilder();

  @override
  final checker = const TypeChecker.fromRuntime(UnitSpecialization);

  @override
  SpecializationUnit build(Element element) => SpecializationUnit(
        displayName: element.displayName,
        shortName: stringOf(element, "shortName"),
        equivalent: stringOf(element, "equivalent"),
      );
}

class FlingSpecializationBuilder extends FlingBuilder {
  final DimensionBuilder dimension;
  final Iterable<SpecializationUnit> specializedUnits;
  final Iterable<UnitDetails> standardUnits;

  FlingSpecializationBuilder(
    Element element,
    ConstantReader annotation,
  )   : dimension = DimensionBuilder(annotation),
        specializedUnits =
            const UnitSpecializationBuilder().buildChildren(element),
        standardUnits = const UnitBuilder().buildChildren(element);
}
