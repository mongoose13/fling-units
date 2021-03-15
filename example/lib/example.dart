import 'package:fling_units/fling_units.dart';

void main() {
  // Create an instance of the measurement you care about.
  // You may use any of several construction methods.
  // Include the precision of your measurement for best results!
  var bodyTemperature = Temperature.ofFahrenheit(93.4);
  var distanceToSeattle = Distance.ofImperial(
    miles: 123,
    yards: 15,
    feet: 2,
    inches: 4,
    precision: Precision(3),
  );
  var distanceToTheMoon =
      Distance.ofMetric(kilometers: 382500, precision: Precision(4));
  var depthsOfMyMind = Volume.infinite();

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
  while (bodyTemperature < Temperature.ofFahrenheit(98.6)) {
    print('I need another blanket...');
    bodyTemperature += TemperatureChange.ofFahrenheit(2);
  }
  print('Ahh, much better!');
  // Attempting to compare incompatible types is a compile-time error.
  // if (bodyTemperature <= depthsOfMyMind) { // compile error!  }

  //------------------------------------------------//

  // Inherent ordering of items allows sorting lists with the built-in methods.
  var distances = [
    Distance.ofInches(1, precision: Precision(3)),
    Distance.ofCentimeters(1, precision: Precision(3)),
    Distance.zero(),
    Distance.ofMiles(1, precision: Precision(3)),
    Distance.ofFeet(-1, precision: Precision(3)),
    Distance.negativeInfinite(),
  ];
  print('\nThese are all out of whack: $distances');
  distances.sort();
  print('Much better: $distances');

  //------------------------------------------------//

  // When you're ready, interpret the measurement using whatever unit you like.
  print(
      '\nI drove ${distanceToSeattleIfYouForgotSomethingAtHome.asYards} yards because I left my driving glasses at home.');
  print(
      'I can fit ${depthsOfMyMind.asCubicMeters} boxes of bananas in my mind.');

  //------------------------------------------------//

  // Some of the more common derived units have full syntactic support.
  var monitorSurfaceArea = Area.ofSquareInches(800, precision: Precision(4));
  print('\nMy monitor dimensions:');
  print('${monitorSurfaceArea.asSquareMeters} m^2');
  print('${monitorSurfaceArea.asSquareCentimeters} cm^2');
  print('${monitorSurfaceArea.asSquareInches} in^2');

  // You can also build them from their component parts.
  var oneSquareInch = Area.of(
    Distance.ofInches(1, precision: Precision(3)),
    Distance.ofInches(1, precision: Precision(3)),
  );
  print('\nOne square inch is ${oneSquareInch.asSquareFeet} square feet.');

  //------------------------------------------------//

  // Need a derived unit that isn't specifically implemented? Build it yourself!
  // You can also use the common derived units to create your masterpiece.
  var fuelConsumption = DerivedMeasurement<Distance, Volume>.divide(
    distanceToSeattle,
    Volume.ofUsGallons(2),
  );
  print('\nDriving to Seattle made me realize how great my fuel economy is!');
  print('${fuelConsumption.as(Distance.miles, Volume.usGallons)} mpg');
  // Interpret the derived unit in any combination of component units.
  print('${fuelConsumption.as(Distance.miles, Volume.liters)} mpl');
  print('${fuelConsumption.as(Distance.kilometers, Volume.liters)} kpl');
  print('${fuelConsumption.as(Distance.kilometers, Volume.usGallons)} kpg');

  // Have fun!
}