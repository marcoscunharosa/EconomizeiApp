import 'package:economizei_app/models/eatable.dart';
import 'package:economizei_app/screens/quiz/recipes_selection.dart';
import 'package:flutter/material.dart';

import '../../repository/recipes_repository.dart';
import '../../repository/products_repository.dart';
import '../../models/recipe.dart';
import '../../models/product.dart';
import '../../service/user_service.dart';

class EatableSelection extends StatefulWidget {
  int type;
  Function setInformation;
  Function clearInformation;
  int selected;
  List<Recipe> recipes;
  List<Product> products;

  EatableSelection({
    required this.type,
    required this.setInformation,
    required this.clearInformation,
    required this.selected,
    required this.recipes,
    required this.products,
  });

  @override
  State<EatableSelection> createState() => _EatableSelectionState();
}

class _EatableSelectionState extends State<EatableSelection> {
  List<Eatable> eatable = [];
  bool pressAttention = false;

  void productSelect(Product product) {
    widget.products.add(product);
    widget.selected += 1;
    if (widget.selected > 0) {
      widget.setInformation();
    }
  }

  void productUnselect(Product product) {
    widget.products.remove(product);
    widget.selected -= 1;
    if (widget.selected <= 0) {
      widget.clearInformation();
    }
  }

  void recipeSelect(Recipe recipe) {
    widget.recipes.add(recipe);
    widget.selected += 1;
    if (widget.selected > 0) {
      widget.setInformation();
    }
  }

  void recipeUnselect(Recipe recipe) {
    widget.recipes.remove(recipe);
    widget.selected -= 1;
    if (widget.selected <= 0) {
      widget.clearInformation();
    }
  }

  /*List<Widget> listEatable() {
    eatable.addAll(RecipesRepository.getRepository()!.allRecipes.map((recipe) {
      return Container(
        margin: const EdgeInsets.all(2),
        child: RaisedButton(
          child: Text(recipe.name),
          color: pressAttention
              ? UserService.getInstance()!
                  .questions[widget.type]
                  .color['primary']!
              : Color(0xFF959595),
          elevation: 0,
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          onPressed: () {
            setState(() {
              pressAttention = !pressAttention;
              print(pressAttention);
              if (pressAttention) {
                recipeSelect(recipe);
              } else {
                recipeUnselect(recipe);
              }
            });
          },
        ),
      );
    }).toList());
    eatable
        .addAll(ProductsRepository.getRepository()!.allProducts.map((product) {
      return Container(
        margin: const EdgeInsets.all(2),
        child: RaisedButton(
          child: Text(product.name),
          color: pressAttention
              ? UserService.getInstance()!
                  .questions[widget.type]
                  .color['primary']!
              : Color(0xFF959595),
          elevation: 0,
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          onPressed: () {
            setState(() {
              pressAttention = !pressAttention;
              if (pressAttention) {
                productSelect(product);
              } else {
                productUnselect(product);
              }
            });
          },
        ),
      );
    }).toList());
    return eatable;
  }*/

  Widget testando() {
    eatable.addAll(RecipesRepository.getRepository()!.allRecipes);
    eatable.addAll(ProductsRepository.getRepository()!.allProducts);
    return RecipesSelection(
      clearInformation: widget.clearInformation,
      recipes: widget.recipes,
      products: widget.products,
      selected: widget.selected,
      setInformation: widget.setInformation,
      type: widget.type,
      eatable: eatable,
    );
  }

  @override
  Widget build(BuildContext context) {
    /*return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 4,
      mainAxisSpacing: 5,*/
    /*children: RecipesRepository.getRepository()!
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
          .toList(),*/
    //children: listEatable(),
    //);

    return testando();
  }
}
