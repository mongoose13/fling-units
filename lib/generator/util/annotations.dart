class MeasurementTemplate {
  final String name;

  const MeasurementTemplate({
    required this.name,
  });
}

class MeasurementUnit {
  final bool isSI;
  final String shortName;
  final double multiplier;

  const MeasurementUnit({
    this.isSI = false,
    required this.shortName,
    required this.multiplier,
  });
}
