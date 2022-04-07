import 'package:economizei_app/service/user_service.dart';
import 'package:economizei_app/widgets/slide_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../../models/account.dart';

class PersonalDataScreen extends StatefulWidget {
  final Function enableButton;
  final Function disableButton;
  const PersonalDataScreen(
      {Key? key, required this.enableButton, required this.disableButton})
      : super(key: key);

  @override
  State<PersonalDataScreen> createState() => PersonalDataScreenState();
}

class PersonalDataScreenState extends State<PersonalDataScreen> {
  final _formKey = GlobalKey<FormState>();

  final _heightTextController = MoneyMaskedTextController(rightSymbol: 'm', precision: 2);
  final _weightTextController = MoneyMaskedTextController(rightSymbol: 'kg', precision: 1);
  final _ageTextController = TextEditingController();
  String? sex;
  String? dietaryPattern;
  String? physicalActivityLevel;
  bool completedAnswers = false;

  Widget _getField(String title, Widget textFormField, double width) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF0FB8EE), fontWeight: FontWeight.bold),
          ),
          textFormField
        ],
      ),
    );
  }

  void watchChanges() {
    if (_heightTextController.text != "0,00m" &&
        _weightTextController.text != "0,0kg" &&
        _ageTextController.text.isNotEmpty &&
        sex != null &&
        physicalActivityLevel != null &&
        dietaryPattern != null) {
      completedAnswers = true;
      widget.enableButton();
    } else if (completedAnswers) {
      completedAnswers = false;
      widget.disableButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    Account user = UserService.getInstance()!.userAccount!;
    if (user.areInformationsSaved()) {
      _heightTextController.text = user.height!;
      _weightTextController.text = user.weight!;
      _ageTextController.text = user.age!;
      sex = user.sex!;
      dietaryPattern = user.dietaryPreferences!;
      physicalActivityLevel = user.pyshicsActivityLevel!;
    }
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.3,
                crossAxisSpacing: 40,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  SlideFadeAnimation(
                    dy: -0.5,
                    timeStart: 800,
                    duration: 800,
                    child: _getField(
                        "Altura",
                        TextFormField(
                          cursorColor: Color(0xFF0FB8EE),
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          controller: _heightTextController,
                          
                          onChanged: (String? value) {

                            user.height = value;
                            watchChanges();
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 5),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF0FB8EE), width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value == "0,00m") {
                              return 'Inválido';
                            }
                            return null;
                          },
                        ),
                        67),
                  ),
                  SlideFadeAnimation(
                    timeStart: 1000,
                    duration: 800,
                    dy: -0.5,
                    child: _getField(
                        "Peso",
                        TextFormField(
                            cursorColor: Color(0xFF0FB8EE),
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            controller: _weightTextController,
                            onChanged: (String? value) {
                              user.weight = value;
                              watchChanges();
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 5),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF0FB8EE), width: 2),
                              ),
                            ),
                            validator: (value) {
                              if (value == "0,0kg") {
                                return 'Inválido';
                              }
                              return null;
                            }),
                        67),
                  ),
                  SlideFadeAnimation(
                    timeStart: 1200,
                    duration: 800,
                    dy: -0.5,
                    child: _getField(
                        "Sexo",
                        Container(
                          child: DropdownButtonFormField(
                              value: user.sex,
                              isExpanded: true,
                              alignment: Alignment.center,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.only(top: 19, bottom: 5),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF0FB8EE), width: 2))),
                              hint: const Text(
                                "Selecione seu sexo",
                                style: TextStyle(fontStyle: FontStyle.italic),
                                overflow: TextOverflow.ellipsis,
                              ),
                              items: [
                                'Masculino',
                                'Feminino',
                                'Prefiro não informar'
                              ].map((String type) {
                                return DropdownMenuItem<String>(
                                    value: type, child: Text(type));
                              }).toList(),
                              onChanged: (String? value) {
                                user.sex = value;
                                sex = value;
                                watchChanges();
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Inválido';
                                }
                                return null;
                              }),
                        ),
                        67),
                  ),
                  SlideFadeAnimation(
                    timeStart: 1400,
                    duration: 800,
                    dy: -0.5,
                    child: _getField(
                        "Idade",
                        TextFormField(
                            cursorColor: Color(0xFF0FB8EE),
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            controller: _ageTextController,
                            onChanged: (String? value) {
                              user.age = value;
                              watchChanges();
                            },
                            decoration: const InputDecoration(
                              hintText: "Ex: 20 anos",
                              hintStyle: TextStyle(fontStyle: FontStyle.italic),
                              contentPadding: EdgeInsets.only(bottom: 5),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF0FB8EE), width: 2),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Inválido';
                              }
                              return null;
                            }),
                        67),
                  ),
                ],
              ),
            )),
            Container(
              child: SlideFadeAnimation(
                duration: 800,
                timeStart: 1600,
                dy: -0.5,
                child: _getField(
                  "Padrão Alimentar",
                  Container(
                    child: DropdownButtonFormField(
                        value: user.dietaryPreferences,
                        isExpanded: true,
                        alignment: Alignment.center,
                        decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF0FB8EE), width: 2))),
                        hint: const Center(
                          child: Text(
                            "Selecione uma opção",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontStyle: FontStyle.italic),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        items: ['Carnívoro', 'Vegetariano', 'Vegano']
                            .map((String type) {
                          return DropdownMenuItem<String>(
                              value: type, child: Center(child: Text(type)));
                        }).toList(),
                        onChanged: (String? value) {
                          user.dietaryPreferences = value;
                          dietaryPattern = value;
                          watchChanges();
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Inválido';
                          }
                          return null;
                        }),
                  ),
                  (MediaQuery.of(context).size.width - 80),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: SlideFadeAnimation(
                duration: 800,
                timeStart: 1800,
                dy: -0.5,
                child: _getField(
                  "Qual o seu nível de atividade física?",
                  DropdownButtonFormField(
                      value: user.pyshicsActivityLevel,
                      isExpanded: true,
                      alignment: Alignment.center,
                      decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF0FB8EE), width: 2))),
                      hint: const Center(
                        child: Text(
                          "Selecione uma opção",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontStyle: FontStyle.italic),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      items: [
                        'Leve ou sedentário',
                        'Faço certas atividades',
                        'Faço academia'
                      ].map((String type) {
                        return DropdownMenuItem<String>(
                            value: type, child: Center(child: Text(type)));
                      }).toList(),
                      onChanged: (String? value) {
                        user.pyshicsActivityLevel = value;
                        physicalActivityLevel = value;
                        watchChanges();
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Inválido';
                        }
                        return null;
                      }),
                  (MediaQuery.of(context).size.width - 80),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
