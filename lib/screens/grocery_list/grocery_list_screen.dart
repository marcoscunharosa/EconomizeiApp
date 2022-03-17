import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/product_shop.dart';
import 'package:economizei_app/models/product_type.dart';
import 'package:economizei_app/models/unit_type.dart';

import '../../controllers/grocery_list_constructor.dart';
import 'price_bottom_bar.dart';
import 'search_bar.dart';
import '../../service/user_service.dart';

import '../../models/product_category_list.dart';
import '../../screens/grocery_list/grocery_categories.dart';
import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  List<ProductCategoryList> items = [];
  // GroceryListConstructor.getProductCategoryList(
  //     UserService.getInstance()!.userAccount!.userMealMenu!);
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

  List<Product> addItems1 = [];
  // void addSelectItems(List<Product> addItems) {
  //   setState(() {
  //     items.add(
  //       ProductCategoryList(
  //         category: addItems.last.productType,
  //         products: [
  //           ProductShop(
  //             product: addItems[addItems.length - 1],
  //             amount: 1,
  //             get: false,
  //             meals: [],
  //             unit: UnitType.unidade,
  //           )
  //         ],
  //       ),
  //     );
  //   });
  // }
  ProductCategoryList? findCategory(ProductType productType) {
    ProductCategoryList? category = null;
    for (ProductCategoryList element in items) {
      if (element.category == productType) {
        category = element;
      }
    }
    return category;
  }

  void addSelectItems(Product item) {
    var category = findCategory(item.productType);
    if (category == null) {
      setState(() {
        items.add(
          ProductCategoryList(
            category: item.productType,
            products: [
              ProductShop(
                product: item,
                amount: 1,
                get: false,
                meals: [],
                unit: UnitType.unidade,
              )
            ],
          ),
        );
      });
    } else {
      setState(() {
        category.products.add(ProductShop(
          product: item,
          amount: 1,
          get: false,
          meals: [],
          unit: UnitType.unidade,
        ));
      });
    }
  }

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
    var groceryList = UserService.getInstance()!.userAccount!.groceryList;
    if (groceryList == null) {
      UserService.getInstance()!.userAccount!.saveGroceryList(
          GroceryListConstructor.getProductCategoryList(
              UserService.getInstance()!.userAccount!.userMealMenu!));
    }
    items = UserService.getInstance()!.userAccount!.groceryList!.categories;
    //print("Carregando screengrocery");
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchBar(
                      selected: addItems1,
                      addItem: addSelectItems,
                    ),
                  ),
                );
              },
              child: const Text("Pesquisa",
                  style: TextStyle(fontSize: 20, color: Color(0XFFc2c2c2))),
            ),
            leading: IconButton(
              icon: Icon(Icons.search, color: Color(0xFF666666)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchBar(
                      selected: addItems1,
                      addItem: addSelectItems,
                    ),
                  ),
                );
              },
            ),
          ),
          body: GroceryCategories(
            items: items,
            changeTotalValue: changeTotalValue,
          ),
          bottomNavigationBar: PriceBottomBar(price: totalValue),
        ),
      ),
      floatingActionButton: Container(
        width: 50,
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
