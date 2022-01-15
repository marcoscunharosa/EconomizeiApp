import 'package:flutter/material.dart';

import '../../widgets/app_bar_custom.dart';
import '../../service/user_service.dart';

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

  @override
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

  @override
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

    print(
        "Eaters ${UserService.getInstance()!.userAccount!.preferences.eaters}");
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
        color: Color(0xFFF5F5F5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: 80,
          padding: EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: 10,
            right: 10,
          ),
          child: TextFormField(
            controller: numberPeopleController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(
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
      return Text("nada");
    }
  }

  Widget quizBody() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    UserService.getInstance()!.questions[widget.value].icon,
                    color: UserService.getInstance()!
                        .questions[widget.value]
                        .color['primary'],
                    size: 144,
                  ),
                  Container(
                    width: 276,
                    child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        margin: EdgeInsets.only(
                          top: 32,
                          bottom: 16,
                        ),
                        child: Text(
                          UserService.getInstance()!
                              .questions[widget.value]
                              .question,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Roboto",
                          ),
                        )),
                  ),
                  answerType(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget navigationBar() {
    navigationQuizPages = [];
    navigationQuizColor.add(Color(0xFFEE0F55));
    navigationQuizPages.add(
      Icon(
        Icons.circle,
        size: 10,
        color: navigationQuizColor[0],
      ),
    );
    for (var i = 1; i < UserService.getInstance()!.questions.length; i++) {
      navigationQuizColor.add(Color(0xFF959595));
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
      color: Color(0xFFF1F1F1),
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
            children: navigationQuizPages.map((page) => page).toList(),
          ),
          GestureDetector(
            onTap: () {
              next();
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom("Questionário"),
      body: quizBody(),
      bottomNavigationBar: navigationBar(),
    );
  }
}
