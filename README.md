A type safe Dart library for unit conversion.

## Usage
Import the library:
```yaml
# pubspec.yaml
dependencies:
  fling_units: ^0.1.0
```
```dart
// application code
import 'package:fling/fling_units.dart' as FlingUnits;
```

Create an instance of the dimension type you want to measure:
```dart
FlingUnits.Distance distanceToSeattle = FlingUnits.Distance.miles(246);
```

Convert to any other type within that dimension:
```dart
double distanceToSeattleInKilometers = distanceToSeattle.kilometers;
double distanceToSeattleInInches = distanceToSeattle.inches;
```

Perform basic arithmetic:
```dart
FlingUnits.Distance distanceToSeattleAndBack = distanceToSeattle * 2.0;
FlingUnits.Distance distanceToTheMoon = distanceToUpperAtmosphere + distanceFromAtmosphereToMoon;
FlingUnits.Distance distanceToTheEndsOfTheUniverse = FlingUnits.Distance.infinity();
bool useTheCar = distanceToTravel >= FlingUnits.Distance.miles(1.0);
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
- implements `Comparable<Distance>`
- comparison between two Distances (`>`, `<`, `==`, `!=`, `>=`, `<=`)
- add two Distances (`+`)
- subtract two Distances (`-`)
- multiply a Distance by a scalar (`*`)
- divide a Distance by a scalar (`/`)