import 'package:flutter/material.dart';

import '../models/product.dart';

class SelectionButton extends StatefulWidget {
  Color unselectedColor;
  Color selectedColor;
  String insideText;
  Function activatedFunction;
  Function deactivatedFunction;
  Product product;

  SelectionButton({
    required this.unselectedColor,
    required this.selectedColor,
    required this.insideText,
    required this.activatedFunction,
    required this.deactivatedFunction,
    required this.product,
  });

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
            if (pressAttention) {
              widget.activatedFunction(widget.product);
            } else {
              widget.deactivatedFunction(widget.product);
            }
          });
        },
      ),
    );
  }
}
