import 'package:economizei_app/controllers/grocery_list_constructor.dart';
import 'package:economizei_app/screens/grocery_list/price_bottom_bar.dart';
import 'package:economizei_app/service/user_service.dart';

import '../../models/unit_type.dart';
import '../../models/product_category_list.dart';
import '../../models/meal_type.dart';
import '../../models/product_shop.dart';
import '../../repository/products_repository.dart';
import '../../screens/grocery_list/grocery_categories.dart';
import '../../widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  List<ProductCategoryList> items = GroceryListConstructor.getProductCategoryList(
    UserService.getInstance()!.userAccount!.userMealMenu!);
  //[
  //   ProductCategoryList(
  //     category: ProductsRepository.getRepository()!.allProducts[0].productType,
  //     products: [
  //       ProductShop(
  //           product: ProductsRepository.getRepository()!.allProducts[0],
  //           amount: 1,
  //           get: false,
  //           meals: [
  //             MealType.breakfast,
  //             MealType.dinner,
  //           ],
  //           unit: UnitType.unidade),
  //     ],
  //   ),
  //   ProductCategoryList(
  //     category: ProductsRepository.getRepository()!.allProducts[1].productType,
  //     products: [
  //       ProductShop(
  //           product: ProductsRepository.getRepository()!.allProducts[1],
  //           amount: 100,
  //           get: false,
  //           meals: [MealType.dinner],
  //           unit: UnitType.grama),
  //       ProductShop(
  //           product: ProductsRepository.getRepository()!.allProducts[3],
  //           amount: 200,
  //           get: false,
  //           meals: [
  //             MealType.lunch,
  //             MealType.betweenMeals,
  //           ],
  //           unit: UnitType.grama),
  //     ],
  //   ),
  //   ProductCategoryList(
  //     category: ProductsRepository.getRepository()!.allProducts[2].productType,
  //     products: [
  //       ProductShop(
  //           product: ProductsRepository.getRepository()!.allProducts[2],
  //           amount: 3,
  //           get: false,
  //           meals: [
  //             MealType.betweenMeals,
  //             MealType.dinner,
  //           ],
  //           unit: UnitType.kilograma),
  //     ],
  //   ),
  // ];

  double totalValue = 0;
  double getPrice() {
    return totalValue;
  }

  void changeTotalValue(double addValue) {
    setState(() {
      print("entrando aqui: " + addValue.toString());
      totalValue += addValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Pesquisa"),
          ),
          body: GroceryCategories(
            items: items,
            changeTotalValue: changeTotalValue,
          ),
          bottomNavigationBar: PriceBottomBar(price: totalValue),
        ),
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        child: const FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 10,
          onPressed: null,
          disabledElevation: 0,
          child: Icon(
            Icons.check_rounded,
            color: Color(0xFF32CD32),
            size: 35,
          ),
        ),
      ),
    );
  }
}
