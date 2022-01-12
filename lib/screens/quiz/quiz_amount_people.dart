import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import './quiz_meals_like.dart';
import '../../widgets/enter_exit_route.dart';
import '../../widgets/app_bar_custom.dart';

class QuizAmountPeople extends StatefulWidget {
  const QuizAmountPeople({Key? key}) : super(key: key);

  @override
  State<QuizAmountPeople> createState() => _QuizAmountPeopleState();
}

class _QuizAmountPeopleState extends State<QuizAmountPeople> {
  final numberPeopleController = TextEditingController();
  int numberPeople = 0;

  @override
  void saveNumberPeople(int number) {
    setState(() {
      numberPeople = number;
      print(numberPeople);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBarCustom("Questionário"),
=======
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 72,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Questionário",
              style: TextStyle(color: Color(0xFFEE0F55)),
            ),
            Icon(Icons.dehaze, color: Color(0xFFEE0F55)),
          ],
        ),
      ),
>>>>>>> fb4126e (Creating screens 1 and 2 of inicial quiz)
      body: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.people_alt_rounded,
                color: Color(0xFF0FB8EE),
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
                      "Para quantas pessoas você está planejando este cardápio?",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Roboto",
                      ),
                    )),
              ),
              Card(
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
                  child: TextField(
                    controller: numberPeopleController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                    onChanged: (_) {
                      saveNumberPeople(int.parse(numberPeopleController.text));
                    },
                  ),
                ),
              ),
              Text("Pessoas"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFF1F1F1),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
<<<<<<< HEAD
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFEE0F55),
                  ),
                  Text(
                    "Voltar",
                    style: TextStyle(color: Color(0xFFEE0F55)),
                  ),
                ],
              ),
=======
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFEE0F55),
                ),
                Text(
                  "Voltar",
                  style: TextStyle(color: Color(0xFFEE0F55)),
                ),
              ],
>>>>>>> fb4126e (Creating screens 1 and 2 of inicial quiz)
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
<<<<<<< HEAD
                  context,
                  EnterExitRoute(exitPage: widget, enterPage: QuizMealsLike()),
=======
                  context, EnterExitRoute(exitPage: widget, enterPage: QuizMealsLike()),
>>>>>>> fb4126e (Creating screens 1 and 2 of inicial quiz)
                );
              },
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Continuar",
                      style: TextStyle(color: Color(0xFFEE0F55)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFFEE0F55),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /*BottomNavigationBar(
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios),
              label: "Voltar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios),
              label: "Continuar",
            ),
          ],
        ),*/
    );
  }
}
