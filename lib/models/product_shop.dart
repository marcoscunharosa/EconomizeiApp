import 'unit_type.dart';
import './meal_type.dart';
import './product.dart';

class ProductShop {
  Product product;
  bool get;
  double amount;
  UnitType unit;
  List<MealType> meals;
  double value = 0;

  ProductShop({
    required this.product,
    required this.get,
    required this.amount,
    required this.unit,
    required this.meals,
  });

  void setValue(double newValue) {
    value = newValue;
  }
}