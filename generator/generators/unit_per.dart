import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import 'package:fling_units/src/core/annotations.dart';
import '../util/builder.dart';

Builder unitPerBuilder(BuilderOptions options) {
  return SharedPartBuilder([UnitPerGenerator(options)], 'unitPer');
}

class UnitPerGenerator extends GeneratorForAnnotation<PrefixType> {
  final BuilderOptions builderOptions;

  UnitPerGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingPrefixBuilder();

    final children = element.children
        .where((element) => builder.checker.hasAnnotationOfExact(element))
        .map((element) => (
              name: element.displayName,
              shortName: builder.checker
                  .firstAnnotationOfExact(element)!
                  .getField("shortName")!
                  .toStringValue(),
            ));

    builder.add(
      Class(
        (unitPer) => unitPer
          ..name = "UnitPer"
          ..types.addAll([
            Reference("N extends Unit<D>"),
            Reference("D extends Dimension"),
          ])
          ..extend = Reference("PrefixedUnitPer<N, D>")
          ..constructors.add(
            Constructor(
              (constructor) => constructor
                ..requiredParameters.add(
                  Parameter(
                    (numerator) => numerator
                      ..name = "numerator"
                      ..toSuper = true,
                  ),
                ),
            ),
          )
          ..methods.addAll(
            children.map(
              (prefix) => Method(
                (meth) => meth
                  ..docs.add(
                      "/// Establishes a prefix for the derived unit being constructed.")
                  ..name = prefix.name
                  ..returns = Reference("PrefixedUnitPer<N, D>")
                  ..type = MethodType.getter
                  ..lambda = true
                  ..body = Code(
                      "PrefixedUnitPer(numerator, prefix: _${prefix.name})"),
              ),
            ),
          ),
      ),
    );

    return builder.flush();
  }
}
