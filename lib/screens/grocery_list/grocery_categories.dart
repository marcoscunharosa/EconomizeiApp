import '../../models/amount_type.dart';
import '../../models/grocery_list.dart';
import '../../models/meal_type.dart';
import '../../models/product_shop.dart';
import '../../screens/grocery_list/item_parameters.dart';
import 'package:flutter/material.dart';

class GroceryCategories extends StatefulWidget {
  //Map<ProductType, List<ProductShop>> items;
  List<GroceryList> items;
  Function changeTotalValue;

  GroceryCategories({
    required this.items,
    required this.changeTotalValue,
  });

  @override
  _GroceryCategoriesState createState() => _GroceryCategoriesState();
}

class _GroceryCategoriesState extends State<GroceryCategories> {
  String dropdownValue = AmountType.grama.title;
  bool allSelected = false;

  void selectItem(GroceryList category, ProductShop product) {
    setState(() {
      product.get = !product.get;
      if (product.get) {
        widget.changeTotalValue(product.value);
        category.totalSelected += 1;
      } else {
        widget.changeTotalValue(-product.value);
        category.totalSelected -= 1;
      }
      category.allSelected = category.totalSelected == category.products.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.items.map((category) {
        return ExpansionTile(
          title: Text(category.category.name),
          collapsedTextColor:
              category.allSelected ? const Color(0xFFFFFFFF) : const Color(0xFF0FB8EE),
          textColor: category.allSelected ? const Color(0xFFFFFFFF) : const Color(0xFF0FB8EE),
          collapsedIconColor:
              category.allSelected ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
          iconColor:
              category.allSelected ? const Color(0xFFFFFFFF) : const Color(0xFF0FB8EE),
          collapsedBackgroundColor:
              category.allSelected ? const Color(0xFF0FB8EE) : const Color(0xFFFFFFFF),
          backgroundColor:
              category.allSelected ? const Color(0xFF0FB8EE) : const Color(0xFFFFFFFF),
          children: category.products.map((product) {
            return Card(
              color: const Color(0xFFFFFFFF),
              elevation: 0,
              child: CheckboxListTile(
                activeColor: const Color(0xFF0FB8EE),
                title: Row(
                  children: [
                    Container(
                      width: 110,
                      child: Text(product.product.name),
                    ),
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: product.meals
                        .map(
                          (meal) => ImageIcon(
                            meal.icon,
                            size: 20,
                            color: meal.color['primary'],
                          ),
                        )
                        .toList(),
                  ),
                ),
                secondary: ItemParameters(
                  product: product,
                ),
                value: product.get,
                onChanged: (bool? value) {
                  selectItem(category, product);
                },
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
