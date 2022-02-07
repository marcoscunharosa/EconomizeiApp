import 'package:economizei_app/models/foods_per_day.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MealMenu{
  DateTime currentDay;
  DateTimeRange timeInterval;
  List<FoodsPerDay> foodsPerDayList = [];

  MealMenu({
    required this.currentDay,
    required this.timeInterval
  });

  void addFoodsPerDay(FoodsPerDay foodsPerDay){
    foodsPerDayList.add(foodsPerDay);
  }
}