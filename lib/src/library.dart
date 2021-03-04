import 'dimension.dart';
import 'system.dart';
import 'unit.dart';

class Fling {
  Fling._();

  static final Comparator<Unit> sizeComparator =
      (final Unit a, final Unit b) => a.multiplier.compareTo(b.multiplier);

  static Iterable<Unit> allUnits() => _units.values;

  static Unit fromShort(final String short) {
    if (!_units.containsKey(short)) {
      throw ArgumentError('No such unit: "$short"');
    }
    return _units[short];
  }

  static MeasurementSystem metric = MeasurementSystem(name: 'Metric');
  static MeasurementSystem usCustomary =
      MeasurementSystem(name: 'US Customary');
  static MeasurementSystem universal = MeasurementSystem(name: 'Universal');

  static Dimension unit = Dimension(name: 'unit');
  static Dimension distance = Dimension(name: 'distance');
  static Dimension volume = Dimension(name: 'volume');
  static Dimension mass = Dimension(name: 'mass');

  static final Unit u = Unit.root(
      name: 'units',
      short: 'unit',
      dimension: unit,
      measurementSystem: universal);

  static final Unit g = Unit.root(
      name: 'grams', short: 'g', dimension: mass, measurementSystem: metric);
  static final Unit mg = Unit(
    name: 'milligrams',
    short: 'mg',
    dimension: mass,
    measurementSystem: metric,
    multiplier: 0.001,
  );
  static final Unit kg = Unit(
    name: 'kilograms',
    short: 'kg',
    dimension: mass,
    measurementSystem: metric,
    multiplier: 1000,
  );

  static final Unit dr = Unit(
    name: 'drams',
    short: 'dr',
    dimension: mass,
    measurementSystem: usCustomary,
    multiplier: 1.77185,
  );
  static final Unit oz = Unit(
    name: 'ounces',
    short: 'oz',
    dimension: mass,
    measurementSystem: usCustomary,
    multiplier: 28.3495,
  );
  static final Unit lb = Unit(
    name: 'pounds',
    short: 'lb',
    dimension: mass,
    measurementSystem: usCustomary,
    multiplier: 453.592,
  );

  static final Unit L = Unit.root(
      name: 'liters', short: 'l', dimension: volume, measurementSystem: metric);
  static final Unit cL = Unit(
    name: 'centiliters',
    short: 'cl',
    dimension: volume,
    measurementSystem: metric,
    multiplier: 0.01,
  );
  static final Unit mL = Unit(
    name: 'milliliters',
    short: 'ml',
    dimension: volume,
    measurementSystem: metric,
    multiplier: 0.001,
  );

  static final Unit tbsp = Unit(
    name: 'tablespoons',
    short: 'tbsp',
    dimension: volume,
    measurementSystem: usCustomary,
    multiplier: 0.0147868,
  );
  static final Unit tsp = Unit(
    name: 'teaspoons',
    short: 'tsp',
    dimension: volume,
    measurementSystem: usCustomary,
    multiplier: 0.00492892,
  );
  static final Unit cup = Unit(
    name: 'cups',
    short: 'cup',
    dimension: volume,
    measurementSystem: usCustomary,
    multiplier: 0.24,
  );
  static final Unit pt = Unit(
    name: 'pints',
    short: 'pt',
    dimension: volume,
    measurementSystem: usCustomary,
    multiplier: 0.473176,
  );
  static final Unit qt = Unit(
    name: 'quarts',
    short: 'qt',
    dimension: volume,
    measurementSystem: usCustomary,
    multiplier: 0.946353,
  );
  static final Unit gal = Unit(
    name: 'gallons',
    short: 'gal',
    dimension: volume,
    measurementSystem: usCustomary,
    multiplier: 3.78541,
  );

  static final Map<String, Unit> _units = {
    u.short: u,
    g.short: g,
    mg.short: mg,
    kg.short: kg,
    dr.short: dr,
    oz.short: oz,
    lb.short: lb,
    L.short: L,
    mL.short: mL,
    cL.short: cL,
    tbsp.short: tbsp,
    tsp.short: tsp,
    cup.short: cup,
    pt.short: pt,
    qt.short: qt,
    gal.short: gal,
  };
}