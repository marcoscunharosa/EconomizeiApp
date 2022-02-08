import 'package:economizei_app/models/chosable_item.dart';
import 'package:economizei_app/models/ingredient.dart';

class Recipe implements ChosableItem{
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
  @override
  void choose(List<ChosableItem> list){
    list.add(this);
  }
}
