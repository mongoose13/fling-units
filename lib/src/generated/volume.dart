// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../measurements/volume.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension NumExtensionVolume on num {
  Volume get liters => VolumeInterpreter.liters(this);
  Volume get teaspoons => VolumeInterpreter.teaspoons(this);
  Volume get tablespoons => VolumeInterpreter.tablespoons(this);
  Volume get fluidOunces => VolumeInterpreter.fluidOunces(this);
  Volume get cups => VolumeInterpreter.cups(this);
  Volume get pints => VolumeInterpreter.pints(this);
  Volume get quarts => VolumeInterpreter.quarts(this);
  Volume get gallons => VolumeInterpreter.gallons(this);
  Volume get usTeaspoons => VolumeInterpreter.usTeaspoons(this);
  Volume get usTablespoons => VolumeInterpreter.usTablespoons(this);
  Volume get usFluidOunces => VolumeInterpreter.usFluidOunces(this);
  Volume get usCups => VolumeInterpreter.usCups(this);
  Volume get usPints => VolumeInterpreter.usPints(this);
  Volume get usQuarts => VolumeInterpreter.usQuarts(this);
  Volume get usGallons => VolumeInterpreter.usGallons(this);
  Volume get usLegalCups => VolumeInterpreter.usLegalCups(this);
}

// **************************************************************************
// InterpreterGenerator
// **************************************************************************

class VolumeInterpreter extends MeasurementInterpreter<Volume> {
  const VolumeInterpreter._(
    super.name,
    super.multiplier, [
    super.prefix = const MeasurementPrefix.unit(),
  ]) : super();

  static const liters = VolumeInterpreter._('L', 1000.0);

  static const teaspoons = VolumeInterpreter._('tsp', 168936.0);

  static const tablespoons = VolumeInterpreter._('tbsp', 56312.0);

  static const fluidOunces = VolumeInterpreter._('fl oz', 35195.1);

  static const cups = VolumeInterpreter._('cup', 3519.51);

  static const pints = VolumeInterpreter._('pt', 1759.75);

  static const quarts = VolumeInterpreter._('qt', 879.877);

  static const gallons = VolumeInterpreter._('gal', 219.969);

  static const usTeaspoons = VolumeInterpreter._('us tsp', 202884.0);

  static const usTablespoons = VolumeInterpreter._('us tbsp', 67628.0);

  static const usFluidOunces = VolumeInterpreter._('us fl oz', 33814.0);

  static const usCups = VolumeInterpreter._('us cup', 4226.76);

  static const usPints = VolumeInterpreter._('us pt', 2113.38);

  static const usQuarts = VolumeInterpreter._('us qt', 1056.69);

  static const usGallons = VolumeInterpreter._('us gal', 264.172);

  static const usLegalCups = VolumeInterpreter._('legal cup', 4166.67);

  @override
  Volume call(
    num value, {
    Precision precision = Precision.max,
  }) =>
      Volume(value, this, precision);

  VolumeInterpreter withPrefix(
    MeasurementPrefix prefix, {
    Precision precision = Precision.max,
  }) =>
      VolumeInterpreter._(name, unitMultiplier, prefix);
}

// **************************************************************************
// MeasurementGenerator
// **************************************************************************

class Volume extends Measurement<Volume> {
  const Volume(
    num units,
    MeasurementInterpreter<Volume> interpreter, [
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

  static const VolumeInterpreter siUnit = liters;

  @override
  acceptVisitor(MeasurementVisitor visitor) => visitor.visitVolume(this);

  @override
  construct(
    double amount,
    MeasurementInterpreter<Volume>? interpreter,
    Precision precision,
  ) =>
      Volume(amount, interpreter ?? siUnit, precision);
}

// **************************************************************************
// PrefixGenerator
// **************************************************************************

mixin VolumePrefix {
  static VolumeInterpreter siUnit = VolumeInterpreter.liters;

  MeasurementPrefix get prefix;
  VolumeInterpreter get liters => VolumeInterpreter.liters.withPrefix(prefix);
  VolumeInterpreter get teaspoons =>
      VolumeInterpreter.teaspoons.withPrefix(prefix);
  VolumeInterpreter get tablespoons =>
      VolumeInterpreter.tablespoons.withPrefix(prefix);
  VolumeInterpreter get fluidOunces =>
      VolumeInterpreter.fluidOunces.withPrefix(prefix);
  VolumeInterpreter get cups => VolumeInterpreter.cups.withPrefix(prefix);
  VolumeInterpreter get pints => VolumeInterpreter.pints.withPrefix(prefix);
  VolumeInterpreter get quarts => VolumeInterpreter.quarts.withPrefix(prefix);
  VolumeInterpreter get gallons => VolumeInterpreter.gallons.withPrefix(prefix);
  VolumeInterpreter get usTeaspoons =>
      VolumeInterpreter.usTeaspoons.withPrefix(prefix);
  VolumeInterpreter get usTablespoons =>
      VolumeInterpreter.usTablespoons.withPrefix(prefix);
  VolumeInterpreter get usFluidOunces =>
      VolumeInterpreter.usFluidOunces.withPrefix(prefix);
  VolumeInterpreter get usCups => VolumeInterpreter.usCups.withPrefix(prefix);
  VolumeInterpreter get usPints => VolumeInterpreter.usPints.withPrefix(prefix);
  VolumeInterpreter get usQuarts =>
      VolumeInterpreter.usQuarts.withPrefix(prefix);
  VolumeInterpreter get usGallons =>
      VolumeInterpreter.usGallons.withPrefix(prefix);
  VolumeInterpreter get usLegalCups =>
      VolumeInterpreter.usLegalCups.withPrefix(prefix);
}

// **************************************************************************
// UnitGenerator
// **************************************************************************

const liters = VolumeInterpreter.liters;

const teaspoons = VolumeInterpreter.teaspoons;

const tablespoons = VolumeInterpreter.tablespoons;

const fluidOunces = VolumeInterpreter.fluidOunces;

const cups = VolumeInterpreter.cups;

const pints = VolumeInterpreter.pints;

const quarts = VolumeInterpreter.quarts;

const gallons = VolumeInterpreter.gallons;

const usTeaspoons = VolumeInterpreter.usTeaspoons;

const usTablespoons = VolumeInterpreter.usTablespoons;

const usFluidOunces = VolumeInterpreter.usFluidOunces;

const usCups = VolumeInterpreter.usCups;

const usPints = VolumeInterpreter.usPints;

const usQuarts = VolumeInterpreter.usQuarts;

const usGallons = VolumeInterpreter.usGallons;

const usLegalCups = VolumeInterpreter.usLegalCups;
