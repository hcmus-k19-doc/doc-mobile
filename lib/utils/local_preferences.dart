import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences extends Pref {
  @override
  Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  @override
  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    for (String key in prefs.getKeys()) {
      if (key != DATA_CONST.ACCESS_TOKEN) {
        prefs.remove(key);
      }
    }
    return true;
  }
}

class MemoryPref extends Pref {
  Map<String, Object> memoryMap = <String, Object>{};

  @override
  Future<String> getString(String key) {
    return Future.value(memoryMap[key] as String);
  }

  @override
  Future<bool> saveString(String key, String value) async {
    memoryMap[key] = value;
    return Future.value(true);
  }
}

abstract class Pref {
  Future<bool> saveString(String key, String value);
  Future<String> getString(String key);
}

class DATA_CONST {
  static const String CACHE_DEVICE_ID = "CACHE_DEVICE_ID";
  static const String ACCESS_TOKEN = "ACCESS_TOKEN";
  static const String DEVICE_ID = "device_id";
  static const String DEVICE_NAME = "device_name";
  static const String DEVICE_TOKEN = "device_token";
  static const String DEVICE_PLATFORM = "device_platform";
  static const String VERSION_APP = "version_app";
  static const String THEME_MODE = "theme_mode";
}
