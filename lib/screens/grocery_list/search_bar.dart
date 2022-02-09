import 'package:economizei_app/models/product.dart';
import 'package:economizei_app/models/product_type.dart';
import 'package:economizei_app/repository/products_repository.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  List<Product> names = [];
  List<Product> filteredNames = [];
  List<Product> selected = [];
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
      backgroundColor: Color(0xFFEE0F55),
      centerTitle: true,
      title: _appBarTitle,
      leading: IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
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
            tileColor: Color(0xFFF5F5F5),
            trailing: Icon(Icons.shopping_cart_rounded),
            title: Text(filteredNames[index].name),
            onTap: () {
              if (!selected.contains(filteredNames[index])) {
                selected.add(filteredNames[index]);
                print(selected[selected.length - 1].name);
              }
            },
          );
        } else {
          return ListTile(
            title: Text(filteredNames[index].name),
            onTap: () {
              if (!selected.contains(filteredNames[index])) {
                selected.add(filteredNames[index]);
                print(selected[selected.length - 1].name);
              }
            },
          );
        }
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextFormField(
          controller: _filter,
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            prefixStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.search),
            hintText: 'Pesquisa...',
          ),
        );
      } else {
        _searchIcon = const Icon(Icons.search);
        _appBarTitle = const Text('Pesquisa...');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void _getNames() async {
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
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
