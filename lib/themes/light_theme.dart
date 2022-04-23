import 'package:flutter/material.dart';

//TODO: make some abstract class with its Dark/Light implementations (to ensure to have the same values configured)

ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: const Color(0xfff5f5f5),
    textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black)));
