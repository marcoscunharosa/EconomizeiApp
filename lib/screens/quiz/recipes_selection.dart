import 'package:flutter/material.dart';

import '../../repository/recipes_repository.dart';
import '../../models/recipe.dart';
import './selection_recipe_button.dart';
import '../../service/user_service.dart';

class RecipesSelection extends StatelessWidget {
  int type;
  Function setInformation;
  Function clearInformation;
  int selected;
  List<Recipe> recipes;

  RecipesSelection({
    required this.type,
    required this.setInformation,
    required this.clearInformation,
    required this.selected,
    required this.recipes,
  });  

  void recipeSelect(Recipe recipe) {
    recipes.add(recipe);
    selected += 1;
    if (selected > 0) {
      setInformation();
    }
  }

  void recipeUnselect(Recipe recipe) {
    recipes.remove(recipe);
    selected -= 1;
    if (selected <= 0) {
      clearInformation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 4,
      mainAxisSpacing: 5,
      children: RecipesRepository.getRepository()!
          .allRecipes
          .map(
            (recipe) => SelectionRecipeButton(
              unselectedColor: Color(0xFF959595),
              selectedColor:
                  UserService.getInstance()!.questions[type].color['primary']!,
              insideText: recipe.name,
              activatedFunction: recipeSelect,
              deactivatedFunction: recipeUnselect,
              recipe: recipe,
            ),
          )
          .toList(),
    );
  }
}
