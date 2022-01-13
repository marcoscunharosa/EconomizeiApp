import 'package:flutter/material.dart';

class QuizClass {
  final IconData icon;
  final Map<String, Color> color;
  final String question;
  final List<Object> answer;

  QuizClass({required this.icon, required this.color, required this.question, required this.answer});
}
