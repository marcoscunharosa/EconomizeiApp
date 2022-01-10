import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/meal_type.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: meal.type != MealType.addButton
          ? BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  spreadRadius: 0.0,
                  offset: Offset(0, 4),
                ),
              ],
            )
          : const BoxDecoration(
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
      child: meal.type != MealType.addButton
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Icon(
                    meal.type.icon,
                    color: meal.type.color['primary'],
                    size: 50,
                  ),
                ),
                Text(meal.name,
                    style: TextStyle(
                      color: meal.type.color['primary'],
                      fontSize: 18,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    meal.timetable,
                    style: TextStyle(
                      color: meal.type.color['secondary'],
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          : const Icon(
              Icons.add,
              size: 50,
            ),
    );
  }
}
