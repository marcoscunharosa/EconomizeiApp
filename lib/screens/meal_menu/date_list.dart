import 'dart:collection';

import 'package:economizei_app/models/foods_per_day.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../controllers/meal_menu_constructor.dart';
import '../../service/user_service.dart';
import '../../widgets/confirmation_dialog.dart';
import 'open_date_meals.dart';
import 'closed_date_meals.dart';
import 'dart:core';

class DateMealsList extends StatefulWidget {
  ///List<FoodsPerDay> foodsPerDayList;
  DateMealsList({Key? key}) : super(key: key);

  @override
  _DateMealsListState createState() => _DateMealsListState();
}

class _DateMealsListState extends State<DateMealsList> {
  HashMap<DateTime, dynamic> _widgetByDate = HashMap<DateTime, dynamic>();
  late DateTime _openedDay;
  late List<Widget> _listOfWidgets;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void showConfirmationDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext ct) {
          return ConfirmationDialog(
            title: 'Atualizar cardápio da semana',
            buttonActions: [
              ButtonActions(title: 'Não atualizar', action: () {_refreshController.refreshFailed();}),
              ButtonActions(
                  title: 'Atualizar',
                  action: () {
                    setState(() {
                      _updateMealMenu();
                      _refreshController.refreshCompleted();
                    });
                  }),
            ],
            alertText: "Ao atualizar, você perderá o cardápio anterior",
          );
        });
  }

  void _updateMealMenu() {
    var userAccount = UserService.getInstance()!.userAccount!;
    userAccount.saveMealMenu();
    MealMenuConstructor.constructAMealMenu(
        userAccount.preferences.meals, userAccount.userMealMenu!);
    _listOfWidgets = _createDateList();
  }

  void _onRefresh() async {
    showConfirmationDialog();
    //_refreshController.refreshCompleted();
  }

  List<Widget> _createDateList() {
    var foodsPerDay =
        UserService.getInstance()!.userAccount!.userMealMenu!.foodsPerDayList;
    List<Widget> listOfWidgets = [];
    DateTime today = foodsPerDay[0].day;
    int index = 0;
    for (FoodsPerDay foodsPerDay in foodsPerDay) {
      DateTime day = foodsPerDay.day;
      Widget newWidget;
      if (day.day == today.day) {
        newWidget = OpenDateMeals(foodsPerDay: foodsPerDay);
        _openedDay = day;
      } else {
        newWidget =
            ClosedDateMeals(foodsPerDay: foodsPerDay, openDate: openNewDate);
      }

      listOfWidgets.add(newWidget);
      _widgetByDate[day] = {'foodsPerDay': foodsPerDay, 'index': index};

      index++;
      listOfWidgets.add(const Divider(
        thickness: 1.5,
      ));
      index++;
    }
    return listOfWidgets;
  }

  void openNewDate(FoodsPerDay foodsPerDay) {
    setState(() {
      var lastOpenedDateInfo = _widgetByDate[_openedDay];
      var newClosedDate = ClosedDateMeals(
        foodsPerDay: lastOpenedDateInfo['foodsPerDay'],
        openDate: openNewDate,
      );

      var lastClosedDateInfo = _widgetByDate[foodsPerDay.day];
      var newOpenedDate = OpenDateMeals(foodsPerDay: foodsPerDay);

      _openedDay = foodsPerDay.day;
      _listOfWidgets[lastOpenedDateInfo['index']] = newClosedDate;
      _listOfWidgets[lastClosedDateInfo['index']] = newOpenedDate;
    });
  }

  @override
  @protected
  @mustCallSuper
  // ignore: must_call_super
  void initState() {
    _listOfWidgets = _createDateList();
  }

  @override
  Widget build(BuildContext context) {
    print("Entrei");
    return Expanded(
      child: SmartRefresher(
        enablePullDown: true,
        header: const ClassicHeader(
          idleText: "Puxe para atualizar",
          releaseText: 'Solte para atualizar',
          refreshingText: "Aguardando confirmação...",
          completeText: 'Cardápio atualizado!',
          failedText: 'Cardapio não atualizado',
          releaseIcon: Icon(Icons.refresh, color: Color(0xFFEE0F55)),
          idleIcon: Icon(Icons.arrow_downward, color: Color(0xFFEE0F55)),
          textStyle: TextStyle(color: Color(0xFFEE0F55)),
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.builder(
            itemCount: _listOfWidgets.length,
            itemBuilder: (ctx, index) {
              return _listOfWidgets[index];
            }),
      ),
    );
  }
}
