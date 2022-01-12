import 'package:economizei_app/models/meal.dart';

import './meal.dart';

class UserPreferences {
  List<Meal> meals;
  int eaters;
  //List<Recipe> dontEatRecipe;
  //List<Ingredients> dontEatIngredient;

  UserPreferences({
    required this.meals,
    required this.eaters,
    //required this.dontEatRecipe,
    //required this.dontEatIngredient,
  });
}
