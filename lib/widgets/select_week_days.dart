import 'package:economizei_app/screens/plates/plate_template_entries.dart';
import 'package:flutter/material.dart';

class SelectWeekDays extends StatefulWidget {
  final List<WeekDayButton> weekDaysButtons;
  final double spacing;
  final Color color;
  final Function selectDay;
  const SelectWeekDays(
      {Key? key,
      required this.weekDaysButtons,
      this.spacing = 3,
      required this.selectDay,
      this.color = Colors.black})
      : super(key: key);

  @override
  State<SelectWeekDays> createState() => _SelectWeekDaysState();
}

class _SelectWeekDaysState extends State<SelectWeekDays> {
  @override
  Widget build(BuildContext context) {
    final _circleDiameter =
        (MediaQuery.of(context).size.width - 120 - (6 * widget.spacing)) / 7;
    return Container(
      height: _circleDiameter + 5,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext ct, int index) {
            WeekDayButton weekDayButton = widget.weekDaysButtons[index];
            double dRight = widget.spacing;
            if (index == 6) {
              dRight = 0;
            }
            return Container(
              margin: EdgeInsets.only(right: dRight),
              child: GestureDetector(
                child: Container(
                  width: _circleDiameter,
                  height: _circleDiameter,
                  alignment: Alignment.center,
                  child: Text(
                    weekDayButton.symbol,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: weekDayButton.isSelected
                          ? widget.color
                          : Color(0xFFC4C4C4)),
                ),
                onTap: () {
                  setState(() {
                    widget.selectDay(weekDayButton.value);
                    weekDayButton.isSelected = !weekDayButton.isSelected;
                  });
                },
              ),
            );
          }),
    );
  }
}
