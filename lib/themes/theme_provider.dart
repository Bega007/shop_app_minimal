import 'package:flutter/material.dart';
import 'package:minimal_markt/themes/dark_mode.dart';
import 'package:minimal_markt/themes/light_mode.dart';
import 'package:minimal_markt/themes/theme_preference.dart';

class ThemeProvider with ChangeNotifier {
  ThemePrefs themePrefs = ThemePrefs();
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toogleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
