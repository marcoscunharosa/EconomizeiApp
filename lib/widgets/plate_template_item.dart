import 'package:economizei_app/models/plate_template.dart';
import 'package:economizei_app/screens/plates/plate_template_entries.dart';
import 'package:economizei_app/screens/plates/plate_template_page.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../models/meal_type.dart';

class PlateTemplateItem extends StatefulWidget {
  final PlateTemplate plateTemplate;
  final Meal meal;
  final Function openPlateTemplateEditor, deletePlateTemplate;
  final int index;
  const PlateTemplateItem(
      {Key? key,
      required this.index,
      required this.plateTemplate,
      required this.deletePlateTemplate,
      required this.meal,
      required this.openPlateTemplateEditor})
      : super(key: key);

  @override
  State<PlateTemplateItem> createState() => _PlateTemplateItemState();
}

class _PlateTemplateItemState extends State<PlateTemplateItem> {
  String _getIngredientsNames() {
    String names = "";
    for (var platePart in widget.plateTemplate.plateParts) {
      names += platePart.recipe.name + ", ";
    }
    if (names.length > 2) {
      names = names.substring(0, names.length - 2);
    }

    return names;
  }

  

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.index.toString()),
      background: Container(
        color: const Color(0xFF03031B),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        child:  ImageIcon(
          AssetImage('assets/images/deleteicon.png'),
          size: 30,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {

          widget.deletePlateTemplate(widget.plateTemplate);
        }
      },
      direction: DismissDirection.endToStart,
      child: GestureDetector(
        onTap: () {
          widget.openPlateTemplateEditor(widget.plateTemplate, context);
        },
        child: Card(
          margin: EdgeInsets.only(bottom: 5),
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(16),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: widget.meal.type.color['primary'],
                shape: BoxShape.circle,
              ),
              child: ImageIcon(
                widget.meal.type.icon,
                color: Colors.white,
              ),
            ),
            SizedBox(
              //width: double.infinity,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.plateTemplate.name == "" || widget.plateTemplate.name == null
                        ? 'Prato sem nome'
                        : widget.plateTemplate.name!,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    _getIngredientsNames(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
