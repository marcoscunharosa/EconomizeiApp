import './product_type.dart';
class Product{
  final String nameId;
  final String name;
  final ProductType productType;

  Product({required this.nameId, required this.name, required this.productType});
}