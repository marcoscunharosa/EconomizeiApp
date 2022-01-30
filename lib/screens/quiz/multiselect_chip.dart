import 'package:economizei_app/models/eatable.dart';
import 'package:flutter/material.dart';
import '../../models/recipe.dart';
import '../../service/user_service.dart';

class MultiSelectChip extends StatefulWidget {
  final List<Eatable> reportList;
  List<String> selectedChoices;
  int type;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(
      this.reportList, this.selectedChoices, this.type, this.onSelectionChanged);

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
          selected: widget.selectedChoices.contains(item.getName()),
          selectedColor: UserService.getInstance()!
                .questions[widget.type]
                .color['primary'],
          backgroundColor: Color(0xFF959595),
          labelStyle: TextStyle(color: Colors.white),
          onSelected: (selected) {
            setState(() {
              widget.selectedChoices.contains(item.getName())
                  ? widget.selectedChoices.remove(item.getName())
                  : widget.selectedChoices.add(item.getName());
              widget.onSelectionChanged(widget.selectedChoices);
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
      children: _buildChoiceList(),
    );
  }
}
