import 'package:economizei_app/models/meal_type.dart';
import 'package:economizei_app/screens/create_your_meals/meal_screen.dart';
import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../widgets/meal_item.dart';
import './new_meal_dialog.dart';
import '../../models/meal_type.dart';

class MealsGrid extends StatefulWidget {
  List<Meal> meals;
  Function deleteMeal, addMeal, openMealScreen, closeMealScreen;
  final bool isQuiz;
  MealsGrid(this.meals, this.deleteMeal, this.addMeal, this.isQuiz,
      this.openMealScreen, this.closeMealScreen);

  @override
  _MealsGridState createState() => _MealsGridState();
}

class _MealsGridState extends State<MealsGrid> {
  // void deleteMeal(meal) {
  //   setState(() {
  //     widget.meals.remove(meal);
  //   });
  // }

  void showNewMealDialog(bool isEditting, Meal? meal) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: const EdgeInsets.all(0),
              content: NewMealDialog(
                  isEditting: isEditting,
                  addNewMeal: widget.addMeal,
                  meal: meal,
                  removeMeal: widget.deleteMeal));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          padding: const EdgeInsets.all(20),
          itemCount: widget.meals.length + 1,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                if (index > widget.meals.length - 1) {
                  showNewMealDialog(false, null);
                } else {
                  if (widget.isQuiz) {
                    showNewMealDialog(true, widget.meals[index]);
                  } else {
                    widget.openMealScreen(MealScreen(
                      meal: widget.meals[index],
                      backScreen: widget.closeMealScreen,
            
                    ));
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) =>
                    //         MealScreen(meal: widget.meals[index])));
                  }
                }
              },
              child: index < widget.meals.length
                  ? MealItem(meal: widget.meals[index])
                  : Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8F8F8),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            spreadRadius: 0.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
            );
          }),
    );
  }
}
