import 'dart:collection';

import 'package:economizei_app/models/ingredient.dart';
import 'package:economizei_app/models/product_type.dart';
import 'package:economizei_app/models/recipe.dart';
import 'package:economizei_app/models/unity_type.dart';
import 'package:economizei_app/repository/products_repository.dart';
import 'package:economizei_app/models/meal_type.dart';

class RecipesRepository {
  static RecipesRepository? repository;
  late final List<Map<String, dynamic>> _itemsTable;
  late final HashMap<String, Recipe> _items;
  late final HashMap<MealType, List<Recipe>> _recipesLikelyMeals;
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
        "meals-likely": [MealType.breakfast, MealType.betweenMeals],
        "ingredients": [
          {
            "quantity": 3,
            "unity": UnityType.xicara,
            "product": "agua",
            "description": ""
          },
          {
            "quantity": 3,
            "unity": UnityType.colherSopa,
            "product": "acucar",
            "description": ""
          },
          {
            "quantity": 3,
            "unity": UnityType.colherSopa,
            "product": "cafe-em-po",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "filtro-de-papel",
            "description": ""
          },
        ]
      },
      {
        "name-id": "pao-de-forma",
        "name": "Pão com requeijão",
        "servings": 1,
        "meals-likely": [MealType.breakfast, MealType.betweenMeals],
        "ingredients": [
          {
            "quantity": 2,
            "unity": UnityType.fatia,
            "product": "pao-de-forma",
            "description": ""
          },
          {
            "quantity": 5,
            "unity": UnityType.fatia,
            "product": "requeijao",
            "description": ""
          },
        ]
      },
      {
        "name-id": "maca",
        "name": "Maçã",
        "servings": 1,
        "meals-likely": [MealType.breakfast, MealType.betweenMeals],
        "ingredients": [
          {
            "quantity": 100,
            "unity": UnityType.fatia,
            "product": "maca",
            "description": ""
          },
        ]
      },
      {
        "name-id": "arroz-com-carne-bonina",
        "name": "Arroz com carne",
        "meals-likely": [MealType.dinner, MealType.lunch],
        "servings": 3,
        "ingredients": [
          {
            "quantity": 1,
            "unity": UnityType.xicara,
            "product": "arroz",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.xicara,
            "product": "agua",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.dente,
            "product": "alho",
            "description": ""
          },
           {
            "quantity": 150,
            "unity": UnityType.grama,
            "product": "carne-boi",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.fio,
            "product": "azeite",
            "description": ""
          },
          {"quantity": 1, "unity": UnityType.fio, "product": "oleo", "description": ""},
        ]
      },
      {
        "name-id": "bauru",
        "name": "Bauru",
        "servings": 1,
        "meals-likely": [MealType.breakfast, MealType.betweenMeals],
        "ingredients": [
          {
            "quantity": 2,
            "unity": UnityType.fatia,
            "product": "pao-de-forma",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.fatia,
            "product": "queijo-mussarela",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.fatia,
            "product": "presunto",
            "description": ""
          },
          {
            "quantity": 5,
            "unity": UnityType.fatia,
            "product": "manteiga-com-sal",
            "description": ""
          },
        ]
      },
      {
        "name-id": "macarrao-bolonhesa",
        "name": "Macarrão à Bolonhesa",
        "servings": 6,
        "meals-likely": [MealType.lunch, MealType.dinner],
        "ingredients": [
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "cebola",
            "description": "picada"
          },
          {
            "quantity": 1,
            "unity": UnityType.colherSopa,
            "product": "azeite",
            "description": ""
          },
          {
            "quantity": 5,
            "unity": UnityType.unidade,
            "product": "azeitona",
            "description": "picada"
          },
          {
            "quantity": 2,
            "unity": UnityType.lata,
            "product": "molho-tomate",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.cubo,
            "product": "caldo-de-carne",
            "description": "dissolvido em água"
          },
          {
            "quantity": 100,
            "unity": UnityType.mililitro,
            "product": "agua",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "cenoura",
            "description": "picada"
          },
          {
            "quantity": 2,
            "unity": UnityType.unidade,
            "product": "tomate",
            "description": "picado"
          },
          {
            "quantity": 500,
            "unity": UnityType.fatia,
            "product": "macarrao",
            "description": ""
          },
          {
            "quantity": 500,
            "unity": UnityType.fatia,
            "product": "carne-moida",
            "description": ""
          },
        ]
      },
      {
        "name-id": "bisnaga-com-mortadela",
        "name": "Bisnaga com mortadela",
        "servings": 1,
        "meals-likely": [MealType.breakfast, MealType.betweenMeals],
        "ingredients": [
          {
            "quantity": 1 / 2,
            "unity": UnityType.fatia,
            "product": "mortadela",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "bisnaga",
            "description": ""
          },
          {
            "quantity": 5,
            "unity": UnityType.fatia,
            "product": "requeijao",
            "description": ""
          },
        ]
      },
      {
        "name-id": "bolo-de-laranja",
        "name": "Bolo de laranja",
        "servings": 12,
        "meals-likely": [MealType.breakfast, MealType.betweenMeals],
        "ingredients": [
          {
            "quantity": 3,
            "unity": UnityType.unidade,
            "product": "ovos",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.xicara,
            "product": "farinha-trigo",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.xicara,
            "product": "acucar",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.xicara,
            "product": "laranja",
            "description": "suco"
          },
          {
            "quantity": 2,
            "unity": UnityType.colherSopa,
            "product": "manteiga-sem-sal",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.colherSopa,
            "product": "fermento-quimico",
            "description": ""
          },
        ]
      },
      {
        "name-id": "pernil-assado-com-batata",
        "name": "Pernil assado com batata",
        "servings": 12,
        "meals-likely": [MealType.lunch, MealType.dinner],
        "ingredients": [
          {
            "quantity": 2.5,
            "unity": UnityType.kilograma,
            "product": "pernil",
            "description": "desossado"
          },
          {
            "quantity": 1,
            "unity": UnityType.copo,
            "product": "vinagre-branco",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "pimentao-verde",
            "description": ""
          },
          {
            "quantity": 1 / 2,
            "unity": UnityType.xicara,
            "product": "limao",
            "description": "suco"
          },
          {
            "quantity": 1 / 2,
            "unity": UnityType.xicara,
            "product": "azeite",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.unidade,
            "product": "cebola",
            "description": ""
          },
          {
            "quantity": 6,
            "unity": UnityType.dente,
            "product": "alho",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.cubo,
            "product": "caldo-de-carne",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.xicara,
            "product": "agua",
            "description": ""
          },
          {
            "quantity": 6,
            "unity": UnityType.unidade,
            "product": "batata",
            "description": "média"
          },
        ]
      },
      {
        "name-id": "torta-de-liquidificador",
        "name": "Torta de Liquidificador",
        "servings": 6,
        "meals-likely": [MealType.lunch, MealType.dinner],
        "ingredients": [
          {
            "quantity": 3,
            "unity": UnityType.unidade,
            "product": "ovos",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.xicara,
            "product": "oleo",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.xicara,
            "product": "farinha-trigo",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.xicara,
            "product": "leite",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.colherSopa,
            "product": "fermento-quimico",
            "description": ""
          },
          {
            "quantity": 100,
            "unity": UnityType.fatia,
            "product": "queijo",
            "description": "ralado"
          },
          {
            "quantity": 200,
            "unity": UnityType.fatia,
            "product": "presunto",
            "description": "ralado"
          },
          {
            "quantity": 2,
            "unity": UnityType.unidade,
            "product": "tomate",
            "description": "picado"
          },
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "cheiro-verde",
            "description": "picado"
          },
          {
            "quantity": 5,
            "unity": UnityType.unidade,
            "product": "azeitona",
            "description": "picado"
          },
        ]
      },
      {
        "name-id": "bacalhau-ao-forno",
        "name": "Bacalhau ao Forno",
        "servings": 6,
        "meals-likely": [MealType.lunch, MealType.dinner],
        "ingredients": [
          {
            "quantity": 1,
            "unity": UnityType.kilograma,
            "product": "bacalhau",
            "description": ""
          },
          {
            "quantity": 1 / 2,
            "unity": UnityType.kilograma,
            "product": "batata",
            "description": ""
          },
          {
            "quantity": 1 / 2,
            "unity": UnityType.kilograma,
            "product": "cenoura",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.unidade,
            "product": "cebola",
            "description": ""
          },
          {
            "quantity": 2,
            "unity": UnityType.unidade,
            "product": "tomate",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "pimentao-vermelho",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.colherSopa,
            "product": "extrato-tomate",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.quantidade,
            "product": "leite-coco",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.quantidade,
            "product": "coentro",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.quantidade,
            "product": "azeitona",
            "description": "picado"
          },
        ]
      },
      {
        "name-id": "leite-com-chocolate",
        "name": "Leite com chocolate",
        "servings": 1,
        "meals-likely": [MealType.breakfast, MealType.betweenMeals],
        "ingredients": [
          {
            "quantity": 1,
            "unity": UnityType.copo,
            "product": "leite",
            "description": ""
          },
          {
            "quantity": 3,
            "unity": UnityType.colherSopa,
            "product": "achocolatado",
            "description": ""
          },
        ]
      },
      {
        "name-id": "strogonoff-de-frango",
        "name": "Strogonoff de Frango",
        "servings": 10,
        "meals-likely": [MealType.lunch, MealType.dinner],
        "ingredients": [
          {
            "quantity": 3,
            "unity": UnityType.unidade,
            "product": "peito-frango",
            "description": "picado em cubos"
          },
          {
            "quantity": 1,
            "unity": UnityType.dente,
            "product": "alho",
            "description": "picado"
          },
          {
            "quantity": 1,
            "unity": UnityType.colherSopa,
            "product": "sal",
            "description": "a gosto"
          },
          {
            "quantity": 1,
            "unity": UnityType.colherSopa,
            "product": "pimenta",
            "description": "a gosto"
          },
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "cebola",
            "description": "picada"
          },
          {
            "quantity": 1,
            "unity": UnityType.colherSopa,
            "product": "manteiga-sem-sal",
            "description": ""
          },
          {
            "quantity": 1 / 2,
            "unity": UnityType.copo,
            "product": "ketchup",
            "description": ""
          },
          {
            "quantity": 1 / 3,
            "unity": UnityType.copo,
            "product": "mostarda",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.copo,
            "product": "cogumelo",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.copo,
            "product": "creme-de-leite",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "batata-palha",
            "description": "a gosto"
          },
        ]
      },
      {
        "name-id": "ovo-cozido",
        "name": "Ovo cozido",
        "servings": 1,
        "meals-likely": [MealType.breakfast, MealType.betweenMeals],
        "ingredients": [
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": "ovos",
            "description": ""
          },
        ]
      },
      {
        "name-id": "ovos-mexidos",
        "name": "Ovos mexidos",
        "servings": 1,
        "meals-likely": [MealType.breakfast, MealType.betweenMeals],
        "ingredients": [
          {
            "quantity": 3,
            "unity": UnityType.unidade,
            "product": "ovos",
            "description": ""
          },
          {
            "quantity": 1,
            "unity": UnityType.colherSopa,
            "product": "manteiga-sem-sal",
            "description": ""
          },
        ]
      }
    ];
    _recipesLikelyMeals = HashMap<MealType, List<Recipe>>();
    _createIngredientsRecipe();
    _items = HashMap<String, Recipe>();
    _createRepository();
    allRecipes = _items.entries.map((entry) => entry.value).toList();
  }

  List<Recipe> getRecipesLikelyMeals(MealType mealType){
    return _recipesLikelyMeals[mealType]!;
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
      _addInLikelyList(recipeTable['meals-likely'], newRecipe);
    }
  }

  void _addInLikelyList(List<MealType> mealsType, Recipe recipe){
    for (var mealType in mealsType) {
      if (_recipesLikelyMeals[mealType] == null){
        _recipesLikelyMeals[mealType] = [recipe];
      }
      else{
        _recipesLikelyMeals[mealType]!.add(recipe);
      }
    }
  }

  void _createIngredientsRecipe() {
    var products = ProductsRepository.getRepository()!.consumableAloneItems;
    for (var product in products) {
      var mealsLikely = [MealType.breakfast, MealType.betweenMeals];
      if(product.productType == ProductType.congelados){
        mealsLikely =  [MealType.lunch, MealType.dinner];
      }
      var newRecipe = {
        "name-id": "${product.nameId}-recipe",
        "name": product.name,
        "servings": 1,
        "meals-likely": mealsLikely,
        "ingredients": [
          {
            "quantity": 1,
            "unity": UnityType.unidade,
            "product": product.nameId,
            "description": ""
          },
        ]
      };
      _itemsTable.add(newRecipe);
    }
  }

  void _createIngredients(List<dynamic> recipeIngredients, Recipe newRecipe) {
    for (var i = 0; i < recipeIngredients.length; i++) {
      var ingredientTable = recipeIngredients[i];

      var product = ProductsRepository.getRepository()!
          .getProductById(ingredientTable['product']);

      var newIngredient = Ingredient(
          quantity: ingredientTable['quantity'].toDouble(),
          unity: ingredientTable['unity'],
          product: product!,
          description: ingredientTable['description']);

      newRecipe.addIngredient(newIngredient);
    }
  }

  Recipe? getRecipeById(String nameId) {
    return _items[nameId];
  }
}
