import 'package:economizei_app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerForMealMenu extends StatefulWidget {
  final Function enableButton, disableButton;
  const DatePickerForMealMenu({Key? key, required this.enableButton, required this.disableButton})
      : super(key: key);

  @override
  State<DatePickerForMealMenu> createState() => _DatePickerForMealMenuState();
}

class _DatePickerForMealMenuState extends State<DatePickerForMealMenu> {
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      var range = args.value as PickerDateRange;
      UserService.getInstance()!.userAccount!.mealMenuTimeInterval = args.value;
      if (range.startDate != null && range.endDate != null) {
        widget.enableButton();
      } else {
        widget.disableButton();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.range,
        initialSelectedDate: DateTime.now(),
        minDate: DateTime.now(),
        selectionColor: const Color(0xFFEE0F55),
        rangeSelectionColor: Color.fromARGB(255, 255, 162, 170),
        startRangeSelectionColor: const Color(0xFFEE0F55),
        endRangeSelectionColor: const Color(0xFFEE0F55),
        selectionTextStyle: const TextStyle(color: Colors.white),
        rangeTextStyle: const TextStyle(color: Colors.white),
        todayHighlightColor: const Color(0xFFEE0F55),
        onSelectionChanged: _onSelectionChanged,
        headerStyle: const DateRangePickerHeaderStyle(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0xFFEE0F55),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
