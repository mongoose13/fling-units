import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

import 'annotations.dart';

abstract class FlingBuilder {
  final emitter = DartEmitter(useNullSafetySyntax: true);
  final checker = const TypeChecker.fromRuntime(MeasurementUnit);

  final _buffer = StringBuffer();

  void add(Spec spec) => _buffer.writeln(spec.accept(emitter).toString());

  void write(String line) => _buffer.writeln(line);

  String flush() => DartFormatter().format(_buffer.toString());
}

class MeasurementConfig {
  final String name;
  final AssetId asset;

  MeasurementConfig({
    required this.name,
    required this.asset,
  });
}

class FlingLibraryBuilder extends FlingBuilder {
  late final Future<Iterable<MeasurementConfig>> measurements;

  FlingLibraryBuilder(BuildStep buildStep) {
    measurements = _init(buildStep);
  }

  Future<Iterable<MeasurementConfig>> _init(BuildStep buildStep) async {
    return [
      await for (var asset in buildStep.findAssets(Glob('**/*.measurements')))
        MeasurementConfig(
          name: await buildStep.readAsString(asset),
          asset: asset,
        )
    ];
  }
}

class FlingMeasurementBuilder extends FlingBuilder {
  static final overrideAnnotation = CodeExpression(Code("override"));

  late final String measurementClassName;
  late final String interpreterClassName;
  late final String interpreterType;
  late final String prefixClassName;

  late final Iterable<Element> units;
  late final Element siUnit;

  FlingMeasurementBuilder(
    Element element,
    ConstantReader annotation,
  ) {
    measurementClassName = annotation.read('name').stringValue;
    interpreterClassName = "${measurementClassName}Interpreter";
    interpreterType = "MeasurementInterpreter<$measurementClassName>";
    prefixClassName = "${measurementClassName}Prefix";
    units = element.children
        .where((Element element) => checker.hasAnnotationOfExact(element));
    siUnit = units.firstWhere((element) =>
        checker
            .firstAnnotationOfExact(element)
            ?.getField('isSI')
            ?.toBoolValue() ??
        false);
  }

  String shortNameOf(Element unit) =>
      checker
          .firstAnnotationOfExact(unit)
          ?.getField('shortName')
          ?.toStringValue() ??
      "X";

  double multiplierOf(Element unit) =>
      checker
          .firstAnnotationOfExact(unit)
          ?.getField('multiplier')
          ?.toDoubleValue() ??
      1e0;
}
