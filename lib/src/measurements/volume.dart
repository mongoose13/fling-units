import 'package:fling_units/generator/util/annotations.dart';

import 'package:fling_units/fling_units.dart';

part "../generated/volume.dart";

@MeasurementConfig(shortName: "Volume")
enum VolumeConfig {
  @UnitConfig(
    shortName: "L",
    multiplier: 1e3,
    isSI: true,
  )
  liters,

  @UnitConfig(
    shortName: "tsp",
    multiplier: 168936,
  )
  teaspoons,

  @UnitConfig(
    shortName: "tbsp",
    multiplier: 56312,
  )
  tablespoons,

  @UnitConfig(
    shortName: "fl oz",
    multiplier: 35195.1,
  )
  fluidOunces,

  @UnitConfig(
    shortName: "cup",
    multiplier: 3519.51,
  )
  cups,

  @UnitConfig(
    shortName: "pt",
    multiplier: 1759.75,
  )
  pints,

  @UnitConfig(
    shortName: "qt",
    multiplier: 879.877,
  )
  quarts,

  @UnitConfig(
    shortName: "gal",
    multiplier: 219.969,
  )
  gallons,

  @UnitConfig(
    shortName: "us tsp",
    multiplier: 202884,
  )
  usTeaspoons,

  @UnitConfig(
    shortName: "us tbsp",
    multiplier: 67628,
  )
  usTablespoons,

  @UnitConfig(
    shortName: "us fl oz",
    multiplier: 33814,
  )
  usFluidOunces,

  @UnitConfig(
    shortName: "us cup",
    multiplier: 4226.76,
  )
  usCups,

  @UnitConfig(
    shortName: "us pt",
    multiplier: 2113.38,
  )
  usPints,

  @UnitConfig(
    shortName: "us qt",
    multiplier: 1056.69,
  )
  usQuarts,

  @UnitConfig(
    shortName: "us gal",
    multiplier: 264.172,
  )
  usGallons,

  @UnitConfig(
    shortName: "legal cup",
    multiplier: 4166.67,
  )
  usLegalCups;
}

extension VolumeInterpreterExtension on VolumeInterpreter {
  /// Constructs a [VolumeInterpreter] from any three [DistanceInterpreter]s.
  static VolumeInterpreter from(
    MeasurementInterpreter<Distance> a,
    MeasurementInterpreter<Distance> b,
    MeasurementInterpreter<Distance> c, {
    String? name,
  }) =>
      _unitless(a, b, c, name: name);

  /// Constructs a [VolumeInterpreter] with potentially null interpreters.
  static VolumeInterpreter _unitless(
    MeasurementInterpreter<Distance>? a,
    MeasurementInterpreter<Distance>? b,
    MeasurementInterpreter<Distance>? c, {
    String? name,
  }) =>
      VolumeInterpreter._(
          name ?? '${a?.name ?? 'X'}⋅${b?.name ?? 'X'}⋅${c?.name ?? 'X'}',
          (a?.unitMultiplier ?? 1.0) *
              (b?.unitMultiplier ?? 1.0) *
              (c?.unitMultiplier ?? 1.0) /
              (a?.prefix.unitMultiplier ?? 1.0) /
              (b?.prefix.unitMultiplier ?? 1.0) /
              (c?.prefix.unitMultiplier ?? 1.0));

  /// Constructs a [VolumeInterpreter] that will cube a basic
  /// [DistanceInterpreter].
  static VolumeInterpreter cubed(
    DistanceInterpreter a, {
    String? name,
  }) =>
      from(a, a, a, name: name ?? '${a.name}³');
}

extension VolumeExtension on Volume {
  /// Constructs a [Volume] from three [Distance] measurements.
  static Volume of(Distance a, Distance b, Distance c) => Volume(
        a.defaultValue * b.defaultValue * c.defaultValue,
        VolumeInterpreterExtension._unitless(
          a.defaultInterpreter,
          b.defaultInterpreter,
          c.defaultInterpreter,
        ),
        Precision.combine([
          a.precisionData,
          b.precisionData,
          c.precisionData,
        ]),
      );

  /// Produces an interpreter for the cube of a provided unit.
  static VolumeInterpreter cubic(DistanceInterpreter distanceInterpreter) =>
      VolumeInterpreterExtension.cubed(distanceInterpreter);

  /// Interprets this in the specified units.
  double asTriple(
    DistanceInterpreter a,
    DistanceInterpreter b,
    DistanceInterpreter c,
  ) =>
      precisionData.apply(a.of(b.of(c.of(si))));

  /// Interprets this in the specified volume unit.
  double asVolume(MeasurementInterpreter<Volume> interpreter) =>
      precisionData.apply(interpreter.of(si));
}
