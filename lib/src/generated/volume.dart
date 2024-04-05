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
  const VolumeUnit._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const liters = VolumeUnit._('L', 1000.0);

  static const teaspoons = VolumeUnit._('tsp', 168936.0);

  static const tablespoons = VolumeUnit._('tbsp', 56312.0);

  static const fluidOunces = VolumeUnit._('fl oz', 35195.1);

  static const cups = VolumeUnit._('cup', 3519.51);

  static const pints = VolumeUnit._('pt', 1759.75);

  static const quarts = VolumeUnit._('qt', 879.877);

  static const gallons = VolumeUnit._('gal', 219.969);

  static const usTeaspoons = VolumeUnit._('us tsp', 202884.0);

  static const usTablespoons = VolumeUnit._('us tbsp', 67628.0);

  static const usFluidOunces = VolumeUnit._('us fl oz', 33814.0);

  static const usCups = VolumeUnit._('us cup', 4226.76);

  static const usPints = VolumeUnit._('us pt', 2113.38);

  static const usQuarts = VolumeUnit._('us qt', 1056.69);

  static const usGallons = VolumeUnit._('us gal', 264.172);

  static const usLegalCups = VolumeUnit._('legal cup', 4166.67);

  @override
  Volume call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Volume(value, this, precision);

  VolumeUnit withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      VolumeUnit._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Volume extends Measurement<Volume> {
  const Volume(
    num units,
    Unit<Volume> interpreter, [
    Precision precision = Precision.max,
  ]) : super(amount: units, precision: precision, interpreter: interpreter);

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
    double amount,
    Unit<Volume>? interpreter,
    Precision precision,
  ) =>
      Volume(amount, interpreter ?? siUnit, precision);

  @override
  DerivedMeasurementBuilder<Volume> get per => DerivedMeasurementBuilder(this);
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
