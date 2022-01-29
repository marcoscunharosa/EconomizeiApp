import 'package:flutter/material.dart';

enum MealType { breakfast, lunch, betweenMeals, dinner, addButton }

extension MealTypeExtension on MealType {
  String get title {
    switch (this) {
      case MealType.breakfast:
        return "Café da manhã";
      case MealType.lunch:
        return "Almoço";
      case MealType.betweenMeals:
        return "Entre refeições";
      case MealType.dinner:
        return "Janta";
      default:
        return "null";
    }
  }

  AssetImage get icon {
    switch (this) {
      case MealType.breakfast:
        return const AssetImage('assets/images/coffeeicon.png');
      case MealType.lunch:
        return const AssetImage('assets/images/lunchicon.png');
      case MealType.betweenMeals:
        return const AssetImage('assets/images/betweenmealsicon.png');
      case MealType.dinner:
        return const AssetImage('assets/images/dinnericon.png');
      default:
        return const AssetImage('assets/images/quizpeopleicon.png');
    }
  }

  Map<String, Color> get color {
    switch (this) {
      case MealType.breakfast:
        return {
          'primary': const Color(0xFFEE0F55),
          'secondary': const Color(0xFFCF8F8F)
        };
      case MealType.lunch:
        return {
          'primary': const Color(0xFF0FB8EE),
          'secondary': const Color(0xFF69BDD8)
        };
      case MealType.betweenMeals:
        return {
          'primary': const Color(0xFF32CD32),
          'secondary': const Color(0xFF90CD90)
        };
      case MealType.dinner:
        return {
          'primary': const Color(0xFF03031B),
          'secondary': const Color(0xFF5B7882)
        };
      default:
        return {
          'primary': const Color(0xFF03031B),
          'secondary': const Color(0xFF5B7882)
        };
    }
  }
}
