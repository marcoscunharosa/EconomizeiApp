import 'package:economizei_app/models/food.dart';
import 'package:economizei_app/models/foods_per_day.dart';
import 'package:economizei_app/models/meal_menu.dart';
import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/product_type.dart';

class GroceryListConstructor{

  static Map<ProductType, List<Product>> getProductShopByType(MealMenu mealMenu){
    Map<ProductType, List<Product>> productShopByType = {};
    for (var productType in ProductType.values){
      productShopByType[productType] = [];
    }

    for(var foodsPerDay in mealMenu.foodsPerDayList){
      _addIngredients(productShopByType, foodsPerDay.foodList);
    }
    return productShopByType;
  }

  static void _addIngredients(Map<ProductType, List<Product>> productShopByType, List<Food> foods){
    for(var food in foods){
      var ingredients = food.recipe.ingredients;
      for(var ingredient in ingredients){
        var product = ingredient.product;
        if (!productShopByType[product.productType]!.contains(product)){
          productShopByType[product.productType]!.add(product);
        }
      }

    }
  }
}