![Fling logo](https://f000.backblazeb2.com/file/mongoose-website/fling-title.png)

A type safe Dart library for unit conversion. Pass around fully abstracted measurements safely and easily to keep your
code simple!

[![Build Status](https://img.shields.io/travis/gelbermungo/fling-units/master?style=plastic)](https://travis-ci.com/bitbucket/gelbermungo/fling-units)
[![Code Quality](https://img.shields.io/codacy/grade/749ee1e8ee2e4d26ab57b3256f422e9a?style=plastic)](https://www.codacy.com/bb/gelbermungo/fling-units/dashboard)
[![Pub Version](https://img.shields.io/pub/v/fling_units?style=plastic)](https://pub.dev/packages/fling_units)

## Usage
Create an instance of the dimension type you want to measure:
```dart
void main() {
  Distance distanceToSeattle = Distance.ofKilometers(246);
  Distance distanceToTheMoon = Distance.ofImperial(miles: 238900, feet: 42, inches: 6.3);
}
```

Convert to any other measurement type within that dimension:

```dart
void main() {
  double distanceToSeattleInMiles = distanceToSeattle.asMiles;
  double distanceToSeattleInInches = distanceToSeattle.asInches;
}
```

Perform basic arithmetic:

```dart
void main() {
  Distance distanceToSeattleAndBack = distanceToSeattle * 2;
  Distance distanceToTheMoon = distanceToUpperAtmosphere + distanceFromAtmosphereToMoon;
  Distance distanceToTheEndsOfTheUniverse = Distance.infinite();
  bool useTheCar = distanceToTravel >= Distance.ofMiles(1.5);
}
```

Built-in ordering:

```dart
void main() {
  [Distance.zero(), Distance.infinite(), Distance.ofMeters(3), Distance.ofFeet(3), Distance.ofYards(-2)].sort();
  // produces [yards(-2), zero(), feet(3), meters(3), infinite()]
}
```

Abstract away the specific units your code needs by passing around the encapsulated types. It doesn't matter which units each portion of your code requires, they can be combined seamlessly:
```dart
Distance computeTotalDistanceWithWiggleRoom(final Distance targetDistance) {
  return targetDistance + Distance.ofMeters(3.0);
}
```

Ensure type safety:
```dart
void main() {
  var nonsense = distanceToSeattle + temperatureInNewYork; // won't compile!
}
```

Express the certainty in your measurements correctly by setting a precision. Conversions will automatically provide appropriate significant digits:

```dart
void main() {
  var myHeight = Distance.ofMeters(1.5, precision: Precision(2));
  var myHeightInInches = myHeight.asInches; // 59.0
}
```

## Supported Features

### Operations

With few exceptions (due to the nature of those measurements), all measurements support:

  - customizable precision for each measurement
  - implement `Comparable` for built-in ordering among similar measurements
  - compare two similar measurements (`>`, `<`, `==`, `!=`, `>=`, `<=`)
  - add or subtract two similar measurements (`+`, `-`)
  - multiply or divide measurements by a scalar (`*`, `/`)
  - negate measurements (unary `-`)
  - compare magnitude of two measurements (`~/`, `compareMagnitude`)

### Distance Units

Metric:

  - picometers
  - nanometers
  - micrometers
  - millimeters
  - centimeters
  - decimeters
  - meters
  - dekameters
  - hectometers
  - kilometers

Imperial:

  - inches
  - feet
  - yards
  - miles

Nautical:

  - nautical miles

### Area Units

Metric:

  - square millimeters
  - square centimeters
  - square meters
  - square kilometers

Imperial:

  - square inches
  - square feet
  - square yards
  - square miles

### Volume Units

Metric:

  - milliliters
  - centiliters
  - deciliters
  - liters
  - dekaliters
  - hectoliters
  - kiloliters
  - cubic meter

Imperial:
  - teaspoon
  - tablespoon
  - fluid ounce
  - cup
  - pint
  - quart
  - gallon
  - cubic foot
  - cubic inch

US:
  - teaspoon
  - tablespoon
  - fluid ounce
  - cup
  - pint
  - quart
  - gallon
  - legal cup

### Temperature Units

  - kelvin
  - celcius
  - fahrenheit

### Time units

  - picoseconds
  - nanoseconds
  - microseconds
  - milliseconds
  - seconds
  - minutes
  - hours
  - days

### Mass units

  - milligrams
  - centigrams
  - decigrams
  - grams
  - dekagrams
  - hectograms
  - kilograms
  - tonnes
  - ounces
  - pounds
  - short (US) tons
  - long (UK) tons
