import 'package:economizei_app/controllers/grocery_list_constructor.dart';
import 'package:economizei_app/models/meal_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../service/user_service.dart';
import 'date_list.dart';

class MealMenuScreen extends StatefulWidget {
  Function openGroceryList;
  MealMenuScreen({
    Key? key,
    required this.openGroceryList,
  }) : super(key: key);
  MealMenu get mealMenu{
    return UserService.getInstance()!.userAccount!.userMealMenu!;
  }
  @override
  _MealMenuScreenState createState() => _MealMenuScreenState();
}

class _MealMenuScreenState extends State<MealMenuScreen> {
  String _getDateInformation() {
    var firstDay = DateFormat('dd', 'pt_BR')
        .format(widget.mealMenu.timeInterval.startDate!);
    var lastDay =
        DateFormat('dd', 'pt_BR').format(widget.mealMenu.timeInterval.endDate!);
    var monthFirst = DateFormat('MMM', 'pt_BR')
        .format(widget.mealMenu.timeInterval.startDate!);
    var monthSecond = DateFormat('MMM', 'pt_BR')
        .format(widget.mealMenu.timeInterval.endDate!);
    if(widget.mealMenu.timeInterval.startDate!.month != widget.mealMenu.timeInterval.endDate!.month){
      return firstDay + " " + monthFirst + " - " + lastDay + " " + monthSecond;
    }
    return firstDay + " - " + lastDay + " " + monthSecond;
  }

  void _generateGroceryList() {
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
          DateMealsList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            UserService.getInstance()!.userAccount!.saveGroceryList(
                GroceryListConstructor.getProductCategoryList(widget.mealMenu));
            widget.openGroceryList();
          }, //_generateGroceryList,
          backgroundColor: const Color(0xFFEE0F55),
          child: const Icon(Icons.local_grocery_store)),
    );
  }
}
