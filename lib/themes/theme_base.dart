import 'package:flutter/material.dart';

abstract class ThemeBase {
  ThemeData get themeDataBase;
  Brightness get brightness;
  Color get bodyText1Color;

  ThemeData getTheme(){
    return themeDataBase.copyWith(
        brightness: brightness,
        primaryColor: const Color(0xfff5f5f5),
        textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: bodyText1Color)));
  }
}