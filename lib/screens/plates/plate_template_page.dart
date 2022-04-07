import 'package:economizei_app/models/meal.dart';
import 'package:economizei_app/models/meal_type.dart';
import 'package:economizei_app/models/plate_template.dart';
import 'package:economizei_app/screens/plates/plate_template_entries.dart';
import 'package:flutter/material.dart';

class PlateTemplatePage extends StatefulWidget {
  final PlateTemplate plateTemplate;
  final Meal meal;
  final bool isEditing;
  final Function addPlateTemplate, removePlateTemplate;
  const PlateTemplatePage(
      {Key? key,
      required this.plateTemplate,
      required this.meal,
      required this.isEditing,
      required this.addPlateTemplate,
      required this.removePlateTemplate})
      : super(key: key);

  @override
  State<PlateTemplatePage> createState() => _PlateTemplatePageState();
}

class _PlateTemplatePageState extends State<PlateTemplatePage> {
  @override
  Widget build(BuildContext context) {
    var mainColor = widget.meal.type.color['primary'];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.isEditing ? 'Editar prato' : 'Criar novo prato',
            style: const TextStyle(
                color: const Color(0xFFEE0F55), letterSpacing: 1.5),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: const Color(0xFFEE0F55),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CreatePlateScreen(
                plateTemplate: widget.plateTemplate,
                meal: widget.meal,
                isEditting: widget.isEditing,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: widget.isEditing ?() {
                        widget.removePlateTemplate(widget.plateTemplate);
                        Navigator.pop(context);
                      }:null,
                      child: ImageIcon(
                        AssetImage('assets/images/deleteicon.png'),
                        color: Colors.white,
                        size: 24,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(18),
                          minimumSize: const Size(10, 10),
                          primary: mainColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      
                      onPressed: () {
                        widget.addPlateTemplate(
                            widget.plateTemplate, widget.isEditing);
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(18),
                          minimumSize: const Size(10, 10),
                          primary: mainColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
