![Fling logo](https://f000.backblazeb2.com/file/mongoose-website/fling-title.png)

A type safe Dart library for unit conversion. Pass around fully abstracted measurements safely and easily to keep your
code simple!

[![Build Status](https://img.shields.io/travis/gelbermungo/fling-units/master?style=plastic)](https://travis-ci.com/bitbucket/gelbermungo/fling-units)
[![Code Quality](https://img.shields.io/codacy/grade/749ee1e8ee2e4d26ab57b3256f422e9a?style=plastic)](https://www.codacy.com/bb/gelbermungo/fling-units/dashboard)
[![Pub Version](https://img.shields.io/pub/v/fling_units?style=plastic)](https://pub.dev/packages/fling_units)

## Overview

**fling_units** is designed to simplify working with any measurement unit within a code base by abstracting measurements
to basic types that can be "interpreted" into any valid unit of that type, all in a type-safe way. This means you will
never accidentally pass around a measurement of the wrong type or unit again without seeing red squigglies in your IDE.

Have a look at the examples below for more details on what is possible, and let me know how **fling_units** can be made
even better by creating an issue!

## Usage

Create an instance of the dimension type you want to measure:
```dart
void main() {
  Distance distanceToSeattle = kilo.meters(246);  // you can use metric prefixes with any unit
  Distance distanceToTheMoon = Distance.sum([miles(238900), feet(42), inches(6.3)]);
  Mass massOfTheMoon = yocto.grams(73.5);
}
```

Convert to any other measurement type within that dimension:
```dart
void main() {
  double distanceToSeattleInMiles = distanceToSeattle.as(miles);
  double distanceToSeattleInHectoInches = distanceToSeattle.as(hecto.inches);
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

Abstract away the specific units your code needs by passing around the encapsulated types. It doesn't matter which units
each portion of your code requires; they can be combined seamlessly:
```dart
Distance computeTotalDistanceWithWiggleRoom(final Distance targetDistance) {
  return targetDistance + meters(3.0);
}
```

There is full support for some of the more common derived units, e.g. *Area* and *Volume*.
```dart
void main() {
  Area myBackYardSize = Area.of(feet(100), feet(70));
  double myBackYardSizeInSquareInches = myBackYardSize.asArea(Area.square(inches));

  Area yourBackYardSize = Area.square(meters)(100);
  bool offerToHostSummerBarbecue = myBackYardSize > yourBackYardSize;
}
```

You can create your own basic derived units (with all the basic features you'd expect) from existing units:
```dart
void main() {
  var fuelEconomy = DerivedMeasurement<Distance, Volume>.divide(kilo.meters(100), liters(6));
  double milesPerGallon = fuelEconomy.as(miles, gallons);

  var stateRequiredFuelEconomy = DerivedMeasurement<Distance, Volume>.divide(inches(24), teaspoons(2));
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

Express the certainty in your measurements correctly by setting a precision. Conversions will automatically provide
appropriate significant digits:
```dart
void main() {
  var myHeight = meters(1.5, precision: Precision(2));
  var myHeightInInches = myHeight.as(inches); // 59.0
}
```

## Supported Features

### Operations

With few exceptions (due to the nature of those measurements), all measurements support:
  - all standard metric prefixes for each unit
  - customizable precision for each measurement
  - implement `Comparable` for built-in ordering among similar measurements
  - compare two similar measurements (`>`, `<`, `==`, `!=`, `>=`, `<=`)
  - add or subtract two similar measurements (`+`, `-`)
  - multiply or divide measurements by a scalar (`*`, `/`)
  - negate measurements (unary `-`)
  - compare magnitude of two measurements (`~/`, `compareMagnitude`)

### SI Prefixes

Can be applied to any unit:
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
