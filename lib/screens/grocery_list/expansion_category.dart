import 'package:economizei_app/models/product_category_list.dart';
import 'package:economizei_app/models/product_shop.dart';
import 'package:economizei_app/screens/grocery_list/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:economizei_app/models/product_type.dart';
import 'package:economizei_app/models/meal_type.dart';
import '../../screens/grocery_list/item_parameters.dart';

class ExpansionCategory extends StatefulWidget {
  final ProductCategoryList category;
  final Function selectItem;
  ExpansionCategory(
      {Key? key, required this.category, required this.selectItem})
      : super(key: key);

  @override
  _ExpasionCategoryState createState() => _ExpasionCategoryState();
}

class _ExpasionCategoryState extends State<ExpansionCategory> {
  void selectProduct(ProductShop productShop) {
    widget.selectItem(widget.category, productShop);
  }

  void createProductWidgetList() {
    for (var product in widget.category.products) {
      productsWidget
          .add(ProductItemWidget(product: product, selectItem: selectProduct));
    }
  }

  List<ProductItemWidget> productsWidget = [];

  @override
  @protected
  @mustCallSuper
  // ignore: must_call_super
  void initState() {
    createProductWidgetList();
  }

  @override
  Widget build(BuildContext context) {
    var category = widget.category;
    //print("to entranduuu" + category.isAllSelected().toString());
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            category.category.name,
            style: const TextStyle(
              color: Color(0xFF0FB8EE),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          collapsedBackgroundColor: const Color(0xFFFFFFFF),
          // collapsedTextColor: category.allSelected
          //     ? const Color(0xFFFFFFFF)
          //     : const Color(0xFF0FB8EE),
          // textColor: category.allSelected
          //     ? const Color(0xFFFFFFFF)
          //     : const Color(0xFF0FB8EE),
          // collapsedIconColor: category.allSelected
          //     ? const Color(0xFFFFFFFF)
          //     : const Color(0xFF000000),
          // iconColor: category.allSelected
          //     ? const Color(0xFFFFFFFF)
          //     : const Color(0xFF0FB8EE),
          // collapsedBackgroundColor: category.allSelected
          //     ? const Color(0xFF0FB8EE)
          //     : const Color(0xFFFFFFFF),
          // backgroundColor: category.allSelected
          //     ? const Color(0xFF0FB8EE)
          //     : const Color(0xFFFFFFFF),
          children: productsWidget,
        ),
        //       const Divider(
        //   thickness: 1.5,
        // )
      ],
    );
  }
}
