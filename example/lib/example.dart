import "package:fling_units/fling_units.dart";

void main() {
  // Create an instance of the measurement you care about.
  // You may use any of several construction methods.
  // Include the precision of your measurement for best results!
  var distanceToGroceryStore = 2.miles;
  var distanceToTheMoon = kilo.meters(382500, precision: SignificantDigits(4));
  var distanceToSeattle = DistanceMeasurement.sum(
    [
      miles(123),
      yards(15),
      feet(2),
      inches(4),
    ],
    precision: DigitsAfterDecimal.none,
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
      (distanceToSeattleAndBack + distanceToSeattle)
          .withPrecision(DigitsAfterDecimal.none);

  // You can also make use of the Precision subclasses to ensure proper significant digits.
  final bucketMagnitudeDifference =
      SignificantDigits(3).apply(myBucketSize.compareMagnitude(yourBucketSize));
  final timesYourBucketFitsInMine = myBucketSize ~/ yourBucketSize;
  final leftOverBucketVolume = (myBucketSize % yourBucketSize)
      .withPrecision(DigitsAfterDecimal(3))
      .butAs(liters);

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
    inches(1, precision: DigitsAfterDecimal.none),
    centi.meters(1, precision: DigitsAfterDecimal.none),
    DistanceMeasurement.zero(),
    miles(1, precision: DigitsAfterDecimal.none),
    feet(-1, precision: DigitsAfterDecimal.none),
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
      "I can fit ${depthsOfMyMind.asDerived(cubic(meters))} boxes of bananas in my mind.");
  print(
      "I can fit ${depthsOfMyPetRocksMind.as(cubic(meters))} boxes of bananas in my pet rock's mind.");

  //------------------------------------------------//

  // Some of the more common derived units (e.g. Area) have full syntactic support.
  var monitorSurfaceArea =
      (14 * 18).square(inches).withPrecision(DigitsAfterDecimal.none);
  print("\nMy monitor dimensions:");
  print("${monitorSurfaceArea.as(square(meters))} m²");
  print("${monitorSurfaceArea.as(square(centi.meters))} cm²");
  print("${monitorSurfaceArea.as(square(inches))} in²");
  print(
      "${monitorSurfaceArea.as(DerivedUnit2(inches, centi.meters))} in x cm (in case you ever needed that...)");

  // You can also build them from their component parts.
  var oneSquareInch = square(inches).using(
    inches(1, precision: DigitsAfterDecimal.none),
    inches(1, precision: DigitsAfterDecimal.none),
  );
  print("\nOne square inch is "
      "${oneSquareInch.as(square(feet))} square feet");

  //------------------------------------------------//

  // Need a derived unit that isn't specifically implemented? Build it yourself!

  var milesPerGallon = miles.per.usGallon.withName("mpg");
  var fuelUsed = 2.4.usGallons;
  var fuelEconomy = milesPerGallon
      .using(distanceToSeattle, fuelUsed.inverted)
      .withPrecision(DigitsAfterDecimal(1));
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
  // built-in Volume units or any others you have created. The library currently
  // supports up to third-order derived units.

  var energyProductionRate =
      energyProduction.over(0.5.minutes).butAs(coulombs.per.second);
  print("If done over 30 seconds, that's a rate of $energyProductionRate");

  var myMilkRecord =
      (0.25).gallons.per.minute.withPrecision(DigitsAfterDecimal.none);
  print(
      "\nI drank $myMilkRecord (${myMilkRecord.butAs(liters.per.second)}) of milk. I do not recommend trying it yourself.");

  //------------------------------------------------//

  // The unit interpreters themselves have a toString() method that will produce
  // the "standard" short form of the unit. Measurements will make use of that
  // in their own toString() methods using whichever unit was used to
  // instantiate them. You can also change the default unit later.
  final goldAmount = 1234.milli.grams.withPrecision(DigitsAfterDecimal.none);
  print("\nI have $goldAmount of gold!");
  print("I have ${goldAmount.as(kilo.grams)} ${kilo.grams} of gold!");
  print("I have ${goldAmount.butAs(ounces)} of gold!");

  // This is also true for derived units. The library will produce a default
  // unit name, but you can also supply your own.
  final carSpeed = 100.miles.per.hour.withPrecision(DigitsAfterDecimal.none);
  print("\nMy car is going $carSpeed!");
  print(
      "My car is going ${carSpeed.butAs(inches.per.second.withName("inches/second"))}!");
  final carSpeedAsFPM = carSpeed.butAs(feet.per.minute);
  print("My car is going $carSpeedAsFPM!");
  print(
      "My car is going ${carSpeedAsFPM.defaultValue} in ${carSpeedAsFPM.defaultUnit}!");

  //------------------------------------------------//

  // The library defines a few constants for you as well.
  print(
      "That's ${(carSpeed.compareMagnitude(speedOfLight) * 100.0).toStringAsPrecision(3)}% the speed of light!");

  //------------------------------------------------//

  // All basic measurements support const-ness in their default constructors.
  // Unfortunately, due to limitations of the language, it is not possible to
  // set up const constructors using the extensions or prefixes at this time,
  // nor is it possible to create const derived units at this time.

  const sizeUnit = inches;
  const sizeOfMyHand = DistanceMeasurement(5.0, sizeUnit);
  const massOfMyHand = MassMeasurement(1.2, pounds);
  print(
      "\nMy hand will always have a linear density of ${pounds.per.inch.using(massOfMyHand, sizeOfMyHand.inverted).withPrecision(SignificantDigits(2))}.");

  // Have fun!
  liters.per.second;
  3.liters.per.second;
  3.liters.butAsDerived(cubic(meters));
  final cubicMeters = cubic(meters);
  final converted = 300.liters.butAsDerived(cubicMeters);
  print(converted);
  print(1
      .cbm
      .butAsDerived(cubic(centi.meters))
      .withPrecision(DigitsAfterDecimal(1)));
  print(1.cbm.asDerived(cubic(centi.meters)));
  print(1e6
      .cubic(centi.meters)
      .butAsConsolidated(cbm)
      .withPrecision(DigitsAfterDecimal(1)));
  print(1e6.cubic(centi.meters).asConsolidated(cbm));
  //1.cubic(grams).asConsolidated(cbm);

  milli.miles;
  miles.per.hour;
  miles.per.hour;
  miles.per.milli.hour;

  3.miles;
  3.milli.miles;
  DerivedUnit2(miles, hours).per.mile;
  3.miles.dot.hours;
  3.miles.per.hour;
  3.miles.per.milli;
  3.miles.per.milli.hour;

  meters.per.hour.per.inch;
}
