import 'package:flutter/material.dart';

import '../widgets/enter_exit_route.dart';

class QuizBottomBarCustom extends Container {
  QuizBottomBarCustom({required BuildContext context, required Widget widget, required Widget newWidget})
      : super(
          height: 52,
          color: Color(0xFFF1F1F1),
          //padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFFEE0F55),
                      ),
                    ),
                    Text(
                      "Voltar",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFEE0F55),
                          letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Color(0xFFEE0F55),
                  ),
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Color(0xFF959595),
                  ),
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Color(0xFF959595),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    EnterExitRoute(
                        exitPage: widget, enterPage: newWidget),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "Continuar",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFEE0F55),
                            letterSpacing: 1.5),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFEE0F55),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
}
