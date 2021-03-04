import 'dimension.dart';
import 'system.dart';

class Unit {
  final Dimension dimension;
  final MeasurementSystem measurementSystem;
  final String name;
  final String short;
  final double multiplier;

  Unit({
    final this.name,
    final this.short,
    final this.dimension,
    final this.measurementSystem,
    final this.multiplier,
  });

  Unit.root({
    final this.name,
    final this.short,
    final this.dimension,
    final this.measurementSystem,
  }) : multiplier = 1.0;

  double convertTo(final Unit other, final double quantity) {
    if (dimension != other.dimension) {
      throw ArgumentError.value(other.dimension, 'convertTo',
          'Mismatching dimension for conversion from $dimension to ${other.dimension}');
    }
    return quantity * multiplier / other.multiplier;
  }

  @override
  String toString() => name;
}