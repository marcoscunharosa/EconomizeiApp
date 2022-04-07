import 'package:economizei_app/models/food.dart';
import 'package:economizei_app/models/foods_per_day.dart';
import 'package:economizei_app/models/meal_menu.dart';
import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/product_category_list.dart';
import 'package:economizei_app/models/product_shop.dart';
import 'package:economizei_app/models/product_type.dart';
import 'package:economizei_app/models/unit_type.dart';

class GroceryListConstructor {
  static Map<ProductType, List<Product>> _productsByType = {};
  static Map<Product, ProductShop> _productShopByProduct = {};

  static List<ProductCategoryList> getProductCategoryList(MealMenu mealMenu) {
    _productsByType = {};
    _productShopByProduct = {};

    List<ProductCategoryList> items = [];
    _saveProductShopByType(mealMenu);

    for (var productType in _productsByType.keys) {
      List<ProductShop> productsShop = [];
      for (var product in _productsByType[productType]!) {
        productsShop.add(_productShopByProduct[product]!);
      }
      items.add(
          ProductCategoryList(category: productType, products: productsShop));
    }
    items.sort((a, b) {
      return a.category.name.compareTo(b.category.name);
    });
    return items;
  }

  static void _saveProductShopByType(MealMenu mealMenu) {
    for (var foodsPerDay in mealMenu.foodsPerDayList) {
      _addIngredients(foodsPerDay.foodList);
    }
  }

  static void _addIngredients(List<Food> foods) {
    for (var food in foods) {
      for (var platePart in food.plate.plateParts) {
        var ingredients = platePart.recipe.ingredients;
        for (var ingredient in ingredients) {
          var product = ingredient.product;
          if (_productsByType[product.productType] == null) {
            _productsByType[product.productType] = [product];
          } else if (!_productsByType[product.productType]!.contains(product)) {
            _productsByType[product.productType]!.add(product);
          }
          if (_productShopByProduct[product] == null) {
            _productShopByProduct[product] = ProductShop(
                product: product,
                get: false,
                amount: ingredient.quantity,
                unit: UnitType.grama,
                meals: [food.meal.type]);
          } else {
            ProductShop productShop = _productShopByProduct[product]!;
            productShop.amount += ingredient.quantity;
            if (!productShop.meals.contains(food.meal.type)) {
              productShop.meals.add(food.meal.type);
            }
          }
        }
      }
    }
  }

  static void addSingleIngredient(Product product) {
    _productShopByProduct[product] = ProductShop(
        product: product,
        get: false,
        amount: 0,
        unit: UnitType.grama,
        meals: []);
  }
}
