class MeasurementConfig {
  final String shortName;

  const MeasurementConfig({
    required this.shortName,
  });
}

class UnitConfig {
  final bool isSI;
  final String shortName;
  final double multiplier;

  const UnitConfig({
    this.isSI = false,
    required this.shortName,
    required this.multiplier,
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
