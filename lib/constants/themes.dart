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
    background: Colors.grey[800]!,
    onBackground: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
  );
}

class SettingsProvider extends ChangeNotifier {
  Locale? _locale;
  String? _localeString;

  Locale get locale => _locale ?? const Locale("vi", "VN");

  String get localeString => _localeString ?? "vi";

  ThemeMode? _themeMode;

  ThemeMode get themeMode => _themeMode ?? ThemeMode.light;

  SettingsProvider() {
    getThemeMode();
    getLocale();
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

  void getLocale() async {
    LocalPreferences localPreferences = LocalPreferences();
    final String tempLocale =
        await localPreferences.getString(DATA_CONST.LOCALE);
    if (tempLocale.isEmpty || tempLocale == LOCALE_MODE_CONST.VI) {
      _locale = const Locale("vi", "VN");
      _localeString = LOCALE_MODE_CONST.VI;
    } else {
      _locale = const Locale("en", "EN");
      _localeString = LOCALE_MODE_CONST.EN;
    }
    notifyListeners();
  }

  Future<void> toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    await LocalPreferences().saveString(DATA_CONST.THEME_MODE,
        isDark ? THEME_MODE_CONST.BLACK_MODE : THEME_MODE_CONST.LIGHT_MODE);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale, String localeString) async {
    _locale = locale;
    _localeString = localeString;
    await LocalPreferences()
        .saveString(DATA_CONST.LOCALE, _localeString ?? "vi");
    notifyListeners();
  }
}

class THEME_MODE_CONST {
  static const String LIGHT_MODE = "LIGHT_MODE";
  static const String BLACK_MODE = "BLACK_MODE";
}

class LOCALE_MODE_CONST {
  static const String VI = "vi";
  static const String EN = "en";
}
