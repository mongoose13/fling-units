class DimensionConfig {
  final String shortName;

  const DimensionConfig({
    required this.shortName,
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
