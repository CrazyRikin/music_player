import 'package:flutter/material.dart';
import 'package:music_player/utils/theme/dark_theme.dart';
import 'package:music_player/utils/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  //initially light mode
  ThemeData _themeData = kLightMode;

  //get theme
  ThemeData get themeData => _themeData;

  //is dark mode
  bool get isDarkMode => _themeData == kDarkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == kLightMode) {
      //using theme setter
      themeData = kDarkMode;
    } else {
      themeData = kLightMode;
    }
  }
}
