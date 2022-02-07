import 'package:economizei_app/models/eatable.dart';
import 'package:economizei_app/models/ingredient.dart';

class Recipe extends Eatable {
  final String nameId;
  String name;
  int servings;
  late List<Ingredient> ingredients;

  Recipe({required this.nameId, required this.name, required this.servings}) {
    ingredients = [];
  }

  void addIngredient(Ingredient ingredient) {
    ingredients.add(ingredient);
  }

  @override
  String getName() {
    return name;
  }

  @override
  Recipe getRecipe() {
    return this;
  }
}
