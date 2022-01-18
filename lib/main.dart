import 'package:economizei_app/repository/recipes_repository.dart';
import 'package:flutter/material.dart';
import 'screens/create_your_meals/create_your_meals.dart';
import 'screens/quiz/quiz.dart';
import 'service/user_service.dart';
import 'repository/products_repository.dart';

void main() {
  var userService = UserService.getInstance();
  userService!.createUser(
      username: "Batatinha Colorida", email: "batatinhacolorida@gmail.com");
  ProductsRepository.getRepository()!.createTable();
  RecipesRepository.getRepository()!.createTable();
  // Pegar usuário: UserService.getInstance().userAccount
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const CreateYourMeals(),
          '/quiz': (context) => Quiz(),
        });
  }
}
