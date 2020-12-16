import 'package:flutter/material.dart';

class Styles {
  static const buttonTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static const sectionTitleStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w900);

  static const pageTitleStyle = TextStyle(
      fontSize: 30.0, fontWeight: FontWeight.w600, fontFamily: 'Comfortaa');

  static const globalPadding = 16.0;
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    gapPadding: 10,
    borderSide: BorderSide(color: Colors.black, width: 2.0),
  );

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
  );
}
