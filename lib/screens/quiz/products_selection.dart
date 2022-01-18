import 'package:flutter/material.dart';

import '../../repository/products_repository.dart';
import '../../models/product.dart';
import '../../widgets/selection_button.dart';
import '../../service/user_service.dart';

class ProductsSelection extends StatelessWidget {
  int type;
  Function setInformation;
  Function clearInformation;
  int selected;
  List<Product> products;

  ProductsSelection({
    required this.type,
    required this.setInformation,
    required this.clearInformation,
    required this.selected,
    required this.products,
  });  

  void productSelect(Product product) {
    products.add(product);
    selected += 1;
    if (selected > 0) {
      setInformation();
    }
  }

  void productUnselect(Product product) {
    products.remove(product);
    selected -= 1;
    if (selected <= 0) {
      clearInformation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 4,
      mainAxisSpacing: 5,
      children: ProductsRepository.getRepository()!
          .allProducts
          .map(
            (product) => SelectionButton(
              unselectedColor: Color(0xFF959595),
              selectedColor:
                  UserService.getInstance()!.questions[type].color['primary']!,
              insideText: product.name,
              activatedFunction: productSelect,
              deactivatedFunction: productUnselect,
              product: product,
            ),
          )
          .toList(),
    );
  }
}
