A Dart library for unit conversion.

## Usage
Import the library:
```yaml
# pubspec.yaml
dependencies:
  fling_units: ^0.1.0
```
```dart
// application code
import 'package:fling/fling_units.dart';
```

All units are available as static members on the Fling object. Convert between any two unis easily:
```dart
var pounds = FlingUnits.kg.convertTo(FlingUnits.lb, 2.0);
```

You can also identify units by their "short names":
```dart
var poundUnit = FlingUnits.fromShort('lb');
```

Get all units and perform stream operations on them:
```dart
var volumeUnits = FlingUnits.allUnits().where((unit) => unit.dimension == FlingUnits.volume);
```

Use the size comparator to order units by their relative sizes:
```dart
var sortedList = [FlingUnits.g, FlingUnits.kg, FlingUnits.mg, FlingUnits.lb].sort(Fling.sizeComparator); // [mg, g, lb, kg]
```