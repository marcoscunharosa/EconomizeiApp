import 'dart:math';

import 'package:economizei_app/models/recipe.dart';
import 'package:economizei_app/models/food.dart';
import 'package:economizei_app/models/foods_per_day.dart';
import 'package:economizei_app/models/meal.dart';
import 'package:economizei_app/models/meal_menu.dart';
import 'package:economizei_app/models/user_preferences.dart';
import 'package:economizei_app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../models/plate.dart';

class MealMenuConstructor {
  static void constructAMealMenu(
      List<Meal> userMeals, MealMenu mealMenu) {
    PickerDateRange timeInterval = mealMenu.timeInterval;
    List<DateTime> days =
        _getDaysInBetween(timeInterval.startDate!, timeInterval.endDate!);
    for (int i = 0; i < days.length; i++) {
      DateTime day = days[i];
      mealMenu.addFoodsPerDay(_createFoodsPerDay(day, userMeals));
    }
  }

  static FoodsPerDay _createFoodsPerDay(DateTime day, List<Meal> meals) {
    //Map<Meal, List<Recipe>> mapOfRecipes = userPreferences.eatAt;
    List<Food> foodList = [];
    //var random = Random();
    for (var meal in meals) {
      Plate plate = Plate(name: meal.plateTemplates[0].name);
      plate.plateParts.addAll(meal.plateTemplates[0].plateParts);
      foodList.add(_createFood(plate, meal));
    }
    return FoodsPerDay(day: day, foodList: foodList);
  }

  static Food _createFood(Plate plate, Meal meal) {
    return Food(plate: plate, meal: meal);
  }

  static List<DateTime> _getDaysInBetween(
      DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }
}
