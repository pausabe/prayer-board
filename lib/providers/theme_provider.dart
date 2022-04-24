import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _currentTheme;
  ThemeData get currentTheme => _currentTheme;
  set currentTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}