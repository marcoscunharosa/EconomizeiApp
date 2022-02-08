import 'package:economizei_app/models/food.dart';
import 'package:flutter/material.dart';
import '../../models/meal_type.dart';

class FoodItem extends StatelessWidget {
  final Food food;
  const FoodItem({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: ImageIcon(
                food.meal.type.icon,
                color: food.meal.type.color['primary'],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text(food.recipe.name,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
