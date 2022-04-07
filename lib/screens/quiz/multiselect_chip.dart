import 'package:economizei_app/models/chosable_item.dart';
import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../../models/meal_type.dart';
import '../../models/recipe.dart';
import '../../service/user_service.dart';

class MultiSelectChip extends StatefulWidget {
  final List<ChosableItem> reportList;
  List<ChosableItem> selectedChoices;
  final MealType mealType;
  //final Function(List<ChosableItem>) onSelectionChanged;

  MultiSelectChip(
    this.reportList,
    this.selectedChoices,
    this.mealType,
    //this.onSelectionChanged,
  );

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  _buildChoiceList() {
    List<Widget> choices = [];

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2),
        child: ChoiceChip(
          label: Text(item.getName()),
          selected: widget.selectedChoices.contains(item),
          selectedColor: widget.mealType.color['primary'],
          backgroundColor: Color(0xFFC4C4C4),
          labelStyle: TextStyle(color: Colors.white),
          onSelected: (selected) {
            setState(() {
              widget.selectedChoices.contains(item)
                  ? widget.selectedChoices.remove(item)
                  : widget.selectedChoices.add(item);
              //widget.onSelectionChanged(widget.selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: _buildChoiceList(),
    );
  }
}
