import 'package:economizei_app/models/plate.dart';
import 'package:economizei_app/models/recipe.dart';

import 'meal.dart';

class Food{
  Plate plate;
  final Meal meal;

  Food({
    required this.plate,
    required this.meal
  });
  
}