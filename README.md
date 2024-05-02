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
  // extensions on `num` make instantiating a measurement feel natural
  Measurement<Mass> massOfTheMoon = (73.5).yocto.grams;

  double timeInHours = 3.4;
  Measurement<Time> travelTime = timeInHours.hours;

  // you can also build a measurement by "calling" a unit or building a sum of parts
  Measurement<Charge> energyProduction = milli.amperes(123.4);
  Measurement<Distance> distanceToTheMoon = sum([miles(238900), feet(42), inches(6.3)]);
```

Convert measurements to any other measurement type within that dimension easily:

```dart
  Measurement<Distance> distanceToTheMoonAsMiles = distanceToTheMoon.butAs(miles);
  Measurement<Mass> massOfTheMoonAsShortTons = massOfTheMoon.butAs(shortTons);
```

You can read the `double` value of any measurement using any unit in the same dimension:

```dart
  double distanceToTheMoonInMiles = distanceToTheMoon.as(miles);
  double massOfTheMoonInShortTons = massOfTheMoon.as(shortTons);
```

Perform basic arithmetic:

```dart
  // multiplication
  Measurement<Distance> distanceToTheMoonAndBack = distanceToTheMoon * 2;

  // addition
  Measurement<Distance> distanceToTheMoon = distanceToUpperAtmosphere + distanceFromAtmosphereToMoon;

  // support for infinite measurements
  Measurement<Distance> distanceToTheEndsOfTheUniverse = DistanceMeasurement.infinite();

  // compare measurements within the same dimension
  bool useTheCar = distanceToTravel >= miles(1.5);
```

All measurements have built-in ordering within their dimension:

```dart
  [DistanceMeasurement.zero(), DistanceMeasurement.infinite(), meters(3), feet(3), yards(-2)].sort();
  // produces [yards(-2), zero(), feet(3), meters(3), infinite()]
```

Abstract away the specific units your code needs by passing around the
encapsulated types. It doesn't matter which units different parts of your code
require; you can combine them seamlessly:

```dart
Measurement<Distance> computeTotalDistanceWithWiggleRoom(Measurement<Distance> targetDistance) {
  return targetDistance + meters(3.0);
}
```

You can create derived units (with all the features you'd expect) from existing units:

```dart
  // create a derived unit from any existing units:
  var milesPerGallon = ratio(miles, gallons);

  // instantiate measurements using the new unit the same way you would any other unit:
  var stateRequiredFuelEconomy = milesPerGallon(20);

  // you can also instantiate a measurement by providing the component parts of the measurement:
  var fuelEconomy = milesPerGallon.using(kilo.meters(100), liters(6));

  // measurements created this way have all the features of any other measurement, such as comparison operators:
  bool switchCars = fuelEconomy < stateRequiredFuelEconomy;

  // extensions on num exist for the derived unit helper methods, too (inverse, ratio, product, square, cubic):
  var frequency = 2000.inverse(seconds);
```

Ensure type safety at compile time:

```dart
  // none of these lines will compile!
  var nonsense = miles(123) + grams(18);
  var impossible = meters(3).as(celcius);
  var silliness = grams(5) < seconds(3);
```

Express the certainty in your measurements by setting a precision. Conversions
will automatically provide appropriate significant digits. Set the precision
when you create the measurement, or later on:

```dart
  var myHeight = meters(1.5, precision: Precision(2));
  var myHeightInInches = myHeight.as(inches); // 59.0
  
  var myWeight = kilo.grams(61.234);
  var myPreciseWeight = myWeight.withPrecisionOf(3); // 61.2
```

Use the `equals` method for less restrictive equality checks that read more naturally,
even if their precisions differ:

```dart
  var massOfMyPetRock = 500.grams.withPrecisionOf(3);
  var anotherWayToWriteIt = (0.5).kilo.grams.withPrecisionOf(1);

  massOfMyPetRock == anotherWayToWriteIt; // false
  massOfMyPetRock.equals(anotherWayToWriteIt); // true
```

Measurements and units alike produce sensible `toString()` output to facilitate debugging:

```dart
void main() {
  print(3.miles); // "3.0 mi"
  print(kilo.meters); // "km"
  print(ratio(miles, hours)(2.0)); // "2.0 mi⋅h⁻¹"
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