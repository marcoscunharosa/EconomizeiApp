import 'dart:collection';

import 'package:economizei_app/models/ingredient.dart';
import 'package:economizei_app/models/recipe.dart';
import 'package:economizei_app/models/unity_type.dart';
import 'package:economizei_app/repository/products_repository.dart';
import 'package:enum_to_string/enum_to_string.dart';

class RecipesRepository {
  static RecipesRepository? repository;
  late final List<Map<String, dynamic>> _itemsTable;
  late final HashMap<String, Recipe> _items;
  late final List<Recipe> allRecipes;
  static RecipesRepository? getRepository() {
    repository ??= RecipesRepository();
    return repository;
  }

  void createTable() {
    this._itemsTable = [
      {
        "name-id": "cafe",
        "name": "Café",
        "servings": 6,
        "ingredients": [
          {
            "quantity": 3,
            "unity": "xicara",
            "product": "agua",
            "description": ""
          },
          {
            "quantity": 3,
            "unity": "colherSopa",
            "product": "acucar",
            "description": ""
          },
          {
            "quantity": 3,
            "unity": "colherSopa",
            "product": "cafe-em-po",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "unidade",
            "product": "filtro-de-papel",
            "description": ""
          },
        ]
      },
      {
        "name-id": "pao-de-forma",
        "name": "Pão",
        "servings": 1,
        "ingredients": [
          {
            "quantity": 2,
            "unity": "fatia",
            "product": "pao-de-forma",
            "description": ""
          },
          {
            "quantity": 5,
            "unity": "grama",
            "product": "requeijao",
            "description": ""
          },
        ]
      },
      {
        "name-id": "maca",
        "name": "Maçã",
        "servings": 1,
        "ingredients": [
          {
            "quantity": 100,
            "unity": "grama",
            "product": "maca",
            "description": ""
          },
        ]
      },
      {
        "name-id": "arroz",
        "name": "Arroz",
        "servings": 3,
        "ingredients": [
          {
            "quantity": 1,
            "unity": "xicara",
            "product": "arroz",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "xicara",
            "product": "agua",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "dente",
            "product": "alho",
            "description": ""
          },
          {"quantity": 1, "unity": "fio", "product": "oleo", "description": ""},
        ]
      },
      {
        "name-id": "bife",
        "name": "Bife",
        "servings": 1,
        "ingredients": [
          {
            "quantity": 150,
            "unity": "grama",
            "product": "carne-boi",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "fio",
            "product": "azeite",
            "description": ""
          },
        ]
      },
      {
        "name-id": "bauru",
        "name": "Bauru",
        "servings": 1,
        "ingredients": [
          {
            "quantity": 2,
            "unity": "fatia",
            "product": "pao-de-forma",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "fatia",
            "product": "queijo-mussarela",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "fatia",
            "product": "presunto",
            "description": ""
          },
          {
            "quantity": 5,
            "unity": "grama",
            "product": "manteiga",
            "description": ""
          },
        ]
      },
      {
        "name-id": "macarrao-bolonhesa",
        "name": "Macarrão à Bolonhesa",
        "servings": 6,
        "ingredients": [
          {
            "quantity": 1,
            "unity": "unidade",
            "product": "cebola",
            "description": "picada"
          },
          {
            "quantity": 1,
            "unity": "colherSopa",
            "product": "azeite",
            "description": ""
          },
          {
            "quantity": 5,
            "unity": "unidade",
            "product": "azeitona",
            "description": "picada"
          },
          {
            "quantity": 2,
            "unity": "lata",
            "product": "molho-tomate",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "cubo",
            "product": "caldo-de-carne",
            "description": "dissolvido em água"
          },
          {
            "quantity": 100,
            "unity": "mililitro",
            "product": "agua",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "unidade",
            "product": "cenoura",
            "description": "picada"
          },
          {
            "quantity": 2,
            "unity": "unidade",
            "product": "tomate",
            "description": "picado"
          },
          {
            "quantity": 500,
            "unity": "grama",
            "product": "macarrao",
            "description": ""
          },
          {
            "quantity": 500,
            "unity": "grama",
            "product": "carne-moida",
            "description": ""
          },
        ]
      },
      {
        "name-id": "bisnaga-com-mortadela",
        "name": "Bisnaga com mortadela",
        "servings": 1,
        "ingredients": [
          {
            "quantity": 1 / 2,
            "unity": "fatia",
            "product": "mortadela",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "unidade",
            "product": "bisnaga",
            "description": ""
          },
          {
            "quantity": 5,
            "unity": "grama",
            "product": "requeijao",
            "description": ""
          },
        ]
      },
      {
        "name-id": "bolo-de-laranja",
        "name": "Bolo de laranja",
        "servings": 12,
        "ingredients": [
          {
            "quantity": 3,
            "unity": "unidade",
            "product": "ovos",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "xicara",
            "product": "farinha-trigo",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "xicara",
            "product": "acucar",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "xicara",
            "product": "laranja",
            "description": "suco"
          },
          {
            "quantity": 2,
            "unity": "colherSopa",
            "product": "manteiga",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "colherSopa",
            "product": "fermento-quimico",
            "description": ""
          },
        ]
      },
      {
        "name-id": "pernil-assado-com-batata",
        "name": "Pernil assado com batata",
        "servings": 12,
        "ingredients": [
          {
            "quantity": 2.5,
            "unity": "kilograma",
            "product": "pernil",
            "description": "desossado"
          },
          {
            "quantity": 1,
            "unity": "copo",
            "product": "vinagre-branco",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "unidade",
            "product": "pimentao-verde",
            "description": ""
          },
          {
            "quantity": 1 / 2,
            "unity": "xicara",
            "product": "limao",
            "description": "suco"
          },
          {
            "quantity": 1 / 2,
            "unity": "xicara",
            "product": "azeite",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "unidade",
            "product": "cebola",
            "description": ""
          },
          {
            "quantity": 6,
            "unity": "dente",
            "product": "alho",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "cubo",
            "product": "caldo-de-carne",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "xicara",
            "product": "agua",
            "description": ""
          },
          {
            "quantity": 6,
            "unity": "unidade",
            "product": "batata",
            "description": "média"
          },
        ]
      },
      {
        "name-id": "torta-de-liquidificador",
        "name": "Torta de Liquidificador",
        "servings": 6,
        "ingredients": [
          {
            "quantity": 3,
            "unity": "unidade",
            "product": "ovos",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "xicara",
            "product": "oleo",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "xicara",
            "product": "farinha-trigo",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "xicara",
            "product": "leite",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "colherSopa",
            "product": "fermento-quimico",
            "description": ""
          },
          {
            "quantity": 100,
            "unity": "grama",
            "product": "queijo",
            "description": "ralado"
          },
          {
            "quantity": 200,
            "unity": "grama",
            "product": "presunto",
            "description": "ralado"
          },
          {
            "quantity": 2,
            "unity": "unidade",
            "product": "tomate",
            "description": "picado"
          },
          {
            "quantity": 1,
            "unity": "unidade",
            "product": "cheiro-verde",
            "description": "picado"
          },
          {
            "quantity": 5,
            "unity": "unidade",
            "product": "azeitona",
            "description": "picado"
          },
        ]
      },
      {
        "name-id": "bacalhau-ao-forno",
        "name": "Bacalhau ao Forno",
        "servings": 6,
        "ingredients": [
          {
            "quantity": 1,
            "unity": "kilograma",
            "product": "bacalhau",
            "description": ""
          },
          {
            "quantity": 1 / 2,
            "unity": "kilograma",
            "product": "batata",
            "description": ""
          },
          {
            "quantity": 1 / 2,
            "unity": "kilograma",
            "product": "cenoura",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "unidade",
            "product": "cebola",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": "unidade",
            "product": "tomate",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "unidade",
            "product": "pimentao-vermelho",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "colherSopa",
            "product": "extrato-tomate",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "quantidade",
            "product": "leite-coco",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "quantidade",
            "product": "coentro",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "quantidade",
            "product": "azeitona",
            "description": "picado"
          },
        ]
      },
      {
        "name-id": "leite-com-chocolate",
        "name": "Leite com chocolate",
        "servings": 1,
        "ingredients": [
          {
            "quantity": 1,
            "unity": "copo",
            "product": "leite",
            "description": ""
          },
          {
            "quantity": 3,
            "unity": "colherSopa",
            "product": "achocolatado",
            "description": ""
          },
        ]
      },
      {
        "name-id": "strogonoff-de-frango",
        "name": "Strogonoff de Frango",
        "servings": 10,
        "ingredients": [
          {
            "quantity": 3,
            "unity": "unidade",
            "product": "peito-frango",
            "description": "picado em cubos"
          },
          {
            "quantity": 1,
            "unity": "dente",
            "product": "alho",
            "description": "picado"
          },
          {
            "quantity": 1,
            "unity": "colherSopa",
            "product": "sal",
            "description": "a gosto"
          },
          {
            "quantity": 1,
            "unity": "colherSopa",
            "product": "pimenta",
            "description": "a gosto"
          },
          {
            "quantity": 1,
            "unity": "unidade",
            "product": "cebola",
            "description": "picada"
          },
          {
            "quantity": 1,
            "unity": "colherSopa",
            "product": "manteiga",
            "description": ""
          },
          {
            "quantity": 1 / 2,
            "unity": "copo",
            "product": "ketchup",
            "description": ""
          },
          {
            "quantity": 1 / 3,
            "unity": "copo",
            "product": "mostarda",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "copo",
            "product": "cogumelo",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "copo",
            "product": "creme-de-leite",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": "unidade",
            "product": "batata-palha",
            "description": "a gosto"
          },
        ]
      },
    ];
    _items = HashMap<String, Recipe>();
    _createRepository();
    allRecipes = _items.entries.map((entry) => entry.value).toList();
  }

  void _createRepository() {
    for (var i = 0; i < _itemsTable.length; i++) {
      var recipeTable = _itemsTable[i];
      var newRecipe = Recipe(
          name: recipeTable['name'],
          nameId: recipeTable['name-id'],
          servings: recipeTable['servings']);
      _createIngredients(recipeTable['ingredients'], newRecipe);

      _items[newRecipe.nameId] = newRecipe;
    }
  }

  void _createIngredients(List<dynamic> recipeIngredients, Recipe newRecipe) {
    for (var i = 0; i < recipeIngredients.length; i++) {
      var ingredientTable = recipeIngredients[i];

      var product = ProductsRepository.getRepository()!
          .getProductById(ingredientTable['product']);

      var unityType =
          EnumToString.fromString(UnityType.values, ingredientTable['unity']!);

      var newIngredient = Ingredient(
          quantity: ingredientTable['quantity'].toDouble(),
          unity: unityType!,
          product: product!,
          description: ingredientTable['description']);

      newRecipe.addIngredient(newIngredient);
    }
  }

  Recipe? getRecipeById(String nameId) {
    return _items[nameId];
  }
}
