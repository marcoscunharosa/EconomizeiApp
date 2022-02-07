import './meal.dart';
import './eatable.dart';

class UserPreferences {
  List<Meal> meals;
  int? eaters = 0;
  Map<Meal, List<Eatable>> eatAt = {};
  List<Eatable> dontEat = [];

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

  void addEatAt(int mealIndex, List<Eatable> eatable) {
    eatAt[meals[mealIndex]] = eatable;
  }

  void addDontEat(List<Eatable> eatable) {
    dontEat = eatable;
  }
}
