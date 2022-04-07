import 'package:economizei_app/models/recipe.dart';
import 'package:economizei_app/repository/unity_of_plate_part.dart';

class PlatePart {
  Recipe recipe;
  double amount;
  UnityOfPlatePart unity;
  bool canBeReplaced, isAlwaysOnPlate;

  PlatePart(
      {required this.recipe,
      required this.amount,
      required this.unity,
      required this.canBeReplaced,
      required this.isAlwaysOnPlate});

  String get unityString{
    if(amount > 1){
      return unity.plural;
    }
    return unity.singular;
  }
}
