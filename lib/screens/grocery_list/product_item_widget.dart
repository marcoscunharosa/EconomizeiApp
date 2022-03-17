import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/product_shop.dart';
import 'package:economizei_app/models/meal_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'item_parameters.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductShop product;
  final Function selectItem;
  final Function deleteItem;
  const ProductItemWidget(
      {Key? key,
      required this.product,
      required this.selectItem,
      required this.deleteItem})
      : super(key: key);

  @override
  _ProductItemWidgetState createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.product.product.nameId),
      background: Container(
        color: const Color(0xFF03031B),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        child:  ImageIcon(
          AssetImage('assets/images/deleteicon.png'),
          size: 30,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        print(direction);
        if (direction == DismissDirection.endToStart) {
          widget.deleteItem(widget.product);
        }
      },
      direction: DismissDirection.endToStart,
      child: Card(
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
            child: widget.product.meals.length > 0
                ? Row(
                    children: widget.product.meals
                        .map(
                          (meal) => ImageIcon(
                            meal.icon,
                            size: 20,
                            color: meal.color['primary'],
                          ),
                        )
                        .toList(),
                  )
                : Container(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      size: 20,
                      color: Colors.grey[400],
                    )),
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
      ),
    );
  }
}
