import 'package:flutter/material.dart';

class QuizBottomBar extends StatefulWidget {
  final Function nextPage, previousPage;
  const QuizBottomBar(
      {Key? key, required this.nextPage, required this.previousPage})
      : super(key: key);

  @override
  State<QuizBottomBar> createState() => QuizBottomBarState();
}

class QuizBottomBarState extends State<QuizBottomBar> {
  bool isNextDisable = true;

  void enableButton() {
    setState(() {
      isNextDisable = false;
    });
  }

  void disableButton() {
    setState(() {
      isNextDisable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      color: const Color(0xFFF1F1F1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              widget.previousPage();
            },
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Color(0xFFEE0F55),
                  ),
                ),
                const Text(
                  "VOLTAR",
                  style: TextStyle(
                      fontSize: 14, color: Color(0xFFEE0F55), letterSpacing: 1),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isNextDisable) {
                widget.nextPage();
              }

              // Navigator.push(
              //   context,
              //   EnterExitRoute(
              //       exitPage: widget, enterPage: newWidget),
              // );
            },
            child: Container(
              child: Row(
                children: [
                  Text(
                    "CONTINUAR",
                    style: TextStyle(
                        fontSize: 14,
                        color: isNextDisable
                            ? const Color(0xFF989898)
                            : const Color(0xFFEE0F55),
                        letterSpacing: 1.5),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: isNextDisable
                          ? const Color(0xFF989898)
                          : const Color(0xFFEE0F55),
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
}
