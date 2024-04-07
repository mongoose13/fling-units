// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/volume.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionVolume on num {
  Volume get liters => VolumeUnit.liters(this);
  Volume get teaspoons => VolumeUnit.teaspoons(this);
  Volume get tablespoons => VolumeUnit.tablespoons(this);
  Volume get fluidOunces => VolumeUnit.fluidOunces(this);
  Volume get cups => VolumeUnit.cups(this);
  Volume get pints => VolumeUnit.pints(this);
  Volume get quarts => VolumeUnit.quarts(this);
  Volume get gallons => VolumeUnit.gallons(this);
  Volume get usTeaspoons => VolumeUnit.usTeaspoons(this);
  Volume get usTablespoons => VolumeUnit.usTablespoons(this);
  Volume get usFluidOunces => VolumeUnit.usFluidOunces(this);
  Volume get usCups => VolumeUnit.usCups(this);
  Volume get usPints => VolumeUnit.usPints(this);
  Volume get usQuarts => VolumeUnit.usQuarts(this);
  Volume get usGallons => VolumeUnit.usGallons(this);
  Volume get usLegalCups => VolumeUnit.usLegalCups(this);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

class VolumeUnit extends Unit<Volume> {
  const VolumeUnit._({
    required super.name,
    required super.unitMultiplier,
    super.prefix = const MeasurementPrefix.unit(),
  });

  static const liters = VolumeUnit._(name: 'L', unitMultiplier: 1000.0);

  static const teaspoons = VolumeUnit._(name: 'tsp', unitMultiplier: 168936.0);

  static const tablespoons =
      VolumeUnit._(name: 'tbsp', unitMultiplier: 56312.0);

  static const fluidOunces =
      VolumeUnit._(name: 'fl oz', unitMultiplier: 35195.1);

  static const cups = VolumeUnit._(name: 'cup', unitMultiplier: 3519.51);

  static const pints = VolumeUnit._(name: 'pt', unitMultiplier: 1759.75);

  static const quarts = VolumeUnit._(name: 'qt', unitMultiplier: 879.877);

  static const gallons = VolumeUnit._(name: 'gal', unitMultiplier: 219.969);

  static const usTeaspoons =
      VolumeUnit._(name: 'us tsp', unitMultiplier: 202884.0);

  static const usTablespoons =
      VolumeUnit._(name: 'us tbsp', unitMultiplier: 67628.0);

  static const usFluidOunces =
      VolumeUnit._(name: 'us fl oz', unitMultiplier: 33814.0);

  static const usCups = VolumeUnit._(name: 'us cup', unitMultiplier: 4226.76);

  static const usPints = VolumeUnit._(name: 'us pt', unitMultiplier: 2113.38);

  static const usQuarts = VolumeUnit._(name: 'us qt', unitMultiplier: 1056.69);

  static const usGallons =
      VolumeUnit._(name: 'us gal', unitMultiplier: 264.172);

  static const usLegalCups =
      VolumeUnit._(name: 'legal cup', unitMultiplier: 4166.67);

  @override
  Volume call(
    num magnitude, {
    Precision precision = Precision.max,
  }) =>
      Volume(magnitude, this, precision);

  VolumeUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      VolumeUnit._(name: name, unitMultiplier: unitMultiplier, prefix: prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Volume extends Measurement<Volume> {
  const Volume(
    num magnitude,
    Unit<Volume> defaultUnit, [
    Precision precision = Precision.max,
  ]) : super(
          magnitude: magnitude,
          precision: precision,
          defaultUnit: defaultUnit,
        );

  const Volume.zero([super.interpreter = siUnit]) : super.zero();

  const Volume.infinite([super.interpreter = siUnit]) : super.infinite();

  const Volume.negativeInfinite([super.interpreter = siUnit])
      : super.negativeInfinite();

  const Volume.nan([super.interpreter = siUnit]) : super.nan();

  Volume.sum(
    super.parts, {
    super.precision,
  }) : super.sum();

  static const VolumeUnit siUnit = liters;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitVolume(this);

  @override
  construct(
    num magnitude,
    Unit<Volume> defaultUnit,
    Precision precision,
  ) =>
      Volume(magnitude, defaultUnit, precision);

  @override
  DerivedMeasurementPerBuilder<Volume> get per =>
      DerivedMeasurementPerBuilder(this);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin VolumePrefix {
  static VolumeUnit siUnit = VolumeUnit.liters;

  MeasurementPrefix get prefix;
  VolumeUnit get liters => VolumeUnit.liters.withPrefix(prefix);
  VolumeUnit get teaspoons => VolumeUnit.teaspoons.withPrefix(prefix);
  VolumeUnit get tablespoons => VolumeUnit.tablespoons.withPrefix(prefix);
  VolumeUnit get fluidOunces => VolumeUnit.fluidOunces.withPrefix(prefix);
  VolumeUnit get cups => VolumeUnit.cups.withPrefix(prefix);
  VolumeUnit get pints => VolumeUnit.pints.withPrefix(prefix);
  VolumeUnit get quarts => VolumeUnit.quarts.withPrefix(prefix);
  VolumeUnit get gallons => VolumeUnit.gallons.withPrefix(prefix);
  VolumeUnit get usTeaspoons => VolumeUnit.usTeaspoons.withPrefix(prefix);
  VolumeUnit get usTablespoons => VolumeUnit.usTablespoons.withPrefix(prefix);
  VolumeUnit get usFluidOunces => VolumeUnit.usFluidOunces.withPrefix(prefix);
  VolumeUnit get usCups => VolumeUnit.usCups.withPrefix(prefix);
  VolumeUnit get usPints => VolumeUnit.usPints.withPrefix(prefix);
  VolumeUnit get usQuarts => VolumeUnit.usQuarts.withPrefix(prefix);
  VolumeUnit get usGallons => VolumeUnit.usGallons.withPrefix(prefix);
  VolumeUnit get usLegalCups => VolumeUnit.usLegalCups.withPrefix(prefix);
}

// **************************************************************************
// GlobalGenerator
// **************************************************************************

const liters = VolumeUnit.liters;

const teaspoons = VolumeUnit.teaspoons;

const tablespoons = VolumeUnit.tablespoons;

const fluidOunces = VolumeUnit.fluidOunces;

const cups = VolumeUnit.cups;

const pints = VolumeUnit.pints;

const quarts = VolumeUnit.quarts;

const gallons = VolumeUnit.gallons;

const usTeaspoons = VolumeUnit.usTeaspoons;

const usTablespoons = VolumeUnit.usTablespoons;

const usFluidOunces = VolumeUnit.usFluidOunces;

const usCups = VolumeUnit.usCups;

const usPints = VolumeUnit.usPints;

const usQuarts = VolumeUnit.usQuarts;

const usGallons = VolumeUnit.usGallons;

const usLegalCups = VolumeUnit.usLegalCups;
