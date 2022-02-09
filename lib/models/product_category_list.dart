import './product_shop.dart';
import './product_type.dart';

class ProductCategoryList {
  ProductType category;
  List<ProductShop> products;

  ProductCategoryList({required this.category, required this.products});

  bool isAllSelected(){
    for( var product in products){
      if( !product.get){
        return false;
      }
    }
    return true;
  }
}
