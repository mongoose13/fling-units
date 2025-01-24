import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import 'package:fling_units/src/core/annotations.dart';
import '../util/builder.dart';

Builder measurementPerBuilder(BuilderOptions options) {
  return SharedPartBuilder(
      [MeasurementPerGenerator(options)], 'measurementPer');
}

class MeasurementPerGenerator extends GeneratorForAnnotation<PrefixType> {
  final BuilderOptions builderOptions;

  MeasurementPerGenerator(this.builderOptions);

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
        (measurementPer) => measurementPer
          ..name = "MeasurementPer"
          ..types.addAll([
            Reference("N extends Measurement<D>"),
            Reference("D extends Dimension"),
          ])
          ..extend = Reference("PrefixedMeasurementPer<N, D>")
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
                      "/// Establishes a prefix for the derived measurement being constructed.")
                  ..name = prefix.name
                  ..returns = Reference("PrefixedMeasurementPer<N, D>")
                  ..type = MethodType.getter
                  ..lambda = true
                  ..body = Code(
                      "PrefixedMeasurementPer(numerator, prefix: _${prefix.name})"),
              ),
            ),
          ),
      ),
    );
    builder.add(
      Class(
        (measurementDot) => measurementDot
          ..name = "MeasurementDot"
          ..types.addAll([
            Reference("N extends Measurement<D>"),
            Reference("D extends Dimension"),
          ])
          ..extend = Reference("PrefixedMeasurementDot<N, D>")
          ..constructors.add(
            Constructor(
              (constructor) => constructor
                ..requiredParameters.add(
                  Parameter(
                    (first) => first
                      ..name = "first"
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
                      "/// Establishes a prefix for the derived measurement being constructed.")
                  ..name = prefix.name
                  ..returns = Reference("PrefixedMeasurementDot<N, D>")
                  ..type = MethodType.getter
                  ..lambda = true
                  ..body = Code(
                      "PrefixedMeasurementDot(first, prefix: _${prefix.name})"),
              ),
            ),
          ),
      ),
    );

    return builder.flush();
  }
}
