import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SelectionButton extends StatefulWidget {
  Color unselectedColor;
  Color selectedColor;
  String insideText;
  Function activatedFunction;

  SelectionButton(
      {required this.unselectedColor,
      required this.selectedColor,
      required this.insideText,
      required this.activatedFunction});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: RaisedButton(
        child: Text(widget.insideText),
        color: pressAttention ? widget.selectedColor : widget.unselectedColor,
        elevation: 0,
        textColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        onPressed: () {
          setState(() {
            pressAttention = !pressAttention;
          });
        },
      ),
    );
  }
}
