import 'package:flutter/material.dart';
import 'package:json_app/app/themes/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = primaryThemeData;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(int value) {
    switch (value) {
      case 1:
        themeData = primaryThemeData;
    }
  }
}
