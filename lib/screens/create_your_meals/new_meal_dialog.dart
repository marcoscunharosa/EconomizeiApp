import 'package:flutter/material.dart';
import '../../models/meal_type.dart';
import '../../models/meal.dart';

class NewMealDialog extends StatefulWidget {
  final bool isEditting;
  final Function addNewMeal;
  const NewMealDialog(
      {Key? key, required this.addNewMeal, required this.isEditting})
      : super(key: key);

  @override
  _NewMealDialogState createState() => _NewMealDialogState();
}

class _NewMealDialogState extends State<NewMealDialog> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _hoursEditingController = TextEditingController();
  final TextEditingController _minutesEditingController =
      TextEditingController();
  MealType? _mealTypeChosen;

  void createNewMeal() {
    if (_mealTypeChosen != null) {
      var hour =
          _hoursEditingController.text + ":" + _minutesEditingController.text;
      var meal = Meal(
          name: _nameEditingController.text,
          timetable: hour,
          type: _mealTypeChosen!);
      Navigator.pop(context);
      widget.addNewMeal(meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F8F8),
      height: 468,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 35,
                  ))),
          Container(
            alignment: Alignment.center,
            child: _mealTypeChosen == null
                ? const Icon(Icons.no_meals_ouline, size: 50)
                : Icon(_mealTypeChosen!.icon,
                    size: 50, color: _mealTypeChosen!.color['primary']),
            margin: const EdgeInsets.only(bottom: 10),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text(
              "Nome",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            height: 60,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: _mealTypeChosen != null
                          ? _mealTypeChosen!.color['primary']!
                          : Colors.black,
                      width: 2.0),
                ),
                hintText: 'Nome da refeição',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
              ),
              controller: _nameEditingController,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 10),
            child: const Text(
              "Categoria",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            height: 38,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: _mealTypeChosen != null
                          ? _mealTypeChosen!.color['primary']!
                          : Colors.black,
                      width: 2.0),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  value: _mealTypeChosen,
                  onChanged: (MealType? newType) {
                    setState(() {
                      _mealTypeChosen = newType!;
                    });
                  },
                  underline: Container(),
                  elevation: 16,
                  hint: const Text(
                    'Escolha uma categoria',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  items: <MealType>[
                    MealType.breakfast,
                    MealType.lunch,
                    MealType.betweenMeals,
                    MealType.dinner
                  ].map((MealType type) {
                    return DropdownMenuItem<MealType>(
                        value: type, child: Text(type.title));
                  }).toList(),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              "Horário",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 62,
                      height: 50,
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: _mealTypeChosen != null
                            ? _mealTypeChosen!.color['primary']
                            : Colors.black,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 10),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: _mealTypeChosen != null
                                    ? _mealTypeChosen!.color['primary']!
                                    : Colors.black,
                                width: 3.0),
                          ),
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                          hintText: '00',
                        ),
                        controller: _hoursEditingController,
                      ),
                    ),
                    const Text(
                      "Hora",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Container(
                height: 62,
                child: const Text(
                  ":",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 62,
                      height: 50,
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: _mealTypeChosen != null
                            ? _mealTypeChosen!.color['primary']
                            : Colors.black,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 10),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: _mealTypeChosen != null
                                    ? _mealTypeChosen!.color['primary']!
                                    : Colors.black,
                                width: 3.0),
                          ),
                          hintStyle: TextStyle(fontStyle: FontStyle.italic),
                          hintText: '00',
                        ),
                        controller: _minutesEditingController,
                      ),
                    ),
                    const Text(
                      "Minuto",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 35,
                  ),
                ),
                GestureDetector(
                  onTap: createNewMeal,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
