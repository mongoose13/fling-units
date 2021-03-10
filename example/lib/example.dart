import 'package:fling_units/fling_units.dart';

void main() {
  // Create an instance of the measurement you care about.
  // You may use any of several construction methods.
  // Include the precision of your measurement for best results!
  var bodyTemperature = Temperature.fahrenheit(93.4);
  var distanceToSeattle = Distance.imperial(
    miles: 123,
    yards: 15,
    feet: 2,
    inches: 4,
    precision: Precision(3),
  );
  var distanceToTheMoon =
      Distance.metric(kilometers: 382500, precision: Precision(4));
  var depthsOfMyMind = Volume.infinity();

  //------------------------------------------------//

  // Perform basic arithmetic on compatible units.
  var distanceToSeattleAndBack = distanceToSeattle * 2;
  var distanceToSeattleIfYouForgotSomethingAtHome =
      distanceToSeattleAndBack + distanceToSeattle;

  //------------------------------------------------//

  // Compare measurements of the same type (e.g. Distance or Temperature).
  if (distanceToTheMoon > distanceToSeattle) {
    print('Whew, we are still in Kansas.');
  } else {
    print("I don't think we're in Kansas any more.");
  }

  print('\nIt is cold...');
  while (bodyTemperature < Temperature.fahrenheit(98.6)) {
    print('I need another blanket...');
    bodyTemperature += TemperatureChange.fahrenheit(2);
  }
  print('Ahh, much better!');
  // Attempting to compare incompatible types is a compile-time error.
  // if (bodyTemperature <= depthsOfMyMind) { // compile error!  }

  //------------------------------------------------//

  // Inherent ordering of items allows sorting lists with the built-in methods.
  var distances = [
    Distance.inches(1, precision: Precision(3)),
    Distance.centimeters(1, precision: Precision(3)),
    Distance.zero(),
    Distance.miles(1, precision: Precision(3)),
    Distance.feet(-1, precision: Precision(3)),
    Distance.negativeInfinity(),
  ];
  print('\nThese are all out of whack: $distances');
  distances.sort();
  print('Much better: $distances');

  //------------------------------------------------//

  // When you're ready, interpret the measurement using whatever unit you like.
  print(
      '\nI drove ${distanceToSeattleIfYouForgotSomethingAtHome.yards} yards because I left my driving glasses at home.');
  print('I can fit ${depthsOfMyMind.cubicMeters} boxes of bananas in my mind.');

  //------------------------------------------------//

  // Some of the more common derived units have full syntactic support.
  var monitorSurfaceArea = Area.squareInches(800, precision: Precision(4));
  print('\nMy monitor dimensions:');
  print('${monitorSurfaceArea.squareMeters} m^2');
  print('${monitorSurfaceArea.squareCentimeters} cm^2');
  print('${monitorSurfaceArea.squareInches} in^2');

  // You can also build them from their component parts.
  var oneSquareInch = Area(
    Distance.inches(1, precision: Precision(3)),
    Distance.inches(1, precision: Precision(3)),
  );
  print('\nOne square inch is ${oneSquareInch.squareFeet} square feet.');

  //------------------------------------------------//

  // Need a derived unit that isn't specifically implemented? Build it!
  var fuelEconomy = DerivedMeasurement<Distance, Volume>.divide(
    distanceToSeattle,
    Volume.gallons(2),
    precision: Precision(3),
  );
  print('\nDriving to Seattle made me realize how great my fuel economy is!');
  print('${fuelEconomy.as(Distance.asMiles, Volume.asGallons)} mpg');
  // Interpret the derived unit in any combination of component units.
  print('${fuelEconomy.as(Distance.asMiles, Volume.asLiters)} mpl');
  print('${fuelEconomy.as(Distance.asKilometers, Volume.asLiters)} kpl');
  print('${fuelEconomy.as(Distance.asKilometers, Volume.asGallons)} kpg');

  // Have fun!
}
