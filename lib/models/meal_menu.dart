import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MealMenu{
  DateTime currentDay;
  DateTimeRange timeInterval;

  MealMenu({
    required this.currentDay,
    required this.timeInterval
  });
}