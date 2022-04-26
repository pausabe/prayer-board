import 'package:flutter/material.dart';
import 'package:prayerboard/themes/theme_base.dart';

class LightTheme extends ThemeBase {
  @override
  ThemeData get themeDataBase => ThemeData.light();

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get bodyText1Color => Colors.white;
}