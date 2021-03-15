A type safe Dart library for unit conversion. Pass around fully abstracted measurements safely and easily to keep your
code simple!

## Usage
Create an instance of the dimension type you want to measure:
```dart
FlingUnits.Distance distanceToSeattle = FlingUnits.Distance.ofKilometers(246);
FlingUnits.Distance distanceToTheMoon = FlingUnits.Distance.imperial(miles: 238900, feet: 42, inches: 6.3);
```

Convert to any other measurement type within that dimension:

```dart
double distanceToSeattleInMiles = distanceToSeattle.asMiles;
double distanceToSeattleInInches = distanceToSeattle.asInches;
```

Perform basic arithmetic:

```dart
FlingUnits.Distance distanceToSeattleAndBack = distanceToSeattle * 2;
FlingUnits.Distance distanceToTheMoon = distanceToUpperAtmosphere + distanceFromAtmosphereToMoon;
FlingUnits.Distance distanceToTheEndsOfTheUniverse = FlingUnits.Distance.infinite();
bool useTheCar = distanceToTravel >= FlingUnits.Distance.ofMiles(1.5);
```

Built-in ordering:

```dart
[Distance.zero(), Distance.infinite(), Distance.ofMeters(3), Distance.ofFeet(3), Distance.ofMeters(-2)].sort();
// produces [meters(-2), zero(), feet(3), meters(3), infinite()]
```

Abstract away the specific units your code needs by passing around the encapsulated types. It doesn't matter which units each portion of your code requires, they can be combined seamlessly:
```dart
FlingUnits.Distance computeTotalDistanceWithWiggleRoom(final FlingUnits.Distance targetDistance) {
  return targetDistance + FlingUnits.Distance.ofMeters(3.0);
}
```

Ensure type safety:
```dart
var nonsense = distanceToSeattle + temperatureInNewYork;  // won't compile!
```

Use precision to make sure you express yourself correctly:

```dart
var myHeight = Distance.ofMeters(1.5, precision: Precision(2));
var myHeightInInches = myHeight.asInches;  // 59.0
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

### Distance Units

Metric:

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

- microseconds
- milliseconds
- seconds
- minutes
- hours
- days