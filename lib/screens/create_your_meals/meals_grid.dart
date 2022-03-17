import 'package:economizei_app/models/meal_type.dart';
import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../widgets/meal_item.dart';
import './new_meal_dialog.dart';
import '../../models/meal_type.dart';

class MealsGrid extends StatefulWidget {
  List<Meal> meals;
  Function deleteMeal, addMeal;

  MealsGrid(this.meals, this.deleteMeal, this.addMeal);

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
          itemCount: widget.meals.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
                onTap: () {
                  if (widget.meals[index].type == MealType.addButton) {
                    showNewMealDialog(false, null);
                  } else {
                    showNewMealDialog(true, widget.meals[index]);
                  }
                },
                child: MealItem(meal: widget.meals[index]));
          }),
    );
  }
}
