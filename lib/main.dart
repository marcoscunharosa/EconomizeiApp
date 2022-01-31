import 'package:economizei_app/repository/recipes_repository.dart';
import 'package:flutter/material.dart';
import 'screens/create_your_meals/create_your_meals.dart';
import 'screens/quiz/quiz_amount_people.dart';
import 'screens/quiz/quiz_meals_like.dart';
import 'service/user_service.dart';
import 'repository/products_repository.dart';

void main() {
  var userService = UserService.getInstance();
  userService!.createUser(
      username: "Batatinha Colorida", email: "batatinhacolorida@gmail.com");
  ProductsRepository.getRepository()!.createTable();
  RecipesRepository.getRepository()!.createTable();
  // Pegar usuário: UserService.getInstance().userAccount


  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const CreateYourMeals(),
          '/quiz': (context) => const QuizAmountPeople(),
        });
  }
}
