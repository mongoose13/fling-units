# Fling Units

![Fling logo](https://f000.backblazeb2.com/file/mongoose-website/fling-title.png)

A type safe Dart library for unit conversion. Pass around fully abstracted
measurements to keep your code simple!

[![Build Status](https://img.shields.io/circleci/build/bitbucket/mongoose13/fling-units)](https://app.circleci.com/pipelines/bitbucket/mongoose13/fling-units?branch=master&filter=all)
[![Code Quality](https://img.shields.io/codacy/grade/749ee1e8ee2e4d26ab57b3256f422e9a?style=plastic)](https://www.codacy.com/bb/gelbermungo/fling-units/dashboard)
[![Pub Version](https://img.shields.io/pub/v/fling_units?style=plastic)](https://pub.dev/packages/fling_units)

<a href="https://www.buymeacoffee.com/mongoose" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px;width: 217px;" ></a>

## Overview

We designed **fling_units** to simplify working with any measurement unit within
a code base by abstracting measurements to basic types that can be "interpreted"
into any valid unit of that type, all in a type-safe way. This means you will
never pass around a measurement of the wrong type or unit again without seeing
red squiggles in your IDE.

Have a look at the examples below for more details on what is possible, and let
us know how we can improve **fling_units** by creating an issue!

## Philosophy

### Design goals

- **Simplicity**: Casual users must be able to pick up the basic features. We
  prefer idiomatic approaches since users will already have experience with
  them. The library will not offer confusing or difficult options.

- **Safety**: We will protect against invalid or incorrect usage. We favor
  compile-time checks over runtime checks. If something is possible with the
  library, it must be valid in the real world.

- **Correctness**: Conversions must be accurate. The limiting factor in accuracy
  is the measurement itself, not the library. Bug fixes take top priority. Full
  test coverage is required.

- **Minimalism**: We will not depend on larger libraries or other difficult
  dependencies. Including the library into a project must be easy and must not
  require any configuration or complicated setup.

### Things that matter less

- **Performance**: While we will not try to make the library slower than it
  needs to be, we will not make small performance enhancements at the cost of
  other design goals.

- **Memory**: We will not reduce memory footprint at the cost of one of the
  other design goals, but we will keep the library as small and unobtrusive as
  possible.

## Usage

Create a measurement using any standard unit:

```dart
void main() {
  // extensions on `num` make instantiating a measurement easy
  Measurement<Mass> massOfTheMoon = (73.5).yocto.grams;

  // you can also build a measurement as the sum of parts
  Measurement<Distance> distanceToTheMoon = sum([miles(238900), feet(42), inches(6.3)]);
}
```

Convert to any other measurement type within that dimension:

```dart
void main() {
  double distanceToTheMoonInMiles = distanceToTheMoon.as(miles);
  double massOfTheMoonInShortTons = massOfTheMoon.as(shortTons);
}
```

Perform basic arithmetic:

```dart
void main() {
  // multiplication
  Distance distanceToSeattleAndBack = distanceToSeattle * 2;

  // addition
  Distance distanceToTheMoon = distanceToUpperAtmosphere + distanceFromAtmosphereToMoon;

  // support for infinite measurements
  Distance distanceToTheEndsOfTheUniverse = Distance.infinite();

  // compare measurements within the same dimension
  bool useTheCar = distanceToTravel >= miles(1.5);
}
```

Built-in ordering:

```dart
void main() {
  [Distance.zero(), Distance.infinite(), meters(3), feet(3), yards(-2)].sort();
  // produces [yards(-2), zero(), feet(3), meters(3), infinite()]
}
```

Abstract away the specific units your code needs by passing around the
encapsulated types. It doesn't matter which units different parts of your code
require; you can combine them seamlessly:

```dart
Distance computeTotalDistanceWithWiggleRoom(final Distance targetDistance) {
  return targetDistance + meters(3.0);
}
```

The more common derived units, e.g. *Area* and *Volume*, have full support:

```dart
void main() {
  Area myBackYardSize = Area.of(feet(100), feet(70));
  double myBackYardSizeInSquareInches = myBackYardSize.asArea(
      Area.square(inches));

  Area yourBackYardSize = Area.square(meters)(100);
  bool offerToHostSummerBarbecue = myBackYardSize > yourBackYardSize;
}
```

You can create your own basic derived units (with all the basic features you'd
expect) from existing units:

```dart
void main() {
  var fuelEconomy = kilo.meters(100).per(liters(6));
  double milesPerGallon = fuelEconomy.as(miles, gallons);

  var stateRequiredFuelEconomy = inches(24).per(teaspoons(2));
  bool switchCars = fuelEconomy < stateRequiredFuelEconomy;
}
```

Ensure type safety at compile time:

```dart
void main() {
  // none of these lines will compile!
  var nonsense = miles(123) + grams(18);
  var impossible = meters(3).as(celcius);
  var silliness = grams(5) < seconds(3);
}
```

Express the certainty in your measurements by setting a precision. Conversions
will automatically provide appropriate significant digits. Set the precision
when you create the measurement, or later on:

```dart
void main() {
  var myHeight = meters(1.5, precision: Precision(2));
  var myHeightInInches = myHeight.as(inches); // 59.0
  
  var myWeight = kilo.grams(61.234);
  var myPreciseWeight = myWeight.withPrecisionOf(3); // 61.2
}
```

Use the `equals` method for less restrictive equality checks that read more naturally,
even if their precisions differ:

```dart
void main() {
  var massOfMyPetRock = 500.grams.withPrecisionOf(3);
  var anotherWayToWriteIt = (0.5).kilo.grams.withPrecisionOf(1);

  massOfMyPetRock == anotherWayToWriteIt; // false
  massOfMyPetRock.equals(anotherWayToWriteIt); // true
}
```

Extensions allow you to define measurements from any number for a more natural
syntax:

```dart
void main() {
  var distanceToTheStore = 3.kilo.meters;
  var distanceToYourHouse = 2.5.miles;
}
```

Measurements and units alike produce sensible `toString()` output to facilitate debugging:

```dart
void main() {
  print(3.miles); // "3.0 mi"
  print(kilo.meters); // "km"
  print(4.miles.per(2.hours)); // "2.0 mi/h"
}
```

## Supported Features

### Operations

With some exceptions (due to the nature of those measurements), all measurements
support:

- all standard metric prefixes for each unit
- customizable precision for each measurement
- `Comparable` for built-in ordering among similar measurements
- compare two similar measurements (`>`, `<`, `==`, `!=`, `>=`, `<=`)
- add or subtract two similar measurements (`+`, `-`)
- multiply or divide measurements by a scalar (`*`, `/`)
- negate measurements (unary `-`)
- measurement comparisons (`~/`, `%`, `compareMagnitude`)
- visitor pattern compatible
- extensions on *num* for more natural instantiation

### SI Prefixes

Work with any unit:

- quecto
- ronto
- yocto
- zepto
- atto
- femto
- pico
- nano
- micro
- milli
- centi
- deci
- deka
- hecto
- kilo
- mega
- giga
- tera
- peta
- exa
- zetta
- yotta
- ronna
- quetta

### Distance Units

- meters
- inches
- feet
- yards
- miles
- nautical miles

### Area Units

- any Distance unit x any other Distance unit

### Volume Units

- liters
- teaspoon (Imperial / US)
- tablespoon (Imperial / US)
- fluid ounce (Imperial / US)
- cup (Imperial / US / US Legal)
- pint (Imperial / US)
- quart (Imperial / US)
- gallon (Imperial / US)
- cubic foot
- cubic inch

### Temperature Units

- kelvin
- celcius
- fahrenheit

### Time units

- seconds
- minutes
- hours
- days

### Mass units

- grams
- tonnes
- ounces
- pounds
- short (US) tons
- long (UK) tons
- atomic mass units
- daltons
- electron rest mass

### Electric Charge units

- amperes

### Luminous Intensity units

- candela
- candlepower
- Hefnerkerze

### Pressure units

- Pascals
- bars
- Baryes
- standard atmospheres
- technical atmospheres
- mmHg
- inHg
- PSI

### Angle units

- turns (rotations)
- radians
- gradians
- degrees
- arc minutes
- arc seconds

### Frequency units

- hertz