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
        elevation: 0,
        toolbarHeight: 72,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Crie suas refeições",
              style: TextStyle(
                color: Color(0xFFEE0F55),
                letterSpacing: 1.5,
              ),
            ),
            Icon(Icons.dehaze, color: Color(0xFFEE0F55)),
          ],
        ),
      ),
      body: const MealsGrid(),
      bottomNavigationBar: Container(
        height: 53,
        color: const Color(0xFFF1F1F1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Continuar para gerar o cardápio",
              style: TextStyle(
                  fontSize: 18, color: Color(0xFFEE0F55), letterSpacing: 1.5),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Icon(
                Icons.arrow_forward,
                color: Color(0xFFEE0F55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
