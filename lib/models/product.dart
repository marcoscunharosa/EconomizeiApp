import 'package:economizei_app/models/eatable.dart';

import './product_type.dart';
class Product extends Eatable{
  final String nameId;
  final String name;
  final ProductType productType;

  Product({required this.nameId, required this.name, required this.productType});

  @override
  String getName() {
    return name;
  }
}