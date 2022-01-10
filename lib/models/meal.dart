

import './meal_type.dart';
class Meal {
  MealType type;
  String timetable;
  String name;

  Meal({
    required this.name,
    required this.type,
    required this.timetable
  });
}