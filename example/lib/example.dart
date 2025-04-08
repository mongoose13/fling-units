import "package:fling_units/fling_units.dart";

void main() {
  // Create an instance of the measurement you care about.
  // You may use any of several construction methods.
  // Include the precision of your measurement for best results!
  var distanceToGroceryStore = 2.miles;
  var distanceToTheMoon = kilo.meters(382500, precision: 4);
  var distanceToSeattle = DistanceMeasurement.sum(
    [
      miles(123),
      yards(15),
      feet(2),
      inches(4),
    ],
    precision: 3,
  );
  var bodyTemperature = Temperature.ofFahrenheit(93.4);
  var depthsOfMyMind = double.infinity.liters;
  var depthsOfMyPetRocksMind = 0.cubic(meters);

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
  // All of the basic comparators work (<, >, <=, >=, !=, ==).
  print("Comparing local distances...");
  if (distanceToTheMoon > distanceToSeattle) {
    print("Whew, we are still in Kansas.");
  } else {
    print("I don't think we're in Kansas any more.");
  }
  if (distanceToGroceryStore <= distanceToGroceryStore) {
    print("Wherever you go, there you are.");
  }

  print("\nMy bucket is $myBucketSize while yours is only $yourBucketSize");
  print("My bucket is $bucketMagnitudeDifference times bigger than yours!");
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
  var distances = [
    inches(1, precision: 3),
    centi.meters(1, precision: 3),
    DistanceMeasurement.zero(),
    miles(1, precision: 3),
    feet(-1, precision: 3),
    DistanceMeasurement.negativeInfinite(),
  ];
  print("\nThese distances are all out of whack: $distances");
  print("Let's sort them!");
  distances.sort();
  print("Much better: $distances");

  //------------------------------------------------//

  // When you"re ready, convert the measurement to whatever unit you like.
  print(
      "\nI drove ${distanceToSeattleIfYouForgotSomethingAtHome.as(yards)} yards because I left my driving glasses at home.");
  print(
      "I can fit ${depthsOfMyMind.as(cubic(meters))} boxes of bananas in my mind.");
  print(
      "I can fit ${depthsOfMyPetRocksMind.as(cubic(meters))} boxes of bananas in my pet rock's mind.");

  //------------------------------------------------//

  // Some of the more common derived units (e.g. Area) have full syntactic support.
  // You can create simple derived measurements with by() or over().
  var monitorSurfaceArea = 14.inches.by(18.inches).withPrecision(4);
  print("\nMy monitor dimensions:");
  print("${monitorSurfaceArea.as(square(meters))} m²");
  print("${monitorSurfaceArea.as(square(centi.meters))} cm²");
  print("${monitorSurfaceArea.as(square(inches))} in²");
  print(
      "${monitorSurfaceArea.as(DerivedUnit2.build(inches, centi.meters))} in x cm (in case you ever needed that...)");

  // You can also build them from their component parts.
  var oneSquareInch = square(inches).using(
    inches(1, precision: 3),
    inches(1, precision: 3),
  );
  print("\nOne square inch is "
      "${oneSquareInch.as(square(feet))} square feet");

  //------------------------------------------------//

  // Need a derived unit that isn't specifically implemented? Build it yourself!

  var milesPerGallon = miles.per.usGallon.withName("mpg");
  var fuelUsed = 2.4.usGallons;
  var fuelEconomy = milesPerGallon
      .using(distanceToSeattle, fuelUsed.inverted)
      .withPrecision(3);
  print("\nDriving to Seattle made me realize how great my fuel economy is!");
  print("I get $fuelEconomy");

  // Interpret the derived unit in any combination of component units.
  print("${fuelEconomy.as(miles.per.liter)} mpl");
  print("${fuelEconomy.as(centi.meters.per.milli.liter)} cm/ml");

  // This also lets you define derived units that are a product of two simpler units.
  var coulombs = seconds.dot.amperes.withName("coulombs");
  var energyProduction = coulombs(3.14159);
  print("\nMy invention generates $energyProduction!");

  // You can also use other derived units to create your masterpiece, such as the
  // built-in Volume units or any others you have created.

  var energyProductionRate = energyProduction
      .over(0.5.minutes)
      .butAs(DerivedUnit2.build(coulombs, seconds.inverted));
  print("If done over 30 seconds, that's a rate of $energyProductionRate");

  var myMilkRecord = 3.usGallons.over(12.minutes).withPrecision(2);
  print(
      "\nI drank $myMilkRecord (${myMilkRecord.butAs(liters.per.second)}) of milk. I do not recommend trying it yourself.");

  //------------------------------------------------//

  // The unit interpreters themselves have a toString() method that will produce
  // the "standard" short form of the unit. Measurements will make use of that
  // in their own toString() methods using whichever unit was used to
  // instantiate them. You can also change the default unit later.
  final goldAmount = 1234.milli.grams.withPrecision(4);
  print("\nI have $goldAmount of gold!");
  print("I have ${goldAmount.as(kilo.grams)} ${kilo.grams} of gold!");
  print("I have ${goldAmount.butAs(ounces)} of gold!");

  // This is also true for derived units. The library will produce a default
  // unit name, but you can also supply your own.
  final carSpeed = 100.miles.per.hour.withPrecision(3);
  print("\nMy car is going $carSpeed!");
  print(
      "My car is going ${carSpeed.butAs(inches.per.second.withName("inches/second"))}!");
  final carSpeedAsFPM = carSpeed.butAs(feet.per.minute);
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
      "\nMy hand will always have a linear density of ${pounds.per.inch.using(massOfMyHand, sizeOfMyHand.inverted).withPrecision(2)}.");

  // Have fun!
}
