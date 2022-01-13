import 'package:economizei_app/models/account.dart';
import 'package:flutter/material.dart';
import '../models/quiz_class.dart';
import '../models/meal.dart';
import '../models/meal_type.dart';
import '../models/user_preferences.dart';

class UserService {
  static UserService? instance;
  Account? userAccount;
  final questions = [
    QuizClass(
      icon: Icons.people_alt_rounded,
      color: {
        'primary': const Color(0xFFEE0F55),
        'secondary': const Color(0xFFCF8F8F)
      },
      question: "Para quantas pessoas você está planejando este cardápio?",
      answer: [0],
    ),
    QuizClass(
      icon: Icons.people_alt_rounded,
      color: {
        'primary': const Color(0xFFEE0F55),
        'secondary': const Color(0xFFCF8F8F)
      },
      question: "O que você(s) não gosta(m) de comer?",
      answer: [""],
    ),
    QuizClass(
      icon: Icons.people_alt_rounded,
      color: {
        'primary': const Color(0xFFEE0F55),
        'secondary': const Color(0xFFCF8F8F)
      },
      question:
          "Selecione todos os dias para os quais você gostaria de gerar um cardápio:",
      answer: [""],
    ),
  ];

  static UserService? getInstance() {
    if (instance == null) {
      instance = UserService();
    }
    return instance;
  }

  void createUser({required String username, required String email}) {
    List<Meal> standartMeals = [
      Meal(
          name: "Café da Manhã",
          type: MealType.breakfast,
          timetable: DateTime.parse("2019-11-20 08:00:00"))
    ];
    userAccount = Account(
        username: username,
        email: email,
        preferences: UserPreferences(meals: standartMeals));
  }

  void createUserMeals({required List<Meal> meals}) {
    List<Meal> filterMeals = [];
    for (var i = 0; i < meals.length; i++) {
      if (meals[i].type != MealType.addButton) {
        filterMeals.add(meals[i]);
        createQuestion(meals[i]);
      }
    }
    userAccount?.setMeals(filterMeals);

    for (var i = 0; i < filterMeals.length; i++) {
      print(userAccount?.preferences.meals[i].name);
    }
  }

  void createQuestion(Meal meal) {
    questions.add(QuizClass(
      icon: meal.type.icon,
      color: meal.type.color,
      question: "O que você(s) costuma(m) comer na refeição ${meal.name}",
      answer: [0],
    ));
  }
}
