import 'package:economizei_app/models/foods_per_day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'food_item.dart';

class OpenDateMeals extends StatefulWidget {
  FoodsPerDay foodsPerDay;
  OpenDateMeals({Key? key, required this.foodsPerDay}) : super(key: key);

  @override
  _OpenDateMealsState createState() => _OpenDateMealsState();
}

class _OpenDateMealsState extends State<OpenDateMeals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: const Color(0xFF0FB8EE),
                child: Text(
                  DateFormat('dd').format(widget.foodsPerDay.day),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
              ),
              Text(
                DateFormat('EEE', 'pt_BR').format(widget.foodsPerDay.day),
                style: const TextStyle(
                  color: Color(0xFF676767),
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 250),
                    //height: 300,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.foodsPerDay.foodList.length,
                        itemBuilder: (ctx, index) {
                          return FoodItem(
                              food: widget.foodsPerDay.foodList[index]);
                        }),
                  ),
                  Container(
                    child: Icon(Icons.add),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF5F5F5),
                      borderRadius: BorderRadius.circular(38),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
