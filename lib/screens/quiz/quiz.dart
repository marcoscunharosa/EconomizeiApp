import 'package:economizei_app/widgets/selection_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar_custom.dart';
import '../../service/user_service.dart';
import './quiz_body.dart';

class Quiz extends StatefulWidget {
  @override
  var value = 0;

  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int pagina = 0;
  List<Widget> navigationQuizPages = [];
  List<Color> navigationQuizColor = [];
  final numberPeopleController = TextEditingController();
  Color continueColor = Color(0xFF959595);
  bool canContinue = false;

  void setInformation() {
    setState(() {
      continueColor = Color(0xFFEE0F55);
      canContinue = true;
    });
  }

  void clearInformation() {
    setState(() {
      continueColor = Color(0xFF959595);
      canContinue = false;
    });
  }

  void saveNumberPeople(int number) {
    if (number != null) {
      UserService.getInstance()!
          .userAccount!
          .preferences
          .setEatersNumber(number);
    }
  }

  void previous() {
    if (widget.value - 1 == 0 && numberPeopleController.text != "") {
      saveNumberPeople(int.parse(numberPeopleController.text));
      setInformation();
    }
    if (widget.value - 1 == -1) {
      return Navigator.pop(context);
    } else {
      setState(() {
        navigationQuizColor[widget.value] = Color(0xFF959595);
        navigationQuizColor[widget.value - 1] = Color(0xFFEE0F55);
      });
      decreaseNumber();
    }
  }

  void next() {
    if (canContinue) {
      if (widget.value == 0 && numberPeopleController.text != "") {
        saveNumberPeople(int.parse(numberPeopleController.text));
      }
      if (widget.value + 1 >= UserService.getInstance()!.questions.length) {
        return Navigator.pop(context);
      } else {
        setState(() {
          navigationQuizColor[widget.value] = Color(0xFF959595);
          navigationQuizColor[widget.value + 1] = Color(0xFFEE0F55);
        });
        addNumber();
      }
      clearInformation();
    } else {
      print("cant continue");
    }
  }

  void addNumber() {
    setState(() {
      widget.value += 1;
    });
  }

  void decreaseNumber() {
    setState(() {
      widget.value -= 1;
    });
  }

  Widget answerType() {
    if (widget.value == 0) {
      return Card(
        color: const Color(0xFFF5F5F5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: 80,
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: 10,
            right: 10,
          ),
          child: TextFormField(
            controller: numberPeopleController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
            ),
            validator: (numberPeopleController) {
              if (numberPeopleController != null ||
                  numberPeopleController!.isNotEmpty) {
                setInformation();
              }
            },
            onChanged: (_) {
              if (numberPeopleController.text != "") {
                setInformation();
              }
            },
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
        width: 270,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3.5,
          children: [
            SelectionButton(
              unselectedColor: const Color(0xFF959595),
              selectedColor: const Color(0xFFEE0F55),
              insideText: "Olá",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Olá",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Olá",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
            SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor: Color(0xFFEE0F55),
              insideText: "Tudo bem?",
              activatedFunction: () {},
            ),
          ],
        ),
      );
    }
  }

  Widget navigationBar() {
    navigationQuizPages = [];
    navigationQuizColor.add(const Color(0xFFEE0F55));
    navigationQuizPages.add(
      Icon(
        Icons.circle,
        size: 10,
        color: navigationQuizColor[0],
      ),
    );
    for (var i = 1; i < UserService.getInstance()!.questions.length; i++) {
      navigationQuizColor.add(const Color(0xFF959595));
      navigationQuizPages.add(
        Icon(
          Icons.circle,
          size: 10,
          color: navigationQuizColor[i],
        ),
      );
    }

    return Container(
      height: 52,
      color: const Color(0xFFF1F1F1),
      //padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              previous();
            },
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFEE0F55),
                  ),
                ),
                const Text(
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
            children: navigationQuizPages.map((page) => page).toList(),
          ),
          GestureDetector(
            onTap: () {
              next();
            },
            child: Row(
              children: [
                Text(
                  "Continuar",
                  style: TextStyle(
                      fontSize: 18, color: continueColor, letterSpacing: 1.5),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: continueColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom("Questionário"),
      body: QuizBody(widget.value, answerType),
      bottomNavigationBar: navigationBar(),
    );
  }
}
