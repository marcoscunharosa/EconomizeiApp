import 'package:flutter/material.dart';

import '../../widgets/app_bar_custom.dart';
import '../../models/quiz_class.dart';

class Quiz extends StatelessWidget {
  //const Quiz({ Key? key }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom("Questionário"),
      body: Text("ola"),
    );
  }
}
