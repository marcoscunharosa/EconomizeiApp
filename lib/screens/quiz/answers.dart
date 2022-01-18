import 'package:economizei_app/screens/quiz/products_selection.dart';
import 'package:flutter/material.dart';

import '../../service/user_service.dart';
import '../../repository/products_repository.dart';
import '../../models/product.dart';
import '../../widgets/selection_button.dart';

class Answers extends StatelessWidget {
  int type;
  Function setInformation;
  Function clearInformation;
  final numberPeopleController;
  int selected;
  List<Product> products;

  Answers({
    required this.type,
    required this.setInformation,
    required this.clearInformation,
    required this.numberPeopleController,
    required this.selected,
    required this.products,
  });

  List<Widget> answersType = [];

  @override
  Widget build(BuildContext context) {
    answersType.add(
      Card(
        color: const Color(0xFFF5F5F5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: 80,
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: 10,
            right: 10,
          ),
          child: TextFormField(
            controller: numberPeopleController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
            ),
            validator: (numberPeopleController) {
              if (numberPeopleController != null ||
                  numberPeopleController!.isNotEmpty) {
                setInformation();
              }
            },
            onChanged: (_) {
              if (numberPeopleController.text != "") {
                setInformation();
              }
            },
          ),
        ),
      ),
    );
    for (var i = 0; i < UserService.getInstance()!.questions.length - 3; i++) {
      answersType.add(
        Container(
          height: 300,
          width: 300,
          child: ProductsSelection(
            clearInformation: clearInformation,
            selected: selected,
            setInformation: setInformation,
            type: type,
            products: products,
          ),
        ),
      );
    }
    answersType.add(
      Container(
        height: 300,
        width: 300,
        child: ProductsSelection(
          clearInformation: clearInformation,
          selected: selected,
          setInformation: setInformation,
          type: type,
          products: products,
        ),
      ),
    );
    answersType.add(
      Text("Ola"),
    );
    return answersType[type];
  }
}
