import 'package:economizei_app/widgets/quiz_bottom_bar_custom.dart';
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
      appBar: AppBarCustom("Questionário"),
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
      bottomNavigationBar: QuizBottomBarCustom(
          context: context, widget: widget, newWidget: QuizMealsLike()),
    );
  }
}
