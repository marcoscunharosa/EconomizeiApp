import 'package:flutter/material.dart';

import 'meals_grid.dart';
import '../../widgets/enter_exit_route.dart';
import '../quiz/quiz_amount_people.dart';
import '../../widgets/app_bar_custom.dart';

class CreateYourMeals extends StatefulWidget {
  const CreateYourMeals({Key? key}) : super(key: key);

  @override
  _CreateYourMealsState createState() => _CreateYourMealsState();
}

class _CreateYourMealsState extends State<CreateYourMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom("Crie suas refeições"),
      body: const MealsGrid(),
      bottomNavigationBar: Container(
        height: 53,
        color: const Color(0xFFF1F1F1),
        child: GestureDetector(
          onTap: () {
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
