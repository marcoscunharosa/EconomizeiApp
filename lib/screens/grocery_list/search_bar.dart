import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/product_type.dart';
import 'package:economizei_app/repository/products_repository.dart';
import 'package:economizei_app/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  List<Product> selected;
  Function addItem;
  SearchBar({required this.selected, required this.addItem});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  List<Product> names = [];
  List<Product> filteredNames = [];
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('Pesquisa de produtos');

  _SearchBarState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  AppBar _buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: TextFormField(
        controller: _filter,
        style: const TextStyle(
          backgroundColor: Colors.white,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(5),
          filled: true,
          fillColor: Colors.white,
          //prefixIconColor: Color(0xFFEE0F55),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFF666666),
          ),
          hintText: 'Pesquisa...',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xFF989898),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color(0xFF0FB8EE),
            ),
          ),
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildList() {
    // ignore: prefer_is_not_empty
    if (!(_searchText.isEmpty)) {
      List<Product> tempList = [];
      if (tempList.isEmpty) {
        tempList.add(Product(
            name: _searchText,
            nameId: _searchText.toLowerCase(),
            productType: ProductType.outros));
      }
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]
            .name
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0 && filteredNames.length != names.length) {
          return ListTile(
            tileColor: const Color(0xFFF5F5F5),
            trailing: const Icon(Icons.shopping_cart_rounded),
            title: Text(filteredNames[index].name),
            onTap: () {
              // if (!widget.selected.contains(filteredNames[index])) {
              //   widget.selected.add(filteredNames[index]);
              //   widget.addItem(widget.selected);
              // }
              widget.addItem(filteredNames[index]);
              Navigator.pop(context);
            },
          );
        } else {
          return ListTile(
            title: Text(filteredNames[index].name),
            onTap: () {
              // if (!widget.selected.contains(filteredNames[index])) {
              //   widget.selected.add(filteredNames[index]);
              //   print(widget.selected[widget.selected.length - 1].name);
              //   widget.addItem(widget.selected);
              // }
              widget.addItem(filteredNames[index]);
              Navigator.pop(context);
            },
          );
        }
      },
    );
  }

  void _getNames() {
    List<Product> tempList = [];
    tempList.addAll(ProductsRepository.getRepository()!.allProducts);
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }

  @override
  void initState() {
    _getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 72,
        title: const Text(
          "Pesquise seus itens",
          style: TextStyle(
            color: Color(0xFFEE0F55),
            letterSpacing: 1.5,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFEE0F55),
        ),
      ),
      body: Scaffold(
        appBar: _buildBar(context),
        body: Container(
          child: _buildList(),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
