import 'package:flutter/material.dart';
import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';

enum ThemeType { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = darkTheme;
  ThemeType _themeType = ThemeType.dark;

  toggleTheme() {
    if (_themeType == ThemeType.dark) {
      currentTheme = lightTheme;
      _themeType = ThemeType.light;
      return notifyListeners();
    }

    if (_themeType == ThemeType.light) {
      currentTheme = darkTheme;
      _themeType = ThemeType.dark;
      return notifyListeners();
    }
  }
}