import "package:fling_units/fling_units.dart";

void main() {
  // Create an instance of the measurement you care about.
  // You may use any of several construction methods.
  // Include the precision of your measurement for best results!
  var distanceToTheMoon = kilo.meters(382500, precision: 4);
  var distanceToSeattle = sum<Distance>(
    [
      miles(123),
      yards(15),
      feet(2),
      inches(4),
    ],
    precision: 3,
  );
  var bodyTemperature = Temperature.ofFahrenheit(93.4);
  var depthsOfMyMind = Measurement.infinite(liters); // Volume.infinite();
  var depthsOfMyPetRocksMind =
      Measurement.zero(cubic(meters)); // Volume.zero();

  // Want syntactic sugar? Any measurement can be created from a number using
  // extensions. We recommend wrapping doubles in parenthesis for readability.
  var yourBucketSize = 3.liters;
  var myBucketSize = (1.3).deka.liters;

  //------------------------------------------------//

  // Perform basic arithmetic on compatible units. You can add, subtract, multiply,
  // divide, truncating divide, or modulo divide.
  final distanceToSeattleAndBack = distanceToSeattle * 2;
  final distanceToSeattleIfYouForgotSomethingAtHome =
      (distanceToSeattleAndBack + distanceToSeattle).withPrecision(6);

  // You can also make use of the Precision class to ensure proper significant digits.
  final bucketMagnitudeDifference =
      Precision(3).apply(myBucketSize.compareMagnitude(yourBucketSize));
  final timesYourBucketFitsInMine = myBucketSize ~/ yourBucketSize;
  final leftOverBucketVolume =
      (myBucketSize % yourBucketSize).withPrecision(3).butAs(liters);

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
  var distances = <Measurement<Distance>>[
    inches(1, precision: 3),
    centi.meters(1, precision: 3),
    DistanceMeasurement.zero(),
    miles(1, precision: 3),
    feet(-1, precision: 3),
    DistanceMeasurement.negativeInfinite(),
  ];
  print("\nThese are all out of whack: $distances");
  distances.sort();
  print("Much better: $distances");

  //------------------------------------------------//

  // When you"re ready, interpret the measurement using whatever unit you like.
  print(
      "\nI drove ${distanceToSeattleIfYouForgotSomethingAtHome.as(yards)} yards because I left my driving glasses at home.");
  print(
      "I can fit ${depthsOfMyMind.as(cubic(meters))} boxes of bananas in my mind.");
  print(
      "I can fit ${depthsOfMyPetRocksMind.as(cubic(meters))} boxes of bananas in my pet rock's mind.");

  //------------------------------------------------//

  // Some of the more common derived units (e.g. Area) have full syntactic support.
  var monitorSurfaceArea = square(inches)(800).withPrecision(4);
  print("\nMy monitor dimensions:");
  print("${monitorSurfaceArea.as(square(meters))} m²");
  print("${monitorSurfaceArea.as(square(centi.meters))} cm²");
  print("${monitorSurfaceArea.as(square(inches))} in²");
  print(
      "${monitorSurfaceArea.as(product2(inches, centi.meters))} in x cm (in case you ever needed that...)");

  // You can also build them from their component parts.
  var oneSquareInch = square(inches).using(
    inches(1, precision: 3),
    inches(1, precision: 3),
  );
  print("\nOne square inch is "
      "${oneSquareInch.as(square(feet))} square feet");

  //------------------------------------------------//

  // Need a derived unit that isn't specifically implemented? Build it yourself!
  // You can also use the common derived units to create your masterpiece.
  var fuelConsumption = ratio(miles, usGallons, name: "mpg")
      .using(distanceToSeattle, usGallons(2.4));
  print("\nDriving to Seattle made me realize how great my fuel economy is!");
  print("I get $fuelConsumption");
  // Interpret the derived unit in any combination of component units.
  print("${fuelConsumption.as(ratio(miles, liters))} mpl");
  print("${fuelConsumption.as(ratio(kilo.meters, liters))} kpl");
  print("${fuelConsumption.as(ratio(kilo.meters, usGallons))} kpg");

  var coulombs = ratio(seconds, amperes, name: "coulombs");
  var energyProduction = coulombs(3.14159);
  print("My invention generates $energyProduction!");

  //------------------------------------------------//

  // The unit interpreters themselves have a toString() method that will produce
  // the "standard" short form of the unit. Measurements will make use of that
  // in their own toString() methods using whichever unit was used to
  // instantiate them. You can also change the default unit later.
  final goldAmount = 1234.milli.grams.withPrecision(4);
  print("I have $goldAmount of gold!");
  print("I have ${goldAmount.as(kilo.grams)} ${kilo.grams} of gold!");
  print("I have ${goldAmount.butAs(ounces)} of gold!");

  // This is also true for derived units. The library will produce a default
  // unit name, but you can also supply your own.
  final carSpeed = ratio(miles, hours).using(
    100.miles.withPrecision(3),
    1.hours.withPrecision(3),
  );
  print("\nMy car is going $carSpeed!");
  final carSpeedAsFPM = carSpeed.butAs(ratio(feet, minutes));
  print("My car is going $carSpeedAsFPM!");
  print(
      "My car is going ${carSpeedAsFPM.defaultValue} in ${carSpeedAsFPM.defaultUnit}!");

  //------------------------------------------------//

  // All basic measurements support const-ness in their default constructors.
  // Unfortunately, it is not possible to set up const constructors using the
  // extensions or prefixes at this time, nor is it possible to create const
  // derived units at this time.

  const sizeOfMyHand = DistanceMeasurement(5.0, inches);
  const massOfMyHand = MassMeasurement(1.2, pounds);
  print(
      "\nMy hand will always have a linear density of ${ratio(pounds, inches).using(massOfMyHand, sizeOfMyHand).withPrecision(2)}.");

  // Have fun!
}
