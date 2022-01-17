import 'package:flutter/material.dart';

import '../../service/user_service.dart';

class QuizBody extends StatelessWidget {
  int page;
  Function answerType;
  QuizBody(this.page, this.answerType);

  @override
  Widget build(BuildContext context) {
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
                    UserService.getInstance()!.questions[page].icon,
                    color: UserService.getInstance()!
                        .questions[page]
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
                          UserService.getInstance()!.questions[page].question,
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
}
