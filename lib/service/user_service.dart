import 'package:economizei_app/models/account.dart';
import 'package:flutter/material.dart';
import '../models/quiz_class.dart';
import '../models/meal.dart';
import '../models/meal_type.dart';
import '../models/user_preferences.dart';

class UserService {
  static UserService? instance;
  Account? userAccount;
  final List<QuizClass> questions = [
    QuizClass(
      icon: const ImageIcon(
        AssetImage('assets/images/quizpeopleicon.png'),
        color: Color(0xFF0FB8EE),
        size: 112,
      ),
      color: {
        'primary': const Color(0xFF0FB8EE),
        'secondary': const Color(0xFFCF8F8F)
      },
      question: "Para quantas pessoas você está planejando este cardápio?",
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

    if (questions.length > 1) {
      questions.removeRange(1, questions.length);
    }

    for (var i = 0; i < meals.length; i++) {
      if (meals[i].type != MealType.addButton) {
        filterMeals.add(meals[i]);
        createQuestionMeal(meals[i]);
      }
    }
    userAccount?.setMeals(filterMeals);
    addOtherQuestions();
  }

  void createQuestionMeal(Meal meal) {
    questions.add(QuizClass(
      icon: ImageIcon(
        const AssetImage('assets/images/coffeeicon.png'),
        color: meal.type.color['primary'],
        size: 96,
      ),
      color: meal.type.color,
      question: "O que você(s) costuma(m) comer na refeição ${meal.name}?",
    ));
  }

  void addOtherQuestions() {
    questions.add(QuizClass(
      icon: const ImageIcon(
        AssetImage('assets/images/noticon.png'),
        color: Color(0xFF03031B),
        size: 96,
      ),
      color: {
        'primary': const Color(0xFF03031B),
        'secondary': const Color(0xFF03031B)
      },
      question: "O que você(s) não gosta(m) de comer?",
    ));
    questions.add(QuizClass(
      icon: const ImageIcon(
        AssetImage('assets/images/quizpeopleicon.png'),
        color: Color(0xFFEE0F55),
        size: 112,
      ),
      color: {
        'primary': const Color(0xFFEE0F55),
        'secondary': Colors.white,
      },
      question:
          "Selecione todos os dias para os quais você gostaria de gerar um cardápio:",
    ));
  }

}
