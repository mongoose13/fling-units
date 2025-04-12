import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';

import 'builder.dart';
import 'dimension_builder.dart';
import 'unit_builder.dart';

class MeasurementDetails {
  final String name;
  final AssetId asset;
  final Iterable<DimensionDetails>? dimensions;
  final Iterable<UnitDetails> units;

  MeasurementDetails({
    required this.name,
    required this.asset,
    required this.dimensions,
    required this.units,
  });

  bool get isDerived => dimensions != null;
  int get order => dimensions?.length ?? 0;
}

class FlingMeasurementBuilder extends FlingBuilder {
  static final overrideAnnotation = CodeExpression(Code("override"));
  final checker = const UnitBuilder();
  late final DimensionBuilder dimension;

  late final String unitName;
  late final String measurementName;
  late final String prefixName;

  late final Iterable<UnitDetails> units;
  late final UnitDetails siUnit;

  FlingMeasurementBuilder(
    Element element,
    ConstantReader annotation,
  ) {
    dimension = DimensionBuilder(annotation);
    unitName = "${dimension.name}Unit";
    measurementName = "${dimension.name}Measurement";
    prefixName = "${dimension.name}Prefix";

    units = checker.buildChildren(element);
    siUnit = units.firstWhere(
      (unit) => unit.isSI,
      orElse: () => throw ArgumentError(
        "No SI unit identified for ${dimension.name}",
      ),
    );
  }
}
