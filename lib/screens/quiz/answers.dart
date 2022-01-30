import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../service/user_service.dart';
import './multiselect_chip.dart';
import '../../models/eatable.dart';
import '../../repository/products_repository.dart';
import '../../repository/recipes_repository.dart';

class Answers extends StatefulWidget {
  int type;
  Function setInformation;
  Function clearInformation;
  final numberPeopleController;
  List<Eatable> selectedReportList;
  List<Eatable> selectedChoices;

  Answers({
    required this.type,
    required this.setInformation,
    required this.clearInformation,
    required this.numberPeopleController,
    required this.selectedReportList,
    required this.selectedChoices,
  });

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  List<Widget> answersType = [];

  late DateTimeRange _selectedDates;
  bool _dateWasSelect = false;

  void selectDate() {
    showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
      helpText: "Selecione o intervalo",
    ).then((pickedDates) {
      if (pickedDates == null) {
        widget.clearInformation();
        _dateWasSelect = false;
        return;
      }
      setState(() {
        _selectedDates = pickedDates;
        _dateWasSelect = true;
        saveDateRange();
        widget.setInformation();
      });
    });
  }

  void saveDateRange() {
    if (_selectedDates != null) {
      UserService.getInstance()!.userAccount!.setDateRange(_selectedDates);
    }
  }

  Widget eatableSelection() {
    List<Eatable> eatable = [];
    eatable.addAll(ProductsRepository.getRepository()!.allProducts);
    eatable.addAll(RecipesRepository.getRepository()!.allRecipes);
    return ListView(children: [
      MultiSelectChip(
        eatable,
        widget.selectedChoices,
        widget.type,
        (selectedList) {
          setState(() {
            widget.selectedReportList = selectedList;
            if (widget.selectedReportList.length < 1) {
              widget.clearInformation();
            } else {
              widget.setInformation();
            }
          });
        },
      ),
    ]);
  }

  Widget build(BuildContext context) {
    if (widget.type == 0) {
      return Card(
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
            controller: widget.numberPeopleController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
            ),
            validator: (numberPeopleController) {
              if (numberPeopleController != null ||
                  numberPeopleController!.isNotEmpty) {
                widget.setInformation();
              }
            },
            onChanged: (_) {
              if (widget.numberPeopleController.text != "") {
                widget.setInformation();
              }
            },
          ),
        ),
      );
    }
    if (widget.type > 0 &&
        widget.type <= UserService.getInstance()!.questions.length - 3) {
      return SizedBox(
        height: 270,
        width: 300,
        child: eatableSelection(),
      );
    }
    if (widget.type == UserService.getInstance()!.questions.length - 2) {
      return SizedBox(
        height: 270,
        width: 300,
        child: eatableSelection(),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              _dateWasSelect == false
                  ? 'Nenhuma data selecionada.'
                  : 'Início: ${DateFormat('dd/MM/yyyy').format(_selectedDates.start)}\nFim: ${DateFormat('dd/MM/yyyy').format(_selectedDates.end)}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RaisedButton(
            child: const Text(
              "Selecione o intervalo de datas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            color: UserService.getInstance()!
                .questions[widget.type]
                .color['primary'],
            textColor: UserService.getInstance()!
                .questions[widget.type]
                .color['secondary'],
            elevation: 0,
            onPressed: selectDate,
          ),
        ],
      );
    }
  }
}
