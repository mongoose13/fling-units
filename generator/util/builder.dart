import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

import 'package:fling_units/src/core/annotations.dart';

class UnitDetails {
  final String name;
  final String singularName;

  UnitDetails({
    required this.name,
    required this.singularName,
  });
}

class MeasurementDetails {
  final String name;
  final AssetId asset;
  final Iterable<UnitDetails> units;

  MeasurementDetails({
    required this.name,
    required this.asset,
    required this.units,
  });
}

typedef PrefixDetails = ({String name, String shortName, double multiplier});

class FlingBuilder {
  final _emitter = DartEmitter(useNullSafetySyntax: true);
  final _buffer = StringBuffer();

  void add(Spec spec) => _buffer.writeln(spec.accept(_emitter).toString());
  void addAll(Iterable<Spec> specs) => specs.forEach(add);

  void write(String line) => _buffer.writeln(line);

  String flush() => DartFormatter().format(_buffer.toString());
}

class FlingPrefixBuilder extends FlingBuilder {
  final checker = const TypeChecker.fromRuntime(PrefixConfig);
}

class FlingStandaloneBuilder extends FlingBuilder {
  final BuildStep _buildStep;
  Future<Iterable<MeasurementDetails>>? _measurements;
  Future<Iterable<PrefixDetails>>? _prefixes;

  FlingStandaloneBuilder(this._buildStep);

  Future<Iterable<MeasurementDetails>> get measurements {
    _measurements ??= _readMeasurements();
    return _measurements!;
  }

  Future<Iterable<PrefixDetails>> get prefixes {
    _prefixes ??= _readPrefixes();
    return _prefixes!;
  }

  Future<Iterable<MeasurementDetails>> _readMeasurements() async {
    final assets =
        await _buildStep.findAssets(Glob('**/*.measurements')).toList();
    final pairs = await Future.wait(assets.map((asset) => _buildStep
        .readAsString(asset)
        .then((line) => (asset: asset, line: line.split(",")))));
    return pairs.map(
      (pair) => MeasurementDetails(
        name: pair.line.first,
        asset: pair.asset,
        units: pair.line.skip(1).map(
              (name) => UnitDetails(
                name: name,
                singularName: name, // TODO: implement
              ),
            ),
      ),
    );
  }

  Future<Iterable<PrefixDetails>> _readPrefixes() async {
    final assets = await _buildStep.findAssets(Glob('**/*.prefixes')).toList();
    final data = await Future.wait(assets.map((asset) => _buildStep
        .readAsString(asset)
        .then((file) => (asset: asset, lines: file.split("\n")))));
    return data.expand((asset) {
      return asset.lines.map((line) {
        final parts = line.split(",");
        return (
          name: parts.first,
          shortName: parts.skip(1).first,
          multiplier: double.parse(parts.skip(2).first),
        );
      });
    });
  }
}

class FlingMeasurementBuilder extends FlingBuilder {
  static final overrideAnnotation = CodeExpression(Code("override"));
  final checker = const TypeChecker.fromRuntime(UnitConfig);

  late final String dimensionName;
  late final Reference dimensionType;
  late final String unitName;
  late final Reference unitExtends;
  late final Reference unitType;
  late final String measurementName;
  late final Reference measurementType;
  late final String prefixName;

  late final Iterable<Element> units;
  late final Element siUnit;

  FlingMeasurementBuilder(
    Element element,
    ConstantReader annotation,
  ) {
    dimensionName = annotation.read('shortName').stringValue;
    dimensionType = Reference("f.Dimension");

    unitName = "${dimensionName}Unit";
    measurementName = "${dimensionName}Measurement";
    prefixName = "${dimensionName}Prefix";

    unitExtends = Reference("f.Unit<$dimensionName>");
    unitType = Reference("f.Unit<$dimensionName>");
    measurementType = Reference("f.Measurement<$dimensionName>");

    units = element.children
        .where((Element element) => checker.hasAnnotationOfExact(element));
    siUnit = units.firstWhere(
      (element) =>
          checker
              .firstAnnotationOfExact(element)
              ?.getField('isSI')
              ?.toBoolValue() ??
          false,
      orElse: () => throw ArgumentError(
        "No SI unit identified for $dimensionName",
      ),
    );
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
