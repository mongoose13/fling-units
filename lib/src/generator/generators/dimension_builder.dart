import 'dart:async';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:fling_units/src/generator/util/builder.dart';

import '../builders/base.dart';
import '../generator.dart';

Builder dimensionBuilder(BuilderOptions options) {
  return FlingBuilderBase(
    "dimensions",
    DimensionGenerator(FlingBuilderBase.maxDimensions(options)),
  );
}

class DimensionGenerator extends FlingGenerator {
  final int maxDimensions;
  DimensionGenerator(this.maxDimensions);

  @override
  Future<void> generate(FlingStandaloneBuilder builder) async {
    builder.add(Directive.import("package:fling_units/fling_units.dart"));

    for (final dimensionCount in increments(max: maxDimensions)) {
      builder.add(
        Class(
          (dimension) => dimension
            ..name = "Dimension$dimensionCount"
            ..types.addAll(
              increments(max: dimensionCount).map(
                (i) => Reference("D$i extends Dimension"),
              ),
            )
            ..extend = Reference("Dimension")
            ..constructors.add(
              Constructor(
                (constructor) => constructor..constant = true,
              ),
            ),
        ),
      );
    }
  }
}
