import 'package:economizei_app/models/chosable_item.dart';
import 'package:economizei_app/models/plate_template.dart';

import './meal_type.dart';

class Meal {
  MealType type;
  DateTime timetable;
  String name;
  List<PlateTemplate> plateTemplates = [];
  List<ChosableItem> itemsUserLikes = [];

  Meal({required this.name, required this.type, required this.timetable});

  void addPlateTemplate(PlateTemplate plateTemplate) {
    plateTemplates.add(plateTemplate);
  }
}
