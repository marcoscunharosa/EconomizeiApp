import 'package:economizei_app/controllers/grocery_list_constructor.dart';
import 'package:economizei_app/models/account.dart';
import 'package:economizei_app/screens/create_your_meals/create_your_meals.dart';
import 'package:economizei_app/screens/grocery_list/grocery_list_screen.dart';
import 'package:economizei_app/service/user_service.dart';
import 'package:economizei_app/widgets/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_bar_custom.dart';
import '../create_your_meals/meal_screen.dart';
import '../meal_menu/meal_menu_screen.dart';
import 'navigation_drawer_widget.dart';

class MainPage extends StatefulWidget {
  late MealMenuScreen mealMenuScreen;
  late List<NavigationSection> _children;
  MainPage({Key? key}) : super(key: key) {
    mealMenuScreen = MealMenuScreen(
        // mealMenu: UserService.getInstance()!.userAccount!.userMealMenu!,
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
        ),
      ),
    ];
  }

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  int _bottomSelectedIndex = 0;

  

  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    List<BottomNavigationBarItem> items = [];
    for (NavigationSection section in widget._children) {
      if (section.bottomNavigationBarItem != null) {
        items.add(section.bottomNavigationBarItem!);
      }
    }
    return items;
  }

  void _navigationBottomNavBar(int index) {
    setState(() {
      while (widget._children.length != 3) {
        widget._children.removeLast();
      }
      _selectedIndex = index;
      _bottomSelectedIndex = index;
    });
  }

  void goToGroceryListScreen() {
    setState(() {
      _selectedIndex = 2;
      _bottomSelectedIndex = 2;
    });
  }

  void goToEditMeals() {
    setState(() {
      while (widget._children.length != 3) {
        widget._children.removeLast();
      }
      widget._children.add(NavigationSection(
          'Minhas Refeições',
          CreateYourMeals(
            meals: UserService.getInstance()!.userAccount!.preferences.meals,
            openMealScreen: openEditMeal,
            closeMealScreen: backToEditMeals,
            backScreen: () => _navigationBottomNavBar(0),
          ),
          null));
      _selectedIndex = 3;
    });
  }

  void backToEditMeals() {
    setState(() {
      widget._children.removeLast();
      _selectedIndex = 3;
    });
  }

  void openEditMeal(MealScreen mealScreen) {
    widget._children.add(NavigationSection('Refeição', mealScreen, null));
    setState(() {
      _selectedIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    var _navigationBarItems = _getBottomNavigationBarItems();
    widget.mealMenuScreen.openGroceryList = goToGroceryListScreen;
    return Scaffold(
      endDrawer: NavigationDrawerWidget(
        goToEditMeals: goToEditMeals,
      ),

      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFEE0F55)),
        elevation: 0,
        title: Text(
          widget._children[_selectedIndex].title,
          style: const TextStyle(
            color: Color(0xFFEE0F55),
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.white,
      ), //AppBarCustom(widget._children[_selectedIndex].title),
      body: widget._children[_selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomSelectedIndex,
        selectedItemColor: _selectedIndex < _navigationBarItems.length
            ? Color(0xFFEE0F55)
            : Colors.grey[600],
        onTap: _navigationBottomNavBar,
        type: BottomNavigationBarType.fixed,
        items: _navigationBarItems,
      ),
    );
  }
}

class NavigationSection {
  final String title;
  final Widget widget;
  final BottomNavigationBarItem? bottomNavigationBarItem;
  NavigationSection(this.title, this.widget, this.bottomNavigationBarItem);
}
