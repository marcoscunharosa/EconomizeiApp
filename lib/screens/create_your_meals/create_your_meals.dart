import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'meals_grid.dart';
import '../../widgets/enter_exit_route.dart';
import '../quiz/quiz.dart';
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

  void deleteMeal(meal) {
    setState(() {
      meals.remove(meal);
    });
  }

  void addNewMeal(meal) {
    var index = meals.length - 1;

    setState(() {
      if (!meals.contains(meal)) {
        meals.insert(index, meal);
      }
      meals.sort((a, b) {
          return a.timetable.compareTo(b.timetable);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Color(0xFFEE0F55),
      Colors.white,
      Color(0xFFEE0F55),
    ];
    const colorizeTextStyle = TextStyle(fontSize: 18, letterSpacing: 1.2);
    return Scaffold(
      appBar: AppBarCustom("Crie suas refeições"),
      body: MealsGrid(meals, deleteMeal, addNewMeal),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (meals.length == 1) {
            return;
          }
          UserService.getInstance()?.createUserMeals(meals: meals);
          Navigator.push(
            context,
            EnterExitRoute(exitPage: widget, enterPage: Quiz()),
          );
        },
        child: Container(
          height: 52,
          color: const Color(0xFFF1F1F1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: meals.length == 1
                    ? const Text("Continuar para gerar o cardápio",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.2,
                          color: Colors.grey,
                        ))
                    : AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                              "Continuar para gerar o cardápio",
                              colors: colorizeColors,
                              textStyle: colorizeTextStyle),
                        ],
                        repeatForever: true,
                      ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_forward,
                  color:
                      meals.length == 1 ? Colors.grey : const Color(0xFFEE0F55),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
