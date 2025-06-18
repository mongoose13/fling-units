import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:fling_units/src/generator/builders/builder.dart';

import '../../builders/bulder_base.dart';
import '../../builders/builder_library.dart';

Builder perDotBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "perdot",
    PerDotGenerator(FlingBuilderBase.maxDimensions(options)),
  );
}

class PerDotGenerator extends FlingGenerator {
  final int maxDimensions;
  PerDotGenerator(this.maxDimensions);

  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    builder.add(Directive.import("package:fling_units/fling_units.dart"));

    for (final dimensionCount in increments(min: 2, max: maxDimensions)) {
      final counts = increments(max: dimensionCount - 1);
      final dimensionReferences = counts
          .map(
            (i) => Reference("D$i extends Dimension"),
          )
          .followedBy(
            counts.map(
              (i) => Reference("I$i extends Dimension"),
            ),
          );

      builder.add(Code("// $dimensionCount dimensions"));

      builder.add(
        Class(
          (perdot) => perdot
            ..name = "MeasurementPerDot$dimensionCount"
            ..types.addAll(dimensionReferences)
            ..abstract = true
            ..extend = Reference("MeasurementPerDot")
            ..fields.addAll(
              counts.map(
                (i) => Field(
                  (unit) => unit
                    ..name = "unit$i"
                    ..type = Reference("Unit<D$i, I$i>")
                    ..modifier = FieldModifier.final$,
                ),
              ),
            )
            ..constructors.add(
              Constructor(
                (constructor) => constructor
                  ..constant = true
                  ..requiredParameters.add(
                    Parameter(
                      (magnitude) => magnitude
                        ..name = "magnitude"
                        ..toSuper = true,
                    ),
                  )
                  ..requiredParameters.addAll(
                    counts.map(
                      (i) => Parameter(
                        (unit) => unit
                          ..name = "unit$i"
                          ..toThis = true,
                      ),
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (prefix) => prefix
                        ..name = "prefix"
                        ..named = true
                        ..toSuper = true,
                    ),
                  ),
              ),
            ),
        ),
      );

      final extensions = ["D", "I"]
          .map((t) => counts.map((i) => "$t$i"))
          .expand((item) => item)
          .join(", ");

      for (final type in ["Per", "Dot"]) {
        final isPer = type == "Per";
        builder.add(
          Class(
            (prefixed) => prefixed
              ..name = "PrefixedMeasurement$type$dimensionCount"
              ..types.addAll(dimensionReferences)
              ..extend =
                  Reference("MeasurementPerDot$dimensionCount<$extensions>")
              ..constructors.add(
                Constructor(
                  (constructor) => constructor
                    ..constant = true
                    ..requiredParameters.add(
                      Parameter(
                        (magnitude) => magnitude
                          ..name = "magnitude"
                          ..toSuper = true,
                      ),
                    )
                    ..requiredParameters.addAll(
                      counts.map(
                        (i) => Parameter(
                          (unit) => unit
                            ..name = "unit$i"
                            ..toSuper = true,
                        ),
                      ),
                    )
                    ..optionalParameters.add(
                      Parameter(
                        (prefix) => prefix
                          ..name = "prefix"
                          ..named = true
                          ..toSuper = true,
                      ),
                    ),
                ),
              )
              ..methods.add(
                Method(
                  (build) => build
                    ..name = "build"
                    ..returns = Reference("DerivedMeasurement$dimensionCount<"
                        "${counts.map((i) => "D$i").join(", ")}, ${isPer ? "I" : "D"}, "
                        "${counts.map((i) => "I$i").join(", ")}, ${isPer ? "D" : "I"}>")
                    ..types.addAll(
                      ["D", "I"].map(
                        (i) => Reference("$i extends Dimension"),
                      ),
                    )
                    ..requiredParameters.add(
                      Parameter(
                        (unit) => unit
                          ..name = "unit"
                          ..type = Reference("Unit<D, I>"),
                      ),
                    )
                    ..lambda = true
                    ..body = Code("DerivedMeasurement$dimensionCount("
                        "magnitude: magnitude"
                        ", precision: Precision.max"
                        ", defaultUnit: DerivedUnit$dimensionCount(${counts.map((i) => "unit$i").join(", ")}, unit${isPer ? ".inverted" : ""})"
                        ")"),
                ),
              ),
          ),
        );
        builder.add(
          Class(
            (prefixed) => prefixed
              ..name = "Measurement$type$dimensionCount"
              ..types.addAll(dimensionReferences)
              ..extend = Reference(
                  "PrefixedMeasurement$type$dimensionCount<$extensions>")
              ..constructors.add(
                Constructor(
                  (constructor) => constructor
                    ..constant = true
                    ..requiredParameters.add(
                      Parameter(
                        (magnitude) => magnitude
                          ..name = "magnitude"
                          ..toSuper = true,
                      ),
                    )
                    ..requiredParameters.addAll(
                      counts.map(
                        (i) => Parameter(
                          (unit) => unit
                            ..name = "unit$i"
                            ..toSuper = true,
                        ),
                      ),
                    )
                    ..optionalParameters.add(
                      Parameter(
                        (prefix) => prefix
                          ..name = "prefix"
                          ..named = true
                          ..toSuper = true,
                      ),
                    ),
                ),
              ),
          ),
        );
      }

      builder.add(
        Class(
          (perdot) => perdot
            ..name = "UnitPerDot$dimensionCount"
            ..abstract = true
            ..types.addAll(dimensionReferences)
            ..fields.addAll(
              counts.map(
                (i) => Field(
                  (unit) => unit
                    ..name = "unit$i"
                    ..type = Reference("Unit<D$i, I$i>")
                    ..modifier = FieldModifier.final$,
                ),
              ),
            )
            ..fields.add(
              Field(
                (prefix) => prefix
                  ..name = "prefix"
                  ..type = Reference("UnitPrefix")
                  ..modifier = FieldModifier.final$,
              ),
            )
            ..constructors.add(
              Constructor(
                (constructor) => constructor
                  ..requiredParameters.addAll(
                    counts.map(
                      (i) => Parameter(
                        (unit) => unit
                          ..name = "unit$i"
                          ..toThis = true,
                      ),
                    ),
                  )
                  ..optionalParameters.add(
                    Parameter(
                      (prefix) => prefix
                        ..name = "prefix"
                        ..named = true
                        ..toThis = true
                        ..defaultTo = Code("const UnitPrefix.unit()"),
                    ),
                  ),
              ),
            ),
        ),
      );

      for (final type in ["Per", "Dot"]) {
        final isPer = type == "Per";
        builder.add(
          Class(
            (perdot) => perdot
              ..name = "PrefixedUnit$type$dimensionCount"
              ..types.addAll(dimensionReferences)
              ..extend = Reference("UnitPerDot$dimensionCount<$extensions>")
              ..constructors.add(
                Constructor(
                  (constructor) => constructor
                    ..requiredParameters.addAll(
                      counts.map(
                        (i) => Parameter(
                          (unit) => unit
                            ..name = "unit$i"
                            ..toSuper = true,
                        ),
                      ),
                    )
                    ..optionalParameters.add(
                      Parameter(
                        (prefix) => prefix
                          ..name = "prefix"
                          ..named = true
                          ..toSuper = true,
                      ),
                    ),
                ),
              )
              ..methods.add(
                Method(
                  (build) => build
                    ..name = "build"
                    ..types.addAll(["D", "I"]
                        .map((d) => Reference("$d extends Dimension")))
                    ..requiredParameters.add(
                      Parameter(
                        (unit) => unit
                          ..name = "unit"
                          ..type = Reference("Unit<D, I>"),
                      ),
                    )
                    ..returns = Reference("DerivedUnit$dimensionCount<"
                        "${counts.map((i) => "D$i").join(", ")}"
                        ", ${isPer ? "I" : "D"}"
                        ", ${counts.map((i) => "I$i").join(", ")}"
                        ", ${isPer ? "D" : "I"}"
                        ">")
                    ..lambda = true
                    ..body = Code(
                        "DerivedUnit$dimensionCount(${counts.map((i) => "unit$i").join(", ")}, unit${isPer ? ".inverted" : ""})"),
                ),
              ),
          ),
        );
        builder.add(
          Class(
            (perdot) => perdot
              ..name = "Unit$type$dimensionCount"
              ..types.addAll(dimensionReferences)
              ..extend =
                  Reference("PrefixedUnit$type$dimensionCount<$extensions>")
              ..constructors.add(
                Constructor(
                  (constructor) => constructor
                    ..requiredParameters.addAll(
                      counts.map(
                        (i) => Parameter(
                          (unit) => unit
                            ..name = "unit$i"
                            ..toSuper = true,
                        ),
                      ),
                    ),
                ),
              ),
          ),
        );
      }
    }
  }
}
