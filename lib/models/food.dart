import 'package:economizei_app/models/recipe.dart';

import 'meal.dart';

class Food{
  Recipe recipe;
  final Meal meal;

  Food({
    required this.recipe,
    required this.meal
  });
  
}