import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import '../builders/base.dart';
import '../generator.dart';

Builder derivedMeasurementBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "derived_measurements",
    DerivedMeasurementGenerator((options.config["max"] as num?)?.toInt() ?? 3),
  );
}

class DerivedMeasurementGenerator extends FlingGenerator {
  final int max;
  DerivedMeasurementGenerator(this.max);

  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    builder.add(Directive.partOf("package:fling_units/src/core/library.dart"));

    for (var dimensionCount = 2; dimensionCount <= max; ++dimensionCount) {
      final counts = [for (var i = 1; i <= dimensionCount; ++i) i];
      final dimensions = counts.map((count) => "D$count").join(", ");
      final invertedDimensions = counts.map((count) => "I$count").join(", ");
      builder.add(
        Class(
          (derivedClass) => derivedClass
            ..docs.add(
                """/// A derived measurement that has $dimensionCount components.""")
            ..name = "DerivedMeasurement$dimensionCount"
            ..types
                .addAll(counts.map((i) => Reference("D$i extends f.Dimension")))
            ..types
                .addAll(counts.map((i) => Reference("I$i extends f.Dimension")))
            ..extend = Reference(
                "Measurement<f.Dimension$dimensionCount<$dimensions>, f.Dimension$dimensionCount<$invertedDimensions>>")
            ..constructors.add(
              Constructor(
                (constructor) => constructor
                  ..docs.add("/// Constructor.")
                  ..constant = true
                  ..optionalParameters.addAll([
                    Parameter(
                      (magnitude) => magnitude
                        ..named = true
                        ..required = true
                        ..name = "magnitude"
                        ..toSuper = true,
                    ),
                    Parameter(
                      (precision) => precision
                        ..named = true
                        ..required = true
                        ..name = "precision"
                        ..toSuper = true,
                    ),
                    Parameter((defaultUnit) => defaultUnit
                      ..named = true
                      ..required = true
                      ..name = "defaultUnit"
                      ..toThis = true)
                  ]),
              ),
            )
            ..fields.add(
              Field(
                (defaultUnit) => defaultUnit
                  ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                  ..modifier = FieldModifier.final$
                  ..name = "defaultUnit"
                  ..type = Reference(
                      "DerivedUnit$dimensionCount<$dimensions, $invertedDimensions>"),
              ),
            )
            ..methods.add(
              Method(
                (withPrecision) => withPrecision
                  ..name = "withPrecision"
                  ..requiredParameters.add(
                    Parameter(
                      (precision) => precision
                        ..name = "precision"
                        ..type = Reference("f.Precision"),
                    ),
                  )
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>")
                  ..lambda = true
                  ..body = Code("DerivedMeasurement$dimensionCount("
                      "magnitude: magnitude,"
                      "precision: precision,"
                      "defaultUnit: defaultUnit,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (butAs) => butAs
                  ..name = "butAs"
                  ..requiredParameters.add(
                    Parameter(
                      (unit) => unit
                        ..name = "unit"
                        ..type = Reference(
                            "DerivedUnit$dimensionCount<$dimensions, $invertedDimensions>"),
                    ),
                  )
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>")
                  ..lambda = true
                  ..body = Code("DerivedMeasurement$dimensionCount("
                      "magnitude: unit.fromSI(si),"
                      "precision: precision,"
                      "defaultUnit: unit,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (as) => as
                  ..name = "as"
                  ..requiredParameters.add(Parameter((unit) => unit
                    ..name = "unit"
                    ..type = Reference(
                        "DerivedUnit$dimensionCount<$dimensions, $invertedDimensions>")))
                  ..returns = Reference("double")
                  ..lambda = true
                  ..body = Code("unit.fromSI(precision.apply(si))"),
              ),
            )
            ..methods.add(
              Method(
                (negation) => negation
                  ..docs.add(
                      "/// Returns a measurement representing the opposite magnitude of this.")
                  ..name = "operator -"
                  ..returns = Reference("DerivedMeasurement$dimensionCount")
                  ..lambda = true
                  ..body = Code(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>("
                      "magnitude: -magnitude,"
                      "defaultUnit: defaultUnit,"
                      "precision: precision,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (addition) => addition
                  ..docs.add(
                      "/// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.")
                  ..name = "operator +"
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>")
                  ..requiredParameters.add(
                    Parameter(
                      (other) => other
                        ..name = "other"
                        ..type = Reference(
                            "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>"),
                    ),
                  )
                  ..lambda = true
                  ..body = Code(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>("
                      "magnitude: magnitude + other.as(defaultUnit),"
                      "precision: f.Precision.addition(this, other),"
                      "defaultUnit: defaultUnit,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (subtraction) => subtraction
                  ..docs.add(
                      "/// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.")
                  ..name = "operator -"
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>")
                  ..requiredParameters.add(
                    Parameter(
                      (other) => other
                        ..name = "other"
                        ..type = Reference(
                            "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>"),
                    ),
                  )
                  ..lambda = true
                  ..body = Code(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>("
                      "magnitude: magnitude - other.as(defaultUnit),"
                      "precision: f.Precision.addition(this, other),"
                      "defaultUnit: defaultUnit,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (multiplication) => multiplication
                  ..docs.add(
                      "/// Returns a measurement equivalent to a multiple of this.")
                  ..name = "operator *"
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>")
                  ..requiredParameters.add(
                    Parameter(
                      (multiplier) => multiplier
                        ..name = "multiplier"
                        ..type = Reference("num"),
                    ),
                  )
                  ..lambda = true
                  ..body = Code(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>("
                      "magnitude: magnitude * multiplier.toDouble(),"
                      "precision: precision,"
                      "defaultUnit: defaultUnit,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (division) => division
                  ..docs.add(
                      "/// Returns a measurement equivalent to a fraction of this.")
                  ..name = "operator /"
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>")
                  ..requiredParameters.add(
                    Parameter(
                      (divisor) => divisor
                        ..name = "divisor"
                        ..type = Reference("num"),
                    ),
                  )
                  ..lambda = true
                  ..body = Code(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>("
                      "magnitude: magnitude / divisor.toDouble(),"
                      "precision: precision,"
                      "defaultUnit: defaultUnit,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (modulo) => modulo
                  ..docs.add(
                      """/// Returns the Euclidean remainder of the division between two measurements.
  ///
  /// For example:
  /// ```dart
  /// feet(2) % inches(7); // 3 inches
  /// inches(7) % feet(2); // 7 inches
  /// ```
  ///
  /// For the purposes of this function, a negative divisor is treated identically
  /// to its positive counterpart, and thus the operation always produces a positive
  /// result. This is consistent with the way Dart handles the modulo operator.
  /// For example:
  /// ```dart
  /// feet(2) % inches(-7); // 3 inches
  /// feet(-2) % inches(7); // 4 inches
  /// feet(-2) % inches(-7); // 4 inches
  /// ```
  ///
  /// If the divisor is zero or the dividend is infinite, the result is always NaN.""")
                  ..name = "operator %"
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>")
                  ..requiredParameters.add(
                    Parameter(
                      (other) => other
                        ..name = "other"
                        ..type = Reference(
                            "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>"),
                    ),
                  )
                  ..body = Code(
                      "final magnitude = defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue);"
                      "return DerivedMeasurement$dimensionCount("
                      "magnitude: magnitude,"
                      "defaultUnit: defaultUnit,"
                      "precision: f.Precision.combine([precision, other.precision], magnitude),"
                      ");"),
              ),
            )
            ..methods.add(
              Method(
                (inverted) => inverted
                  ..name = "inverted"
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$invertedDimensions, $dimensions>")
                  ..type = MethodType.getter
                  ..lambda = true
                  ..body = Code("DerivedMeasurement$dimensionCount("
                      "magnitude: magnitude,"
                      "defaultUnit: defaultUnit.inverted,"
                      "precision: precision,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (by) => by
                  ..name = "by"
                  ..returns = Reference(
                      "DerivedMeasurement2<f.Dimension$dimensionCount<$dimensions>, D, f.Dimension$dimensionCount<$invertedDimensions>, I>")
                  ..types.addAll([
                    Reference("D extends f.Dimension, I extends f.Dimension")
                  ])
                  ..requiredParameters.add(
                    Parameter(
                      (term) => term
                        ..name = "term"
                        ..type = Reference("Measurement<D, I>"),
                    ),
                  )
                  ..lambda = true
                  ..body = Code(
                      "f.DerivedUnit2.build(defaultUnit, term.defaultUnit)(defaultValue * term.defaultValue)"),
              ),
            )
            ..methods.add(
              Method(
                (over) => over
                  ..name = "over"
                  ..returns = Reference(
                      "DerivedMeasurement2<f.Dimension$dimensionCount<$dimensions>, I, f.Dimension$dimensionCount<$invertedDimensions>, D>")
                  ..types.addAll([
                    Reference("D extends f.Dimension, I extends f.Dimension")
                  ])
                  ..requiredParameters.add(
                    Parameter(
                      (term) => term
                        ..name = "term"
                        ..type = Reference("Measurement<D, I>"),
                    ),
                  )
                  ..lambda = true
                  ..body = Code(
                      "f.DerivedUnit2.build(defaultUnit, term.defaultUnit.inverted)(defaultValue / term.defaultValue)"),
              ),
            )
            ..methods.add(
              Method(
                (per) => per
                  ..name = "per"
                  ..returns = Reference("f.MeasurementPer<"
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>, "
                      "f.Dimension$dimensionCount<$dimensions>, "
                      "f.Dimension$dimensionCount<$invertedDimensions>>")
                  ..type = MethodType.getter
                  ..lambda = true
                  ..body = Code("f.MeasurementPer(this)"),
              ),
            )
            ..methods.add(
              Method(
                (dot) => dot
                  ..name = "dot"
                  ..returns = Reference("f.MeasurementDot<"
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>, "
                      "f.Dimension$dimensionCount<$dimensions>, "
                      "f.Dimension$dimensionCount<$invertedDimensions>>")
                  ..type = MethodType.getter
                  ..lambda = true
                  ..body = Code("f.MeasurementDot(this)"),
              ),
            ),
        ),
      );
    }
  }
}
