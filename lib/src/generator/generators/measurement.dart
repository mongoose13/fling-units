import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import '../generator.dart';

Builder measurementBuilder(BuilderOptions options) {
  return SharedPartBuilder([MeasurementGenerator(options)], 'measurement');
}

class MeasurementGenerator extends GeneratorForAnnotation<DimensionConfig> {
  final BuilderOptions builderOptions;

  MeasurementGenerator(this.builderOptions);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final builder = FlingMeasurementBuilder(element, annotation);

    if (builder.dimension.isDerived) {
      return;
    }

    for (final isInverted in [false, true]) {
      if (builder.siUnit == null) {
        throw ArgumentError(
            "No SI unit identified for ${builder.dimension.name}");
      }
      final siUnit = builder.siUnit!;
      final dimensionName = isInverted
          ? "Inverted${builder.dimension.name}"
          : builder.dimension.name;
      final invertedDimensionName = isInverted
          ? builder.dimension.name
          : "Inverted${builder.dimension.name}";
      final unitName = "${dimensionName}Unit";
      final measurementName = "${dimensionName}Measurement";
      final invertedMeasurementName = "${invertedDimensionName}Measurement";
      final measurementType = Reference(measurementName);
      builder.add(
        Class(
          (measurement) => measurement
            ..name = measurementName
            ..extend = Reference(
                "f.Measurement<$dimensionName, $invertedDimensionName>")
            ..fields.add(
              Field(
                (si) => si
                  ..static = true
                  ..modifier = FieldModifier.constant
                  ..name = 'siUnit'
                  ..type = Reference(unitName)
                  ..assignment = Code(switch (isInverted) {
                    false => siUnit.name,
                    true =>
                      "$unitName._(name: \"${builder.siUnit}⁻¹\", unitMultiplier: 1.0)",
                  }),
              ),
            )
            ..fields.add(
              Field(
                (defaultUnit) => defaultUnit
                  ..docs.add("""/// The default unit for this measurement.
                                ///
                                /// Operations that require a unit conversion, but are not provided one (e.g.
                                /// [toString]) will make use of this unit.
                                ///
                                /// By default, this is set as the unit used to create the measurement. It can
                                /// be changed using [butAs].""")
                  ..modifier = FieldModifier.final$
                  ..name = 'defaultUnit'
                  ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                  ..type = Reference(unitName),
              ),
            )
            ..constructors.add(
              Constructor(
                (constructor) => constructor
                  ..constant = true
                  ..requiredParameters.add(
                    Parameter(
                      (magnitude) => magnitude
                        ..docs.add(
                            "/// The magnitude of the measurement as a multiple of the measurement's [defaultUnit].")
                        ..name = "magnitude"
                        ..type = Reference("num"),
                    ),
                  )
                  ..requiredParameters.add(
                    Parameter(
                      (defaultUnit) => defaultUnit
                        ..docs.add(
                            "/// The [Unit] in which the measurement was made.")
                        ..name = "defaultUnit"
                        ..toThis = true,
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (precision) => precision
                        ..name = "precision"
                        ..named = true
                        ..type = Reference("f.Precision")
                        ..defaultTo = Code("f.Precision.max"),
                    ),
                  )
                  ..initializers.add(Code(
                      "super(magnitude: magnitude, precision: precision,)")),
              ),
            )
            ..constructors.add(
              Constructor(
                (sum) => sum
                  ..docs.add(
                      "/// Creates a measurement that is the sum of several measurements.")
                  ..name = "sum"
                  ..requiredParameters.add(
                    Parameter(
                      (parts) => parts
                        ..name = "parts"
                        ..type = Reference("Iterable<f.$measurementName>"),
                    ),
                  )
                  ..optionalParameters.addAll(
                    [
                      Parameter(
                        (precision) => precision
                          ..name = "precision"
                          ..type = Reference("f.Precision")
                          ..defaultTo = Code("f.Precision.max")
                          ..named = true,
                      ),
                      Parameter(
                        (defaultUnit) => defaultUnit
                          ..name = "defaultUnit"
                          ..type = Reference("$unitName?")
                          ..named = true,
                      ),
                    ],
                  )
                  ..initializers.add(
                    Code("defaultUnit = defaultUnit ?? parts.first.defaultUnit,"
                        "super("
                        "magnitude: (defaultUnit ?? parts.first.defaultUnit).fromSI(parts.fold("
                        "0.0, (previousValue, element) => previousValue + element.si)),"
                        "precision: precision,"
                        ")"),
                  ),
              ),
            )
            ..constructors.add(
              Constructor(
                (zero) => zero
                  ..constant = true
                  ..name = "zero"
                  ..optionalParameters.add(
                    Parameter(
                      (unit) => unit
                        ..name = "defaultUnit"
                        ..toThis = true
                        ..defaultTo = Code("siUnit"),
                    ),
                  )
                  ..initializers.add(Code("super.zero()")),
              ),
            )
            ..constructors.add(
              Constructor(
                (infinite) => infinite
                  ..constant = true
                  ..name = "infinite"
                  ..optionalParameters.add(
                    Parameter(
                      (unit) => unit
                        ..name = "defaultUnit"
                        ..toThis = true
                        ..defaultTo = Code("siUnit"),
                    ),
                  )
                  ..initializers.add(Code("super.infinite()")),
              ),
            )
            ..constructors.add(
              Constructor(
                (negativeInfinite) => negativeInfinite
                  ..constant = true
                  ..name = "negativeInfinite"
                  ..optionalParameters.add(
                    Parameter(
                      (unit) => unit
                        ..name = "defaultUnit"
                        ..toThis = true
                        ..defaultTo = Code("siUnit"),
                    ),
                  )
                  ..initializers.add(Code("super.negativeInfinite()")),
              ),
            )
            ..constructors.add(
              Constructor(
                (nan) => nan
                  ..constant = true
                  ..name = "nan"
                  ..optionalParameters.add(
                    Parameter(
                      (unit) => unit
                        ..name = "defaultUnit"
                        ..toThis = true
                        ..defaultTo = Code("siUnit"),
                    ),
                  )
                  ..initializers.add(Code("super.nan()")),
              ),
            )
            ..methods.add(
              Method(
                (withPrecision) => withPrecision
                  ..docs.add(
                      "/// Creates an equivalent measurement with the specified precision (significant digits).")
                  ..name = "withPrecision"
                  ..lambda = true
                  ..requiredParameters.add(Parameter(
                    (precision) => precision
                      ..name = "precision"
                      ..type = Reference("f.Precision"),
                  ))
                  ..returns = measurementType
                  ..body = Code(
                      "$measurementName(magnitude.toDouble(), defaultUnit, precision: precision)"),
              ),
            )
            ..methods.add(
              Method(
                (negate) => negate
                  ..docs.add(
                      "/// Returns a measurement representing the opposite magnitude of this.")
                  ..name = "operator -"
                  ..lambda = true
                  ..returns = measurementType
                  ..body = Code(
                      "$measurementName(-magnitude.toDouble(), defaultUnit, precision: precision)"),
              ),
            )
            ..methods.add(
              Method(
                (add) => add
                  ..docs.add(
                      "/// Returns a measurement equivalent to the sum of this and another measurement of the same dimension.")
                  ..name = "operator +"
                  ..lambda = true
                  ..requiredParameters.add(
                    Parameter(
                      (other) => other
                        ..name = "other"
                        ..type = measurementType,
                    ),
                  )
                  ..returns = measurementType
                  ..body = Code(
                      "$measurementName(defaultUnit.fromSI(si + other.si), defaultUnit, precision: f.Precision.addition(this, other))"),
              ),
            )
            ..methods.add(
              Method(
                (add) => add
                  ..docs.add(
                      "/// Returns a measurement equivalent to the difference between this and another measurement of the same dimension.")
                  ..name = "operator -"
                  ..lambda = true
                  ..requiredParameters.add(
                    Parameter((other) => other
                      ..name = "other"
                      ..type = measurementType),
                  )
                  ..returns = measurementType
                  ..body = Code(
                      "$measurementName(defaultUnit.fromSI(si - other.si), defaultUnit, precision: f.Precision.addition(this, -other))"),
              ),
            )
            ..methods.add(
              Method(
                (multiply) => multiply
                  ..docs.add(
                      "/// Returns a measurement equivalent to a multiple of this.")
                  ..name = "operator *"
                  ..lambda = true
                  ..returns = measurementType
                  ..requiredParameters.add(
                    Parameter(
                      (multiplier) => multiplier
                        ..name = "multiplier"
                        ..type = Reference("num"),
                    ),
                  )
                  ..body = Code(
                      "$measurementName(magnitude * multiplier.toDouble(), defaultUnit, precision: precision)"),
              ),
            )
            ..methods.add(
              Method(
                (divide) => divide
                  ..docs.add(
                      "/// Returns a measurement equivalent to a fraction of this.")
                  ..name = "operator /"
                  ..lambda = true
                  ..returns = measurementType
                  ..requiredParameters.add(
                    Parameter(
                      (divisor) => divisor
                        ..name = "divisor"
                        ..type = Reference("num"),
                    ),
                  )
                  ..body = Code(
                      "$measurementName(magnitude / divisor.toDouble(), defaultUnit, precision: precision)"),
              ),
            )
            ..methods.add(
              Method((euclid) => euclid
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
                ..requiredParameters.add(
                  Parameter(
                    (other) => other
                      ..name = "other"
                      ..type = measurementType,
                  ),
                )
                ..returns = measurementType
                ..body = Code(
                    "final magnitude = defaultUnit.fromSI(preciseDefaultValue % other.preciseDefaultValue);"
                    "return $measurementName(magnitude, defaultUnit, precision: f.Precision.combine([precision, other.precision], magnitude));")),
            )
            ..methods.add(
              Method(
                (butAs) => butAs
                  ..docs.add(
                      "/// Creates a new measurement equivalent to this one but with a different default unit.")
                  ..name = "butAs"
                  ..returns = measurementType
                  ..lambda = true
                  ..requiredParameters.add(
                    Parameter(
                      (unit) => unit
                        ..name = "unit"
                        ..type = Reference(unitName),
                    ),
                  )
                  ..body = Code(
                      "$measurementName(unit.fromSI(si), unit, precision: precision)"),
              ),
            )
            ..methods.add(
              Method(
                (as) => as
                  ..docs.add(
                      "/// Converts the default value of this measurement to the specified unit.")
                  ..name = "as"
                  ..requiredParameters.add(
                    Parameter(
                      (unit) => unit
                        ..name = "unit"
                        ..type = Reference(unitName),
                    ),
                  )
                  ..returns = Reference("double")
                  ..lambda = true
                  ..body = Code("unit.fromSI(precision.apply(si))"),
              ),
            )
            ..methods.add(
              Method(
                (inverted) => inverted
                  ..docs.add(
                      """/// Creates a measurement that is the inverse of this measurement.
                       ///
                       /// For example:
                       /// ```dart
                       /// final hertz = 3.seconds.inverted; // 1/3 Hz
                       /// ```""")
                  ..lambda = true
                  ..type = MethodType.getter
                  ..name = "inverted"
                  ..returns = Reference(invertedMeasurementName)
                  ..body = Code(
                      "$invertedMeasurementName(magnitude, defaultUnit.inverted, precision: precision,)"),
              ),
            )
            ..methods.add(
              Method(
                (per) => per
                  ..docs.add(
                      """/// Creates a derived measurement of a derived unit consisting of this measurement's
                       /// unit in the numerator and the specified unit in the denominator, with this measurement's
                       /// default value as the default value of the resulting derived unit.""")
                  ..name = "per"
                  ..lambda = true
                  ..type = MethodType.getter
                  ..returns = Reference(
                      "f.MeasurementPer2<$dimensionName, $invertedDimensionName>")
                  ..body = Code("f.MeasurementPer2(defaultValue, defaultUnit)"),
              ),
            )
            ..methods.add(
              Method(
                (dot) => dot
                  ..docs.add(
                      """/// Creates a derived measurement of a derived unit consisting of this measurement's
                       /// unit multiplied by the specified measurement's unit, with this measurement's
                       /// default value as the default value of the resulting derived unit.""")
                  ..name = "dot"
                  ..lambda = true
                  ..type = MethodType.getter
                  ..returns = Reference(
                      "f.MeasurementDot2<$dimensionName, $invertedDimensionName>")
                  ..body = Code("f.MeasurementDot2(defaultValue, defaultUnit)"),
              ),
            )
          /*
            ..methods.add(
              Method(
                (over) => over
                  ..docs.add(
                      "/// Creates a derived measurement representing the ratio of this and another measurement.")
                  ..name = "over"
                  ..lambda = true
                  ..types.addAll([
                    Reference("D extends f.Dimension"),
                    Reference("I extends f.Dimension")
                  ])
                  ..requiredParameters.add(
                    Parameter(
                      (term) => term
                        ..name = "term"
                        ..type = Reference("f.Measurement<D, I>"),
                    ),
                  )
                  ..returns = Reference(
                      "f.DerivedMeasurement2<$dimensionName, I, $invertedDimensionName, D>")
                  ..body = Code(
                      "f.DerivedUnit2(defaultUnit, term.defaultUnit.inverted)"
                      "(defaultValue / term.defaultValue)"),
              ),
            )
            ..methods.add(
              Method(
                (by) => by
                  ..docs.add(
                      "/// Creates a derived measurement representing the product of this and another measurement.")
                  ..name = "by"
                  ..lambda = true
                  ..types.addAll([
                    Reference("D extends f.Dimension"),
                    Reference("I extends f.Dimension")
                  ])
                  ..requiredParameters.add(
                    Parameter(
                      (term) => term
                        ..name = "term"
                        ..type = Reference("f.Measurement<D, I>"),
                    ),
                  )
                  ..returns = Reference(
                      "f.DerivedMeasurement2<$dimensionName, D, $invertedDimensionName, I>")
                  ..body = Code("f.DerivedUnit2(defaultUnit, term.defaultUnit)"
                      "(defaultValue * term.defaultValue)"),
              ),
            )
            */
          ,
        ),
      );
    }

    return builder.flush();
  }
}
