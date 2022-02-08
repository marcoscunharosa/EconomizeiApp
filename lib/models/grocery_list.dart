import './product_shop.dart';
import './product_type.dart';

class GroceryList {
  ProductType category;
  List<ProductShop> products;
  int totalSelected = 0;
  bool allSelected = false;

  GroceryList({required this.category, required this.products});
}
