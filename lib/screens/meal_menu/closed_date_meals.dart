import 'package:economizei_app/models/foods_per_day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/meal_type.dart';

class ClosedDateMeals extends StatelessWidget {
  final FoodsPerDay foodsPerDay;
  final Function openDate;
  const ClosedDateMeals({Key? key, required this.foodsPerDay, required this.openDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openDate(foodsPerDay);
      },
      child: Container(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 100,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('dd').format(foodsPerDay.day),
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      DateFormat('EEE').format(foodsPerDay.day),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF676767),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(left: 8),
                child: ListView.builder(
                    itemCount: foodsPerDay.foodList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Container(
                        child: ImageIcon(foodsPerDay.foodList[index].meal.type.icon,
                            size: 20,
                            color: foodsPerDay
                                .foodList[index].meal.type.color['primary']),
                        margin: const EdgeInsets.only(right: 5),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
