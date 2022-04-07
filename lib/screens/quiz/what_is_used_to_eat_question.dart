import 'package:economizei_app/models/meal.dart';
import '../../models/chosable_item.dart';
import '../../models/meal_type.dart';
import 'package:flutter/material.dart';
import '../../repository/recipes_repository.dart';
import 'multiselect_chip.dart';

class WhatIsUsedToEatQuestion extends StatefulWidget {
  final Meal meal;
  const WhatIsUsedToEatQuestion({Key? key, required this.meal})
      : super(key: key);

  @override
  State<WhatIsUsedToEatQuestion> createState() =>
      _WhatIsUsedToEatQuestionState();
}

class _WhatIsUsedToEatQuestionState extends State<WhatIsUsedToEatQuestion> {
  Widget eatableSelection(Meal meal) {
    List<ChosableItem> recipes = [];
    recipes.addAll(
        RecipesRepository.getRepository()!.getRecipesLikelyMeals(meal.type));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(child: MultiSelectChip(recipes, meal.itemsUserLikes ,meal.type)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mainColor = widget.meal.type.color['primary'];
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Text(
              widget.meal.name,
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ImageIcon(
              widget.meal.type.icon,
              color: mainColor,
              size: 24,
            )
          ],
        ),
        Expanded(child: eatableSelection(widget.meal)),
      ],
    );
  }
}
