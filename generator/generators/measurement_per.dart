import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

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
    final builder = FlingPrefixBuilder(element, annotation);

    builder.add(
      Class(
        (measurementPer) => measurementPer
          ..name = "MeasurementPer"
          ..types.addAll([
            Reference("N extends Measurement<D, I>"),
            Reference("D extends Dimension"),
            Reference("I extends Dimension"),
          ])
          ..extend = Reference("PrefixedMeasurementPer<N, D, I>")
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
            builder.prefixes.map(
              (prefix) => Method(
                (meth) => meth
                  ..docs.add(
                      "/// Establishes a prefix for the derived measurement being constructed.")
                  ..name = prefix.name
                  ..returns = Reference("PrefixedMeasurementPer<N, D, I>")
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
            Reference("N extends Measurement<D, I>"),
            Reference("D extends Dimension"),
            Reference("I extends Dimension"),
          ])
          ..extend = Reference("PrefixedMeasurementDot<N, D, I>")
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
            builder.prefixes.map(
              (prefix) => Method(
                (meth) => meth
                  ..docs.add(
                      "/// Establishes a prefix for the derived measurement being constructed.")
                  ..name = prefix.name
                  ..returns = Reference("PrefixedMeasurementDot<N, D, I>")
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
