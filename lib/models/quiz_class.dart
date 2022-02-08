import 'package:flutter/material.dart';

import 'meal_type.dart';

class QuizClass {
  final ImageIcon icon;
  final Map<String, Color> color;
  final String question;
  final MealType? meal;

  QuizClass({required this.icon, required this.color, required this.question, this.meal});
}
