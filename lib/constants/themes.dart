import 'package:flutter/material.dart';
import 'package:flutter_app/utils/local_preferences.dart';

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

  String get localeString => _localeString;

  ThemeMode? _themeMode;

  ThemeMode get themeMode => _themeMode ?? ThemeMode.light;

  SettingsProvider() {
    getThemeMode();
  }

  void getThemeMode() async {
    LocalPreferences localPreferences = LocalPreferences();
    final String tempTheme =
        await localPreferences.getString(DATA_CONST.THEME_MODE);
    if (tempTheme.isEmpty || tempTheme == THEME_MODE_CONST.LIGHT_MODE) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  Future<void> toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    await LocalPreferences().saveString(DATA_CONST.THEME_MODE,
        isDark ? THEME_MODE_CONST.BLACK_MODE : THEME_MODE_CONST.LIGHT_MODE);
    notifyListeners();
  }

  void setLocale(Locale locale, String localeString) {
    _locale = locale;
    _localeString = localeString;
    notifyListeners();
  }
}

class THEME_MODE_CONST {
  static const String LIGHT_MODE = "LIGHT_MODE";
  static const String BLACK_MODE = "BLACK_MODE";
}
