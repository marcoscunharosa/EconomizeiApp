import 'package:economizei_app/models/plate_template.dart';
import 'package:economizei_app/screens/create_your_meals/meal_screen.dart';
import 'package:economizei_app/screens/create_your_meals/meals_grid.dart';
import 'package:flutter/material.dart';

import '../../models/meal.dart';

class CreateYourMeals extends StatefulWidget {
  final List<Meal> meals;
  final Function openMealScreen, closeMealScreen, backScreen;
  const CreateYourMeals(
      {Key? key,
      required this.meals,
      required this.backScreen,
      required this.openMealScreen,
      required this.closeMealScreen})
      : super(key: key);

  @override
  State<CreateYourMeals> createState() => _CreateYourMealsState();
}

class _CreateYourMealsState extends State<CreateYourMeals> {
  void deleteMeal(meal) {
    setState(() {
      widget.meals.remove(meal);
    });
  }

  void addNewMeal(Meal meal) {
    var index = widget.meals.length;

    setState(() {
      if (!widget.meals.contains(meal)) {
        widget.meals.insert(index, meal);
      }
      widget.meals.sort((a, b) {
        return a.timetable.compareTo(b.timetable);
      });
      meal.plateTemplates.add(PlateTemplate(daysOfConsuming: []));
      widget.openMealScreen(
          MealScreen(meal: meal, backScreen: widget.closeMealScreen));
    });
  }

  Future<bool> _onBackPressed() {
    widget.backScreen();
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MealsGrid(widget.meals, deleteMeal, addNewMeal, false,
          widget.openMealScreen, widget.closeMealScreen),
    );
  }
}
