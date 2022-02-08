import '../../models/amount_type.dart';
import '../../models/grocery_list.dart';
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
  List<GroceryList> items = [
    GroceryList(
      category: ProductsRepository.getRepository()!.allProducts[0].productType,
      products: [
        ProductShop(
            product: ProductsRepository.getRepository()!.allProducts[0],
            amount: 1,
            get: false,
            meals: [
              MealType.breakfast,
              MealType.dinner,
            ],
            unit: AmountType.unidade),
      ],
    ),
    GroceryList(
      category: ProductsRepository.getRepository()!.allProducts[1].productType,
      products: [
        ProductShop(
            product: ProductsRepository.getRepository()!.allProducts[1],
            amount: 100,
            get: false,
            meals: [MealType.dinner],
            unit: AmountType.grama),
        ProductShop(
            product: ProductsRepository.getRepository()!.allProducts[3],
            amount: 200,
            get: false,
            meals: [
              MealType.lunch,
              MealType.betweenMeals,
            ],
            unit: AmountType.grama),
      ],
    ),
    GroceryList(
      category: ProductsRepository.getRepository()!.allProducts[2].productType,
      products: [
        ProductShop(
            product: ProductsRepository.getRepository()!.allProducts[2],
            amount: 3,
            get: false,
            meals: [
              MealType.betweenMeals,
              MealType.dinner,
            ],
            unit: AmountType.kilograma),
      ],
    ),
  ];

  double totalValue = 0;

  void changeTotalValue(double addValue) {
    setState(() {
      totalValue += addValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const Card(
                child: Text("Pesquisa"),
              ),
              GroceryCategories(
                items: items,
                changeTotalValue: changeTotalValue,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: const Color(0xFF32CD32),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Preço\nestimado:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text(
                      "R\$ ${totalValue.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: null,
        disabledElevation: 0,
        child: Icon(
          Icons.check_rounded,
          color: Color(0xFF32CD32),
          size: 52,
        ),
      ),
    );
  }
}
