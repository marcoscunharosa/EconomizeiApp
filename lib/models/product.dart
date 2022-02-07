import 'package:economizei_app/models/eatable.dart';
import 'package:economizei_app/models/recipe.dart';

import './product_type.dart';
class Product extends Eatable{
  final String nameId;
  final String name;
  final ProductType productType;
  late Recipe recipe;

  Product({required this.nameId, required this.name, required this.productType}){
    recipe = Recipe(name: name, nameId: nameId + "_product", servings: 1);
  }

  @override
  String getName() {
    return name;
  }

  @override
  Recipe getRecipe(){
    return recipe;
  }
}