import 'package:economizei_app/models/account.dart';
import 'package:economizei_app/service/user_service.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_bar_custom.dart';
import '../meal_menu/meal_menu_screen.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<NavigationSection> _children = [
    NavigationSection("Cardápio",
        MealMenuScreen(mealMenu: UserService.getInstance()!.userAccount!.userMealMenu!),
        const BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: "Cardápio",
        )),
    NavigationSection("Feed",
        const Center(
          child: Text("Feed"),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.dynamic_feed),
          label: "Feed",
        )),
    NavigationSection("Lista de compras",
        const Center(
          child: Text("Lista de compras"),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.local_grocery_store),
          label: "Lista de compras",
        )),
  ];
  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    List<BottomNavigationBarItem> items = [];
    for (NavigationSection section in _children) {
      items.add(section.bottomNavigationBarItem);
    }
    return items;
  }

  void _navigationBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(_children[_selectedIndex].title),
      body: _children[_selectedIndex].widget,
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
