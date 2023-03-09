import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredLocalStorage {
  final securedStorage = const FlutterSecureStorage();

  Future<void> saveString(String key, String value) async =>
      await securedStorage.write(key: key, value: value);

  Future<String?> readString(String key) async =>
      await securedStorage.read(key: key);

  Future<void> deleteAll() async => await securedStorage.deleteAll();
}


class KEY_CONST {
  static const String ACCESS_TOKEN_KEY = "ACCESS_TOKEN";
  static const String REFRESH_TOKEN_KEY = "REFRESH_TOKEN";
}