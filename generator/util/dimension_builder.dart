import 'package:source_gen/source_gen.dart';

class DimensionDetails {
  final String name;
  final String invertedName;

  DimensionDetails({
    required this.name,
  }) : invertedName = name.startsWith("Inverted")
            ? name.replaceFirst("Inverted", "")
            : "Inverted$name";
}

class DimensionBuilder {
  DimensionBuilder(ConstantReader annotation)
      : name = annotation.read('name').stringValue,
        types = annotation.read('types').isList
            ? annotation.read('types').listValue.map((item) =>
                DimensionDetails(name: item.toStringValue() ?? "UnknownType"))
            : null;

  final String name;
  final Iterable<DimensionDetails>? types;

  bool get isDerived => types != null;
  int get order => types?.length ?? 1;
}
