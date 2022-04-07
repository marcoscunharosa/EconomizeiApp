import 'package:economizei_app/models/plate_part.dart';
import '../../repository/unity_of_plate_part.dart';
import 'package:economizei_app/repository/recipes_repository.dart';
import 'package:economizei_app/screens/plates/recipe_search_overlay_field.dart';
import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';
import '../../models/recipe.dart';

class AddPlatePartDialog extends StatefulWidget {
  final PlatePart platePart;
  final bool isEditting;
  final Function addPlatePart;
  final Function removePlatePart;
  const AddPlatePartDialog(
      {Key? key,
      required this.platePart,
      required this.isEditting,
      required this.addPlatePart,
      required this.removePlatePart})
      : super(key: key);

  @override
  State<AddPlatePartDialog> createState() => _AddPlatePartDialogState();
}

class _AddPlatePartDialogState extends State<AddPlatePartDialog> {
  final _formKeyUnity = GlobalKey<FormState>();
  final _focusUnity = FocusNode();
  final _formKeyRecipe = GlobalKey<RecipeOverlayFieldState>();
  bool isFirstLoaded = false;

  final TextEditingController recipeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  UnityOfPlatePart? unity = null;
  bool canBeReplaced = false;
  bool isAlwaysOnPlate = false;

  final List<Recipe> _listOfAllRecipes =
      List<Recipe>.from(RecipesRepository.getRepository()!.allRecipes);

  Widget _getTitleWidget(String text) {
    return Container(
      height: 40,
      color: Color(0xFFF8F8F8),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _addPlatePart() {
    if (_formKeyUnity.currentState!.validate() &&
        _formKeyRecipe.currentState!.validateForm()) {
      amountController.text = amountController.text.replaceAll(',', '.');
      if (amountController.text == '') {
        widget.platePart.amount = 1;
      } else {
        widget.platePart.amount = double.parse(amountController.text);
      }
      if (unity == null) {
        widget.platePart.unity =
            AllPlatePartsUnity.getUnity('colher de servir');
      } else {
        widget.platePart.unity = unity!;
      }
      widget.platePart.canBeReplaced = canBeReplaced;
      widget.platePart.isAlwaysOnPlate = isAlwaysOnPlate;
      widget.addPlatePart(widget.platePart, widget.isEditting);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isEditting && !isFirstLoaded) {
      isFirstLoaded = true;
      recipeController.text = widget.platePart.recipe.name;
      amountController.text = widget.platePart.amount.toString();
      if (widget.platePart.amount % 1 == 0) {
        amountController.text = widget.platePart.amount.toInt().toString();
      }
      unity = widget.platePart.unity;
      isAlwaysOnPlate = widget.platePart.isAlwaysOnPlate;
      canBeReplaced = widget.platePart.canBeReplaced;
    }
    return SingleChildScrollView(
      child: Container(
        width: 300,
        //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Column(children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: Color(0xFFF8F8F8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //width: 211,
                  child: Text(
                    widget.isEditting
                        ? 'Editar uma parte'
                        : 'Adicionar uma parte',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFEE0F55),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 28,
                ),
                //Icon(Icons.close, size: 28,),
              ],
            ),
          ),
          _getTitleWidget('Receita:'),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: RecipeOverlayField(
              key: _formKeyRecipe,
              platePart: widget.platePart,
              textController: recipeController,
            ),
          ),
          _getTitleWidget('Medida:'),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                  child: Form(
                    key: _formKeyUnity,
                    child: TextFormField(
                      controller: amountController,
                      focusNode: _focusUnity,
                      onEditingComplete: () {
                        _formKeyUnity.currentState!.validate();
                        _focusUnity.unfocus();
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCFCFCF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFEE0F55),
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: "1",
                        hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis),
                      ),
                      validator: (String? value) {
                        if (value != null && value == '0') {
                          return "Inválido";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 195,
                  child: DropdownButtonFormField(
                    value: unity,
                    isExpanded: true,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis),
                    alignment: Alignment.center,
                    decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCFCFCF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFEE0F55), width: 2))),
                    hint: const Text(
                      'colher de servir',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: AllPlatePartsUnity.allUnities
                        .map((UnityOfPlatePart type) {
                      return DropdownMenuItem<UnityOfPlatePart>(
                          value: type, child: Text(type.singular));
                    }).toList(),
                    onChanged: (UnityOfPlatePart? value) {
                      //print(value);
                      unity = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          _getTitleWidget('Preferências:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    color: canBeReplaced ? Color(0xFFEE0F55) : Colors.white,
                    child: canBeReplaced
                        ? const Icon(
                            Icons.swap_horiz_rounded,
                            color: Colors.white,
                            size: 18,
                          )
                        : Container(),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Pode ser substituído?',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              SizedBox(
                height: 40,
                child: Switch(
                    value: canBeReplaced,
                    activeColor: Colors.white,
                    activeTrackColor: Color(0xFFEE0F55),
                    onChanged: (value) {
                      setState(() {
                        canBeReplaced = value;
                      });
                    }),
              ),
            ],
          ),
          SizedBox(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                canBeReplaced
                    ? const Divider(
                        color: Color(0xFFDADADA),

                        height: 1, //Color(0xFFDADADA),
                      )
                    : Container(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: canBeReplaced ? 40 : 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: canBeReplaced
                        ? const [
                            Text(
                              'Gerenciar substituições',
                              style: TextStyle(
                                  color: Color(0xFFEE0F55),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.double_arrow_rounded,
                              color: Color(0xFFEE0F55),
                              size: 18,
                            ),
                          ]
                        : [],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFDADADA),
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    color: isAlwaysOnPlate ? Color(0xFFEE0F55) : Colors.white,
                    child: isAlwaysOnPlate
                        ? const Icon(
                            Icons.replay,
                            color: Colors.white,
                            size: 18,
                          )
                        : Container(),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Sempre está no prato?',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              SizedBox(
                height: 30,
                child: Switch(
                    value: isAlwaysOnPlate,
                    activeColor: Colors.white,
                    activeTrackColor: Color(0xFFEE0F55),
                    onChanged: (value) {
                      setState(() {
                        isAlwaysOnPlate = value;
                      });
                    }),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: widget.isEditting
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                widget.isEditting
                    ? IconButton(
                        onPressed: () {
                          widget.removePlatePart(widget.platePart);
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 35,
                        ),
                      )
                    : Container(),
                GestureDetector(
                  onTap: () {
                    _addPlatePart();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
