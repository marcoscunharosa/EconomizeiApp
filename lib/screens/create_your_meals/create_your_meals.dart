import 'package:flutter/material.dart';
import 'meals_grid.dart';


class CreateYourMeals extends StatefulWidget {
  const CreateYourMeals({Key? key}) : super(key: key);

  @override
  _CreateYourMealsState createState() => _CreateYourMealsState();
}

class _CreateYourMealsState extends State<CreateYourMeals> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation : 0,
        toolbarHeight: 72,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Crie suas refeições",
              style: TextStyle(
                color: Color(0xFFEE0F55)
              ),
            ),
            Icon(Icons.dehaze,
            color: Color(0xFFEE0F55)),
          ],
        ),
      ),
      body: const MealsGrid(),
    );
  }
}
