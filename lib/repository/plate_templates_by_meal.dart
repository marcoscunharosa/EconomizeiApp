import 'package:economizei_app/models/meal_type.dart';
import 'package:economizei_app/models/plate_template.dart';
import 'package:economizei_app/repository/recipes_repository.dart';
import 'package:economizei_app/repository/unity_of_plate_part.dart';

import '../models/plate_part.dart';

class PlateTemplateByMeal {
  static PlateTemplateByMeal? _instance;
  late Map<MealType, Function> _plateTemplateByMeal;
  PlateTemplateByMeal() {
    _plateTemplateByMeal = _createMap();
  }

  Map<MealType, Function> _createMap() {
    Map<MealType, Function> map = {};
    map[MealType.breakfast] = _getTemplateOfBreakfast;
    map[MealType.betweenMeals] = _getTemplateOfBetweenMeals;
    map[MealType.dinner] = _getTemplateOfLunch;
    map[MealType.lunch] = _getTemplateOfLunch;
    return map;
  }

  PlateTemplate _getTemplateOfBreakfast() {
    var plateTemplate = PlateTemplate(daysOfConsuming: [], name: '');
    plateTemplate.plateParts.add(
      PlatePart(
          recipe:
              RecipesRepository.getRepository()!.getRecipeById('ovos-mexidos')!,
          amount: 1 / 2,
          unity: AllPlatePartsUnity.getUnity('colher de servir'),
          canBeReplaced: true,
          isAlwaysOnPlate: true),
    );
    plateTemplate.plateParts.add(
      PlatePart(
          recipe: RecipesRepository.getRepository()!
              .getRecipeById('leite-com-chocolate')!,
          amount: 1,
          unity: AllPlatePartsUnity.getUnity('caneca'),
          canBeReplaced: true,
          isAlwaysOnPlate: false),
    );
    return plateTemplate;
  }

  PlateTemplate _getTemplateOfLunch() {
    var plateTemplate = PlateTemplate(daysOfConsuming: [], name: '');
    plateTemplate.plateParts.add(
      PlatePart(
          recipe:
              RecipesRepository.getRepository()!.getRecipeById('arroz-branco')!,
          amount: 2,
          unity: AllPlatePartsUnity.getUnity('colher de servir'),
          canBeReplaced: false,
          isAlwaysOnPlate: true),
    );
    plateTemplate.plateParts.add(
      PlatePart(
          recipe: RecipesRepository.getRepository()!.getRecipeById('feijao')!,
          amount: 1,
          unity: AllPlatePartsUnity.getUnity('concha'),
          canBeReplaced: false,
          isAlwaysOnPlate: true),
    );
    plateTemplate.plateParts.add(
      PlatePart(
          recipe: RecipesRepository.getRepository()!
              .getRecipeById('file-de-frango')!,
          amount: 2,
          unity: AllPlatePartsUnity.getUnity('fatia'),
          canBeReplaced: true,
          isAlwaysOnPlate: true),
    );
    plateTemplate.plateParts.add(
      PlatePart(
          recipe: RecipesRepository.getRepository()!
              .getRecipeById('salada-tradicional')!,
          amount: 1,
          unity: AllPlatePartsUnity.getUnity('unidade'),
          canBeReplaced: true,
          isAlwaysOnPlate: false),
    );
    return plateTemplate;
  }

  PlateTemplate _getTemplateOfBetweenMeals() {
    var plateTemplate = PlateTemplate(daysOfConsuming: [], name: '');
    plateTemplate.plateParts.add(
      PlatePart(
          recipe: RecipesRepository.getRepository()!
              .getRecipeById('bisnaga-com-mortadela')!,
          amount: 1,
          unity: AllPlatePartsUnity.getUnity('unidade'),
          canBeReplaced: false,
          isAlwaysOnPlate: true),
    );

    return plateTemplate;
  }

  static PlateTemplateByMeal get instance {
    _instance ??= PlateTemplateByMeal();
    return _instance!;
  }

  PlateTemplate getTemplate(MealType mealType) {
    return _plateTemplateByMeal[mealType]!();
  }
}
