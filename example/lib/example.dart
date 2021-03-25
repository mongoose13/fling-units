import 'package:fling_units/fling_units.dart';

void main() {
  // Create an instance of the measurement you care about.
  // You may use any of several construction methods.
  // Include the precision of your measurement for best results!
  var bodyTemperature = Temperature.ofFahrenheit(93.4);
  var distanceToSeattle = Distance.sum(
    [
      miles(123),
      yards(15),
      feet(2),
      inches(4),
    ],
    precision: Precision(3),
  );
  var distanceToTheMoon = kilo.meters(382500, precision: Precision(4));
  var depthsOfMyMind = Volume.infinite();

  //------------------------------------------------//

  // Perform basic arithmetic on compatible units.
  var distanceToSeattleAndBack = distanceToSeattle * 2;
  var distanceToSeattleIfYouForgotSomethingAtHome =
      (distanceToSeattleAndBack + distanceToSeattle)
          .withPrecision(Precision(6));

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
    bodyTemperature += fahrenheit(2);
  }
  print('Ahh, much better!');
  // Attempting to compare incompatible types is a compile-time error.
  // if (bodyTemperature <= depthsOfMyMind) { // compile error!  }

  //------------------------------------------------//

  // Inherent ordering of items allows sorting lists with the built-in methods.
  var distances = [
    inches(1, precision: Precision(3)),
    centi.meters(1, precision: Precision(3)),
    Distance.zero(),
    miles(1, precision: Precision(3)),
    feet(-1, precision: Precision(3)),
    Distance.negativeInfinite(),
  ];
  print('\nThese are all out of whack: $distances');
  distances.sort();
  print('Much better: $distances');

  //------------------------------------------------//

  // When you're ready, interpret the measurement using whatever unit you like.
  print(
      '\nI drove ${distanceToSeattleIfYouForgotSomethingAtHome.as(yards)} yards because I left my driving glasses at home.');
  print(
      'I can fit ${depthsOfMyMind.asVolume(Volume.cubic(meters))} boxes of bananas in my mind.');

  //------------------------------------------------//

  // Some of the more common derived units (e.g. Area) have full syntactic support.
  var monitorSurfaceArea = Area.square(inches)(800, precision: Precision(4));
  print('\nMy monitor dimensions:');
  print('${monitorSurfaceArea.asArea(Area.square(meters))} m²');
  print('${monitorSurfaceArea.asArea(Area.square(centi.meters))} cm²');
  print('${monitorSurfaceArea.asArea(Area.square(inches))} in²');
  print('${monitorSurfaceArea.as(inches, inches)} in² (alternate form)');
  print(
      '${monitorSurfaceArea.as(inches, centi.meters)} in x cm (in case you ever needed that...)');

  // You can also build them from their component parts.
  var oneSquareInch = Area.of(
    inches(1, precision: Precision(3)),
    inches(1, precision: Precision(3)),
  );
  print('\nOne square inch is '
      '${oneSquareInch.asArea(Area.square(feet))} square feet.');

  //------------------------------------------------//

  // Need a derived unit that isn't specifically implemented? Build it yourself!
  // You can also use the common derived units to create your masterpiece.
  var fuelConsumption = DerivedMeasurement<Distance, Volume>.divide(
    distanceToSeattle,
    usGallons(2),
  );
  print('\nDriving to Seattle made me realize how great my fuel economy is!');
  print('${fuelConsumption.as(miles, usGallons)} mpg');
  // Interpret the derived unit in any combination of component units.
  print('${fuelConsumption.as(miles, liters)} mpl');
  print('${fuelConsumption.as(kilo.meters, liters)} kpl');
  print('${fuelConsumption.as(kilo.meters, usGallons)} kpg');

  // Have fun!
}
