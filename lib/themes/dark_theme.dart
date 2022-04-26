import 'package:flutter/material.dart';
import 'package:prayerboard/themes/theme_base.dart';

class DarkTheme extends ThemeBase {
  @override
  ThemeData get themeDataBase => ThemeData.dark();

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get bodyText1Color => Colors.black;
}