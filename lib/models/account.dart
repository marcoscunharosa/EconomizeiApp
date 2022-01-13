import 'package:flutter/material.dart';

import './user_preferences.dart';

import '../models/meal.dart';

import '../models/meal.dart';

import '../models/meal.dart';

class Account {
  String username;
  String email;
  UserPreferences preferences;
  DateTime? inicialDay;
  DateTime? finalDay;

  Account({
    required this.username,
    required this.email,
    required this.preferences,
    this.inicialDay,
    this.finalDay,
  });

  void setMeals(List<Meal> meals) {
    preferences = UserPreferences(meals: meals);
  }

  void setDateRange(DateTimeRange dateRange) {
    inicialDay = dateRange.start;
    finalDay = dateRange.end;
  }
}
