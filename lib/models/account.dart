import 'package:economizei_app/models/grocery_list.dart';
import 'package:economizei_app/models/meal_menu.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import './user_preferences.dart';

import '../models/meal.dart';
import 'product_category_list.dart';

class Account {
  String username;
  String email;
  UserPreferences preferences;
  MealMenu? userMealMenu;
  GroceryList? groceryList;
  PickerDateRange? mealMenuTimeInterval;
  String? height, weight, sex, age, dietaryPreferences, pyshicsActivityLevel;

  Account({
    required this.username,
    required this.email,
    required this.preferences,
  });

  void saveMealMenu() {
    userMealMenu = MealMenu(
        currentDay: DateTime.now(), timeInterval: mealMenuTimeInterval!);
  }

  bool areInformationsSaved() {
    List<String?> informations = [
      height,
      weight,
      sex,
      age,
      dietaryPreferences,
      pyshicsActivityLevel
    ];
    for (var info in informations) {
      if (info == null) {
        return false;
      }
    }
    return true;
  }

  void saveGroceryList(List<ProductCategoryList> listOfProducts) {
    groceryList = GroceryList(categories: listOfProducts);
  }

  void setMeals(List<Meal> meals) {
    preferences = UserPreferences(meals: meals);
  }
}
