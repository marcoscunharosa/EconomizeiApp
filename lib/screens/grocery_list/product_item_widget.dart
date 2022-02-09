import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/product_shop.dart';
import 'package:economizei_app/models/meal_type.dart';
import 'package:flutter/material.dart';

import 'item_parameters.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductShop product;
  final Function selectItem;
  const ProductItemWidget(
      {Key? key, required this.product, required this.selectItem})
      : super(key: key);

  @override
  _ProductItemWidgetState createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFFFFF),
      elevation: 0,
      child: CheckboxListTile(
        activeColor: const Color(0xFF0FB8EE),
        title: Row(
          children: [
            Container(
              width: 100,
              child: Text(widget.product.product.name),
            ),
          ],
        ),
        subtitle: Container(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: widget.product.meals
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
          product: widget.product,
        ),
        value: widget.product.get,
        onChanged: (bool? value) {
          setState(() {
            widget.selectItem(widget.product);
          });
        },
      ),
    );
  }
}
