import 'package:economizei_app/repository/recipes_repository.dart';
import 'package:economizei_app/screens/grocery_list/grocery_list_screen.dart';
import 'package:flutter/material.dart';
import 'screens/create_your_meals/create_your_meals.dart';
import 'screens/quiz/quiz.dart';
import 'service/user_service.dart';
import 'repository/products_repository.dart';
import 'screens/main_screen/main_page.dart';
import 'screens/main_screen/main_page.dart';

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
          //'/': (context) => const MainPage(),
          '/': (context) => const CreateYourMeals(),
          '/mainPage': (context) => const MainPage()
          //'/quiz': (context) => Quiz(),
        });
  }
}
