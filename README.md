A Dart library for unit conversion.

## Usage

Import the library:
```dart
import 'package:fling/fling.dart';
```

All units are available as static members on the Fling object. Convert between any two unis easily:
```dart
var pounds = Fling.kg.convertTo(Fling.lb, 2.0);
```

You can also identify units by their "short names":
```dart
var poundUnit = Fling.fromShort('lb');
```

Get all units and perform stream operations on them:
```dart
var volumeUnits = Fling.allUnits().where((unit) => unit.dimension == Fling.volume);
```

Use the size comparator to order units by their relative sizes:
```dart
var sortedList = [Fling.g, Fling.kg, Fling.mg, Fling.lb].sort(Fling.sizeComparator); // [mg, g, lb, kg]
```