import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/unity_type.dart';
import './product.dart';

class Ingredient {
  double quantity;
  UnityType unity;
  Product product;
  String description;

  Ingredient({
    required this.quantity, required this.unity, required this.product, required this.description
  });
}