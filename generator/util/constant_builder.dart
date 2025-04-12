import 'package:analyzer/dart/element/element.dart';
import 'package:fling_units/src/core/annotations.dart';
import 'package:source_gen/source_gen.dart';

import 'builder.dart';

class ConstantDetails {
  final String name;
  final String unit;
  final double magnitude;
  final int precision;

  ConstantDetails({
    required this.name,
    required this.unit,
    required this.magnitude,
    required this.precision,
  });
}

class ConstantBuilder extends ElementBuilder<ConstantDetails> {
  const ConstantBuilder();

  @override
  final checker = const TypeChecker.fromRuntime(MeasurementConstant);

  @override
  ConstantDetails build(Element element) => ConstantDetails(
        name: element.displayName,
        unit: stringOf(element, 'unit'),
        magnitude: doubleOf(element, 'magnitude'),
        precision: intOf(element, 'precision'),
      );
}
