import "package:fling_units/fling_units.dart";

void main() {
  // Create an instance of the measurement you care about.
  // You may use any of several construction methods.
  // Include the precision of your measurement for best results!
  var distanceToTheMoon = kilo.meters(382500, precision: Precision(4));
  var distanceToSeattle = Distance.sum(
    [
      miles(123),
      yards(15),
      feet(2),
      inches(4),
    ],
    precision: Precision(3),
  );
  var bodyTemperature = Temperature.ofFahrenheit(93.4);
  var depthsOfMyMind = Volume.infinite();
  var depthsOfMyPetRocksMind = Volume.zero();

  // Want syntactic sugar? Any measurement can be created from a number using
  // extensions. We recommend wrapping doubles in parenthesis for readability.
  var yourBucketSize = 3.liters;
  var myBucketSize = (1.3).deka.liters;

  //------------------------------------------------//

  // Perform basic arithmetic on compatible units. You can add, subtract, multiply,
  // divide, truncating divide, or modulo divide.
  final distanceToSeattleAndBack = distanceToSeattle * 2;
  final distanceToSeattleIfYouForgotSomethingAtHome =
      (distanceToSeattleAndBack + distanceToSeattle).withPrecisionOf(6);

  // You can also make use of the Precision class to ensure proper significant digits.
  final bucketMagnitudeDifference =
      Precision(3).apply(myBucketSize.compareMagnitude(yourBucketSize));
  final timesYourBucketFitsInMine = myBucketSize ~/ yourBucketSize;
  final leftOverBucketVolume =
      (myBucketSize % yourBucketSize).withPrecisionOf(3).butAs(liters);

  //------------------------------------------------//

  // Compare measurements of the same type (e.g. Distance or Temperature).
  if (distanceToTheMoon > distanceToSeattle) {
    print("Whew, we are still in Kansas.");
  } else {
    print("I don't think we're in Kansas any more.");
  }

  print("\nMy bucket is $bucketMagnitudeDifference times bigger than yours!");
  print(
      "Or, if you prefer, yours fits $timesYourBucketFitsInMine times into mine, with $leftOverBucketVolume left over.");

  print("\nIt is cold...");
  while (bodyTemperature < Temperature.ofFahrenheit(98.6)) {
    print("I need another blanket...");
    bodyTemperature += fahrenheit(2);
  }
  print("Ahh, much better!");
  // Attempting to compare incompatible types is a compile-time error.
  // if (bodyTemperature <= depthsOfMyMind) { // compile error!  }

  //------------------------------------------------//

  // Inherent ordering of items allows sorting lists with the built-in methods.
  var distances = <Distance>[
    inches(1, precision: Precision(3)),
    centi.meters(1, precision: Precision(3)),
    Distance.zero(),
    miles(1, precision: Precision(3)),
    feet(-1, precision: Precision(3)),
    Distance.negativeInfinite(),
  ];
  print("\nThese are all out of whack: $distances");
  distances.sort();
  print("Much better: $distances");

  //------------------------------------------------//

  // When you"re ready, interpret the measurement using whatever unit you like.
  print(
      "\nI drove ${distanceToSeattleIfYouForgotSomethingAtHome.as(yards)} yards because I left my driving glasses at home.");
  print(
      "I can fit ${depthsOfMyMind.asVolume(VolumeExtension.cubic(meters))} boxes of bananas in my mind.");
  print(
      "I can fit ${depthsOfMyPetRocksMind.asVolume(VolumeExtension.cubic(meters))} boxes of bananas in my pet rock's mind.");

  //------------------------------------------------//

  // Some of the more common derived units (e.g. Area) have full syntactic support.
  var monitorSurfaceArea = Area.square(inches)(800, precision: Precision(4));
  print("\nMy monitor dimensions:");
  print("${monitorSurfaceArea.asArea(Area.square(meters))} m²");
  print("${monitorSurfaceArea.asArea(Area.square(centi.meters))} cm²");
  print("${monitorSurfaceArea.asArea(Area.square(inches))} in²");
  print("${monitorSurfaceArea.asPair(inches, inches)} in² (alternate form)");
  print(
      "${monitorSurfaceArea.asPair(inches, centi.meters)} in x cm (in case you ever needed that...)");

  // You can also build them from their component parts.
  var oneSquareInch = Area.of(
    inches(1, precision: Precision(3)),
    inches(1, precision: Precision(3)),
  );
  print("\nOne square inch is "
      "${oneSquareInch.asArea(Area.square(feet))} square feet.");

  //------------------------------------------------//

  // Need a derived unit that isn"t specifically implemented? Build it yourself!
  // You can also use the common derived units to create your masterpiece.
/*
  var fuelConsumption = distanceToSeattle.per.meters(2.4);
  print("\nDriving to Seattle made me realize how great my fuel economy is!");
  print("${fuelConsumption.asPair(miles, usGallons)} mpg");
  // Interpret the derived unit in any combination of component units.
  print("${fuelConsumption.asPair(miles, liters)} mpl");
  print("${fuelConsumption.asPair(kilo.meters, liters)} kpl");
  print("${fuelConsumption.asPair(kilo.meters, usGallons)} kpg");
*/
  var coulombs = seconds.by.amperes;
  print("My invention generates ${coulombs(23)}!");

  //------------------------------------------------//

  // The unit interpreters themselves have a toString() method that will produce
  // the "standard" short form of the unit. Measurements will make use of that
  // in their own toString() methods using whichever unit was used to
  // instantiate them. You can also change the default unit later.
  final goldAmount = 1234.milli.grams.withPrecisionOf(4);
  print("I have $goldAmount of gold!");
  print("I have ${goldAmount.as(kilo.grams)} ${kilo.grams} of gold!");
  print("I have ${goldAmount.butAs(ounces)} of gold!");

  // This is also true for derived units. The library will produce a default
  // unit name, but you can also supply your own.
  final carSpeed = DerivedMeasurementPer<Distance, Time>.divide(
    100.miles.withPrecisionOf(3),
    1.hours.withPrecisionOf(3),
  );
  print("\nMy car is going $carSpeed!");
  final carVelocity = carSpeed.butAs(DerivedUnitPer(
    feet,
    minutes,
    name: "feet per minute",
  ));
  print("My car is going $carVelocity!");
  print(
      "My car is going ${carVelocity.defaultValue} in ${carVelocity.defaultUnit}!");

  //------------------------------------------------//

  // All basic measurements support const-ness in their default constructors.
  // Unfortunately, it is not possible to set up const constructors using the
  // extensions or prefixes at this time, nor is it possible to create const
  // derived units at this time.

  const sizeOfMyHand = Distance(5.0, inches);
  const massOfMyHand = Mass(1.2, pounds);
  print(
      "\nMy hand will always have a linear density of ${DerivedMeasurementPer.divide(massOfMyHand, sizeOfMyHand)}.");

  // Have fun!
  final u = meters.per.minutes;
  final m = u(1);
  print("\n$m = ${m.butAs(inches.per.seconds)}");

  print("My hand is ${3.4.inches.by.inches.butAs(meters.by.meters)}");

  print(2.54.centi.meters.per.deka.seconds.butAs(milli.inches.per.deci.minutes));
  print(square.inches(144).butAs(square.feet));
  print(square.centi.meters);
  print(cubic.centi.meters);
}
