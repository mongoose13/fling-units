import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';

import '../builders/base.dart';
import '../generator.dart';

Builder derivedUnitBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "derived_units",
    DerivedUnitGenerator((options.config["max"] as num?)?.toInt() ?? 3),
  );
}

class DerivedUnitGenerator extends FlingGenerator {
  final int max;
  DerivedUnitGenerator(this.max);

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
                """/// A derived unit that has $dimensionCount components.""")
            ..name = "DerivedUnit$dimensionCount"
            ..types
                .addAll(counts.map((i) => Reference("D$i extends f.Dimension")))
            ..types
                .addAll(counts.map((i) => Reference("I$i extends f.Dimension")))
            ..extend = Reference(
                "Unit<f.Dimension$dimensionCount<$dimensions>, f.Dimension$dimensionCount<$invertedDimensions>>")
            ..implements.add(Reference(
                "Prefixable<DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>>"))
            ..constructors.addAll(
              [
                Constructor(
                  (constructor) => constructor
                    ..docs.add("/// Constructor.")
                    ..constant = true
                    ..optionalParameters.addAll([
                      Parameter(
                        (parameter) => parameter
                          ..named = true
                          ..required = true
                          ..name = "name"
                          ..toSuper = true,
                      ),
                      Parameter(
                        (parameter) => parameter
                          ..named = true
                          ..required = true
                          ..name = "unitMultiplier"
                          ..toSuper = true,
                      ),
                      Parameter(
                        (parameter) => parameter
                          ..named = true
                          ..name = "prefix"
                          ..toSuper = true
                          ..defaultTo = Code("const UnitPrefix.unit()"),
                      )
                    ]),
                ),
                Constructor(
                  (constructor) => constructor
                    ..docs.add("/// Constructor using three existing units.")
                    ..name = "build"
                    ..requiredParameters.addAll(counts.map(
                      (i) => Parameter((first) => first
                        ..name = "unit$i"
                        ..type = Reference("Unit<D$i, I$i>")),
                    ))
                    ..optionalParameters.addAll(
                      [
                        Parameter(
                          (name) => name
                            ..name = "name"
                            ..named = true
                            ..type = Reference("String?"),
                        ),
                        Parameter(
                          (name) => name
                            ..name = "prefix"
                            ..named = true
                            ..toSuper = true
                            ..defaultTo = Code("const UnitPrefix.unit()"),
                        ),
                      ],
                    )
                    ..initializers.add(
                      Code("super("
                          "name: name ?? (${counts.map((i) => "unit1 == unit$i").join(" && ")} ? \"\$unit1${switch (dimensionCount) {
                        2 => "²",
                        3 => "³",
                        _ => "^$dimensionCount"
                      }}\" : \"${counts.map((i) => "\${unit$i.toString()}").join("⋅")}\")"
                          ", unitMultiplier: ${counts.map((i) => "unit$i.multiplier").join(" * ")}"
                          ")"),
                    ),
                ),
              ],
            )
            ..methods.add(
              Method(
                (call) => call
                  ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                  ..name = "call"
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>")
                  ..requiredParameters.add(
                    Parameter(
                      (magnitude) => magnitude
                        ..name = "magnitude"
                        ..type = Reference("num"),
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (precision) => precision
                        ..named = true
                        ..name = "precision"
                        ..type = Reference("f.Precision")
                        ..defaultTo = Code("f.Precision.max"),
                    ),
                  )
                  ..lambda = true
                  ..body = Code(
                      "DerivedMeasurement$dimensionCount(magnitude: magnitude, defaultUnit: this, precision: precision)"),
              ),
            )
            ..methods.add(
              Method(
                (using) => using
                  ..docs.add(
                      """/// Creates a [Measurement] from this [Unit] using existing [Measurement]s of
  /// the same dimension.
  ///
  /// ```dart
  /// // creates a "cubic meter" measurement that is 3 feet wide by 2 feet long by 1 foot high
  /// cubic(meters).using(3.feet, 2.feet, 1.feet);
  /// ```""")
                  ..name = "using"
                  ..types.addAll(
                    counts.map(
                        (i) => Reference("M$i extends Measurement<D$i, I$i>")),
                  )
                  ..requiredParameters.addAll(
                    counts.map(
                      (i) => Parameter(
                        (parameter) => parameter
                          ..name = "measurement$i"
                          ..type = Reference("M$i"),
                      ),
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (precision) => precision
                        ..name = "precision"
                        ..named = true
                        ..type = Reference("f.Precision?"),
                    ),
                  )
                  ..returns = Reference(
                      "DerivedMeasurement$dimensionCount<$dimensions, $invertedDimensions>")
                  ..body = Code("""
                      final magnitude = ${counts.map((i) => "measurement$i.si").join(" * ")} / multiplier;
                      return DerivedMeasurement$dimensionCount(
                        magnitude: magnitude,
                        precision: precision ??
                            f.Precision.combine(
                              [${counts.map((i) => "measurement$i.precision").join(", ")}],
                              magnitude,
                            ),
                        defaultUnit: this,
                      );"""),
              ),
            )
            ..methods.add(
              Method(
                (withName) => withName
                  ..docs.add(
                      """/// Creates a new [Unit] that is identical to this [Unit] but with a different name.
  ///
  /// If this [Unit] already has a name, it is ignored in favor of the provided name.
  ///
  /// ```dart
  /// final milliMeters = milli.meters.withName("millimeters");
  /// ```""")
                  ..name = "withName"
                  ..requiredParameters.add(
                    Parameter((name) => name
                      ..name = "name"
                      ..type = Reference("String")),
                  )
                  ..returns = Reference(
                      "DerivedUnit$dimensionCount<$dimensions, $invertedDimensions>")
                  ..lambda = true
                  ..body = Code("DerivedUnit$dimensionCount(name: name"
                      ", unitMultiplier: unitMultiplier"
                      ", prefix: prefix"
                      ",)"),
              ),
            )
            ..methods.add(
              Method(
                (withPrefix) => withPrefix
                  ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                  ..name = "withPrefix"
                  ..requiredParameters.add(
                    Parameter(
                      (prefix) => prefix
                        ..name = "prefix"
                        ..type = Reference("UnitPrefix"),
                    ),
                  )
                  ..returns = Reference(
                      "DerivedUnit$dimensionCount<$dimensions, $invertedDimensions>")
                  ..lambda = true
                  ..body = Code("DerivedUnit$dimensionCount("
                      "name: name,"
                      "unitMultiplier: unitMultiplier,"
                      "prefix: prefix,"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (inverted) => inverted
                  ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                  ..name = "inverted"
                  ..lambda = true
                  ..type = MethodType.getter
                  ..returns = Reference(
                      "DerivedUnit$dimensionCount<$invertedDimensions, $dimensions>")
                  ..body = Code("InvertedDerivedUnit$dimensionCount("
                      "name: \"(\$name)⁻¹\""
                      ", unitMultiplier: unitMultiplier"
                      ", prefix: prefix"
                      ")"),
              ),
            )
            ..methods.add(
              Method(
                (equals) => equals
                  ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                  ..name = "operator =="
                  ..requiredParameters.add(
                    Parameter(
                      (other) => other
                        ..name = "other"
                        ..type = Reference("Object"),
                    ),
                  )
                  ..returns = Reference("bool")
                  ..lambda = true
                  ..body = Code(
                      "other is DerivedUnit$dimensionCount<$dimensions, $invertedDimensions>"
                      " && other.unitMultiplier == unitMultiplier"
                      " && other.prefix == prefix"
                      " && other.name == name"),
              ),
            )
            ..methods.add(
              Method(
                (hashCode) => hashCode
                  ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                  ..name = "hashCode"
                  ..type = MethodType.getter
                  ..returns = Reference("int")
                  ..lambda = true
                  ..body = Code(
                      "unitMultiplier.hashCode * prefix.hashCode * name.hashCode"),
              ),
            )
            ..methods.addAll(
              ["Per", "Dot"].map(
                (type) => Method(
                  (perdot) => perdot
                    ..name = type.toLowerCase()
                    ..returns = Reference(
                        "f.PrefixedUnit$type<DerivedUnit$dimensionCount<$dimensions, $invertedDimensions>"
                        ", f.Dimension$dimensionCount<$dimensions>"
                        ", f.Dimension$dimensionCount<$invertedDimensions>>")
                    ..type = MethodType.getter
                    ..lambda = true
                    ..body = Code("f.PrefixedUnit$type(this)"),
                ),
              ),
            ),
        ),
      );

      builder.add(
        Class((inverted) => inverted
          ..name = "InvertedDerivedUnit$dimensionCount"
          ..types.addAll(counts.map(
            (i) => Reference("D$i extends f.Dimension"),
          ))
          ..types.addAll(counts.map(
            (i) => Reference("I$i extends f.Dimension"),
          ))
          ..extend = Reference(
              "DerivedUnit$dimensionCount<$dimensions, $invertedDimensions>")
          ..constructors.add(
            Constructor(
              (constructor) => constructor
                ..optionalParameters.addAll(
                  [
                    Parameter(
                      (name) => name
                        ..name = "name"
                        ..named = true
                        ..required = true
                        ..toSuper = true,
                    ),
                    Parameter(
                      (unitMultiplier) => unitMultiplier
                        ..name = "unitMultiplier"
                        ..named = true
                        ..required = true
                        ..toSuper = true,
                    ),
                    Parameter(
                      (prefix) => prefix
                        ..name = "prefix"
                        ..named = true
                        ..required = true
                        ..toSuper = true,
                    ),
                  ],
                ),
            ),
          )
          ..constructors.add(
            Constructor(
              (build) => build
                ..name = "build"
                ..requiredParameters.addAll(
                  counts.map(
                    (i) => Parameter(
                      (unit) => unit
                        ..name = "unit$i"
                        ..type = Reference("Unit<D$i, I$i>"),
                    ),
                  ),
                )
                ..optionalParameters.addAll([
                  Parameter(
                    (name) => name
                      ..name = "name"
                      ..named = true
                      ..type = Reference("String?"),
                  ),
                  Parameter(
                    (prefix) => prefix
                      ..name = "prefix"
                      ..named = true
                      ..toSuper = true
                      ..defaultTo = Code("const UnitPrefix.unit()"),
                  )
                ])
                ..initializers.add(
                  Code("super("
                      "name: name ?? (${counts.map((i) => "unit1 == unit$i").join(" && ")} ? \"\$unit1${switch (dimensionCount) {
                    2 => "²",
                    3 => "³",
                    _ => "^$dimensionCount"
                  }}\" : \"${counts.map((i) => "\${unit$i.toString()}").join("⋅")}\")"
                      ", unitMultiplier: ${counts.map((i) => "unit$i.multiplier").join(" * ")}"
                      ")"),
                ),
            ),
          )
          ..methods.add(
            Method(
              (inverted) => inverted
                ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
                ..name = "inverted"
                ..returns = Reference(
                    "DerivedUnit$dimensionCount<$invertedDimensions, $dimensions>")
                ..type = MethodType.getter
                ..lambda = true
                ..body = Code("DerivedUnit$dimensionCount("
                    "name: name"
                    ", unitMultiplier: unitMultiplier"
                    ", prefix: prefix"
                    ")"),
            ),
          )
          ..methods.add(
            Method((multiplier) => multiplier
              ..annotations.add(FlingMeasurementBuilder.overrideAnnotation)
              ..name = "multiplier"
              ..returns = Reference("double")
              ..type = MethodType.getter
              ..lambda = true
              ..body = Code("1.0 / super.multiplier")),
          )),
      );
    }
  }
}
