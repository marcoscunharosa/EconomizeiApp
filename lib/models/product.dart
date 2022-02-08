import 'package:economizei_app/models/recipe.dart';

import './product_type.dart';
import 'chosable_item.dart';

class Product implements ChosableItem{
  final String nameId;
  final String name;
  final ProductType productType;

  Product({required this.nameId, required this.name, required this.productType});

  @override
  String getName() {
    return name;
  }

  @override
  void choose(List<ChosableItem> list){
    list.add(this);
  }
}