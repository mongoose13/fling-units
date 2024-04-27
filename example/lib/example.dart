import "package:fling_units/fling_units.dart";
import "package:fling_units/src/core/library.dart";

void main() {
  // Create an instance of the measurement you care about.
  // You may use any of several construction methods.
  // Include the precision of your measurement for best results!
  var distanceToTheMoon = kilo.meters(382500, precision: Precision(4));
  var distanceToSeattle = DistanceMeasurement.sum(
    [
      miles(123),
      yards(15),
      feet(2),
      inches(4),
    ],
    precision: Precision(3),
  );
  var bodyTemperature = Temperature.ofFahrenheit(93.4);

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

  print("\nMy bucket is $bucketMagnitudeDifference"
      " times bigger than yours!");
  print("Or, if you prefer, yours fits $timesYourBucketFitsInMine"
      " times into mine, with $leftOverBucketVolume left over.");

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
    inches(1, precision: Precision(3)),
    centi.meters(1, precision: Precision(3)),
    DistanceMeasurement.zero(),
    miles(1, precision: Precision(3)),
    feet(-1, precision: Precision(3)),
    DistanceMeasurement.negativeInfinite(),
  ];
  print("\nThese are all out of whack: $distances");
  distances.sort();
  print("Much better: $distances");

  //------------------------------------------------//

  // When you"re ready, interpret the measurement using whatever unit you like.
  print("\nI drove ${distanceToSeattleIfYouForgotSomethingAtHome.butAs(yards)} "
      "because I left my driving glasses at home.");

  //------------------------------------------------//

  // The unit interpreters themselves have a toString() method that will produce
  // the "standard" short form of the unit. Measurements will make use of that
  // in their own toString() methods using whichever unit was used to
  // instantiate them. You can also change the default unit later.
  final goldAmount = 1234.milli.grams.withPrecisionOf(4);
  print("\nI have $goldAmount of gold!");
  print("I have ${goldAmount.as(kilo.grams)} ${kilo.grams} of gold!");
  print("I have ${goldAmount.butAs(ounces)} of gold!");

  //------------------------------------------------//

  // Need a derived unit? You can use the basic units to create your masterpiece.
  // You can define your unit and "call" it to instantiate measurements.
  // Several helper methods exist to create typical low-order derived units, such as:
  // * square
  // * ratio
  // * product
  // * cubic
  print("\nMy yard is ${square(feet)(20.0)}");

  // If you don't like the default unit names, you can set your own.
  final milesPerHour = ratio(miles, hours, name: "mph");

  // When instantiating measurements, you can pass in the component values
  // instead of the derived unit value.
  final yourSpeed = milesPerHour(
    distanceToSeattle.as(miles), // miles
    1.5, // hours
  ).withPrecisionOf(3);
  print("\nYou're driving to Seattle at $yourSpeed");

  // You can also build a measurement using existing measurements of the correct
  // component types.
  final mySpeed = milesPerHour.using(
    distanceToSeattle,
    2.hours,
  ).withPrecisionOf(3);
  print("I'm going $mySpeed");

  // Then, interpret the derived unit in any combination of component units.
  print("Or, if you prefer, ${mySpeed.as(ratio(miles, days))} miles per day");

  // Derived measurements work just like other measurements, so all the same
  // methods and operators can be used, including comparisons.
  print(mySpeed > yourSpeed ? "I'm faster!" : "You're pretty fast!");
  print("Half my speed: ${mySpeed / 2}");

  //------------------------------------------------//

  // All basic measurements support const-ness in their default constructors.
  // Unfortunately, it is not possible to set up const constructors using the
  // extensions or prefixes at this time, nor is it possible to create const
  // derived units at this time.

  const massOfMyHand = MassMeasurement(2.5, pounds);
  const sizeOfMyHand = DistanceMeasurement(5.0, inches);
  print("\nMy hand will always have a linear density of"
      " ${ratio(pounds, inches).using(massOfMyHand, sizeOfMyHand)}");

  // Have fun!
}
