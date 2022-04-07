import 'package:economizei_app/models/foods_per_day.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MealMenu{
  DateTime currentDay;
  PickerDateRange timeInterval;
  List<FoodsPerDay> foodsPerDayList = [];

  MealMenu({
    required this.currentDay,
    required this.timeInterval
  });

  void addFoodsPerDay(FoodsPerDay foodsPerDay){
    foodsPerDayList.add(foodsPerDay);
  }
}