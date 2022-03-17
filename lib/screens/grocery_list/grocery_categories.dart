import '../../models/unit_type.dart';
import '../../models/product_category_list.dart';
import '../../models/meal_type.dart';
import '../../models/product_shop.dart';
import '../../screens/grocery_list/item_parameters.dart';
import 'package:flutter/material.dart';
import 'package:economizei_app/models/product_type.dart';
import 'expansion_category.dart';

class GroceryCategories extends StatefulWidget {
  //Map<ProductType, List<ProductShop>> items;
  List<ProductCategoryList> items;
  Function changeTotalValue;

  GroceryCategories({
    required this.items,
    required this.changeTotalValue,
  });

  @override
  _GroceryCategoriesState createState() => _GroceryCategoriesState();
}

class _GroceryCategoriesState extends State<GroceryCategories> {
  String dropdownValue = UnitType.grama.title;
  bool allSelected = false;

  void selectItem(ProductCategoryList category, ProductShop product) {
    setState(() {
      product.get = !product.get;
      if (product.get) {
        widget.changeTotalValue(product.value);
      } else {
        widget.changeTotalValue(-product.value);
      }
    });
  }

  void deleteCategory(ProductCategoryList category) {
    setState(() {
      widget.items.remove(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return ExpansionCategory(
          category: widget.items[index],
          selectItem: selectItem,
          deleteCategory: deleteCategory,
        );
      },
    );
  }
}
