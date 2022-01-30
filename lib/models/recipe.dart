import 'package:economizei_app/models/eatable.dart';
import 'package:economizei_app/models/ingredient.dart';

class Recipe extends Eatable {
  final String nameId;
  String name;
  int servings;
  late List<Ingredient> ingredients;

  Recipe({required this.nameId, required this.name, required this.servings}) {
    this.ingredients = [];
  }

  void addIngredient(Ingredient ingredient) {
    this.ingredients.add(ingredient);
  }

  @override
  String getName() {
    return name;
  }
}
