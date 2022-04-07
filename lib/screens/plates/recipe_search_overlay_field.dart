import 'package:economizei_app/repository/recipes_repository.dart';
import 'package:flutter/material.dart';

import '../../models/plate_part.dart';
import '../../models/recipe.dart';

class RecipeOverlayField extends StatefulWidget {
  final TextEditingController textController;
  final PlatePart platePart;
  const RecipeOverlayField({Key? key, required this.platePart, required this.textController})
      : super(key: key);

  @override
  State<RecipeOverlayField> createState() => RecipeOverlayFieldState();
}

class RecipeOverlayFieldState extends State<RecipeOverlayField> {
  final _formKey = GlobalKey<FormState>();
  final allRecipes =
      List<Recipe>.from(RecipesRepository.getRepository()!.allRecipes);
  List<Recipe> filteredRecipes = [];
  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  bool validateForm() {
    return _formKey.currentState!.validate();
  }

  void _chooseRecipe(Recipe recipe) {
    widget.textController.text = recipe.name;
    widget.platePart.recipe = recipe;
    _focusNode.unfocus();
    _formKey.currentState!.validate();
  }

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = this._createOverlayEntry();
        Overlay.of(context)!.insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height),
          child: Material(
            elevation: 6.0,
            
            child: filteredRecipes.length > 0
                ? ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 350),
                  child: ListView.builder(
                    
                      shrinkWrap: true,
                      itemCount: filteredRecipes.length,
                      padding: EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return ListTile(
                          dense: true,
                          onTap: () {
                            _chooseRecipe(filteredRecipes[index]);
                          },
                          title: Text(
                            filteredRecipes[index].name,
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        );
                      }),
                )
                : Container(),
          ),
        ),
      ),
    );
  }

  void _searchRecipes(String value) {
    int max = 10;
    filteredRecipes = [];
    if (value == "") {
      return;
    }
    for (var recipe in allRecipes) {
      if (recipe.name.toLowerCase().contains(value.toLowerCase())) {
        filteredRecipes.add(recipe);
      }
      if (filteredRecipes.length == 10) {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Form(
        key: _formKey,
        child: TextFormField(
          focusNode: _focusNode,
          onEditingComplete: () {
            _focusNode.unfocus();
            widget.textController.text = "";
            _formKey.currentState!.validate();
          },
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Selecione uma receita da lista';
            }
            return null;
          },
          controller: widget.textController,
          onChanged: (value) {
            _searchRecipes(value);
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFCFCFCF)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFEE0F55),
                width: 2,
              ),
            ),
            border: OutlineInputBorder(),
            hintText: "Ex: arroz, suco de maracujá, leite com chocolate",
            hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }
}
