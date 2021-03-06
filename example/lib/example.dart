import 'package:fling_units/fling_units.dart';

class Ingredient {
  final String name;
  final Volume amount;

  Ingredient({this.name, this.amount});
}

class Recipe {
  final String name;
  final int yield;
  final List<Ingredient> ingredients;

  Recipe({this.name, this.yield, this.ingredients});
}

class Formatter {
  final int precision;

  Formatter({this.precision});

  String format(final Volume amount, final String name) {
    // Compare instances created with arbitrary units
    if (amount >= Volume.usCups(0.5)) {
      // Interpret instances as any unit you like
      return '* ${amount.usCups.toStringAsPrecision(precision)} cups of ${name}';
    } else {
      return '* ${amount.usTeaspoons.toStringAsPrecision(precision)} tsp of ${name}';
    }
  }
}

void main() {
  final recipe = Recipe(
    name: 'pancakes',
    yield: 4,
    ingredients: [
      // Create instances using any unit
      Ingredient(name: 'flour', amount: Volume.usPints(1)),
      Ingredient(name: 'milk', amount: Volume.usCups(1)),
      Ingredient(name: 'baking powder', amount: Volume.usTeaspoons(1)),
    ],
  );
  final desiredServings = 6;

  final formatter = Formatter(precision: 3);
  print('To make $desiredServings servings of of ${recipe.name}:');
  recipe.ingredients.forEach((ingredient) {
    // Perform basic arithmetic on instances
    final amount = ingredient.amount / recipe.yield * desiredServings;
    print(formatter.format(amount, ingredient.name));
  });
}
