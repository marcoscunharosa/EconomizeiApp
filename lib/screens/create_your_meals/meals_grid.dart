import 'package:economizei_app/models/meal_type.dart';
import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../widgets/meal_item.dart';
import './new_meal_dialog.dart';
import '../../models/meal_type.dart';

class MealsGrid extends StatefulWidget {
  const MealsGrid({Key? key}) : super(key: key);

  @override
  _MealsGridState createState() => _MealsGridState();
}

class _MealsGridState extends State<MealsGrid> {
  
  

  List<Meal> meals = [
    Meal(name: "Café da Manhã", type: MealType.breakfast, timetable: "08:00"),
    Meal(name: "Adicionar", type: MealType.addButton, timetable: "none")
  ];

  void addNewMeal(meal){
    var index = meals.length - 1;

    setState(() {
      meals.insert(index, meal);
    });
  }
  void showNewMealDialog() async {
    return showDialog(
        context: context,

        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: NewMealDialog(isEditting: false, addNewMeal: addNewMeal),
          );
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
          itemCount: meals.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
                onTap: () {
                  if (meals[index].type == MealType.addButton) {
                    showNewMealDialog();
                  }
                },
                child: MealItem(meal: meals[index]));
          }),
    );
  }
}
