import 'package:flutter/material.dart';

import '../../models/recipe.dart';

class SelectionRecipeButton extends StatefulWidget {
  Color unselectedColor;
  Color selectedColor;
  String insideText;
  Function activatedFunction;
  Function deactivatedFunction;
  Recipe recipe;

  SelectionRecipeButton({
    required this.unselectedColor,
    required this.selectedColor,
    required this.insideText,
    required this.activatedFunction,
    required this.deactivatedFunction,
    required this.recipe,
  });

  @override
  State<SelectionRecipeButton> createState() => _SelectionRecipeButtonState();
}

class _SelectionRecipeButtonState extends State<SelectionRecipeButton> {
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
            if (pressAttention) {
              widget.activatedFunction(widget.recipe);
            } else {
              widget.deactivatedFunction(widget.recipe);
            }
          });
        },
      ),
    );
  }
}
