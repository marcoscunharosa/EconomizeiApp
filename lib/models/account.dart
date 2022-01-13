import './user_preferences.dart';
import 'package:intl/intl.dart';

import '../models/meal.dart';

class Account {
  String username;
  String email;
  UserPreferences preferences;
  DateFormat? inicialDay;
  DateFormat? finalDay;

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
}
