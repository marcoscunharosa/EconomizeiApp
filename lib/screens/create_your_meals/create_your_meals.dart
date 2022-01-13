import 'package:flutter/material.dart';

import 'meals_grid.dart';
import '../../widgets/enter_exit_route.dart';
import '../quiz/quiz_amount_people.dart';
import '../../widgets/app_bar_custom.dart';
import '../../models/meal.dart';
import '../../models/meal_type.dart';
import '../../service/user_service.dart';

class CreateYourMeals extends StatefulWidget {
  const CreateYourMeals({Key? key}) : super(key: key);

  @override
  _CreateYourMealsState createState() => _CreateYourMealsState();
}

class _CreateYourMealsState extends State<CreateYourMeals> {
  List<Meal> meals = [
    Meal(
        name: "Café da Manhã",
        type: MealType.breakfast,
        timetable: DateTime.parse("2019-11-20 08:00:00")),
    Meal(
        name: "Adicionar",
        type: MealType.addButton,
        timetable: DateTime.parse("2019-11-21 00:00:00"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom("Crie suas refeições"),
      body: MealsGrid(meals),
      bottomNavigationBar: Container(
        height: 52,
        color: const Color(0xFFF1F1F1),
        child: GestureDetector(
          onTap: () {
            UserService.getInstance()?.createUserMeals(meals: meals);
            Navigator.push(
              context,
              EnterExitRoute(exitPage: widget, enterPage: QuizAmountPeople()),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Continuar para gerar o cardápio",
                style: TextStyle(
                    fontSize: 18, color: Color(0xFFEE0F55), letterSpacing: 1.5),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFFEE0F55),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
