import 'package:economizei_app/models/plate_template.dart';
import 'package:economizei_app/screens/create_your_meals/plate_template_list.dart';
import 'package:economizei_app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/meal.dart';
import '../../models/meal_type.dart';
import '../../widgets/confirmation_dialog.dart';
import '../plates/plate_template_page.dart';
import 'new_meal_dialog.dart';

class MealScreen extends StatefulWidget {
  final Meal meal;
  final Function backScreen;
  const MealScreen(
      {Key? key,
      required this.meal,
      required this.backScreen,})
      : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  void addPlateTemplate(PlateTemplate plateTemplate, bool isEditing) {
    setState(() {
      if (!isEditing) {
        widget.meal.plateTemplates.add(plateTemplate);
      }
    });
  }

  

  void showNewMealDialog(bool isEditting, Meal? meal) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: const EdgeInsets.all(0),
              content: NewMealDialog(
                  isEditting: isEditting,
                  addNewMeal: (Meal meal) {
                    setState(() {});
                  },
                  meal: meal,
                  removeMeal: (Meal mealToRemove) {
                    UserService.getInstance()!
                        .userAccount!
                        .preferences
                        .meals
                        .remove(mealToRemove);
                    widget.backScreen();
                  }));
        });
  }
  Future<bool> _onBackPressed() {
    widget.backScreen();
    return Future.value(false);
  }
  @override
  Widget build(BuildContext context) {
    var meal = widget.meal;
    var mainColor = meal.type.color['primary'];
    return  WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 72,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: mainColor,
            ),
            onPressed: () {
              widget.backScreen();
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      color: mainColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageIcon(
                    meal.type.icon,
                    color: mainColor,
                    size: 24,
                  )
                ],
              ),
              Text(
                DateFormat('HH:mm').format(meal.timetable),
                style:
                    TextStyle(color: meal.type.color['secondary'], fontSize: 14),
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  showNewMealDialog(true, meal);
                },
                child: Icon(
                  Icons.mode_edit_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(12),
                    minimumSize: const Size(10, 10),
                    primary: mainColor),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Color(0xFFF8F8F8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Meus pratos',
                  style: TextStyle(
                      color: meal.type.color['secondary'],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              PlateTemplateList(
                plateTemplates: meal.plateTemplates,
                meal: meal,
                addPlateTemplate: addPlateTemplate,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Material(
                  child: PlateTemplatePage(
                    plateTemplate: PlateTemplate(daysOfConsuming: []),
                    meal: widget.meal,
                    isEditing: false,
                    addPlateTemplate: addPlateTemplate,
                    removePlateTemplate: () {},
                  ),
                ),
              ),
            );
          },
          backgroundColor: mainColor,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
