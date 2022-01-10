import 'package:flutter/material.dart';

enum MealType {
  breakfast,
  lunch,
  betweenMeals,
  dinner,
  addButton
}

extension MealTypeExtension on MealType {
  String get title {
    switch(this) {
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
  IconData get icon {
    switch(this) {
      case MealType.breakfast:
        return Icons.free_breakfast_rounded;
      case MealType.lunch:
        return Icons.local_dining;
      case MealType.betweenMeals:
        return Icons.local_pizza;
      case MealType.dinner:
        return Icons.local_dining;
      default:
        return Icons.add;
    }
  }

  Map<String, Color> get color {
    switch(this) {
      case MealType.breakfast:
        return {'primary': const Color(0xFFEE0F55), 'secondary': const Color(0xFFCF8F8F)};
      case MealType.lunch:
        return {'primary': const Color(0xFF0FB8EE), 'secondary': const Color(0xFF69BDD8)};
      case MealType.betweenMeals:
        return {'primary': const Color(0xFF32CD32), 'secondary': const Color(0xFF90CD90)};
      case MealType.dinner:
        return {'primary': const Color(0xFF03031B), 'secondary': const Color(0xFF5B7882)};
      default:
        return {'primary': const Color(0xFF03031B), 'secondary': const Color(0xFF5B7882)};;
    }
  }
}

