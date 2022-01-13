import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import '../../widgets/app_bar_custom.dart';

class QuizMealsLike extends StatefulWidget {
  const QuizMealsLike({Key? key}) : super(key: key);

  @override
  State<QuizMealsLike> createState() => _QuizMealsLikeState();
}

class _QuizMealsLikeState extends State<QuizMealsLike> {
  final numberPeopleController = TextEditingController();
  int numberPeople = 0;
  String meals = "Café da manhã";

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
      appBar: AppBarCustom("Crie suas refeições"),
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
                Icons.coffee_rounded,
                color: Color(0xFFEE0F55),
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
                      "O que você(s) costuma(m) comer na refeição \"${meals}\"?",
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
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
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
            Row(
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
