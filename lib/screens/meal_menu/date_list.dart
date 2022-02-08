import 'dart:collection';

import 'package:economizei_app/models/foods_per_day.dart';
import 'package:flutter/material.dart';
import 'open_date_meals.dart';
import 'closed_date_meals.dart';
import 'dart:core';

class DateMealsList extends StatefulWidget {
  List<FoodsPerDay> foodsPerDayList;
  DateMealsList({Key? key, required this.foodsPerDayList}) : super(key: key);

  @override
  _DateMealsListState createState() => _DateMealsListState();
}

class _DateMealsListState extends State<DateMealsList> {
  HashMap<DateTime, dynamic> _widgetByDate = HashMap<DateTime, dynamic>();
  late DateTime _openedDay;
  late List<Widget> _listOfWidgets;

  List<Widget> _createDateList() {
    List<Widget> listOfWidgets = [];
    DateTime today = DateTime.now();
    int index = 0;
    for (FoodsPerDay foodsPerDay in widget.foodsPerDayList) {
      DateTime day = foodsPerDay.day;
      Widget newWidget;
      if (day.day == today.day) {
        newWidget = OpenDateMeals(foodsPerDay: foodsPerDay);
        _openedDay = day;
      } else {
        newWidget =
            ClosedDateMeals(foodsPerDay: foodsPerDay, openDate: openNewDate);
      }

      listOfWidgets.add(newWidget);
      _widgetByDate[day] = {'foodsPerDay': foodsPerDay, 'index': index};

      index++;
      listOfWidgets.add(const Divider(
        thickness: 1.5,
      ));
      index++;
    }
    return listOfWidgets;
  }

  void openNewDate(FoodsPerDay foodsPerDay) {
    setState(() {
      var lastOpenedDateInfo = _widgetByDate[_openedDay];
      var newClosedDate = ClosedDateMeals(
        foodsPerDay: lastOpenedDateInfo['foodsPerDay'],
        openDate: openNewDate,
      );

      var lastClosedDateInfo = _widgetByDate[foodsPerDay.day];
      var newOpenedDate = OpenDateMeals(foodsPerDay: foodsPerDay);

      _openedDay = foodsPerDay.day;
      _listOfWidgets[lastOpenedDateInfo['index']] = newClosedDate;
      _listOfWidgets[lastClosedDateInfo['index']] = newOpenedDate;
    });
  }

  @override
  @protected
  @mustCallSuper
  // ignore: must_call_super
  void initState() {
    _listOfWidgets = _createDateList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _listOfWidgets.length,
          itemBuilder: (ctx, index) {
            return _listOfWidgets[index];
          }),
    );
  }
}
