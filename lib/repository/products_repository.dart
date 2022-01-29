import 'dart:collection';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/product_type.dart';

class ProductsRepository {
  static ProductsRepository? repository;
  late final List<Map<String, String>> _itemsTable;
  late final HashMap<String, Product> _items;
  late final List<Product> allProducts;
  static ProductsRepository? getRepository() {
    repository ??= ProductsRepository();
    return repository;
  }

  void createTable() {
    this._itemsTable = [
      {"name-id": "agua", "name": "Água", "grossery-category": "bebidas"},
      {
        "name-id": "acucar",
        "name": "Açúcar",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "cafe-em-po",
        "name": "Café em pó",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "filtro-de-papel",
        "name": "Filtro de papel",
        "grossery-category": "utensilios"
      },
      {
        "name-id": "pao-de-forma",
        "name": "Pão de forma",
        "grossery-category": "panificacao"
      },
      {
        "name-id": "requeijao",
        "name": "Requeijão",
        "grossery-category": "laticinio"
      },
      {"name-id": "maca", "name": "Maçã", "grossery-category": "hortifruti"},
      {
        "name-id": "arroz",
        "name": "Arroz branco",
        "grossery-category": "graos"
      },
      {"name-id": "alho", "name": "Alho", "grossery-category": "hortifruti"},
      {
        "name-id": "oleo",
        "name": "Óleo de soja",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "carne-boi",
        "name": "Carne bovina",
        "grossery-category": "proteinas"
      },
      {
        "name-id": "azeite",
        "name": "Azeite de oliva",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "queijo-mussarela",
        "name": "Queijo mussarela",
        "grossery-category": "laticinio"
      },
      {
        "name-id": "presunto",
        "name": "Presunto",
        "grossery-category": "proteinas"
      },
      {
        "name-id": "manteiga",
        "name": "Manteiga",
        "grossery-category": "laticinio"
      },
      {
        "name-id": "cebola",
        "name": "Cebola",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "azeitona",
        "name": "Azeitona",
        "grossery-category": "enlatados"
      },
      {
        "name-id": "molho-tomate",
        "name": "Molho de tomate",
        "grossery-category": "molhos"
      },
      {
        "name-id": "caldo-de-carne",
        "name": "Caldo de carne",
        "grossery-category": "temperos"
      },
      {
        "name-id": "cenoura",
        "name": "Cenoura",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "tomate",
        "name": "Tomate",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "macarrao",
        "name": "Macarrão",
        "grossery-category": "massas"
      },
      {
        "name-id": "carne-moida",
        "name": "Carne moída",
        "grossery-category": "proteinas"
      },
      {
        "name-id": "mortadela",
        "name": "Mortadela",
        "grossery-category": "proteinas"
      },
      {
        "name-id": "bisnaga",
        "name": "Bisnaga",
        "grossery-category": "panificacao"
      },
      {"name-id": "ovos", "name": "Ovos", "grossery-category": "ingredientes"},
      {
        "name-id": "farinha-trigo",
        "name": "Farinha de trigo",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "laranja",
        "name": "Laranja",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "fermento-quimico",
        "name": "Fermento químico",
        "grossery-category": "ingredientes"
      },
      {"name-id": "pernil", "name": "Pernil", "grossery-category": "proteinas"},
      {
        "name-id": "vinagre-branco",
        "name": "Vinagre branco",
        "grossery-category": "temperos"
      },
      {
        "name-id": "pimentao-verde",
        "name": "Pimentão verde",
        "grossery-category": "hortifruti"
      },
      {"name-id": "limao", "name": "Limão", "grossery-category": "hortifruti"},
      {
        "name-id": "batata",
        "name": "Batata",
        "grossery-category": "hortifruti"
      },
      {"name-id": "leite", "name": "Leite", "grossery-category": "laticinio"},
      {"name-id": "queijo", "name": "Queijo", "grossery-category": "laticinio"},
      {
        "name-id": "cheiro-verde",
        "name": "Cheiro verde",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "bacalhau",
        "name": "Bacalhau",
        "grossery-category": "proteinas"
      },
      {
        "name-id": "pimentao-vermelho",
        "name": "Pimentão vermelho",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "extrato-tomate",
        "name": "Extrato de tomate",
        "grossery-category": "molhos"
      },
      {
        "name-id": "leite-coco",
        "name": "Leite de coco",
        "grossery-category": "laticinio"
      },
      {
        "name-id": "coentro",
        "name": "Coentro",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "achocolatado",
        "name": "Achocolatado",
        "grossery-category": "doces"
      },
      {
        "name-id": "peito-frango",
        "name": "Peito de frango",
        "grossery-category": "proteinas"
      },
      {
        "name-id": "sal",
        "name": "Sal",
        "grossery-category": "temperos",
      },
      {
        "name-id": "pimenta",
        "name": "Pimenta",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "maionese",
        "name": "Maionese",
        "grossery-category": "laticinio"
      },
      {
        "name-id": "ketchup",
        "name": "Ketchup",
        "grossery-category": "temperos",
      },
      {
        "name-id": "mostarda",
        "name": "Mostarda",
        "grossery-category": "temperos"
      },
      {
        "name-id": "cogumelo",
        "name": "Cogumelo",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "creme-de-leite",
        "name": "Creme de Leite",
        "grossery-category": "laticinio"
      },
      {
        "name-id": "batata-palha",
        "name": "Batata Palha",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "açucar",
        "name": "Açúcar",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "feijao",
        "name": "Feijão",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "pimenta-branca",
        "name": "Pimenta Branca",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "manteiga-sem-sal",
        "name": "Manteiga sem sal",
        "grossery-category": "laticinio"
      },
      {
        "name-id": "açucar-mascavo",
        "name": "Açúcar Mascavo",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "essencia-baunilha",
        "name": "Essencia de Baunilha",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "amido-milho",
        "name": "Amido de milho",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "bicarbonato-sodio",
        "name": "Bicarbonato de sodio",
        "grossery-category": "ingredientes"
      },
      {
        "name-id": "chocolate-meio-amargo",
        "name": "Chocolate meio amargo",
        "grossery-category": "doces"
      },
      {
        "name-id": "tomate-pelado",
        "name": "Tomate pelado",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "grao-de-bico",
        "name": "Grão-de-bico",
        "grossery-category": "hortifruti"
      },
      {
        "name-id": "linguica-calabresa",
        "name": "Linguiça calabresa",
        "grossery-category": "proteinas"
      },
      {
        "name-id": "pao-frances",
        "name": "Pão Frânces",
        "grossery-category": "panificacao"
      },
    ];
    _items = HashMap<String, Product>();
    _createRepository();
    allProducts = _items.entries.map((entry) => entry.value).toList();
  }

  void _createRepository() {
    for (var i = 0; i < _itemsTable.length; i++) {
      var newProductTable = _itemsTable[i];
      ProductType? productType = EnumToString.fromString(
          ProductType.values, newProductTable['grossery-category']!);
      var newProduct = Product(
          nameId: newProductTable['name-id']!,
          name: newProductTable['name']!,
          productType: productType!);
      _items[newProduct.nameId] = newProduct;
    }
  }

  Product? getProductById(String nameId) {
    if (_items[nameId] == null) {
      print(nameId);
    }
    return _items[nameId];
  }

  
}
