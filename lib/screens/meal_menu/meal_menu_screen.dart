import 'package:economizei_app/controllers/grocery_list_constructor.dart';
import 'package:economizei_app/models/meal_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'date_list.dart';

class MealMenuScreen extends StatefulWidget {
  MealMenu mealMenu;
  MealMenuScreen({Key? key, required this.mealMenu }) : super(key: key);

  @override
  _MealMenuScreenState createState() => _MealMenuScreenState();
}

class _MealMenuScreenState extends State<MealMenuScreen> {
  String _getDateInformation(){
    var firstDay = DateFormat('dd').format(widget.mealMenu.timeInterval.start);
    var lastDay = DateFormat('dd').format(widget.mealMenu.timeInterval.end);
    var month = DateFormat('MMM').format(widget.mealMenu.timeInterval.start);
    return firstDay + " - " + lastDay + " " + month;
  }

  void _generateGroceryList(){
    var groceryList = GroceryListConstructor.getProductCategoryList(widget.mealMenu);
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              _getDateInformation(),
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF676767),
              ),
            ),
          ),
          DateMealsList(foodsPerDayList: widget.mealMenu.foodsPerDayList),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},//_generateGroceryList,
          backgroundColor: const Color(0xFFEE0F55),
          child: const Icon(Icons.local_grocery_store)),
    );
  }
}
