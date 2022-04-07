import 'package:economizei_app/models/plate_template.dart';
import 'package:economizei_app/widgets/plate_template_item.dart';
import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../../models/meal_type.dart';
import '../plates/plate_template_page.dart';

class PlateTemplateList extends StatefulWidget {
  final List<PlateTemplate> plateTemplates;
  final Function addPlateTemplate;
  final Meal meal;
  const PlateTemplateList(
      {Key? key,
      required this.plateTemplates,
      required this.meal,
      required this.addPlateTemplate})
      : super(key: key);

  @override
  State<PlateTemplateList> createState() => _PlateTemplateListState();
}

class _PlateTemplateListState extends State<PlateTemplateList> {
  void deletePlateTemplate(PlateTemplate plateTemplate) {
    setState(() {
      widget.plateTemplates.remove(plateTemplate);
    });
  }

  void openPlateTemplateEditor(
      PlateTemplate plateTemplate, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Material(
          child: PlateTemplatePage(
            plateTemplate: plateTemplate,
            meal: widget.meal,
            isEditing: true,
            addPlateTemplate: widget.addPlateTemplate, removePlateTemplate: deletePlateTemplate,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.plateTemplates.length,
        itemBuilder: ((context, index) {
          return PlateTemplateItem(
            index: index,
            plateTemplate: widget.plateTemplates[index],
            meal: widget.meal,
            openPlateTemplateEditor: openPlateTemplateEditor, deletePlateTemplate: deletePlateTemplate,
          );
        }),
      ),
    );
  }
}
