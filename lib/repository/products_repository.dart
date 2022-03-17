import 'dart:collection';
import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/product_type.dart';

class ProductsRepository {
  static ProductsRepository? repository;
  late final List<Map<String, dynamic>> _itemsTable;
  late final HashMap<String, Product> _items;
  late final List<Product> allProducts;
  late final List<Product> consumableAloneItems;
  static ProductsRepository? getRepository() {
    repository ??= ProductsRepository();
    return repository;
  }

  void createTable() {
    this._itemsTable = [
      {
        "name-id": "agua",
         "name": "Água",
         "grossery-category": ProductType.bebidas,
         "can-consumed-alone": false
      },
      {
        "name-id": "acucar",
        "name": "Açúcar",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "cafe-em-po",
        "name": "Café em pó",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "filtro-de-papel",
        "name": "Filtro de papel",
        "grossery-category": ProductType.utensilios,
         "can-consumed-alone": false
      },
      {
        "name-id": "pao-de-forma",
        "name": "Pão de forma",
        "grossery-category": ProductType.panificacao,
         "can-consumed-alone": false
      },
      {
        "name-id": "requeijao",
        "name": "Requeijão",
        "grossery-category": ProductType.laticinio,
         "can-consumed-alone": false
      },
      {"name-id": "maca", "name": "Maçã", "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true},
      {
        "name-id": "arroz",
        "name": "Arroz branco",
        "grossery-category": ProductType.graos,
         "can-consumed-alone": false
      },
      {"name-id": "alho", "name": "Alho", "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false},
      {
        "name-id": "oleo",
        "name": "Óleo de soja",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "carne-boi",
        "name": "Carne bovina",
        "grossery-category": ProductType.proteinas,
         "can-consumed-alone": false
      },
      {
        "name-id": "azeite",
        "name": "Azeite de oliva",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "queijo-mussarela",
        "name": "Queijo mussarela",
        "grossery-category": ProductType.laticinio,
         "can-consumed-alone": false
      },
      {
        "name-id": "presunto",
        "name": "Presunto",
        "grossery-category": ProductType.proteinas,
         "can-consumed-alone": false
      },
      {
        "name-id": "manteiga-com-sal",
        "name": "Manteiga com sal",
        "grossery-category": ProductType.laticinio,
         "can-consumed-alone": false
      },
      {
        "name-id": "cebola",
        "name": "Cebola",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "azeitona",
        "name": "Azeitona",
        "grossery-category": ProductType.enlatados,
         "can-consumed-alone": true
      },
      {
        "name-id": "molho-tomate",
        "name": "Molho de tomate",
        "grossery-category": ProductType.enlatados,
         "can-consumed-alone": false
      },
      {
        "name-id": "caldo-de-carne",
        "name": "Caldo de carne",
        "grossery-category": ProductType.temperos,
         "can-consumed-alone": false
      },
      {
        "name-id": "cenoura",
        "name": "Cenoura",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "tomate",
        "name": "Tomate",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "macarrao",
        "name": "Macarrão",
        "grossery-category": ProductType.massas,
         "can-consumed-alone": false
      },
      {
        "name-id": "carne-moida",
        "name": "Carne moída",
        "grossery-category": ProductType.proteinas,
         "can-consumed-alone": false
      },
      {
        "name-id": "mortadela",
        "name": "Mortadela",
        "grossery-category": ProductType.proteinas,
         "can-consumed-alone": false
      },
      {
        "name-id": "bisnaga",
        "name": "Bisnaga",
        "grossery-category": ProductType.panificacao,
         "can-consumed-alone": false
      },
      {"name-id": "ovos", "name": "Ovos", "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": true},
      {
        "name-id": "farinha-trigo",
        "name": "Farinha de trigo",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "laranja",
        "name": "Laranja",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "fermento-quimico",
        "name": "Fermento químico",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {"name-id": "pernil", "name": "Pernil", "grossery-category": ProductType.proteinas,
         "can-consumed-alone": false},
      {
        "name-id": "vinagre-branco",
        "name": "Vinagre branco",
        "grossery-category": ProductType.temperos,
         "can-consumed-alone": false
      },
      {
        "name-id": "pimentao-verde",
        "name": "Pimentão verde",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {"name-id": "limao", "name": "Limão", "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false},
      {
        "name-id": "batata",
        "name": "Batata",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {"name-id": "leite", "name": "Leite", "grossery-category": ProductType.laticinio,
         "can-consumed-alone": true},
      {"name-id": "queijo", "name": "Queijo", "grossery-category": ProductType.laticinio,
         "can-consumed-alone": true},
      {
        "name-id": "cheiro-verde",
        "name": "Cheiro verde",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "bacalhau",
        "name": "Bacalhau",
        "grossery-category": ProductType.proteinas,
         "can-consumed-alone": false
      },
      {
        "name-id": "pimentao-vermelho",
        "name": "Pimentão vermelho",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "extrato-tomate",
        "name": "Extrato de tomate",
        "grossery-category": ProductType.enlatados,
         "can-consumed-alone": false
      },
      {
        "name-id": "leite-coco",
        "name": "Leite de coco",
        "grossery-category": ProductType.laticinio,
         "can-consumed-alone": false
      },
      {
        "name-id": "coentro",
        "name": "Coentro",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "achocolatado",
        "name": "Achocolatado",
        "grossery-category": ProductType.doces,
         "can-consumed-alone": false
      },
      {
        "name-id": "peito-frango",
        "name": "Peito de frango",
        "grossery-category": ProductType.proteinas,
         "can-consumed-alone": false
      },
      {
        "name-id": "sal",
        "name": "Sal",
        "grossery-category": ProductType.temperos,
         "can-consumed-alone": false
      },
      {
        "name-id": "pimenta",
        "name": "Pimenta",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "maionese",
        "name": "Maionese",
        "grossery-category": ProductType.laticinio,
         "can-consumed-alone": false
      },
      {
        "name-id": "ketchup",
        "name": "Ketchup",
        "grossery-category": ProductType.temperos,
         "can-consumed-alone": false
      },
      {
        "name-id": "mostarda",
        "name": "Mostarda",
        "grossery-category": ProductType.temperos,
         "can-consumed-alone": false
      },
      {
        "name-id": "cogumelo",
        "name": "Cogumelo",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "creme-de-leite",
        "name": "Creme de Leite",
        "grossery-category": ProductType.laticinio,
         "can-consumed-alone": false
      },
      {
        "name-id": "batata-palha",
        "name": "Batata Palha",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "feijao",
        "name": "Feijão",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "pimenta-branca",
        "name": "Pimenta Branca",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "manteiga-sem-sal",
        "name": "Manteiga sem sal",
        "grossery-category": ProductType.laticinio,
         "can-consumed-alone": false
      },
      {
        "name-id": "açucar-mascavo",
        "name": "Açúcar Mascavo",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "essencia-baunilha",
        "name": "Essencia de Baunilha",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "amido-milho",
        "name": "Amido de milho",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "bicarbonato-sodio",
        "name": "Bicarbonato de sodio",
        "grossery-category": ProductType.ingredientes,
         "can-consumed-alone": false
      },
      {
        "name-id": "chocolate-meio-amargo",
        "name": "Chocolate meio amargo",
        "grossery-category": ProductType.doces,
         "can-consumed-alone": false
      },
      {
        "name-id": "tomate-pelado",
        "name": "Tomate pelado",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "grao-de-bico",
        "name": "Grão-de-bico",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": false
      },
      {
        "name-id": "linguica-calabresa",
        "name": "Linguiça calabresa",
        "grossery-category": ProductType.proteinas,
         "can-consumed-alone": false
      },
      {
        "name-id": "pao-frances",
        "name": "Pão Frânces",
        "grossery-category": ProductType.panificacao,
         "can-consumed-alone": false
      },
      {
        "name-id": "abacaxi",
        "name": "Abacaxi",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "banana",
        "name": "Banana",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "yakult",
        "name": "Leite Fermentado",
        "grossery-category": ProductType.laticinio,
         "can-consumed-alone": true
      },
      {
        "name-id": "kiwi",
        "name": "Kiwi",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "manga",
        "name": "Manga",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "melancia",
        "name": "Melancia",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "melao",
        "name": "Melão",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "morangos",
        "name": "Morangos",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "uvas",
        "name": "Uvas",
        "grossery-category": ProductType.hortifruti,
         "can-consumed-alone": true
      },
      {
        "name-id": "lasanha-congelada",
        "name": "Lasanha Congelada",
        "grossery-category": ProductType.congelados,
         "can-consumed-alone": true
      },
      {
        "name-id": "sorvete",
        "name": "Sorvete",
        "grossery-category": ProductType.doces,
         "can-consumed-alone": true
      },
      {
        "name-id": "amendoins",
        "name": "Amendoins",
        "grossery-category": ProductType.doces,
         "can-consumed-alone": true
      },
      {
        "name-id": "batata-chips",
        "name": "Batata Chips",
        "grossery-category": ProductType.doces,
         "can-consumed-alone": true
      },
      {
        "name-id": "biscoitos",
        "name": "Biscoitos",
        "grossery-category": ProductType.doces,
         "can-consumed-alone": true
      },
      {
        "name-id": "pipoca",
        "name": "Pipoca",
        "grossery-category": ProductType.doces,
         "can-consumed-alone": true
      },
    ];
    
    consumableAloneItems = [];
    _items = HashMap<String, Product>();
    _createRepository();
    allProducts = _items.entries.map((entry) => entry.value).toList();
  }

  void _createRepository() {
    for (var i = 0; i < _itemsTable.length; i++) {
      var newProductTable = _itemsTable[i];
      // ProductType? productType = EnumToString.fromString(
      //     ProductType.values, newProductTable['grossery-category']!);
      var newProduct = Product(
          nameId: newProductTable['name-id']!,
          name: newProductTable['name']!,
          productType: newProductTable['grossery-category']!);
      if (newProductTable['can-consumed-alone']) {
        consumableAloneItems.add(newProduct);
      }
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
