

import './meal_type.dart';
class Meal {
  MealType type;
  DateTime timetable;
  String name;

  Meal({
    required this.name,
    required this.type,
    required this.timetable
  });
}