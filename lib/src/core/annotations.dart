class DimensionConfig {
  final String name;

  /// The dimensions that make up a a derived dimension, or `null` if this is a standalone dimension.
  final List<String>? types;

  const DimensionConfig({
    required this.name,
    this.types,
  });
}

class UnitConfig {
  final bool isSI;
  final String shortName;
  final String singularName;
  final double multiplier;
  final bool isVisible;

  const UnitConfig({
    this.isSI = false,
    required this.shortName,
    required this.singularName,
    required this.multiplier,
    this.isVisible = true,
  });
}

class UnitSpecialization {
  final bool isSI;
  final String shortName;
  final String singularName;
  final String equivalent;

  const UnitSpecialization({
    this.isSI = false,
    required this.shortName,
    required this.singularName,
    required this.equivalent,
  });
}

class PrefixType {
  const PrefixType();
}

class PrefixConfig {
  final String shortName;
  final double multiplier;

  const PrefixConfig({
    required this.shortName,
    required this.multiplier,
  });
}

class MeasurementConstant {
  final String unit;
  final double magnitude;

  const MeasurementConstant({
    required this.unit,
    required this.magnitude,
  });
}
