import 'package:flutter/material.dart';

class AppBarCustom extends AppBar {
  AppBarCustom(String title)
      : super(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 72,
          title: Text(
            title,
            style: TextStyle(
              color: Color(0xFFEE0F55),
              letterSpacing: 1.5,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.dehaze, color: Color(0xFFEE0F55)),
              onPressed: () => null,
            ),
          ],
        );
}
