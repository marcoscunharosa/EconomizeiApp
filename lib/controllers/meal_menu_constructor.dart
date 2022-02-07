import 'dart:math';

import 'package:economizei_app/models/eatable.dart';
import 'package:economizei_app/models/food.dart';
import 'package:economizei_app/models/foods_per_day.dart';
import 'package:economizei_app/models/meal.dart';
import 'package:economizei_app/models/meal_menu.dart';
import 'package:economizei_app/models/user_preferences.dart';
import 'package:economizei_app/service/user_service.dart';
import 'package:flutter/material.dart';

class MealMenuConstructor{

  static void constructAMealMenu(UserPreferences userPreferences, MealMenu mealMenu){
    DateTimeRange timeInterval = mealMenu.timeInterval;
    List<DateTime> days = _getDaysInBetween(timeInterval.start, timeInterval.end);
    for(int i = 0; i < days.length; i++){
      DateTime day = days[i];
      mealMenu.addFoodsPerDay(_createFoodsPerDay(day, userPreferences));
    }
  }

  static FoodsPerDay _createFoodsPerDay(DateTime day, UserPreferences userPreferences){
    Map<Meal, List<Eatable>> mapOfRecipes = userPreferences.eatAt;
    List<Food> foodList = [];
    var random = Random();
    for(var meal in mapOfRecipes.keys){
      Eatable eatable = mapOfRecipes[meal]![random.nextInt(mapOfRecipes[meal]!.length)];
      foodList.add(_createFood(eatable, meal));
    }
    return FoodsPerDay(day: day, foodList: foodList);
  }

  static Food _createFood(Eatable eatable, Meal meal){
    return Food(recipe: eatable.getRecipe(), meal: meal);
  }

  static List<DateTime> _getDaysInBetween(DateTime startDate, DateTime endDate){
    List<DateTime> days = [];
    for(int i = 0; i <= endDate.difference(startDate).inDays; i++){
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

}