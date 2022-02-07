import 'package:economizei_app/models/meal_menu.dart';
import 'package:flutter/material.dart';

import './user_preferences.dart';

import '../models/meal.dart';

class Account {
  String username;
  String email;
  UserPreferences preferences;
  MealMenu? userMealMenu;
  DateTimeRange? mealMenuTimeInterval;

  Account({
    required this.username,
    required this.email,
    required this.preferences,
  });

  void saveMealMenu(){
    userMealMenu = MealMenu(currentDay: DateTime.now(), timeInterval: mealMenuTimeInterval!);
  }
  void setMeals(List<Meal> meals) {
    preferences = UserPreferences(meals: meals);
  }

}
