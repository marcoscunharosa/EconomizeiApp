import 'package:economizei_app/models/meal.dart';

import './meal.dart';

class UserPreferences {
  List<Meal> meals;
  int? eaters = 0;
  //List<Recipe> dontEatRecipe;
  //List<Ingredients> dontEatIngredient;

  UserPreferences({
    required this.meals,
    this.eaters,
    //required this.dontEatRecipe,
    //required this.dontEatIngredient,
  });

  void setEatersNumber(int num) {
    eaters = num;
  }
}
