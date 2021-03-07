A type safe Dart library for unit conversion.

## Usage
Create an instance of the dimension type you want to measure:
```dart
FlingUnits.Distance distanceToSeattle = FlingUnits.Distance.kilometers(246);
FlingUnits.Distance distanceToTheMoon = FlingUnits.Distance(miles: 238900, feet: 42, inches: 6.3);
```

Convert to any other type within that dimension:
```dart
double distanceToSeattleInMiles = distanceToSeattle.miles;
double distanceToSeattleInInches = distanceToSeattle.inches;
```

Perform basic arithmetic:
```dart
FlingUnits.Distance distanceToSeattleAndBack = distanceToSeattle * 2;
FlingUnits.Distance distanceToTheMoon = distanceToUpperAtmosphere + distanceFromAtmosphereToMoon;
FlingUnits.Distance distanceToTheEndsOfTheUniverse = FlingUnits.Distance.infinity();
bool useTheCar = distanceToTravel >= FlingUnits.Distance.miles(1.5);
```

Built-in ordering:
```dart
[Distance.zero(), Distance.infinity(), Distance.meters(3), Distance.feet(3), Distance.meters(-2)].sort();
// produces [Distance.meters(-2), Distance.zero(), Distance.feet(3), Distance.meters(3), Distance.infinity()]
```

Abstract away the specific units your code needs by passing around the encapsulated types. It doesn't matter which units each portion of your code requires, they can be combined seamlessly:
```dart
FlingUnits.Distance computeTotalDistanceWithWiggleRoom(final FlingUnits.Distance targetDistance) {
  return targetDistance + FlingUnits.Distance.meters(3.0);
}
```

Ensure type safety:
```dart
var nonsense = distanceToSeattle + temperatureInNewYork;  // won't compile!
```

## Supported Features
### Distance
#### Units
Metric
- millimeters
- centimeters
- decimeters
- meters
- dekameters
- hectometers
- kilometers

Imperial
- inches
- feet
- yards
- miles
  
Nautical
- nautical miles

#### Operations
- implements `Comparable<Distance>` for built-in ordering
- compare two Distances (`>`, `<`, `==`, `!=`, `>=`, `<=`)
- add or subtract two Distances (`+`, `-`)
- multiply or divide a Distance by a scalar (`*`, `/`)
- negate a Distance (unary `-`)

### Volume
#### Units
Metric
- milliliters
- centiliters
- deciliters
- liters
- dekaliters
- hectoliters
- kiloliters
- cubic meter

Imperial
- teaspoon
- tablespoon
- fluid ounce
- cup
- pint
- quart
- gallon
- cubic foot
- cubic inch

US
- teaspoon
- tablespoon
- fluid ounce
- cup
- pint
- quart
- gallon

#### Operations
- implements `Comparable<Volume>` for built-in ordering
- compare two Volumes (`>`, `<`, `==`, `!=`, `>=`, `<=`)
- add or subtract two Volumes (`+`, `-`)
- multiply or divide a Volume by a scalar (`*`, `/`)
- negate a Volume (unary `-`)

### Temperature
#### Units
- kelvin
- celcius
- fahrenheit

#### Operations
- Temperature implements `Comparable<Temperature>` for built-in ordering
- TemperatureChange implements `Comparable<TemperatureChange>` for built-in ordering
- compare two Temperatures (`>`, `<`, `==`, `!=`, `>=`, `<=`)
- compare two TemperatureChanges (`>`, `<`, `==`, `!=`, `>=`, `<=`)
- add or subtract TemperatureChanges to or from Temperatures (`+`, `-`)
- add or subtract TemperatureChanges to or from other TemperatureChanges (`+`, `-`)
- multiply or divide TemperatureChanges by a scalar (`*`, `/`)
- negate a TemperatureChange (unary `-`)