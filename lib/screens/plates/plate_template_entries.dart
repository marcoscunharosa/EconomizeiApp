import 'package:economizei_app/models/meal_type.dart';
import 'package:economizei_app/models/plate_template.dart';
import 'package:economizei_app/screens/plates/plates_parts_list.dart';
import 'package:economizei_app/widgets/select_week_days.dart';
import 'package:flutter/material.dart';

import '../../models/meal.dart';

class CreatePlateScreen extends StatefulWidget {
  final Meal meal;
  final PlateTemplate plateTemplate;
  bool isEditting;
  CreatePlateScreen(
      {Key? key,
      required this.plateTemplate,
      required this.meal,
      this.isEditting = false})
      : super(key: key);

  @override
  State<CreatePlateScreen> createState() => _CreatePlateScreenState();
}

class _CreatePlateScreenState extends State<CreatePlateScreen> {
  final _nameTextController = TextEditingController();
  final double _dRight = 5;
  final _weekDaysButtons = [
    WeekDayButton('domingo'),
    WeekDayButton('segunda-feira'),
    WeekDayButton('terça-feira'),
    WeekDayButton('quarta-feira'),
    WeekDayButton('quinta-feira'),
    WeekDayButton('sexta-feira'),
    WeekDayButton('sábado')
  ];

  void selectDay(String day) {
    if (widget.plateTemplate.daysOfConsuming.contains(day)) {
      widget.plateTemplate.daysOfConsuming.remove(day);
    } else {
      widget.plateTemplate.daysOfConsuming.add(day);
    }
  }

  void initSelectDays(List<String> days) {
    for (var day in _weekDaysButtons) {
      if (days.contains(day.value)) {
        day.isSelected = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.plateTemplate.name != null) {
      _nameTextController.text = widget.plateTemplate.name!;
    }

    initSelectDays(widget.plateTemplate.daysOfConsuming);

    var mainColor = widget.meal.type.color['primary']!;

    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            primary: false,
            elevation: 0,
            backgroundColor: Color(0xFFF8F8F8),
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  widget.meal.name,
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ImageIcon(
                  widget.meal.type.icon,
                  color: mainColor,
                  size: 24,
                )
              ],
            ),
          ),
          Column(children: [
            // Container(
            //   height: 54,
            //   color: Color(0xFFF8F8F8),
            //   child: Row(
            //     children: [
            //       const SizedBox(
            //         width: 16,
            //       ),
            //       Text(
            //         widget.meal.name,
            //         style: TextStyle(
            //           color: mainColor,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 24,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       ImageIcon(
            //         widget.meal.type.icon,
            //         color: mainColor,
            //         size: 24,
            //       )
            //     ],
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: _nameTextController,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                onChanged: (String? value) {
                  widget.plateTemplate.name = value;
                },
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor, width: 2),
                    ),
                    hintText: 'Nomeie seu prato',
                    hintStyle: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF989898))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: const Color(0xFFF8F8F8),
              height: 41,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'Dias de consumo:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              child: SelectWeekDays(
                selectDay: selectDay,
                weekDaysButtons: _weekDaysButtons,
                spacing: _dRight,
                color: mainColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: const Color(0xFFF8F8F8),
              height: 41,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  'Partes do prato:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            PlatesTemplateList(
              plateParts: widget.plateTemplate.plateParts,
              mainColor: mainColor,
            ),
            
          ])
        ],
      ),
    );
  }
}

class WeekDayButton {
  final String value;
  late bool isSelected;
  late final String symbol;
  WeekDayButton(this.value) {
    isSelected = false;
    symbol = value[0].toUpperCase();
  }
}
