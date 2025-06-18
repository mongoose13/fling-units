import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:source_gen/source_gen.dart';

abstract class ElementBuilder<T> {
  const ElementBuilder();

  TypeChecker get checker;

  bool matches(Element element) => checker.hasAnnotationOfExact(element);

  T build(Element element);

  Iterable<T> buildChildren(Element element) => element.children
      .where((element) => matches(element))
      .map((element) => build(element));

  String stringOf(Element element, String field, [String? orElse]) =>
      switch (checker
              .firstAnnotationOfExact(element)
              ?.getField(field)
              ?.toStringValue() ??
          orElse) {
        String result => result,
        dynamic value => throw ArgumentError.value(
            value,
            field,
            "$field must be a String",
          ),
      };

  double doubleOf(Element element, String field, [double? orElse]) =>
      switch (checker
              .firstAnnotationOfExact(element)
              ?.getField(field)
              ?.toDoubleValue() ??
          orElse) {
        double result => result,
        dynamic value => throw ArgumentError.value(
            value,
            field,
            "$field must be a double",
          ),
      };

  int intOf(Element element, String field, [int? orElse]) => switch (checker
              .firstAnnotationOfExact(element)
              ?.getField(field)
              ?.toIntValue() ??
          orElse) {
        int result => result,
        dynamic value => throw ArgumentError.value(
            value,
            field,
            "$field must be an int",
          ),
      };

  bool boolOf(Element element, String field, [bool? orElse]) => switch (checker
              .firstAnnotationOfExact(element)
              ?.getField(field)
              ?.toBoolValue() ??
          orElse) {
        bool result => result,
        dynamic value => throw ArgumentError.value(
            value,
            field,
            "$field must be a bool",
          ),
      };
}

abstract class FlingBuilder {
  final _emitter = DartEmitter(useNullSafetySyntax: true);
  final _buffer = StringBuffer();

  void add(Spec spec) => _buffer.writeln(spec.accept(_emitter).toString());
  void addAll(Iterable<Spec> specs) => specs.forEach(add);

  void write(String line) => _buffer.writeln(line);

  String flush() => DartFormatter(languageVersion: Version(3, 0, 0))
      .format(_buffer.toString());
}

Iterable<int> increments({int min = 1, required int max}) =>
    [for (int i = min; i <= max; ++i) i];
