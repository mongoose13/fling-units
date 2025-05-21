part of "library.dart";

class UnitPrefix {
  const UnitPrefix(
    this.multiplier, {
    this.name = "",
  });

  const UnitPrefix.unit()
      : multiplier = 1.0,
        name = "";

  final double multiplier;

  final String name;

  UnitPrefix get prefix => this;

  @override
  toString() => name;

  UnitPrefix operator *(UnitPrefix other) =>
      UnitPrefix(multiplier * other.multiplier);

  UnitPrefix operator /(UnitPrefix other) =>
      UnitPrefix(multiplier / other.multiplier);
}
