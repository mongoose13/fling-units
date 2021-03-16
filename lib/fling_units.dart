/// A type-safe measurement framework.
///
/// This library is intended for any application that requires manipulating
/// measurements of any sort, e.g. distance or time. The measurements themselves
/// are abstracted into different types, allowing them to be interpreted in any
/// way required by the consumer. This allows for type safety across the
/// measurement types as well as simplification of business logic in most cases.
///
/// The library uses the following vocabulary:
/// - **measurement**: A value associated with a unit and a precision, e.g. "32.5 meters".
/// - **unit**: A way to interpret a measurement, e.g. "kilometers" and "miles" are valid units for a [Distance] measurement.
/// - **interpret**: A measurement is an abstract concept until it is interpreted with a specific unit in mind, at which point it can be represented as a number and that unit (e.g. "3.2 miles").
/// - **precision**: The quality of a measurement, from the standpoint of *significant digits*.
///
/// Consider a ride-sharing app that aggregates ride information across several
/// platforms. It may want to compare the distances for each potential driver
/// from the client, but each source might provide that information in a
/// different way. By reading the information from each source into an instance
/// of [Distance], the rest of our app can treat all sources the same way.
///
/// (The following example uses completely made-up APIs for Uber and Lyft.)
/// ```dart
/// Distance uberDistance = Distance.miles(Uber.getDriverDistance(clientLocation));
/// Distance lyftDistance = Distance.kilometers(lyft.getNearestDriver(clientLocation).distanceInKm());
/// ```
///
/// Instances of measurements such as [Distance] can be compared directly,
/// without needing to convert beforehand. Further, they can be interpreted in
/// any valid unit for their dimension at any time, without needing to know how
/// they were created.
///
/// ```dart
/// if (driverDistance < Distance.miles(0.5)) {
///   print('Your driver is only ${driverDistance.feet} feet away!');
/// } else {
///   print('Your driver is only ${driverDistance.miles} miles away!');
/// }
/// ```
///
/// While the library strives to support all basic measurement units, not all
/// "derived" units will be available. You can define arbitrary derived units
/// yourself, e.g. "fuel economy" (distance divided by volume, e.g. miles per
/// gallon), using the [DerivedMeasurement] type. Similarly, if a conversion is
/// missing from the library (or you just want to make up your own unit), you
/// can easily define it as a function that accepts a measurement and produces a
/// `double`.
///
/// ```dart
/// var fuelEconomy = DerivedMeasurement<Distance, Volume>(
///   Distance.miles(150),
///   Volume.gallons(5)
/// );
/// double kilometersPerLiter = fuelEconomy.as(Distance.asKilometers, Volume.asLiters);
/// double googaligadsPerLiter = fuelEconomy.as((distance) => distance.miles * 0.123, Volume.asLiters);
/// ```
///
/// Finally, all measurements may be assigned a [Precision] to quantify the
/// precision of the measurement instrument used. This prevents the measurements
/// giving answers with more precision than they realistically could, and also
/// mitigates some rounding errors in the implementation of the language itself.
///
/// ```dart
/// Distance.miles(3.0, precision: Precision(2)).kilometers; // 4.8, not 4.82803...
/// ```
library fling_units;

import 'dart:math' as math;

// framework
part 'src/measurement.dart';
part 'src/derived.dart';
part 'src/interpreter.dart';
part 'src/precision.dart';

// derived units
part 'src/area.dart';
part 'src/volume.dart';

// primary units
part 'src/distance.dart';
part 'src/mass.dart';
part 'src/temperature.dart';
part 'src/time.dart';