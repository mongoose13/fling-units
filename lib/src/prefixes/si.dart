import "package:fling_units/fling_units.dart";
import "package:fling_units/generator/generator.dart";

part "../generated/si.dart";

@PrefixType()
enum Prefixes {
  @PrefixConfig(shortName: "q", multiplier: 1e-30)
  quecto,

  @PrefixConfig(shortName: "r", multiplier: 1e-27)
  ronto,

  @PrefixConfig(shortName: "y", multiplier: 1e-24)
  yocto,

  @PrefixConfig(shortName: "z", multiplier: 1e-21)
  zepto,

  @PrefixConfig(shortName: "a", multiplier: 1e-18)
  atto,

  @PrefixConfig(shortName: "f", multiplier: 1e-15)
  femto,

  @PrefixConfig(shortName: "p", multiplier: 1e-12)
  pico,

  @PrefixConfig(shortName: "n", multiplier: 1e-9)
  nano,

  @PrefixConfig(shortName: "μ", multiplier: 1e-6)
  micro,

  @PrefixConfig(shortName: "m", multiplier: 1e-3)
  milli,

  @PrefixConfig(shortName: "c", multiplier: 1e-2)
  centi,

  @PrefixConfig(shortName: "d", multiplier: 1e-1)
  deci,

  @PrefixConfig(shortName: "da", multiplier: 1e1)
  deka,

  @PrefixConfig(shortName: "h", multiplier: 1e2)
  hecto,

  @PrefixConfig(shortName: "k", multiplier: 1e3)
  kilo,

  @PrefixConfig(shortName: "M", multiplier: 1e6)
  mega,

  @PrefixConfig(shortName: "G", multiplier: 1e9)
  giga,

  @PrefixConfig(shortName: "T", multiplier: 1e12)
  tera,

  @PrefixConfig(shortName: "P", multiplier: 1e15)
  peta,

  @PrefixConfig(shortName: "E", multiplier: 1e18)
  exa,

  @PrefixConfig(shortName: "Z", multiplier: 1e21)
  zetta,

  @PrefixConfig(shortName: "Y", multiplier: 1e24)
  yotta,

  @PrefixConfig(shortName: "R", multiplier: 1e27)
  ronna,

  @PrefixConfig(shortName: "Q", multiplier: 1e30)
  quetta;
}
