import 'package:flutter/material.dart';
import 'package:unlockway/themes/theme.dart';

ThemeData teste = ThemeData();

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(String theme) {
    if (theme == "dark") {
      themeData = darkMode;
    } else if (theme == "light") {
      themeData = lightMode;
    } else if (theme == "system") {}
  }
}
