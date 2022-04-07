// import 'package:economizei_app/controllers/meal_menu_constructor.dart';
// import 'package:economizei_app/models/account.dart';
// import 'package:economizei_app/models/chosable_item.dart';
// import 'package:economizei_app/models/quiz_class.dart';

// import 'package:economizei_app/models/recipe.dart';
// import 'package:economizei_app/models/user_preferences.dart';
// import 'package:economizei_app/repository/products_repository.dart';
// import 'package:economizei_app/repository/recipes_repository.dart';
// import 'package:economizei_app/screens/quiz/answers.dart';
// import 'package:flutter/material.dart';

// import '../../widgets/app_bar_custom.dart';
// import '../../service/user_service.dart';
// import './quiz_body.dart';
// import '../../models/product.dart';

// class Quiz extends StatefulWidget {
//   @override
//   var value = 0;
//   final Account? userAccount = UserService.getInstance()!.userAccount;
//   State<Quiz> createState() => _QuizState();
// }

// class _QuizState extends State<Quiz> {
//   int pagina = 0;
//   List<Widget> navigationQuizPages = [];
//   List<Color> navigationQuizColor = [];
//   final numberPeopleController = TextEditingController();
//   Color continueColor = const Color(0xFF959595);
//   bool canContinue = false;
//   int selected = 0;
//   List<Product> products = [];
//   List<Recipe> recipes = [];
//   List<ChosableItem> selectedReportList = [];
//   List<ChosableItem> selectedChoices = [];

//   void setInformation() {
//     setState(() {
//       continueColor = const Color(0xFFEE0F55);
//       canContinue = true;
//     });
//   }

//   void clearInformation() {
//     setState(() {
//       continueColor = const Color(0xFF959595);
//       canContinue = false;
//       selectedReportList = [];
//       selectedChoices = [];
//     });
//   }

//   void saveNumberPeople(int number) {
//     if (number != null) {
//       UserService.getInstance()!
//           .userAccount!
//           .preferences
//           .setEatersNumber(number);
//     }
//   }

//   void previous() {
//     if (widget.value - 1 == 0 &&
//         (numberPeopleController.text != "" || selected > 0)) {
//       saveNumberPeople(int.parse(numberPeopleController.text));
//       setInformation();
//     }
//     if (widget.value - 1 == -1) {
//       return Navigator.pop(context);
//     } else {
//       setState(() {
//         navigationQuizColor[widget.value] = const Color(0xFF959595);
//         navigationQuizColor[widget.value - 1] = const Color(0xFFEE0F55);
//       });
//       decreaseNumber();
//     }
//   }

//   void saveLikes() {
//     List<Recipe> recipes = [];
//     for(ChosableItem item in selectedChoices){
//       item.choose(recipes);
//     }
//     UserService.getInstance()!
//         .userAccount!
//         .preferences
//         .addEatAt(widget.value - 1, recipes);
//   }

//   void saveDislikes() {
//     List<Product> products = [];
//     for(ChosableItem item in selectedChoices){
//       item.choose(products);
//     }
//     UserService.getInstance()!
//         .userAccount!
//         .preferences
//         .addDontEat(products);
//   }

//   void next() {
//     if (canContinue) {
//       if (widget.value == 0 && numberPeopleController.text != "") {
//         saveNumberPeople(int.parse(numberPeopleController.text));
//       } else if (widget.value > 0 &&
//           widget.value <= UserService.getInstance()!.questions.length - 3) {
//         saveLikes();
//       } else if (widget.value ==
//           UserService.getInstance()!.questions.length - 2) {
//         saveDislikes();
//       }
//       if (widget.value + 1 >= UserService.getInstance()!.questions.length) {
//         widget.userAccount!.saveMealMenu();
//         MealMenuConstructor.constructAMealMenu(
//             widget.userAccount!.preferences,
//             widget.userAccount!.userMealMenu!);
//         Navigator.pushReplacementNamed(context, "/mainPage");
//       } else {
//         setState(() {
//           navigationQuizColor[widget.value] = const Color(0xFF959595);
//           navigationQuizColor[widget.value + 1] = const Color(0xFFEE0F55);
//         });
//         addNumber();
//       }
//       clearInformation();
//     } else {
//       print("cant continue");
//     }
//   }

//   void addNumber() {
//     setState(() {
//       widget.value += 1;
//     });
//   }

//   void decreaseNumber() {
//     setState(() {
//       widget.value -= 1;
//     });
//   }

//   Widget answerType(QuizClass quizClass) {
//     return Answers(
//       type: widget.value,
//       setInformation: setInformation,
//       clearInformation: clearInformation,
//       numberPeopleController: numberPeopleController,
//       selectedReportList: selectedReportList,
//       selectedChoices: selectedChoices,
//       quizClass: quizClass,
//     );
//   }

//   @override
//   Widget navigationBar() {
//     navigationQuizPages = [];
//     navigationQuizColor.add(const Color(0xFFEE0F55));
//     navigationQuizPages.add(
//       Icon(
//         Icons.circle,
//         size: 10,
//         color: navigationQuizColor[0],
//       ),
//     );
//     for (var i = 1; i < UserService.getInstance()!.questions.length; i++) {
//       navigationQuizColor.add(const Color(0xFF959595));
//       navigationQuizPages.add(
//         Icon(
//           Icons.circle,
//           size: 10,
//           color: navigationQuizColor[i],
//         ),
//       );
//     }

//     return Container(
//       height: 52,
//       color: const Color(0xFFF1F1F1),
//       //padding: EdgeInsets.all(10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () {
//               previous();
//             },
//             child: Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(left: 10),
//                   child: const Icon(
//                     Icons.arrow_back_ios,
//                     color: Color(0xFFEE0F55),
//                   ),
//                 ),
//                 const Text(
//                   "Voltar",
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: Color(0xFFEE0F55),
//                       letterSpacing: 1.5),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: navigationQuizPages.map((page) => page).toList(),
//           ),
//           GestureDetector(
//             onTap: () {
//               next();
//             },
//             child: Row(
//               children: [
//                 Text(
//                   "Continuar",
//                   style: TextStyle(
//                       fontSize: 18, color: continueColor, letterSpacing: 1.5),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 10),
//                   child: Icon(
//                     Icons.arrow_forward_ios,
//                     color: continueColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarCustom("Questionário"),
//       body: QuizBody(widget.value, answerType),
//       bottomNavigationBar: navigationBar(),
//     );
//   }
// }
