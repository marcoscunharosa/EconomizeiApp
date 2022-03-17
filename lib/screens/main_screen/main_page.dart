import 'package:economizei_app/controllers/grocery_list_constructor.dart';
import 'package:economizei_app/models/account.dart';
import 'package:economizei_app/screens/grocery_list/grocery_list_screen.dart';
import 'package:economizei_app/service/user_service.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_bar_custom.dart';
import '../meal_menu/meal_menu_screen.dart';

class MainPage extends StatefulWidget {
  late MealMenuScreen mealMenuScreen;
  late List<NavigationSection> _children;
  MainPage({Key? key}) : super(key: key) {
    mealMenuScreen = MealMenuScreen(
        mealMenu: UserService.getInstance()!.userAccount!.userMealMenu!,
        openGroceryList: () {});

    _children = [
      NavigationSection(
          "Cardápio",
          mealMenuScreen,
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Cardápio",
          )),
      NavigationSection(
          "Feed",
          const Center(
            child: Text("Feed"),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: "Feed",
          )),
      NavigationSection(
          "Lista de compras",
          GroceryListScreen(),
          const BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: "Lista de compras",
          )),
    ];
  }

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  // final List<NavigationSection> _children = [
  //   NavigationSection(
  //       "Cardápio",
  //       widget.mealMenuScreen,
  //       const BottomNavigationBarItem(
  //         icon: Icon(Icons.menu_book),
  //         label: "Cardápio",
  //       )),
  //   NavigationSection(
  //       "Feed",
  //       const Center(
  //         child: Text("Feed"),
  //       ),
  //       const BottomNavigationBarItem(
  //         icon: Icon(Icons.dynamic_feed),
  //         label: "Feed",
  //       )),
  //   NavigationSection(
  //       "Lista de compras",
  //       GroceryListScreen(),
  //       const BottomNavigationBarItem(
  //         icon: Icon(Icons.local_grocery_store),
  //         label: "Lista de compras",
  //       )),
  // ];
  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    List<BottomNavigationBarItem> items = [];
    for (NavigationSection section in widget._children) {
      items.add(section.bottomNavigationBarItem);
    }
    return items;
  }

  void _navigationBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void goToGroceryListScreen() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.mealMenuScreen.openGroceryList = goToGroceryListScreen;
    return Scaffold(
      appBar: AppBarCustom(widget._children[_selectedIndex].title),
      body: widget._children[_selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFEE0F55),
        onTap: _navigationBottomNavBar,
        type: BottomNavigationBarType.fixed,
        items: _getBottomNavigationBarItems(),
      ),
    );
  }
}

class NavigationSection {
  final String title;
  final Widget widget;
  final BottomNavigationBarItem bottomNavigationBarItem;
  NavigationSection(this.title, this.widget, this.bottomNavigationBarItem);
}
