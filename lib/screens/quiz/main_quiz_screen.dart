import 'package:economizei_app/models/meal_type.dart';
import 'package:economizei_app/models/plate_part.dart';
import 'package:economizei_app/models/plate_template.dart';
import 'package:economizei_app/repository/plate_templates_by_meal.dart';
import 'package:economizei_app/repository/unity_of_plate_part.dart';
import 'package:economizei_app/repository/recipes_repository.dart';
import 'package:economizei_app/screens/plates/plate_template_entries.dart';
import 'package:economizei_app/screens/quiz/date_picker_for_meal_menu.dart';
import 'package:economizei_app/screens/quiz/personal_data_screen.dart';
import 'package:economizei_app/screens/quiz/what_is_used_to_eat_question.dart';
import 'package:economizei_app/service/user_service.dart';
import 'package:economizei_app/widgets/quiz_bottom_bar_custom.dart';
import 'package:economizei_app/widgets/timeline_title.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../controllers/meal_menu_constructor.dart';
import '../../models/meal.dart';

class MainQuizScreen extends StatefulWidget {
  final List<Meal> meals;
  late List<String> questions = [];
  MainQuizScreen({required this.meals, Key? key}) : super(key: key) {
    questions.add('Vamos começar conhecendo você...');
    for (var meal in meals) {
      questions.add('Monte seu prato do dia a dia para o(a)...');
      questions.add('O que você costuma comer na refeição... ');
    }
    questions.add(
        "Selecione o intervalo de tempo o qual você quer gerar um cardápio:");
  }

  @override
  State<MainQuizScreen> createState() => _MainQuizScreenState();
}

class _MainQuizScreenState extends State<MainQuizScreen> {
  final GlobalKey<QuizBottomBarState> bottomBarKey =
      GlobalKey<QuizBottomBarState>();

  int _currentIndex = 0;

  final List<Widget> _questionsScreens = [];
  final List<bool> enableButtonInBegging = [];

  void createQuestionScreens() {
    _questionsScreens.add(PersonalDataScreen(
      disableButton: disableButton,
      enableButton: enableButton,
    ));
    enableButtonInBegging.add(false);
    for (int i = 0; i < widget.meals.length; i++) {
      var plateTemplate =
          PlateTemplateByMeal.instance.getTemplate(widget.meals[i].type);
      Meal meal = widget.meals[i];
      meal.addPlateTemplate(plateTemplate);
      _questionsScreens.add(CreatePlateScreen(
        plateTemplate: plateTemplate,
        meal: meal,
      ));
      enableButtonInBegging.add(true);
      _questionsScreens.add(WhatIsUsedToEatQuestion(meal: meal));
      enableButtonInBegging.add(true);
    }

    _questionsScreens.add(DatePickerForMealMenu(
      enableButton: enableButton,
      disableButton: disableButton,
    ));
    enableButtonInBegging.add(false);
  }

  void disableButton() {
    bottomBarKey.currentState!.disableButton();
  }

  void enableButton() {
    bottomBarKey.currentState!.enableButton();
  }

  void nextPage() {
    setState(() {
      if (_currentIndex + 1 == _questionsScreens.length) {
        finishQuiz();
      } else {
        _currentIndex++;
        if (enableButtonInBegging[_currentIndex]) {
          enableButton();
        } else {
          disableButton();
        }
      }
    });
  }

  void previousPage() {
    setState(() {
      if (_currentIndex == 0) {
        Navigator.pop(context);
      } else {
        _currentIndex--;
      }
    });
  }

  void finishQuiz() {
    var userAccount = UserService.getInstance()!.userAccount!;
    userAccount.saveMealMenu();
    MealMenuConstructor.constructAMealMenu(
        userAccount.preferences.meals, userAccount.userMealMenu!);
    Navigator.popUntil(context, ModalRoute.withName('/'));
    Navigator.pushReplacementNamed(context, "/mainPage");
  }

  @override
  Widget build(BuildContext context) {
    if (_questionsScreens.isEmpty) {
      createQuestionScreens();
    }
    return Scaffold(
      body: Column(
        children: [
          TimelineTitle(
              title: widget.questions[_currentIndex],
              currentIndex: _currentIndex,
              numberOfIndexes: widget.questions.length),
          Expanded(child: _questionsScreens[_currentIndex])
        ],
      ),
      bottomNavigationBar: QuizBottomBar(
          key: bottomBarKey, nextPage: nextPage, previousPage: previousPage),
    );
  }
}

// class QuestionScreens {
//   final Widget widget;
//   final Function validateAnswers;
//   const QuestionScreens(this.widget, this.validateAnswers);
// }
