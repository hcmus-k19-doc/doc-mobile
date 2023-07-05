import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'color_const.dart';

//secondary = text
//background = background
//surface = item borders

ColorScheme lightTheme() {
  return ColorScheme(
    brightness: Brightness.light,
    primary: ColorConst.primaryBlue,
    onPrimary: Colors.white,
    secondary: Colors.teal,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );
}

ColorScheme darkTheme() {
  return ColorScheme(
    brightness: Brightness.dark,
    primary: ColorConst.primaryBlue,
    onPrimary: Colors.black,
    secondary: Colors.tealAccent,
    onSecondary: Colors.black,
    error: Colors.redAccent,
    onError: Colors.black,
    background: Colors.black,
    onBackground: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
  );
}

class SettingsProvider extends ChangeNotifier {
  Locale _locale = const Locale("vi", "VN");
  String _localeString = "vi";

  Locale get locale => _locale;

  String get localString => _localeString;

  ThemeMode _themeMode = getDeviceThemeMode();

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setLocale(Locale locale, String localeString) {
    _locale = locale;
    _localeString = localeString;
    notifyListeners();
  }
}
