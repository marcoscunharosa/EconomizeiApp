import 'package:economizei_app/repository/unity_of_plate_part.dart';
import 'package:economizei_app/screens/plates/add_plate_part_dialog.dart';
import 'package:economizei_app/widgets/plate_part_card.dart';
import 'package:flutter/material.dart';
import '../../models/plate_part.dart';
import '../../models/recipe.dart';

class PlatesTemplateList extends StatefulWidget {
  final List<PlatePart> plateParts;
  final Color mainColor;
  const PlatesTemplateList(
      {Key? key, required this.plateParts, this.mainColor = Colors.black})
      : super(key: key);

  @override
  State<PlatesTemplateList> createState() => _PlatesTemplateListState();
}

class _PlatesTemplateListState extends State<PlatesTemplateList> {
  void addPlatePart(PlatePart platePart, bool isEditing) {
    setState(() {
      if (!isEditing) {
        widget.plateParts.add(platePart);
      }
    });
  }

  void removePlatePart(PlatePart platePart) {
    setState(() {
      widget.plateParts.remove(platePart);
    });
    
  }

  void showPlatePartDialog(
      {required bool isEdditing, PlatePart? platePart}) async {
    platePart ??= PlatePart(
        amount: 1.0,
        recipe: Recipe(nameId: 'no-recipe', name: 'no-recipe', servings: 1),
        canBeReplaced: false,
        isAlwaysOnPlate: false,
        unity: AllPlatePartsUnity.getUnity('colher de servir'));
    return showDialog(
        context: context,
        builder: (BuildContext ct) {
          return Dialog(
            insetPadding: EdgeInsets.all(0.0),
            child: AddPlatePartDialog(
              platePart: platePart!,
              isEditting: isEdditing,
              addPlatePart: addPlatePart, removePlatePart: removePlatePart,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.plateParts.length,
              itemBuilder: (BuildContext ct, int index) {
                PlatePart platePart = widget.plateParts[index];
                return GestureDetector(
                  onTap: () {
                    showPlatePartDialog(isEdditing: true, platePart: platePart);
                  },
                  child: PlatePartCard(platePart: platePart, removePlatePart: removePlatePart,),
                );
              }),
          SizedBox(
            height: 72,
            child: GestureDetector(
              onTap: () {
                showPlatePartDialog(isEdditing: false);
              },
              child: Card(
                elevation: 4,
                color: Color(0xFFF8F8F8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: widget.mainColor,
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Adicionar parte',
                          style: TextStyle(
                              color: widget.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
