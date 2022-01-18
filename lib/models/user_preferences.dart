import 'package:economizei_app/models/meal.dart';

import './meal.dart';
import './product.dart';

class UserPreferences {
  List<Meal> meals;
  int? eaters = 0;
  Map<String, List<Product>> eatAt = {};
  //List<Recipe> dontEatRecipe;
  List<Product> dontEatProduct = [];

  UserPreferences({
    required this.meals,
    this.eaters,
    //required this.dontEatRecipe,
  });

  void setEatersNumber(int num) {
    eaters = num;
    createEatAt();
  }

  void createEatAt() {
    for (var i = 0; i < meals.length; i++) {
      eatAt[meals[i].name] = [];
    }
  }

  void addEatAtProducts(int mealIndex, List<Product> products) {
    eatAt[meals[mealIndex].name] = products;
  }

  void addDontEatProduct(List<Product> products) {
    dontEatProduct = products;
    for (var i = 0; i < dontEatProduct.length; i++) {
      print(dontEatProduct[i].name);
    }
  }
}
