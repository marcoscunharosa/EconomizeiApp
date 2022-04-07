import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title, alertText;
  late List<ButtonActions> buttonActions;
  ConfirmationDialog(
      {Key? key,
      this.title = "Você tem certeza disso?",
      required this.buttonActions,
      this.alertText = ""})
      : super(key: key);

  List<Widget> _createButtonActions(context) {
    List<Widget> listOfButtons = [];
    for (var buttonAction in buttonActions) {
      listOfButtons.add(TextButton(
        style: TextButton.styleFrom(
          primary: Color(0xFFEE0F55),
        ),
        onPressed: () {
          Navigator.pop(context);
          buttonAction.action();
        },
        child: Text(buttonAction.title),
      ));
    }
    return listOfButtons;
  }

  @override
  Widget build(BuildContext context) {
    var _actions = _createButtonActions(context);
    return ButtonBarTheme(
      data: ButtonBarThemeData(alignment: MainAxisAlignment.spaceAround),
      child: AlertDialog(
        
        title: Text(title),
        content: Text(alertText, textAlign: TextAlign.center,),
        //actionsOverflowDirection: VerticalDirection.up,
        actions: _actions,
      ),
    );
  }
}

class ButtonActions {
  final String title;
  final Function action;
  ButtonActions({required this.title, required this.action});
}
