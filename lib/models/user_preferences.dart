import './meal.dart';
import './recipe.dart';
import './product.dart';

class UserPreferences {
  List<Meal> meals;
  int? eaters = 0;
  Map<Meal, List<Recipe>> eatAt = {};
  List<Product> dontEat = [];

  UserPreferences({
    required this.meals,
    this.eaters,
  });

  void setEatersNumber(int num) {
    eaters = num;
    createEatAt();
  }

  void createEatAt() {
    for (var i = 0; i < meals.length; i++) {
      eatAt[meals[i]] = [];
    }
  }

  void addEatAt(int mealIndex, List<Recipe> eatable) {
    eatAt[meals[mealIndex]] = eatable;
  }

  void addDontEat(List<Product> products) {
    dontEat = products;
  }
}
